use v6.c;
use Test;
use lib 'lib';

use chapter2_1;
use chapter2_3;

plan 3;

my $list = Node.from_list: 1, 2, 3, 4, 5;
delete-node($list.next.next);   # delete node 3
is $list.to_list, (1, 2, 4, 5);

delete-node($list.next.next.next);  # attempt to delete last
is $list.to_list, (1, 2, 4, 5);

delete-node($list);
is $list.to_list, (2, 4, 5);

done-testing;
