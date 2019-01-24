use v6.c;
use Test;
use lib 'lib';

use chapter1_2;

plan 3;

my $str1 = "hello";
rev($str1);
is $str1, "olleh";

my $str2 = "";
rev($str2);
is $str2, "";

my $str3 = "world";
rev($str3);
is $str3, "dlrow";

done-testing;
