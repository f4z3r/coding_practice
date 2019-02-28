#!/usr/bin/env perl6

#= Implement a MyQueue class which implements a queue using two stacks.

class StackQueue is export {
    has Int @!stack1;
    has Int @!stack2;

    submethod TWEAK {
        @!stack1 = ();
        @!stack2 = ();
    }

    method add(StackQueue:D: Int $val) {
        @!stack1.push: $val;
    }

    method remove(StackQueue:D:) returns Int {
        return @!stack2.pop if @!stack2;
        while @!stack1 {
            @!stack2.push: @!stack1.pop;
        }
        @!stack2.pop;
    }
}
