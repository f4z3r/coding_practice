#!/usr/bin/env perl6

#= Assume you have a method isSubstring which checks if one word is a substring of another Given two
#= strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to
#= isSubstring (i e , “waterbottle” is a rotation of “erbottlewat”).


sub is_rotation(Str $str1, Str $str2) returns Bool is export {
  return False if $str1.elems != $str2.elems;
  my $joined = $str1 ~ $str1;
  $joined.contains($str2);
}
