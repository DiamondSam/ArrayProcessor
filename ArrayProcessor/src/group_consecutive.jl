@doc """
group_consecutive(x)

x is a vector. group_consecutive(x) separates one or more arrays of consecutive numbers

Examples\n
 ≡≡≡≡≡≡≡≡≡≡\n
julia> x=[1,3,4,5,7]\n
julia> group_consecutive(x)\n
3-element Array{Array{Int64,1},1}:\n
[1]\n
[3, 4, 5]\n
[7]\n

""" ->
function group_consecutive(x)
        return numsplit(x,findall(diff(x) .!== 1))
end
