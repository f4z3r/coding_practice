use v6.c;
use Test;
use lib 'lib';

use chapter1_7;

plan 3;

my @matrix = [[1, 1, 1, 1],
              [1, 0, 1, 1],
              [1, 1, 1, 1],
              [1, 1, 1, 1],
              [1, 1, 1, 1]];
my @expected = [[1, 0, 1, 1],
                [0, 0, 0, 0],
                [1, 0, 1, 1],
                [1, 0, 1, 1],
                [1, 0, 1, 1]];
set_zero(@matrix);
is-deeply @matrix, @expected;


@matrix = [[1, 1, 1, 1],
           [1, 0, 0, 1],
           [1, 1, 1, 1],
           [1, 1, 0, 1],
           [0, 1, 1, 1],
           [1, 1, 1, 1]];
@expected = [[0, 0, 0, 1],
             [0, 0, 0, 0],
             [0, 0, 0, 1],
             [0, 0, 0, 0],
             [0, 0, 0, 0],
             [0, 0, 0, 1]];
set_zero(@matrix);
is-deeply @matrix, @expected;

@matrix = [[1, 1, 1, 1],
           [1, 1, 1, 1],
           [1, 1, 1, 1],
           [1, 1, 1, 1],
           [1, 1, 1, 1],
           [1, 1, 1, 1]];
@expected = [[1, 1, 1, 1],
             [1, 1, 1, 1],
             [1, 1, 1, 1],
             [1, 1, 1, 1],
             [1, 1, 1, 1],
             [1, 1, 1, 1]];
set_zero(@matrix);
is-deeply @matrix, @expected;

done-testing;
