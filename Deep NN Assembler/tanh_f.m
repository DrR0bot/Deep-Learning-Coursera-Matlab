function [s] = tanh_f(x)
% TanH activation Function
s = (exp(x) - exp(-x)) ./ (exp(x) + exp(-x));
end