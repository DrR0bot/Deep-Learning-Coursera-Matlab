function[dw,db,cost] = propagate(w, b, X, Y)
m = size(X,2);
%Activation function
A = sigmoid_f((w'*X) + b);
cost = (- 1 / m) * sum(Y .* log(A) + (1 - Y) .* (log(1 - A)));

% BACKWARD PROPAGATION (TO FIND GRAD)
dw = (1/m) * (X*(A-Y)');
db = (1/m) * sum(A-Y);
end