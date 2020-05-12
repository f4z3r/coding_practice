module Ex5
export replace_spaces

"""
    replace_spaces("anna hello there") #=> "anna%20hello%20there"

Replaces spaces with '%20'.
"""
function replace_spaces(str::String)::String
  arr = Array{Char,1}()
  sizehint!(arr, length(str))
  for ch in str
    if ch == ' '
      push!(arr, '%', '2', '0')
    else
      push!(arr, ch)
    end
  end
  return join(arr, "")
end

end
