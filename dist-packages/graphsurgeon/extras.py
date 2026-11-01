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

import graphsurgeon as gs

"""
These are more advanced, and more specific functions that don't necessarily fit
in with the more generic search and maniplulation functions. These might include
small functions that compose other graphsurgeon functions for more complex behavior,
or completely free-standing functions that are still typically needed for graph processing.
"""

def process_dilated_conv(dynamic_graph):
    '''
    Replaces **SpaceToBatchND -> Conv2D -> BatchToSpaceND** (this is how TensorFlow represents dilated convolutions internally) with a single node that the UFF converter is able to recognize as a dilated convolution.

    Args:
        dynamic_graph (graphsurgeon.DynamicGraph): DynamicGraph in which to replace dilated convolutions.

    Returns:
        None
    '''
    # Find chains of ops that we recognize as dilated convolutions.
    op_chain = ["SpaceToBatchND", "Conv2D", "BatchToSpaceND"]
    node_chains = dynamic_graph.find_node_chains_by_op(op_chain)
    # Some nodes need to be forwarded, others removed.
    forward_inputs_nodes = []
    remove_nodes = []
    for chain in node_chains:
        # The first node is SpaceToBatchND
        forward_inputs_nodes.append(chain[0])
        # The last node is BatchToSpaceND
        forward_inputs_nodes.append(chain[-1])
        # Reattach the crops node to the Conv instead.
        crops = dynamic_graph.find_node_inputs_by_name(chain[-1], "crops")
        if (len(crops) == 1):
            chain[-1].input.remove(crops[0].name)
            chain[0].input.append(crops[0].name)
        # Remove all inputs from the BatchToSpaceND except the convolution.
        remove_nodes.extend([dynamic_graph.node_map[inp] for inp in chain[-1].input if dynamic_graph.node_map[inp].op != "Conv2D"])
    # Now remove the const nodes.
    dynamic_graph.remove(remove_nodes, remove_exclusive_dependencies=True)
    # Forward inputs the SpaceToBatchND and BatchToSpaceND nodes.
    dynamic_graph.forward_inputs(forward_inputs_nodes)

def process_softmax(dynamic_graph):
    '''
    Replaces **Sub -> Pack -> Slice -> ConcatV2 -> Reshape -> Softmax -> Reshape** (this is how TensorFlow represents softmax internally) with a single node that the UFF converter is able to recognize as a softmax.

    Args:
        dynamic_graph (graphsurgeon.DynamicGraph): DynamicGraph in which to replace softmax nodes.

    Returns:
        None
    '''
    op_chain = ["Sub", "Pack", "Slice", "ConcatV2", "Reshape", "Softmax", "Reshape"]
    node_chains = dynamic_graph.find_node_chains_by_op(op_chain)
    # Some nodes should be removed, others forwarded.
    forward_nodes = []
    remove_nodes = []
    for chain in node_chains:
        # Sub, Pack and Slice can be removed.
        remove_nodes.extend(chain[0:3])
        # Remove the shape input of the slice node
        remove_nodes.extend(dynamic_graph.find_node_inputs_by_name(chain[2], "Shape.*"))
        # For the concat node, we can remove the values input.
        remove_nodes.extend(dynamic_graph.find_node_inputs_by_name(chain[3], "values.*"))
        # The concat and reshape nodes can be forwarded.
        forward_nodes.extend(chain[3:5])
        # Remove the Shape input of the final reshape node
        remove_nodes.extend(dynamic_graph.find_node_inputs_by_name(chain[6], "Shape.*"))
        # Finally forward the last node.
        forward_nodes.append(chain[6])

    dynamic_graph.remove(remove_nodes)
    dynamic_graph.forward_inputs(forward_nodes)
