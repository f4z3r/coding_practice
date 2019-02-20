use v6.c;
use Test;
use lib 'lib';

use chapter3_3;

plan 14;

my $stack = SetofStacks.new(capacity => 2);
$stack.push: 4;
$stack.push: 5;
$stack.push: 6;
is $stack.pop, 6;
is $stack.pop, 5;
is $stack.pop, 4;
throws-like { $stack.pop }, X::Cannot::Empty;

$stack.push: 1;
$stack.push: 2;
$stack.push: 3;
$stack.push: 4;
$stack.push: 5;
$stack.push: 6;
$stack.push: 7;
is $stack.pop-at(1), 4;
is $stack.pop-at(1), 3;
throws-like { $stack.pop-at(1) }, X::Cannot::Empty;
throws-like { $stack.pop-at(100) }, Exception, message => "out of bounds";

is $stack.pop, 7;
is $stack.pop, 6;
is $stack.pop, 5;
is $stack.pop, 2;
is $stack.pop, 1;
throws-like { $stack.pop }, X::Cannot::Empty;

done-testing;
