use v6.c;
use Test;
use lib 'lib';

use chapter1_3;

plan 5;

my $str1 = "aaaaaaa";
remove-dups($str1);
is $str1, "a";

my $str2 = "abcd";
remove-dups($str2);
is $str2, "abcd";

my $str3 = "";
remove-dups($str3);
is $str3, "";

my $str4 = "abababababa";
remove-dups($str4);
is $str4, "ab";

my $str5 = "aaaaabbbbb";
remove-dups($str5);
is $str5, "ab";

done-testing;
