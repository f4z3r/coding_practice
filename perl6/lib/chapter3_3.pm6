#!/usr/bin/env perl6

#= Imagine a (literal) stack of plates If the stack gets too high, it might topple. Therefore, in
#= real life, we would likely start a new stack when the previous stack exceeds some threshold
#= Implement a data structure `SetOfStacks` that mimics this `SetOfStacks` should be composed of
#= several stacks, and should create a new stack once the previous one exceeds capacity.
#= `SetOfStacks::push()` and `SetOfStacks::pop()` should behave identically to a single stack
#=  (that is, `pop()` should return the same values as it would if there were just a single stack)
#=
#= FOLLOW UP
#=
#= Implement a function `popAt(int index)` which performs a pop operation on a specific sub-stack.

class SetofStacks is export {
    has Int $!capacity = 20;
    has Array[Int] @!stacks;

    submethod BUILD(:$capacity) {
        $!capacity = $capacity;
    }

    submethod TWEAK {
        @!stacks = ();
    }

    method push(SetofStacks:D: Int $val) {
        if self!last-stack.defined and self!last-stack.elems < $!capacity {
            self!last-stack.push($val);
        } else {
            @!stacks.push((my Int @ = ($val,)));
        }
    }

    method pop(SetofStacks:D:) returns Int {
        @!stacks.pop until self!last-stack;
        self!last-stack.pop;
    }

    method pop-at(SetofStacks:D: Int $stack-num) returns Int {
        fail "out of bounds" unless @!stacks[$stack-num].defined;
        @!stacks[$stack-num].pop;
    }

    method !last-stack(SetofStacks:D:) returns Array[Int] {
        fail "stack is empty" if @!stacks.end == -1;
        @!stacks[@!stacks.end];
    }
}
