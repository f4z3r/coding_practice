use v6.c;
use Test;
use lib 'lib';

use chapter1_6;

plan 4;

my @matrix = [[1, 2, 3, 4],
              [5, 6, 7, 8],
              [9, 10, 11, 12],
              [13, 14, 15, 16]];
my @expected = [[13, 9, 5, 1],
                [14, 10, 6, 2],
                [15, 11, 7, 3],
                [16, 12, 8, 4]];
rotate(@matrix);
is @matrix, @expected;

@matrix = [[1]];
@expected = [[1]];
rotate(@matrix);
is @matrix, @expected;

@matrix = [[1, 2, 3],
           [4, 5, 6],
           [7, 8, 9]];
@expected = [[7, 4, 1],
             [8, 5, 2],
             [9, 6, 3]];
rotate(@matrix);
is @matrix, @expected;

@matrix = [[]];
@expected = [[]];
rotate(@matrix);
is @matrix, @expected;

done-testing;
