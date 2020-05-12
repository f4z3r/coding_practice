module Ex4
export are_anagrams

"""
    are_anagrams("anna", "aann") #=> true

Returns whether the arguments are anagrams.
"""
function are_anagrams(str1, str2)
  if length(str1) != length(str2) return false end
  sorted1 = sort(collect(str1))
  sorted2 = sort(collect(str2))
  return all(zip(sorted1, sorted2)) do (ch1, ch2)
    ch1 == ch2
  end
end

end
