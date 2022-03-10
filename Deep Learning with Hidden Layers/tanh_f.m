function [s] = tanh_f(x)
% Sigmoid Function
s = (exp(x) - exp(-x)) ./ (exp(x) + exp(-x));
end