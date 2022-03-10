function [dW1,db1,dW2,db2] = backward_propagation(m, W2, A1, A2, X, Y)
dZ2 = A2 - Y;
dW2 = (1/m) * (dZ2*(A1)');
db2 = (1/m) * sum(dZ2);

dZ1 = (W2'* dZ2) .* (A1.^2);
dW1 = (1/m) * (dZ1*(X)');
db1 = (1/m) * sum(dZ1);

end