# matrix transformation (large diagonal elements move to upper) k: pivot
function pivoting!(
    m::Int,
    s::Matrix{Float64},
    k::Int
    )
    v0::Vector{Float64} = zeros(m+1);
    v1::Vector{Float64} = zeros(m+1);
    possess::Int = 0;
    max::Float64 = 0.0;

    for i=k:m
        r = abs(s[i,k]);
        if max <= r
            max = r;
            possess = i;
        end
    end

    for j=1:m+1
        v0[j] = s[possess,j];
        v1[j] = s[k,j];
    end

    for j=1:m+1
        s[possess,j] = v1[j];
        s[k,j] = v0[j];
    end
end

# Gaussian elimination (row reduction)
function gaussianElimination!(
    m::Int,
    s::Matrix{Float64},
    e::Vector{Float64}
    )
    for i=1:m
        pivoting!(m,s,i);
    end

    for l=1:m                 # forward
        if s[l,l] != 0.0
            w = 1.0/s[l,l];
        else
            w = 1.0;
        end
        for j=l:m+1
            s[l,j] *= w;
            for i=l:m
                s[i,j] -= s[i,l]*s[l,j];
            end
        end
    end

    for i=m:-1:1              # backward
        sum = 0.0;
        for j=i:m
            sum += s[i,j]*e[j];
        end
        e[i] = s[i,m+1] - sum;
    end
end