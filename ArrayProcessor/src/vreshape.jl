@doc """
vreshape(array)

Input "array" must be a three-dimensional array.\n
Y = vreshape(array) returns a two-dimensional array. The new array is vcated by the third
dimensional of the original array.

Examples\n
 ≡≡≡≡≡≡≡≡≡≡\n
 julia> A\n
 2×2×2 Array{Float64,3}:\n
 [:, :, 1] =\n
  1.0  2.0\n
  3.0  4.0\n

 [:, :, 2] =\n
  5.0  6.0\n
  7.0  8.0\n


  julia> vreshape(A)\n
  4×2 Array{Any,2}:\n
   1.0  2.0\n
   3.0  4.0\n
   5.0  6.0\n
   7.0  8.0\n
""" ->

function vreshape(array)
    global varray = reshape([],0,size(array,2))
    for i = 1:size(array,3)
        varray = vcat(varray,array[:,:,i])
    end
    return varray
end
