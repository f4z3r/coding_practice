use v6.c;
use Test;
use lib 'lib';

use chapter1_1;

plan 2;

subtest "fast solution", {
    plan 7;

    ok has-unique-chars("abcdefghijk");
    ok has-unique-chars("abcpkljse");
    nok has-unique-chars("abcabc");
    nok has-unique-chars("aaopffdvfdf");
    nok has-unique-chars("ploidskl");
    ok has-unique-chars("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"");
    nok has-unique-chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"");

    done-testing;
}

subtest "slow solution", {
    plan 7;

    ok has-unique-chars-slow("abcdefghijk");
    ok has-unique-chars-slow("abcpkljse");
    nok has-unique-chars-slow("abcabc");
    nok has-unique-chars-slow("aaopffdvfdf");
    nok has-unique-chars-slow("ploidskl");
    ok has-unique-chars-slow("qwertyuiopasdfghjklzxcvbnm,./[];'\\\"");
    nok has-unique-chars-slow("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\"");

    done-testing;
}

done-testing;
