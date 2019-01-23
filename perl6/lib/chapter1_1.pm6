#!/usr/bin/env perl6


# Implement an algorithm to determine if a string has all unique characters What
# if you can not use additional data structures?

# Using an array and supporting only ASCII strings.
sub has-unique-chars(Str $str) returns Bool is export {
    my @seen = False xx 128;
    for $str.comb -> $char {
        return False if @seen[$char.ord];
        @seen[$char.ord] = True;
    }
    True;
}

# Slower solution but does not require any additional data structure.
sub has-unique-chars-slow(Str $str) returns Bool is export {
    for $str.comb.kv -> $idx, $char {
        return False if $str.comb[$idx^..*].contains($char);
    }
    True;
}
