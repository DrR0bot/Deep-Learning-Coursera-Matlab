function [W1,b1,W2,b2] = rand_initialize(n_x,n_h,n_y)

W1 = rand(n_h,n_x) * 0.01;
b1 = zeros(n_h,1);
W2 = rand(n_y,n_h) * 0.01;
b2 = zeros(n_y,1);

end