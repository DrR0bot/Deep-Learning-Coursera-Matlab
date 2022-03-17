function dy = ReLu_back(x)
[r,c] = size(x);
dy = zeros(r,c);
for i = 1: r
    for j = 1:c
        b = x(i,j);
        if b < 0
            dy(i,j) = 0;
        else
            dy(i,j) = 1;
        end
    end
end
end