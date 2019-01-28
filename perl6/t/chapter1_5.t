use v6.c;
use Test;
use lib 'lib';

use chapter1_5;

plan 5;

my $str = "hello world!";
replace-spaces($str);
is $str, "hello%20world!";

$str = "    ";
replace-spaces($str);
is $str, "%20%20%20%20";

$str = "hello world! ";
replace-spaces($str);
is $str, "hello%20world!%20";

$str = "helloworld!";
replace-spaces($str);
is $str, "helloworld!";

$str = "  hello world!";
replace-spaces($str);
is $str, "%20%20hello%20world!";

done-testing;
