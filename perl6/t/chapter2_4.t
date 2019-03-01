use v6.c;
use Test;
use lib 'lib';

use chapter2_1;
use chapter2_4;

plan 4;

my $num1 = Node.from_list: 1, 2, 3;
my $num2 = Node.from_list: 3, 2, 1;
is-deeply add($num1, $num2).to_list, (4, 4, 4);

$num1 = Node.from_list: 9, 1, 4;
$num2 = Node.from_list: 8, 9, 6;
is-deeply add($num1, $num2).to_list, (7, 1, 1, 1);

$num1 = Node.from_list: 9, 1, 4;
$num2 = Node.from_list: 8, 9, 6;
is-deeply add($num1, $num2).to_list, (7, 1, 1, 1);

$num1 = Node.from_list: 1, 2;
$num2 = Node.from_list: 8, 9, 6;
is-deeply add($num1, $num2).to_list, (9, 1, 7);

done-testing;
