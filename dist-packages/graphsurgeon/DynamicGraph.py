# Copyright 1993-2020 NVIDIA Corporation.  All rights reserved.
#
# NOTICE TO LICENSEE:
#
# This source code and/or documentation ("Licensed Deliverables") are
# subject to NVIDIA intellectual property rights under U.S. and
# international Copyright laws.
#
# These Licensed Deliverables contained herein is PROPRIETARY and
# CONFIDENTIAL to NVIDIA and is being provided under the terms and
# conditions of a form of NVIDIA software license agreement by and
# between NVIDIA and Licensee ("License Agreement") or electronically
# accepted by Licensee.  Notwithstanding any terms or conditions to
# the contrary in the License Agreement, reproduction or disclosure
# of the Licensed Deliverables to any third party without the express
# written consent of NVIDIA is prohibited.
#
# NOTWITHSTANDING ANY TERMS OR CONDITIONS TO THE CONTRARY IN THE
# LICENSE AGREEMENT, NVIDIA MAKES NO REPRESENTATION ABOUT THE
# SUITABILITY OF THESE LICENSED DELIVERABLES FOR ANY PURPOSE.  IT IS
# PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTY OF ANY KIND.
# NVIDIA DISCLAIMS ALL WARRANTIES WITH REGARD TO THESE LICENSED
# DELIVERABLES, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY,
# NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE.
# NOTWITHSTANDING ANY TERMS OR CONDITIONS TO THE CONTRARY IN THE
# LICENSE AGREEMENT, IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY
# SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, OR ANY
# DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
# ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
# OF THESE LICENSED DELIVERABLES.
#
# U.S. Government End Users.  These Licensed Deliverables are a
# "commercial item" as that term is defined at 48 C.F.R. 2.101 (OCT
# 1995), consisting of "commercial computer software" and "commercial
# computer software documentation" as such terms are used in 48
# C.F.R. 12.212 (SEPT 1995) and is provided to the U.S. Government
# only as a commercial end item.  Consistent with 48 C.F.R.12.212 and
# 48 C.F.R. 227.7202-1 through 227.7202-4 (JUNE 1995), all
# U.S. Government End Users acquire the Licensed Deliverables with
# only those rights set forth herein.
#
# Any use of the Licensed Deliverables in individual and commercial
# software must include, in the user documentation and internal
# comments to the code, the above Disclaimer and U.S. Government End
# Users Notice.

import copy
from graphsurgeon import StaticGraph
from graphsurgeon._utils import _get_node_names, _handle_single_nodes
from tensorflow.compat.v1 import GraphDef
from collections import OrderedDict

class DynamicGraph(StaticGraph):
    '''
    A sub-class of StaticGraph that can search and modify a TensorFlow GraphDef.

    Args:
        graphdef (tensorflow.GraphDef/tensorflow.Graph OR graphsurgeon.StaticGraph/graphsurgeon.DynamicGraph OR str): A TensorFlow GraphDef/Graph or a StaticGraph/DynamicGraph from which to construct this graph, or a string containing the path to a frozen model.
    '''

    '''Graph Analysis Functions'''
    # Finds nodes in the graph that would be unused if a certain set of nodes were removed.
    # The returned list includes the nodes provided to the function.
    def _find_unused_nodes_on_removal(self, node_removal_list):
        # Since node_outputs will be modified, need a local copy
        node_outputs = copy.deepcopy(self.node_outputs)

        def recursively_remove_inputs(node):
            # Given one node, return a set containing it and all its hanging inputs
            removable_nodes_list = [node]
            for input_name in node.input:
                # Remove this node from the output of it's inputs
                if input_name in node_outputs and node in node_outputs[input_name]:
                    node_outputs[input_name].remove(node)
                # Recursively remove any inputs which are left hanging
                if input_name not in node_outputs or len(node_outputs[input_name]) == 0:
                    input_name = input_name.replace('^', '').split(':')[0]
                    input_node = self.node_map[input_name]
                    removable_nodes_list.extend(recursively_remove_inputs(input_node))
            return removable_nodes_list

        # Nodes that can be removed based on nodes going to be removed.
        removable_nodes_list = []
        for node in node_removal_list:
            removable_nodes_list.extend(recursively_remove_inputs(node))
        return removable_nodes_list

    '''Graph Manipulation Functions'''
    # Given a graphdef and a container of node names, generates a new graph with all the
    # inputs of the specified nodes recursively forwarded, and the nodes themselves removed.
    def _forward_inputs_impl(self, forward_inputs_names):
        nodes = self._internal_graphdef.node

        # FIXME: Handle control inputs properly when bridging. Figure out the duplicate input situation.
        def should_forward_inputs(node):
            # Forward inputs if the node is in the list...
            is_in_forward_inputs_names = node.name in forward_inputs_names
            # ...unless it has control edge inputs
            has_control_edge = False
            for input_name in node.input:
                if '^' in input_name:
                    has_control_edge = True
            return is_in_forward_inputs_names and not has_control_edge

        def generate_input_replacements():
            def generate_shallow_input_replacements():
                shallow_input_replacements = OrderedDict()
                # Traverse the graph once to get a shallow mapping of input -> replacements
                for node in nodes:
                    if should_forward_inputs(node):
                        shallow_input_replacements[node.name] = node.input
                return shallow_input_replacements

            # Initial pass to get 1-layer deep replacements.
            shallow_input_replacements = generate_shallow_input_replacements()
            # Traverse the input replacement map and generate a map of true input replacements.
            for node_name in shallow_input_replacements:
                for input_name in shallow_input_replacements[node_name]:
                    if input_name in shallow_input_replacements:
                        # Append replacements to the end of the input list
                        shallow_input_replacements[node_name].extend(shallow_input_replacements[input_name])
                        # Pop replaced inputs from the front.
                        shallow_input_replacements[node_name].remove(input_name)
            # Done!
            return shallow_input_replacements

        def update_inputs(node, true_input_replacements):
            # Update inputs, replacing those which need to be.
            def get_replaced_input(input_name):
                # REVIEW: Might need to do this a different way later.
                # Check the true input name, not just as a control input.
                new_input_name = input_name.replace('^', '')
                if new_input_name in true_input_replacements:
                    return new_input_name
                return None

            index = 0
            while index < len(node.input):
                # REVIEW: Might need to do this a different way later.
                input_name = get_replaced_input(node.input[index])
                if input_name:
                    # REVIEW: Do we need to check for unique inputs here?
                    # unique_replacement_names = [replacement_name
                    #     for replacement_name in true_input_replacements[input_name]
                    #         if replacement_name not in new_node.input]

                    # Remove the old input, replace with the new ones. Make sure to insert in the correct spot,
                    # so as to preserve input ordering.
                    for replacement in true_input_replacements[input_name]:
                        node.input.insert(index, replacement)
                        index += 1
                    del node.input[index]
                    index -= 1
                index += 1

        # Get true replacements.
        true_input_replacements = generate_input_replacements()
        # Update the graph.
        index = 0
        while index < len(nodes):
            if should_forward_inputs(nodes[index]):
                # If this node should be forwarded, remove it.
                del nodes[index]
                index -= 1
            else:
                # For all other nodes, update their inputs with replacements.
                update_inputs(nodes[index], true_input_replacements)
            index += 1

    # Given a graph def, removes nodes corresponding to the names provided and
    # returns a new GraphDef. Does not forward inputs.
    def _remove_impl(self, remove_names):
        nodes = self._internal_graphdef.node

        def should_remove_node_name(node_name):
            # Determine whether this node_name should be removed from the graph
            node_name = node_name.replace('^', '')
            should_remove_node = node_name in remove_names
            # Check if this node shows up as a control dependency
            should_remove_control_dependency = '^' + node_name in remove_names
            return should_remove_node or should_remove_control_dependency

        def update_inputs(node):
            # Update inputs in the node, removing where necessary.
            index = 0
            while index < len(node.input):
                if should_remove_node_name(node.input[index]):
                    del node.input[index]
                    index -= 1
                index += 1

        # Update the graph.
        index = 0
        while index < len(nodes):
            if should_remove_node_name(nodes[index].name):
                del nodes[index]
                index -= 1
            else:
                # Remove the deleted nodes from the inputs of other nodes.
                update_inputs(nodes[index])
            index += 1

    # Given tensorflow GraphDef and a dict of namespace names -> plugin names,
    # collapses those namespaces into single nodes representing plugins, excluding
    # those nodes specified in exclude_nodes.
    def _collapse_namespaces_impl(self, namespace_map, exclude_node_names, unique_inputs):
        nodes = self._internal_graphdef.node
        # TODO: Maybe let this function arbitrarily collapse any group of nodes.
        # Will require more work on user end to collapse multiple namespaces if
        # implemented this way, but provides much greater flexibility. Maybe some
        # compromise is possible.

        def get_plugin_node(node_name):
            # Get the default plugin node provided by the user, or return None if this
            # does not belong in a plugin.
            if node_name in exclude_node_names:
                # Don't put this node into a plugin, treat as normal node instead.
                return None, None
            # Check if this node should be omitted from the main graph and return the plugin node if so.
            best_match_depth = -1
            best_match = None
            best_namespace = None
            for namespace in namespace_map:
                # Find the end point of the namespace
                current_depth = len(namespace.split('/'))
                # Get a section of the node path to the same depth
                node_namespace = "/".join(node_name.split('/')[:current_depth])
                # Try to match to the longest possible namespace path, then make sure it actually is a path.
                if namespace == node_namespace and current_depth > best_match_depth:
                    best_match_depth = current_depth
                    best_match = namespace_map[namespace]
                    best_namespace = namespace
            return best_match, best_namespace

        def update_inputs(node):
            index = 0
            while index < len(node.input):
                input_name = node.input[index].replace('^', '')
                # We don't care if this is a control input for the purposes of plugins. (That's what the ^ indicates).
                input_plugin, _ = get_plugin_node(input_name)
                # If this input is in a plugin, replace with the plugin name instead.
                if input_plugin:
                    # Remove and replace the node
                    del node.input[index]
                    if input_plugin.name not in node.input:
                        # For plugin inputs, don't add duplicates.
                        node.input.insert(index, input_plugin.name)
                    else:
                        index -= 1
                index += 1

        def update_plugin_inputs(plugin_node, node):
            def add_input(plugin_node, input_name):
                if not unique_inputs or input_name not in plugin_node.input:
                    # If we're not checking for unique inputs, we can add the input all the time.
                    # Otherwise, the input must not already be present.
                    plugin_node.input.append(input_name)

            for input_name in node.input:
                # We don't care if this is a control input for the purposes of plugins. (That's what the ^ indicates).
                input_plugin, _ = get_plugin_node(input_name.replace('^', ''))
                # If the input is in a plugin, we need to add the plugin instead.
                if input_plugin:
                    # If it's in the same plugin, it's not really an input; otherwise, we can add it.
                    if input_plugin.name != plugin_node.name:
                        add_input(plugin_node, input_plugin.name)
                else:
                    # And if it's not in a plugin, just add it as a normal node.
                    add_input(plugin_node, input_name)

        # Update the graph.
        index = 0
        while index < len(nodes):
            plugin_node, plugin_namespace = get_plugin_node(nodes[index].name)
            if plugin_node:
                # Add the inputs of this node to its plugin.
                update_plugin_inputs(namespace_map[plugin_namespace], nodes[index])
                # Finally, remove it from the main graph.
                del nodes[index]
                index -= 1
            else:
                # For non-plugin nodes, just update their inputs.
                update_inputs(nodes[index])
            index += 1

        # Then integrate the plugin nodes back into the graph.
        # NodeDef is an unhashable type.
        unique_nodes = []
        for node in namespace_map.values():
            if node not in unique_nodes:
                unique_nodes.append(node)

        nodes.extend(unique_nodes)

    # Wrapper to handle exclude_nodes
    def collapse_namespaces(self, namespace_map, exclude_nodes=[], unique_inputs=True):
        '''
        Collapses nodes in namespaces to single nodes specified by the user, except where those nodes are marked for exclusion.

        Args:
            namespace_map (dict(str, tensorflow.NodeDef)): A dictionary specifying namespaces and their corresponding plugin nodes. These plugin nodes are typically used to specify attributes of the custom plugin, while inputs and outputs are automatically deduced. Multiple namespaces can be collapsed into a single plugin node, and nested namespaces are collapsed into plugin nodes outside their parent namespaces.
            exclude_nodes (list(tensorflow.NodeDef)): Iterable container (usually a list) of nodes which should NOT be collapsed. These nodes will be present in the final graph as either inputs or outputs of the plugin nodes.
            unique_inputs (bool): Whether inputs to the collapsed node should be unique. If this is false, plugin nodes may have duplicate inputs.

        Returns:
            None
        '''
        exclude_node_names = set(_get_node_names(exclude_nodes))
        self._collapse_namespaces_impl(namespace_map, exclude_node_names, unique_inputs)
        # After modifying, need to regenerate analysis data.
        # TODO: Remove this, and do it more efficiently during traversal.
        self._initialize_analysis_data()

    # Allows for removal of nodes based on node references directly.
    def remove(self, nodes, remove_exclusive_dependencies=False):
        '''
        Removes nodes from this graph. Does not forward inputs, so paths in the graph could be broken.

        Args:
            nodes (list(tensorflow.NodeDef))): Iterable container (usually a list) of nodes which should be removed.
            remove_exclusive_dependencies (bool): Whether to also remove dependencies exclusive to the nodes about to be removed. When set to True, all exclusive dependencies will be removed recursively, and the number of hanging nodes in the graph will remain constant. Defaults to False.

        Returns:
            None
        '''
        nodes = _handle_single_nodes(nodes)
        if remove_exclusive_dependencies:
            nodes = self._find_unused_nodes_on_removal(nodes)
        remove_names = set(_get_node_names(nodes))
        # The implementation requires node names, rather than references.
        self._remove_impl(remove_names)
        # After modifying, need to regenerate analysis data.
        # TODO: Remove this, and do it more efficiently during traversal.
        self._initialize_analysis_data()

    # Allows for removal of nodes based on node references directly.
    def forward_inputs(self, nodes):
        '''
        Removes nodes from this graph. Recursively forwards inputs, such that paths in the graph are preserved.

        **Warning**: Nodes with control inputs are not removed, so as not to break the structure of the graph. If you need to forward these, remove their control inputs first.

        Args:
            nodes (list(tensorflow.NodeDef))): Iterable container (usually a list) of nodes which should be removed and whose inputs forwarded.

        Returns:
            None
        '''
        nodes = _handle_single_nodes(nodes)
        forward_inputs_names = set(_get_node_names(nodes))
        # The implementation requires node names, rather than references.
        self._forward_inputs_impl(forward_inputs_names)
        # After modifying, need to regenerate analysis data.
        # TODO: Remove this, and do it more efficiently during traversal.
        self._initialize_analysis_data()

    def extend(self, node_list):
        '''
        Extends this graph's nodes based on the provided list.

        Args:
            node_list (list(tensorflow.NodeDef)): List of TensorFlow NodeDefs to add to the graph.

        Returns:
            None
        '''
        self._internal_graphdef.node.extend(node_list)

    def append(self, node):
        '''
        Appends a node to this graph.

        Args:
            node (tensorflow.NodeDef): TensorFlow NodeDef to add to the graph.

        Returns:
            None
        '''
        self._internal_graphdef.node.extend([node])
