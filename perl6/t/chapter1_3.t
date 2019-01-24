use v6.c;
use Test;
use lib 'lib';

use chapter1_3;

plan 15;

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


my $str6 = "aaaaaaa";
remove-dups-bis($str6);
is $str6, "a";

my $str7 = "abcd";
remove-dups-bis($str7);
is $str7, "abcd";

my $str8 = "";
remove-dups-bis($str8);
is $str8, "";

my $str9 = "abababababa";
remove-dups-bis($str9);
is $str9, "ab";

my $str0 = "aaaaabbbbb";
remove-dups-bis($str0);
is $str0, "ab";


my $str11 = "aaaaaaa";
remove-dups-fast($str11);
is $str11, "a";

my $str12 = "abcd";
remove-dups-fast($str12);
is $str12, "abcd";

my $str13 = "";
remove-dups-fast($str13);
is $str13, "";

my $str14 = "abababababa";
remove-dups-fast($str14);
is $str14, "ab";

my $str15 = "aaaaabbbbb";
remove-dups-fast($str15);
is $str15, "ab";

done-testing;
