use v6.c;
use Test;
use lib 'lib';

use chapter3_4;

plan 1;

my $hanoi = HanoiProgram.new;
my $expected = q:to/END/;
    moving disk 1 from tower 1 to tower 3
    moving disk 2 from tower 1 to tower 2
    moving disk 1 from tower 3 to tower 2
    moving disk 3 from tower 1 to tower 3
    moving disk 1 from tower 2 to tower 1
    moving disk 2 from tower 2 to tower 3
    moving disk 1 from tower 1 to tower 3
    END
is $hanoi.run, $expected;

done-testing;
