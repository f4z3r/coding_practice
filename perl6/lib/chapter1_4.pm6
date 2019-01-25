#!/usr/bin/env perl6

# Write a method to decide if two strings are anagrams or not.

sub are-anagrams(Str $str1, Str $str2) returns Bool is export {
    my @seen = 0 xx 128;
    for $str1.comb -> $ch {
        @seen[$ch.ord]++;
    }
    for $str2.comb -> $ch {
        @seen[$ch.ord]--;
        return False if @seen[$ch.ord] < 0;
    }
    not [or] @seen;
}
