# Write a method to decide if two strings are anagrams or not.

import math

func are_anagrams*(str1, str2: string): bool =
  var seen: array[128, int]
  for ch in str1:
    seen[int(ch)] += 1
  for ch in str2:
    seen[int(ch)] -= 1
    if seen[int(ch)] < 0: return false
  if sum(seen) == 0: return true
  false
