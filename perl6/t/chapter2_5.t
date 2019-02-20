use v6.c;
use Test;
use lib 'lib';

use chapter2_1;
use chapter2_5;

my sub get-last-node(Node $_ is copy) returns Node {
    .=next while .next.defined;
    $_;
}

plan 2;

subtest "get-last-node", {
    plan 3;

    my $list = Node.from_list: 1, 2, 3, 4, 5;
    is get-last-node($list).data, 5;
    is get-last-node($list), $list.next.next.next.next;
    is $list.data, 1;

    done-testing;
}

subtest "find-loop-entry", {
    plan 5;

    my $list = Node.from_list: 1, 2, 3, 4, 5;
    my $loop-start = get-last-node($list);
    $loop-start.next = Node.from_list: 6, 7, 8, 9;
    get-last-node($list).next = $loop-start;
    is find-loop-entry($list), $loop-start;
    is find-loop-entry($list).data, 5;

    $list = Node.from_list: 1, 2;
    $loop-start = get-last-node($list);
    $loop-start.next = Node.from_list: 3, 4, 5, 6, 7, 8, 9, 10, 11;
    get-last-node($list).next = $loop-start;
    is find-loop-entry($list), $loop-start;
    is find-loop-entry($list).data, 2;

    $list = Node.from_list: 1, 2, 3, 4, 5;
    throws-like find-loop-entry($list), Exception, message => "no loop";

    done-testing;
}



done-testing;
