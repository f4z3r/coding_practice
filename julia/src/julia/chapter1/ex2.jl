module Ex2
export reverse_c_str

"""
    reverse("hello0") #=> "olleh0"

Reverses a string while preserving the termination character.
"""
function reverse_c_str(str::String)::String
  arr = Array{Char,1}()
  for ch in str[end-1:-1:1]
    push!(arr, ch)
  end
  return join(arr, "") * "0"
end

end
