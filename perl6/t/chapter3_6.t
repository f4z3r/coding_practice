use v6.c;
use Test;
use lib 'lib';

use chapter3_6;

plan 3;

my Int @stack = 5, 3, 2, 6, 1, 8, 10, 3, 6;
sort-stack(@stack);
is-deeply @stack, Array[Int].new(1, 2, 3, 3, 5, 6, 6, 8, 10);

@stack = ();
sort-stack(@stack);
is-deeply @stack, Array[Int].new;

@stack = -1, -1, -1, -1, 1;
sort-stack(@stack);
is-deeply @stack, Array[Int].new(-1, -1, -1, -1, 1);

done-testing;
