use v6.c;
use Test;
use lib 'lib';

use chapter2_1;
use chapter2_3;

plan 3;

my $list = Node.from_list: 1, 2, 3, 4, 5;
delete-node($list.next.next);   # delete node 3
is-deeply $list.to_list, (1, 2, 4, 5);

throws-like delete-node($list.next.next.next), Exception,
     message => "cannot be performed on last node";

delete-node($list);
is-deeply $list.to_list, (2, 4, 5);

done-testing;
