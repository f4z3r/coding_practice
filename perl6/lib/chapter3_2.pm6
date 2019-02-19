#!/usr/bin/env perl6

#= How would you design a stack which, in addition to push and pop, also has a function min which
#= returns the minimum element? Push, pop, and min should all operate in O(1) time.

class MinStack is export {
    has Int @!stack;
    has Int @!mins;

    method push(MinStack:D: Int $val) {
        @!stack.push($val);
        @!mins.push($val) if not self.min.defined or self.min >= $val;
    }

    method pop(MinStack:D:) returns Int {
        @!mins.pop if self.min == my $res = @!stack.pop;
        $res;
    }

    method min(MinStack:D:) returns Int {
        fail "stack is empty" if @!mins.end == -1;
        @!mins[@!mins.end];
    }
}
