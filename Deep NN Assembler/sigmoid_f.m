function [s] = sigmoid_f(x)
% Sigmoid Function
s = 1 ./ (1 + exp(-x));
end