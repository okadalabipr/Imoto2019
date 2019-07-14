# Newton's method
function newtonsMethod!(
    x::Vector{Float64},
    real_part::Vector{Float64},
    imaginary_part::Vector{Float64},
    fix_num::Int,
    p::Vector{Float64},
    successful::Bool
    )
    u::Vector{Float64} = zeros(SN);
    vx::Vector{Float64} = zeros(MN);
    s::Matrix{Float64} = zeros(MN,MN+1);

    for i=1:VN
        if fix_num == i
            for j=1:MN
                idx = i+j;
                if idx > VN
                    idx -= VN;
                end
                vx[j] = x[idx];
            end
            break;
        else
            continue;
        end
    end

    # initial error
    e::Vector{Float64} = zeros(MN);
    error::Float64 = 1.0;

    while error > NEPS
        for i=1:VN
            if fix_num == i
                idx_param = VN-i;
                if idx_param == 0
                    y = x[fix_num];
                else
                    y = vx[idx_param];
                end
                p[BP] = y;
                for j=1:MN
                    idx = j-i;
                    if idx == 0
                        y = x[fix_num];
                    elseif idx < 0
                        y = vx[VN+idx];
                    else
                        y = vx[idx];
                    end
                    u[j] = y;
                end
                break;
            else
                continue;
            end
        end

        # initialization
        dFdx::Matrix{Float64} = jacobian(diffeq,u);
        dFdp::Vector{Float64} = getDerivatives(u,p);

        F::Vector{Float64} = diffeq(u);

        eigenvalues::Array{Complex{Float64},1} = eigvals(dFdx);
        for i=1:SN
            real_part[i] = real(eigenvalues[i]);
            imaginary_part[i] = imag(eigenvalues[i]);
        end

        # s = [dF-F]
        for i=1:VN
            if fix_num == i
                for k=1:SN
                    for j=1:SN
                        idx = i+j;
                        if idx == VN
                            dF = dFdp[k];
                        elseif idx > VN
                            dF = dFdx[k,idx-VN];
                        else
                            dF = dFdx[k,idx];
                        end
                        s[k,j] = dF;
                    end
                    s[k,VN] = -F[k];
                end
                break;
            else
                continue;
            end
        end

        gaussianElimination!(MN,s,e);

        # update error
        error = 0.0;
        for i=1:MN
            vx[i] += e[i];
            error += e[i]*e[i];
        end
        error = sqrt(error);
        if isnan(error) || isinf(error)
            successful = false;
            break;
        end
    end

    for i=1:VN
        if fix_num == i
            for j=1:MN
                idx = i+j;
                if idx > VN
                    idx -= VN;
                end
                x[idx] = vx[j];
            end
            break;
        else
            continue;
        end
    end
end