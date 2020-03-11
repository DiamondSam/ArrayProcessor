@doc """
numsplit(x, n)

x is a vector. n is the position where you want to split x.\n
numsplit(x, n) returns two vectors. The first one is composed of the
front n elements. The second one is composed of the remaining part.

Examples\n
 ≡≡≡≡≡≡≡≡≡≡\n
 julia> x=[1,3,4,5,7]\n
 julia> numsplit(x, n)\n
2-element Array{Array{Int64,1},1}:\n
 [1, 3]\n
 [4, 5, 7]\n

""" ->

function numsplit(x, n)
    result = Vector{Vector{eltype(x)}}()
    start = 1
    len = length(x)
    if isempty(n)
        return x
    else
        for i in n
            push!(result, x[start:i])
            start = i+1
        end
        last = x[n[end]+1:end]
        if isempty(last)
            []
        else
            push!(result,last)
        end
        return result
    end
end
