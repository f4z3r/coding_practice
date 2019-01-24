#!/usr/bin/env perl6

# Design an algorithm and write code to remove the duplicate characters in a
# string without using any additional buffer.
#
# NOTE: One or two additional variables are fine. An extra copy of the array is
# not.
#
# FOLLOW UP
# Write the test cases for this method.

# perl6 has immutable strings, hence this question is not possible without
# additional buffers.
sub remove-dups(Str $str is rw) is export {
    # transform into a blob of bytes, essentially equivalent to creating a cstring
    my $buf = $str.encode('ascii');     
    $buf = Buf.new: $buf.kv.cache.map({ $^b unless $^b (elem) $buf[^$^a].Set });
    $str = $buf.decode('ascii');
}
