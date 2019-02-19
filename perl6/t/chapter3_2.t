use v6.c;
use Test;
use lib 'lib';

use chapter3_2;

plan 12;

my $stack = MinStack.new;
$stack.push: 5;
$stack.push: 3;
$stack.push: 4;
is $stack.min, 3;
is $stack.pop, 4;
$stack.push: 1;
$stack.push: 3;
$stack.push: 1;
is $stack.min, 1;
is $stack.pop, 1;
is $stack.min, 1;
is $stack.pop, 3;
is $stack.pop, 1;
is $stack.min, 3;
is $stack.pop, 3;
is $stack.pop, 5;
throws-like { $stack.pop }, X::AdHoc;
throws-like { $stack.min }, X::AdHoc;

done-testing;
