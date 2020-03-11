@doc """
eye(m),eye(m,n)

Y = eye(n) returns the n-by-n identity matrix. Y = eye(m,n) or eye([m n]) returns
an m-by-n matrix with 1's on the diagonal and 0's elsewhere.\n Y = eye(size(A))
returns an identity matrix the same size as A .

Examples\n
 ≡≡≡≡≡≡≡≡≡≡\n
 julia> ArrayProcessor.eye(3,4)\n
 3×4 Array{Float64,2}:\n
  1.0  0.0  0.0  0.0\n
  0.0  1.0  0.0  0.0\n
  0.0  0.0  1.0  0.0\n

""" ->

function eye(m::Int)
  Matrix(1.0I, m, m)
end

function eye(m::Int,n::Int)
  Matrix(1.0I, m, n)
end
