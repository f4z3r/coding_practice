#!/usr/bin/env perl6

#= Given a circular linked list, implement an algorithm which returns the node at the beginning of
#= the loop.
#=
#= DEFINITION
#= Circular linked list: A (corrupt) linked list in which a node's next pointer points to an
#= earlier node, so as to make a loop in the linked list.
#=
#= EXAMPLE
#= Input: A -> B -> C -> D -> E -> C (the same C as earlier)
#= Output: C

use chapter2_1;

sub find-loop-entry(Node $node) returns Node is export {
    my ($n1, $n2) = $node xx 2;

    # find meeting point
    while $n2.next.defined {
        $n1.=next;
        $n2 = $n2.next.next;   # $n2.=next.next; does not work
        last if $n2 === $n1;
    }

    # check if there is a loop
    fail "no loop" unless $n2.next.defined;

    # get loop start
    $n1 = $node;
    until $n1 === $n2 {
        .=next for $n1, $n2;
    }
    $n2;
}
