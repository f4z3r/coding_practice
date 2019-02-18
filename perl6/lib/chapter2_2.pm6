#!/usr/bin/env perl6

use chapter2_1;

#| find the nth to last node in the list.
sub nth-to-last(Node $node, Int $n) returns Node is export {
    my ($p1, $p2) = $node xx 2;
    $p2.=next if $p2.defined for ^$n;
    while $p2.defined {
        $p1.=next;
        $p2.=next;
    }
    $p1;
}
