use v6.c;
use Test;
use lib 'lib';

use chapter1_1;

plan 14;

ok has-unique-chars("abcdefghijk"), "fast 1 works";
ok has-unique-chars("abcpkljse"), "fast 2 works";
nok has-unique-chars("abcabc"), "fast 3 works";
nok has-unique-chars("aaopffdvfdf"), "fast 4 works";
nok has-unique-chars("ploidskl"), "fast 5 works";
ok has-unique-chars("qwertyuiopasdfghjklzxcvbnm,./[];'\\\""), "fast 6 works";
nok has-unique-chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""), "fast 7 works";

ok has-unique-chars-slow("abcdefghijk"), "slow 1 works";
ok has-unique-chars-slow("abcpkljse"), "slow 2 works";
nok has-unique-chars-slow("abcabc"), "slow 3 works";
nok has-unique-chars-slow("aaopffdvfdf"), "slow 4 works";
nok has-unique-chars-slow("ploidskl"), "slow 5 works";
ok has-unique-chars-slow("qwertyuiopasdfghjklzxcvbnm,./[];'\\\""), "slow 6 works";
nok has-unique-chars-slow("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""), "slow 7 works";

done-testing;
