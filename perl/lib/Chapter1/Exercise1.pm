#!/usr/bin/env perl

use strict;
use warnings;

# Implement an algorithm to determine if a string has all unique characters. What if you
# cannot use additional data structures?
sub is_unique {
  my $str = shift;

  my @cache = [0 x 128];
  foreach my $char (split //, $str) {
    return 0 if $cache[ord $char];
    $cache[ord $char] = 1;
  }
  return 1;
}

sub is_unique_no_array {
  my $str = shift;

  for my $idx (0 .. length($str) - 1) {
    my $curr = substr $str, $idx, 1;
    for my $runner ($idx + 1 .. length($str) - 1) {
      if ($curr eq substr $str, $runner, 1) {
        return 0;
      }
    }
  }
  return 1;
}


1;
