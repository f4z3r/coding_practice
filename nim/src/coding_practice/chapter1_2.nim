# Write code to reverse a C-style string. (C-string means that "abcd" is
# represented as five characters, including the null character.)

proc rev*(str: var string) =
  ## nim solution; does not handle c-strings
  let last = len(str) - 1
  for idx, _ in str:
    if idx > last - idx: break
    (str[idx], str[last-idx]) = (str[last-idx], str[idx])


