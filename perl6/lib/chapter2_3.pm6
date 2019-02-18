#!/usr/bin/env perl6

use chapter2_1;

#| remove a node from a list given only access to the node itself.
sub delete-node(Node $node) is export {
    return unless $node.next.defined; # can only be performed if not last node
    my $next = $node.next;
    $node.data = $next.data;
    $node.next = $next.next;
}
