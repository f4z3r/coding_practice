#!/usr/bin/env perl6

#= In the classic problem of the Towers of Hanoi, you have 3 rods and N disks of different sizes
#= which can slide onto any tower. The puzzle starts with disks sorted in ascending order of size
#= from top to bottom (e.g. each disk sits on top of an even larger one). You have the following
#= constraints:
#=
#= (A) Only one disk can be moved at a time
#= (B) A disk is slid off the top of one rod onto the next rod
#= (C) A disk can only be placed on top of a larger disk
#=
#= Write a program to move the disks from the first rod to the last using Stacks.

my class Tower {
    has Int $.index is required;
    has Int @!disks;

    submethod BUILD(Int :$!index, Int :$capacity = 0) {
        if $capacity {
            @!disks = (1..$capacity).reverse;
        } else {
            @!disks = ();
        }
    }

    method add(Tower:D: Int $disk) {
        fail "illegal" unless @!disks.end == -1 or @!disks[@!disks.end] >= $disk;
        @!disks.push: $disk;
    }

    method move-to-top(Tower:D: Tower:D $dest) returns Str {
        my $top = @!disks.pop;
        $dest.add($top);
        "moving disk $top from tower $!index to tower $dest.index()\n";
    }

    method move-disks(Tower:D: Int $disk-count, Tower:D $dest, Tower:D $buf) returns Str {
        if $disk-count > 0 {
            my $movements = self.move-disks($disk-count - 1, $buf, $dest);
            $movements ~= self.move-to-top($dest);
            $movements ~= $buf.move-disks($disk-count - 1, $dest, self);
        } else {
            "";
        }
    }
}

class HanoiProgram is export {
    has Tower $!t1;
    has Tower $!t2;
    has Tower $!t3;
    has Int $!size = 3;

    submethod TWEAK {
        $!t1 = Tower.new(index => 1, capacity => $!size);
        $!t2 = Tower.new(index => 2);
        $!t3 = Tower.new(index => 3);
    }

    method run(HanoiProgram:D:) returns Str {
        $!t1.move-disks($!size, $!t3, $!t2);
    }
}
