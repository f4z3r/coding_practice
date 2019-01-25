# Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?

func has_unique_chars*(str: string): bool =
  ## using an array; supports only ascii strings
  var seen: array[128, bool]
  for ch in str:
    if seen[int(ch)]: return false
    seen[int(ch)] = true
  true

func has_unique_chars_bis*(str: string): bool =
  ## not using any other structures; is O(n^2) complexity
  for idx, ch1 in str:
    for ch2 in str[idx+1..^1]:
      if ch2 == ch1: return false
  true
