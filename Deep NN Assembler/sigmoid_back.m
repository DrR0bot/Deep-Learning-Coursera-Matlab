function [ds] = sigmoid_back(x)
% Sigmoid Function
ds = (1 ./ (exp(x) + 1)) - (1 ./ (exp(x) + 1)).^2;
end