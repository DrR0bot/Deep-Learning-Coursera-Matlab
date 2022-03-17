function dy = Leaky_ReLu_back(x,a)
[r,c] = size(x);
dy = zeros(r,c);
for i = 1: r
    for j = 1:c
        b = x(i,j);
        if b < 0
            dy(i,j) = a;
        else
            dy(i,j) = 1;
        end
    end
end
end