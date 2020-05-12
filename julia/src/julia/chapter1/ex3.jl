module Ex3
export remove_dup_chars, remove_dup_chars_custom

"""
     remove_dup_chars("hello") #=> "helo"

Remove duplicate characters from a string.
"""
function remove_dup_chars(str::String)::String
  return join(unique(x -> x, str), "")
end

"""
     remove_dup_chars_custom("hello") #=> "helo"

Remove duplicate characters from a string.
"""
function remove_dup_chars_custom(str::String)::String
  seen = Set{Char}()
  arr = filter(str) do ch
    if ch in seen
      false
    else
      push!(seen, ch)
      true
    end
  end
  return join(arr, "")
end


end
