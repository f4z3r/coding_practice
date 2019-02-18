#!/usr/bin/env perl6

#= Write a method to replace all spaces in a string with '%20'.

# Requires an additional buffer since strings are not mutable in perl6 so it
# would be required even if the original string was converted to a buffer.

sub replace-spaces(Str $str is rw) is export {
  my $result = Buf.new;
  for $str.comb -> $ch {
    if $ch eq ' ' {
      $result.push("%20".encode('ascii'));
    } else {
      $result.push($ch.ord);
    }
  }
  $str = $result.decode('ascii');
}
