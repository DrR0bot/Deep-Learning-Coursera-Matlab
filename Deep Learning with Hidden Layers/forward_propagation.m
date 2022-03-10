function [Z1,Z2,A1,A2] = forward_propagation(X,W1,b1,W2,b2)
% Here we calculate Z1, A1, Z2 and A2
Z1 = W1*X + b1;
A1 = tanh_f(Z1);
Z2 = W2*A1 + b2;
A2 = sigmoid_f(Z2);
end