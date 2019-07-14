function newCurve!(p::Vector{Float64})
    count::Int = 1;
    x::Vector{Float64} = zeros(VN);
    dx::Vector{Float64} = zeros(VN);

    real_part::Vector{Float64} = zeros(SN);
    imaginary_part::Vector{Float64} = zeros(SN);

    # file
    if !isdir("./Data")
        mkdir("./Data");
    else
        files::Vector{String} = readdir("./Data");
        for file in files
            rm("./Data/$file");
        end
    end
    FOUT1 = open("./Data/fp.dat","w");  # file for fixed point
    FOUT2 = open("./Data/ev.dat","w");  # file for eigenvalues

    fix_num0::Int = VN;

    # initial condition
    x[1:SN] = getSteadyState(p);
    x[end] = p[BP];

    direction::Bool = false;  # <--- || --->

    # initial fixed
    fix_val::Float64 = x[fix_num0];
    fix_num::Int = fix_num0;
    x[fix_num] = fix_val;

    # first Newton's method
    successful::Bool = true;
    newtonsMethod!(x,real_part,imaginary_part,fix_num,p,successful);

    write(FOUT1,@sprintf("%d\t",count));
    for i=1:VN
        write(FOUT1,@sprintf("%10.8e\t",x[i]));
    end
    write(FOUT1,@sprintf("%d\n",fix_num));

    write(FOUT2,@sprintf("%d\t",count));
    for i=1:SN
        write(FOUT2,@sprintf("%10.8e\t%10.8e\t",real_part[i],imaginary_part[i]));
    end
    write(FOUT2,@sprintf("%10.8e\t%d\n",p[BP],fix_num));

    count += 1;

    # keep optimums
    px::Vector{Float64} = copy(x);

    # variation
    direction ? fix_val += IVAL : fix_val -= IVAL;

    # same fixed variable
    x[fix_num] = fix_val;

    while count <= MC && successful
        newtonsMethod!(x,real_part,imaginary_part,fix_num,p,successful);

        # maximum variation
        for i=1:VN
            dx[i] = x[i] - px[i];
        end
        sum = 0.0;
        for i=1:VN
            sum += dx[i]*dx[i];
        end
        ave = sqrt(sum);
        for i=1:VN
            dx[i] /= ave;
        end
        px = copy(x);
        for i=1:VN
            x[i] += abs(RATE)*dx[i];
        end

        # fix variable with maximum variation
        j::Int = 1;
        for i=2:VN
            if abs(dx[j]) < abs(dx[i])
                j = i;
            end
        end
        fix_num = j;

        # Stop calc.
        if x[end] <= 0.0
            successful = false;
        end

        write(FOUT1,@sprintf("%d\t",count));
        for i=1:VN
            write(FOUT1,@sprintf("%10.8e\t",x[i]));
        end
        write(FOUT1,@sprintf("%d\n",fix_num));

        write(FOUT2,@sprintf("%d\t",count));
        for i=1:SN
            write(FOUT2,@sprintf("%10.8e\t%10.8e\t",real_part[i],imaginary_part[i]));
        end
        write(FOUT2,@sprintf("%10.8e\t%d\n",p[BP],fix_num));

        count += 1;
    end

    close(FOUT1);
    close(FOUT2);
end