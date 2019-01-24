#!/usr/bin/env perl6

# Write code to reverse a C-style string. (C-string means that "abcd"
# is represented as five characters, including the null character.)

sub rev(Str $str is rw) is export {
    # simlate c-string
    my $buf = $str.encode('ascii');
    my $cs = Buf.new($buf);
    $cs.push(0);

    # $cs contains simulated c-string
    for $cs.keys -> $idx {
        state $last-idx = $cs.end;
        my $swap-idx = $last-idx - 1 - $idx;
        last if $swap-idx <= $idx;
        ($cs[$idx], $cs[$swap-idx]) = ($cs[$swap-idx], $cs[$idx]);
    }

    # reassign since perl6 strings are immutable
    $cs.pop;    # remove trailing \0
    $str = $cs.decode('ascii');
}

