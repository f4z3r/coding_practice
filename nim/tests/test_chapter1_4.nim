import unittest

import coding_practice/chapter1_4

test "are_anagrams":
        check(are_anagrams("asdfg", "gfdsa"))
        check(are_anagrams("ggg", "ggg"))
        check(are_anagrams("binary", "brainy"))
        check(are_anagrams("", ""))
        check(are_anagrams("iihhffkklltt", "ihfkltihfklt"))
        check(not are_anagrams("asdfgg", "gfdsa"))
        check(not are_anagrams("anna", "anna "))
        check(not are_anagrams("pottee", "eettap"))
        check(not are_anagrams("potter", "harry"))
