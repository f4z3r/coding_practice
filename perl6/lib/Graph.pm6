#!/usr/bin/env perl6

unit module Graph;

#| A generic node.
class Node {
    has Int $.val is required;
    has Node @!neighbours = ();

    method add-neighbour(Node:D: Node:D $neighbour) {
        @!neighbours.push: $neighbour;
    }

    method has-n-neighbours(Node:D: Int $count) returns Bool {
        +@!neighbours == $count;
    }

    method get-nth-neighbour(Node:D: Int $idx) returns Node {
        fail "index out of bounds" unless +@!neighbours > $idx;
        @!neighbours[$idx];
    }

    method rm-nth-neighbour(Node:D: Int $idx) returns Node {
        fail "index out of bounds" unless +@!neighbours > $idx;
        @!neighbours.splice($idx, 1)[0];
    }
}
