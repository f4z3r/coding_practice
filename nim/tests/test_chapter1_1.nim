import unittest

import coding_practice/chapter1_1

test "has_unique_chars":
  check(has_unique_chars("abcdefghijkl"))
  check(has_unique_chars("abcpkljse"))
  check(not has_unique_chars("abcabc"))
  check(not has_unique_chars("aaopffdvfdf"))
  check(not has_unique_chars("ploisdskl"))
  check(has_unique_chars("qwertyuiopasdfghjklzxcvbnm"))
  check(has_unique_chars("qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""))
  check(not has_unique_chars("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""))

test "has_unique_chars_bis":
  check(has_unique_chars_bis("abcdefghijkl"))
  check(has_unique_chars_bis("abcpkljse"))
  check(not has_unique_chars_bis("abcabc"))
  check(not has_unique_chars_bis("aaopffdvfdf"))
  check(not has_unique_chars_bis("ploisdskl"))
  check(has_unique_chars_bis("qwertyuiopasdfghjklzxcvbnm"))
  check(has_unique_chars_bis("qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""))
  check(not has_unique_chars_bis("?qwertyuiopasdfghjklzxcvbnm,./[]?;'\\\""))
