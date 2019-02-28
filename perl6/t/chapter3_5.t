use v6.c;
use Test;
use lib 'lib';

use chapter3_5;

plan 8;

my $queue = StackQueue.new;
$queue.add: 1;
$queue.add: 2;
$queue.add: 3;
$queue.add: 4;
is $queue.remove, 1;
$queue.add: 5;
$queue.add: 6;
$queue.add: 7;
is $queue.remove, 2;
is $queue.remove, 3;
is $queue.remove, 4;
is $queue.remove, 5;
is $queue.remove, 6;
is $queue.remove, 7;
throws-like { $queue.remove }, X::Cannot::Empty;

done-testing;
