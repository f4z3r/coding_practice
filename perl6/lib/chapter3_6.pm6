#!/usr/bin/env perl6

#= Write a program to sort a stack in ascending order. You should not make any assumptions about
#= how the stack is implemented. The following are the only functions that should be used to write
#= this program: push | pop | peek | isEmpty.

sub sort-stack(Int @stack) is export {
    my Int @res;
    while @stack {
        my $temp = @stack.pop;
        @stack.push: @res.pop while @res and @res[@res.end] > $temp;
        @res.push: $temp;
    }
    @stack = @res;
}
