module Ex1
export has_unique_chars, has_unique_chars_fast

"""
    julia> has_unique_chars("hello")  #=> false

Checks if the string contains only unique characters.
"""
function has_unique_chars(str::String)::Bool
  for (idx, ch1) in enumerate(str)
    for ch2 in str[idx+1:end]
      ch1 == ch2 && return false
    end
  end
  return true
end

"""
    julia> has_unique_chars_fast("hello")  #=> false

Checks if the string contains only unique characters.
"""
function has_unique_chars_fast(str::String)::Bool
  unique = trues(128)
  for ch in str
    idx = Int(ch)
    !unique[idx+1] && return false
    unique[idx+1] = false
  end
  return true
end

end


