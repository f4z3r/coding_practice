#!/usr/bin/env perl6

use chapter2_1;

sub add(Node $num1 is copy, Node $num2 is copy, Int $carry = 0) returns Node is export {
    return if ($num1, $num2).map(*.defined).none and $carry == 0;
    my $sum = ($num1, $num2).grep(*.defined).map(*.data).sum + $carry;
    .=next if .defined for $num1, $num2;
    Node.new(data => $sum % 10, next => add($num1, $num2, $sum > 10 ?? 1 !! 0));
}
