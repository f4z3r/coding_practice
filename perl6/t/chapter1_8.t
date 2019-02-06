use v6.c;
use Test;
use lib 'lib';

use chapter1_8;

plan 6;

ok is_rotation("hello", "elloh");
nok is_rotation("hello", "elloj");
ok is_rotation("apple", "pleap");
nok is_rotation("apple", "paple");
nok is_rotation("v", "elloh");
ok is_rotation("abababab", "babababa");

done-testing;
