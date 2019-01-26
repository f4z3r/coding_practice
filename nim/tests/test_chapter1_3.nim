import unittest

import coding_practice/chapter1_3


test "filter_unique":
  var str = "aaaaaaaaa"
  filter_unique(str)
  check(str == "a")

  str = "abcd"
  filter_unique(str)
  check(str == "abcd")

  str = ""
  filter_unique(str)
  check(str == "")

  str = "ababababababa"
  filter_unique(str)
  check(str == "ab")

  str = "aaaabbbbb"
  filter_unique(str)
  check(str == "ab")

test "filter_unique_fast":
  var str = "aaaaaaaaa"
  filter_unique_fast(str)
  check(str == "a")

  str = "abcd"
  filter_unique_fast(str)
  check(str == "abcd")

  str = ""
  filter_unique_fast(str)
  check(str == "")

  str = "ababababababa"
  filter_unique_fast(str)
  check(str == "ab")

  str = "aaaabbbbb"
  filter_unique_fast(str)
  check(str == "ab")
