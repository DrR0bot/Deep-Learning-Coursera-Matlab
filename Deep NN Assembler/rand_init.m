function [W,b] = rand_init(n_h,n_a,m)
W = rand(n_h,n_a) * 0.01;
b = zeros(n_h,m);
end