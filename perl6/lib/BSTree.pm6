#!/usr/bin/env perl6

unit module BSTree;

my class Node {
    has Int $.key is required;
    has Int $.value;
    has Node %!children = {};

    method insert(Node:D: Int $key, Int $value?) {
        given $key <=> $!key {
            when Order::Less { self!insert-on($key, $value, side => "left") }
            when Order::More { self!insert-on($key, $value, side => "right") }
            when Order::Same {
                fail "key already exists in BST" unless $value.defined;
                $!value = $value;
            }
        }
    }

    method search(Node:D: Int $key) returns Int {
        given $key <=> $!key {
            when Order::Less {
                fail "not found" unless %!children<left>.defined;
                %!children<left>.search($key);
            }
            when Order::More {
                fail "not found" unless %!children<right>.defined;
                %!children<right>.search($key);
            }
            when Order::Same {
                $!value.defined ?? $!value !! 1;
            }
        }
    }

    method !insert-on(Node:D: Int $key, Int $value?, :$side) {
        if %!children{$side}.defined {
            %!children{$side}.insert($key, $value);
        } else {
            %!children{$side} = Node.new(:$key, :$value);
        }
    }

    method left(Node:D:) returns Node {
        %!children<left>;
    }

    method right(Node:D:) returns Node {
        %!children<right>;
    }
}

#| Binary search tree implementation supporting insertion and search. Each node contains a key and
#| optionally a value. The tree is sorted based on keys and those need to be unique.
#| Deletion is not supported.
class BinarySearchTree {
    has Node $!root;

    method insert(Int $key, Int $value?) {
        if $!root.defined {
            $!root.insert($key, $value);
        } else {
            $!root = Node.new(:$key, :$value);
        }
    }

    method search(BinarySearchTree:D: Int $key) returns Int {
        fail "empty tree" unless $!root.defined;
        $!root.search($key);
    }

    method min-key() returns Int {
        self!min-node.key;
    }

    method min() returns Int {
        fail "no value set on minimum node" unless (my $value = self!min-node.value).defined;
        $value;
    }

    method max-key() returns Int {
        self!max-node.key;
    }

    method max() returns Int {
        fail "no value set on maximum node" unless (my $value = self!max-node.value).defined;
        $value;
    }

    method !min-node() returns Node {
        fail "empty tree" unless $!root.defined;
        my $curr = $!root;
        $curr .= left while $curr.left.defined;
        $curr;
    }

    method !max-node() returns Node {
        fail "empty tree" unless $!root.defined;
        my $curr = $!root;
        $curr .= right while $curr.right.defined;
        $curr;
    }
}
