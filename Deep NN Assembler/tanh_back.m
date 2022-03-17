function [ds] = tanh_back(x)
% TanH activation Function
ds =  (4 ./ (exp(-x) + exp(x)).^2);
end