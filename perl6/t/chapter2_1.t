use v6.c;
use Test;
use lib 'lib';

use chapter2_1;

plan 3;
subtest "from_list", {
    plan 5;

    my $list = Node.from_list: 1, 2, 3, 4;
    isa-ok $list, Node;
    is $list.data, 1;
    is $list.next.next.data, 3;

    dies-ok { Node.from_list; }
    dies-ok { Node.from_list: 1; }

    done-testing;
}

subtest "remove-dups", {
    plan 4;

    my $list = Node.from_list: 1, 2, 2, 5, 4, 3, 3, 1;
    remove-dups($list);
    isa-ok $list, Node;
    is-deeply $list.to_list, (1, 2, 5, 4, 3);

    $list = Node.new(data => 5);
    remove-dups($list);
    is-deeply $list.to_list, (5,);

    $list = Node.from_list: 0 xx 10;
    remove-dups($list);
    is-deeply $list.to_list, (0,);

    done-testing;
}

subtest "slow-remove-dups", {
    plan 4;

    my $list = Node.from_list: 1, 2, 2, 5, 4, 3, 3, 1;
    slow-remove-dups($list);
    isa-ok $list, Node;
    is-deeply $list.to_list, (1, 2, 5, 4, 3);

    $list = Node.new(data => 5);
    slow-remove-dups($list);
    is-deeply $list.to_list, (5,);

    $list = Node.from_list: 0 xx 10;
    slow-remove-dups($list);
    is-deeply $list.to_list, (0,);
}

done-testing;
