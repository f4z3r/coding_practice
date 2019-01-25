import unittest

import coding_practice/chapter1_2

test "rev":
  var str = "hello"
  rev(str)
  check str == "olleh"

  str = ""
  rev(str)
  check str == ""

  str = "jake"
  rev(str)
  check str == "ekaj"
