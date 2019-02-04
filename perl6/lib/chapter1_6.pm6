#!/usr/lib/env perl6


# Given an image represented by an NxN matrix, where at each pixel in the image is 4 bytes, write a
# method to rotate the image by 90 degrees. Can you do this in place?


sub rotate(@image) is export {
  my $row-count = @image.elems;
  my $half-rows = round($row-count / 2);
  my $inner-rows = $half-rows;
  $inner-rows-- if not $row-count %% 2;
  for 0..^$half-rows -> $row {
    for 0..^$inner-rows -> $column {
      swap-pixels-in-quadrants(@image, $row-count, $row, $column);
    }
  }
}

sub swap-pixels-in-quadrants(@image, $row-count, $row, $column) {
  my $temp = @image[$row][$column];
  @image[$row][$column] = @image[$row-count - $column - 1][$row];
  @image[$row-count - $column - 1][$row] = @image[$row-count - $row - 1][$row-count - $column - 1];
  @image[$row-count - $row - 1][$row-count - $column - 1] = @image[$column][$row-count - $row - 1];
  @image[$column][$row-count - $row - 1] = $temp;
}

