#!/usr/bin/env perl6

#= Write an algorithm such that if an element of an MxN matrix is 0, its entire row and column is set
#= to 0.

sub set_zero(@matrix) is export {
  my @zero_rows = False xx @matrix.elems;
  my @zero_columns = False xx @matrix[0].elems;
  for @matrix.kv -> $i, @row {
    for @row.kv -> $j, $element {
      if $element == 0 {
        @zero_rows[$i] = True;
        @zero_columns[$j] = True;
      }
    }
  }
  for @matrix.keys -> $i {
    for @matrix[$i].keys -> $j {
      @matrix[$i][$j] = 0 if @zero_rows[$i] || @zero_columns[$j];
    }
  }
}
