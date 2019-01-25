use v6.c;
use Test;
use lib 'lib';

use chapter1_4;

plan 9;

ok are-anagrams("asdfg", "gfdsa");
ok are-anagrams("ggg", "ggg");
ok are-anagrams("binary", "brainy");
ok are-anagrams("", "");
ok are-anagrams("iihhffkklltt", "ihfkltihfklt");
nok are-anagrams("asdfgg", "gfdsa");
nok are-anagrams("anna", "anna ");
nok are-anagrams("pottee", "eettap");
nok are-anagrams("potter", "harry");

done-testing;
