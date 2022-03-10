function [W1,b1,W2,b2] = update_parameters(W1,b1,W2,b2,dW1,db1,dW2,db2,learning_rate)
 W1 = W1 - learning_rate * dW1;
 b1 = b1 - learning_rate * db1;
 W2 = W2 - learning_rate * dW2;
 b2 = b2 - learning_rate * db2;
end