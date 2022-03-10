function [n_x, n_h, n_y,m] = layer_sizes(X,Y,nh)
n_x = size(X,1);
n_h = nh;
n_y = size(Y,1);
m = size(Y,2);
end