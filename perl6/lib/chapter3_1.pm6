#!/usr/bin/env perl6

#= Describe how you could use a single array to implement three stacks.

#| role implemented by all triple stacks.
role TripleStack {
    has Int @!stack-pointer = -1, -1, -1;

    method push(Int $stack-num, Int $val) { ... }
    method pop(Int $stack-num) returns Int { ... }
    method peek(Int $stack-num) returns Int { ... }

    method is-empty(Int $stack-num) returns Bool {
        @!stack-pointer[$stack-num] < 0;
    }
}

#| naive approach dividing into three sub-arrays.
class NaiveTripleStack does TripleStack is export {
    has Int $!stack-size = 100;
    has Int @!buf;

    submethod TWEAK {
        @!buf = 0 xx ($!stack-size * 3);
    }

    method push(TripleStack:D: Int $stack-num, Int $val) {
        fail "stack full" if @!stack-pointer[$stack-num] >= $!stack-size - 1;
        @!stack-pointer[$stack-num]++;
        my $idx = self!get-index($stack-num);
        @!buf[$idx] = $val;
    }

    method pop(TripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        my $idx = self!get-index($stack-num);
        my $res = @!buf[$idx];
        @!stack-pointer[$stack-num]--;
        @!buf[$idx] = 0;
        $res;
    }

    method peek(TripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        my $idx = self!get-index($stack-num);
        @!buf[$idx];
    }

    method !get-index(TripleStack:D: Int $stack-num) returns Int {
        $stack-num * $!stack-size + @!stack-pointer[$stack-num];
    }
}


#| generic node with reference to previous node in buffer.
my class Node {
    has Int $.data is required;
    has Int $.prev is required;
}


#| more efficient solution that still has the drawback that when popping data from the stacks,
#| the unused space is not necessarily restored.
class EfficientTripleStack does TripleStack is export {
    has Int $!max-len = 300;
    has Int $!idx = 0;
    has Node @!buf;

    method push(EfficientTripleStack:D: Int $stack-num, Int $val) {
        fail "buffer full" if +@!buf >= $!max-len;
        my $last-idx = @!stack-pointer[$stack-num];
        @!stack-pointer[$stack-num] = $!idx++;
        @!buf[@!stack-pointer[$stack-num]] = Node.new(data => $val, prev => $last-idx);
    }

    method pop(EfficientTripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        my $res = @!buf[@!stack-pointer[$stack-num]].data;
        @!stack-pointer[$stack-num] = @!buf[@!stack-pointer[$stack-num]].prev;
        $!idx--;
        $res;
    }

    method peek(EfficientTripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        @!buf[@!stack-pointer[$stack-num]].data;
    }
}


#| imho best implementation of a triple stack. Uses more memory upfront, but fully recycles unused
#| buffer space.
class BestTripleStack does TripleStack is export {
    has Int $!max-len = 300;
    has Bool @!free;
    has Node @!buf;

    submethod TWEAK {
        @!free = True xx $!max-len;
    }

    method push(BestTripleStack:D: Int $stack-num, Int $val) {
        my $idx = self!get-new-index;
        @!free[$idx] = False;
        @!buf[$idx] = Node.new(data => $val, prev => @!stack-pointer[$stack-num]);
        @!stack-pointer[$stack-num] = $idx;
    }

    method pop(BestTripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        my $node = @!buf[@!stack-pointer[$stack-num]];
        @!free[@!stack-pointer[$stack-num]] = True;
        @!stack-pointer[$stack-num] = $node.prev;
        $node.data;
    }

    method peek(BestTripleStack:D: Int $stack-num) returns Int {
        fail "empty stack" if self.is-empty($stack-num);
        my $node = @!buf[@!stack-pointer[$stack-num]];
        $node.data;
    }

    method !get-new-index(BestTripleStack:D:) returns Int {
        fail "buffer full" unless my $pair = @!free.pairs.first(*.value);
        $pair.key;
    }
}
