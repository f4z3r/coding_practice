# Design an algorithm and write code to remove the duplicate characters in a
# string without using any additional buffer.
#
# Note: One or two additional variables are fine. An extra copy of the arrray is
# not.
#
# Follow up:
# Write the test cases for this method.

proc filter_unique*(str: var string) =
  ## quadratic runtime solution; does not use additional buffers
  var tail = 1
  for idx1, _ in str:
    for idx2 in 0..<tail:
      if str[idx1] == str[idx2]: break
      if idx2 == tail-1:
        str[tail] = str[idx1] 
        tail += 1
  str[tail..^1] = ""

proc filter_unique_fast*(str: var string) =
  ## linear runtime solution; uses additional buffer
  var seen: array[128, bool]
  var tail = 0
  for ch in str:
    if seen[int(ch)]: continue
    seen[int(ch)] = true
    str[tail] = ch
    tail += 1
  str[tail..^1] = ""


