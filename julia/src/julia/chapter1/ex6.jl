module Ex6
export rotate!

"""
Rotates a square image by 90 degrees clockwise.
"""
function rotate!(matrix::Matrix)
  @assert ndims(matrix) == 2
  nrow, ncol = size(matrix)
  @assert nrow == ncol
  half_length = Int(floor(nrow / 2))
  inner_length = nrow % 2 == 1 ? half_length + 1 : half_length
  for i = 1:half_length, j=1:inner_length
    tmp = matrix[i,j]
    matrix[i,j] = matrix[nrow + 1 - j,i]
    matrix[nrow + 1 - j,i] = matrix[nrow + 1 - i,nrow + 1 - j]
    matrix[nrow + 1 - i,nrow + 1 - j] = matrix[j,nrow + 1 - i]
    matrix[j,nrow + 1 - i] = tmp
  end
end

end
