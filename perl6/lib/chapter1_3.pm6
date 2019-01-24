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

# aternative solution not using sets
sub remove-dups-bis(Str $str is rw) is export {
    my $buf = $str.encode('ascii');
    $buf = Buf.new: $buf.kv.cache.map({ $^b unless [or] $buf[^$^a].map(* == $^b) });
    $str = $buf.decode('ascii');
}

# another alternative using constant memory
sub remove-dups-fast(Str $str is rw) is export {
    my $buf = Buf.new: $str.encode('ascii');
    for $buf.values -> $ch {
        state $idx = 0;
        state @seen = False xx 128;
        next if @seen[$ch];
        @seen[$ch] = True;
        $buf[$idx++] = $ch;
        LAST {
            $buf.pop for $idx..^$buf.elems;
        }
    }
    $str = $buf.decode('ascii');
}
        
    
