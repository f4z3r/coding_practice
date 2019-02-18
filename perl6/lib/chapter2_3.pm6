#!/usr/bin/env perl6

#= Implement an algorithm to delete a node in the middle of a single linked list, given only access
#= to that node.
#=
#= EXAMPLE
#= Input: the node 'c' from the linked list a -> b -> c -> d -> e
#= Output: nothing is returned, but the new linked list looks like a -> b -> d -> e

use chapter2_1;

#| remove a node from a list given only access to the node itself.
sub delete-node(Node $node) is export {
    fail "cannot be performed on last node" unless $node.next.defined;
    my $next = $node.next;
    $node.data = $next.data;
    $node.next = $next.next;
}
