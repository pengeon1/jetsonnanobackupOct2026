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

import re
from tensorflow.compat.v1 import NodeDef

def _string_matches_regex(match_string, regex):
    # Check for exact matches.
    matches_name = regex == match_string
    if matches_name:
        return True
    # Otherwise, treat as a regex
    matches_regex = False
    re_matches = re.match(regex, match_string)
    # If we find matches...
    if re_matches:
        # Check that they are exact matches
        matches_regex = re_matches.group() == match_string
        if matches_regex:
            return True
    return False

# Takes a string as well as a list of RegExs. Returns true if the string matches any of the RegExs.
def _regex_list_contains_string(regex_list, match_string):
    for regex in regex_list:
        if _string_matches_regex(match_string, regex):
            return True
    return False

# Check if an object is an iterable but NOT a string.
def _is_nonstring_iterable(obj):
    return hasattr(obj, '__contains__') and not type(obj) is str

# Accepts either a string or iterable. If it receives a string, returns a container
# containing that string, otherwise returns the iterable.
def _generate_iterable_for_search(potential_iterable):
    return potential_iterable if _is_nonstring_iterable(potential_iterable) else set([potential_iterable])

# Creates a list of names from a given list of nodes.
def _get_node_names(nodes):
    return [node.name for node in nodes]

def _handle_single_nodes(nodes):
    if isinstance(nodes, NodeDef):
        return [nodes]
    return nodes

# Cleans up the input name. Nodes with multiple outputs are suffixed with a :index_number, so we need to strip this.
def _clean_input_name(input_name):
    return input_name.split(":")[0].replace('^', '')
