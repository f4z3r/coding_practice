#!/usr/bin/env perl6

#= You have two numbers represented by a linked list, where each node contains a single digit. The
#= digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a
#= function that adds the two numbers and returns the sum as a linked list.
#=
#= EXAMPLE
#= Input (3 -> 1 -> 5), (5 -> 9 -> 2)
#= Ouput (8 -> 0 -> 8)

use chapter2_1;

#| add two lists representing two natural values into a new list.
sub add(Node $num1 is copy, Node $num2 is copy, Int $carry = 0) returns Node is export {
    return if ($num1, $num2).map(*.defined).none and $carry == 0;
    my $sum = ($num1, $num2).grep(*.defined).map(*.data).sum + $carry;
    .=next if .defined for $num1, $num2;
    Node.new(data => $sum % 10, next => add($num1, $num2, $sum > 10 ?? 1 !! 0));
}
