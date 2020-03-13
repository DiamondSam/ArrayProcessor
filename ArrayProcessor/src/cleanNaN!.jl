@doc """
cleanNaN!(y)

y is a vector that has many "NaN". cleanNaN!(y) keeps the front NaN,
change the other NaN based on the previous and last data. \n
!!! Be careful, thisfunction can change the original vector y.

Examples\n
≡≡≡≡≡≡≡≡≡≡\n
julia> y=[NaN ,NaN, 1 ,1.1 ,1.3, NaN,NaN,3.4,4,NaN]\n
julia> cleanNaN!(y)\n
10-element Array{Float64,1}:\n
 NaN\n
 NaN\n
   1.0\n
   1.1\n
   1.3\n
   2.0\n
   2.6999999999999997\n
   3.4\n
   4.0\n
   4.0\n
""" ->

function interpolate!(y)
    len = length(y)
    nanindex = findall(isnan.(y))
    if isempty(nanindex)
        return y
    else
        missingnan = nanindex[findall(nanindex .!== eachindex(nanindex))]
        if isempty(missingnan)
            return y
        else
            missingnan = group_consecutive(missingnan)
            if isa(missingnan, Array{Array{Int64,1},1})
                for i in missingnan
                    start = y[i[1]-1]
                    try
                        lastn = y[i[end]+1]
                        delt_y = (lastn - start)/(length(i)+1)
                        for j = 1:length(i)
                            y[i[j]] = start + delt_y*j
                        end
                    catch
                        y[i] .= start
                    end
                end
                return y
            else
                i = missingnan
                start = y[i[1]-1]
                try
                    lastn = y[i[end]+1]
                    delt_y = (lastn - start)/(length(i)+1)
                    for j = 1:length(i)
                        y[i[j]] = start + delt_y*j
                    end
                catch
                    y[i] .= start
                end
                return y
            end
        end
    end
end


# function chazhi(y)
#     len = length(y)
#     nanindex = findall(isnan.(y))
#     if isempty(nanindex)
#         return y
#     else
#         len_1 = length(findall(nanindex .== eachindex(nanindex)))
#         if len_1 < nanindex[end]
#         #x is the nest 10 numbers that we have
#             x = y[len_1+1:len_1 + min(nanindex[len_1+1]  - len_1-1,30,len-len_1)]
#             x_trend = (mean(x)-x[1])/length(x)
#             for i = 1:len_1
#                 y[i] = y[len_1+1] - x_trend*(len_1-i+1)
#             end
#         else
#             x = y[len_1+1:len_1 + min(30,len-len_1)]
#             x_trend = (mean(x)-x[1])/length(x)
#             for i = 1:len_1
#                 y[i] = y[len_1+1] - x_trend*(len_1-i+1)
#             end
#         end
#         return y
#     end
# end
#
# function chazhi2(y)
#     len = length(y)
#     nanindex = findall(isnan.(y))
#     if isempty(nanindex)
#         return y
#     else
#         len_1 = length(findall(nanindex .== eachindex(nanindex)))
#         if len_1 < nanindex[end]
#         #x is the nest 10 numbers that we have
#             x = y[len_1+1:len_1 + min(nanindex[len_1+1]  - len_1-1,30,len-len_1)]
#             x_mean = mean(x)
#             for i = 1:len_1
#                 y[i] = x_mean
#             end
#         else
#             x = y[len_1+1:len_1 + min(30,len-len_1)]
#             x_mean = mean(x)
#             for i = 1:len_1
#                 y[i] = x_mean
#             end
#         end
#         return y
#     end
# end
