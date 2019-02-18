use v6.c;
use Test;
use lib 'lib';

use chapter2_1;
use chapter2_2;

plan 4;

my $list = Node.from_list: 1, 2, 3, 4, 5, 6, 7;
is nth-to-last($list, 2).data, 6;
is nth-to-last($list, 1).data, 7;
is nth-to-last($list, 4).data, 4;
is nth-to-last($list, 100).data, 1;

done-testing;
