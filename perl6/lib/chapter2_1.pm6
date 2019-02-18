#!/usr/bin/env perl6

class Node is export {
    has Int $.data is rw is required;
    has Node $.next is rw;

    method from_list(Node:U: *@elems where { .elems > 1 }) returns Node {
        return unless @elems.so;
        my $head = Node.new(data => @elems[0]);
        my $curr = $head;
        for @elems[1..*] -> $data {
            $curr.next = Node.new(:$data);
            $curr.=next;
        }
        $head;
    }

    method to_list(Node:D:) {
        (self, *.next ... !*.next).map: *.data;
    }
}

#| remove duplicate values in the linked list.
sub remove-dups(Node $node) is export {
    my %seen;
    my $prev;
    my $curr = $node;
    while $curr.defined {
        if %seen{$curr.data}:exists {
            $prev.next = $curr.next;
        } else {
            %seen{$curr.data} = True;
            $prev = $curr;
        }
        $curr.=next;
    }
}

#| remove duplicate values without an additional buffer.
sub slow-remove-dups(Node $node) is export {
    my $prev = $node;
    while my $curr = $prev.next {
        my $runner = $node;
        until $runner === $curr {
            if $runner.data == $curr.data {
                $curr.=next;
                $prev.next = $curr;
                last;
            }
            $runner.=next;
        }
        if $runner === $curr {
            $prev = $curr;
            $curr.=next;
        }
    }
}
