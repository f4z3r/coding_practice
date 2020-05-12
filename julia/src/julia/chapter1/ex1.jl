module Ex1
export has_unique_chars, has_unique_chars_fast

function has_unique_chars(str::String)::Bool
  for (idx, ch1) in enumerate(str)
    for ch2 in str[idx+1:end]
      if ch1 == ch2 return false end
    end
  end
  return true
end

function has_unique_chars_fast(str::String)::Bool
  chars = zeros(128)
  for ch in str
    idx = Int(ch)
    if chars[idx+1] > 0 return false end
    chars[idx+1] += 1
  end
  return true
end

end


