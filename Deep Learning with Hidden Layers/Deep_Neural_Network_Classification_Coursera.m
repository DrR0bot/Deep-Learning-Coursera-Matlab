%% Planar data classification with one hidden layer
% Welcome to your week 3 programming assignment! It's time to build your first neural network, 
% which will have one hidden layer. Now, you'll notice a big difference between this model 
% and the one you implemented previously using logistic regression.
% 
% By the end of this assignment, you'll be able to:
% 
% Implement a 2-class classification neural network with a single hidden layer
% Use units with a non-linear activation function, such as tanh
% Compute the cross entropy loss
% Implement forward and backward propagation
%% Import Data
% Flower with two colours defined by 0 and 1 in Y
% X = load("X_flower.mat");
% Y = load("Y_flower.mat");
% X = X.X; % BECAUSE IS SAVED AS A STRUCTURE
% Y = Y.Y; % BECAUSE IS SAVED AS A STRUCTURE

%% TESTING VALUES
X = load("t_X.mat").t_X ;
Y = load("t_Y.mat").t_Y ;
%% Neural Network Model
% Define the neural network structure ( # of input units,  # of hidden units, etc).
nh = 50;
[n_x, n_h, n_y,m] = layer_sizes(X,Y,nh);
%% Initialize the model's parameters
[W1,b1,W2,b2] = rand_initialize(n_x,n_h,n_y);
%% Computing Forward Propagation
[Z1,Z2,A1,A2] = forward_propagation(X,W1,b1,W2,b2);
%% Compute loss
[cost] = Compute_cost(A2,Y,m);
%% Implement backward propagation to get the gradients
[dW1,db1,dW2,db2] = backward_propagation(m, W2, A1, A2, X, Y);
%% Update parameters (gradient descent)
learning_rate = 1.2;
[W1,b1,W2,b2] = update_parameters(W1,b1,W2,b2,dW1,db1,dW2,db2,learning_rate);
clear ("b2","W2","W1","b1","cost","Z2","Z1","dW2","dW1","db2","db1","Y","X","A2","A1","m");
clc

%% Practical model with the real X, Y values
% Model_nn
X = load("X_flower.mat");
Y = load("Y_flower.mat");
X = X.X; % BECAUSE IS SAVED AS A STRUCTURE
Y = Y.Y; % BECAUSE IS SAVED AS A STRUCTURE
nh = 4;

% Figure Plot
figure(1)
pointsize = 50;
scatter(X(1,:),X(2,:),pointsize,Y,'filled')
xlabel('X1')
ylabel('X2')


[n_x, n_h, n_y, m] = layer_sizes(X, Y, nh);

[W1,b1,W2,b2] = rand_initialize(n_x, n_h, n_y);

num_iterations = 10000;
k = 1;
learning_rate = 1.2;
% Loop (gradient descent)
for i = 1:num_iterations
    % Forward Propagation
    [Z1, Z2, A1, A2] = forward_propagation(X, W1, b1, W2, b2);

    % Compute Cost
    [cost] = Compute_cost(A2, Y, m);

    % Backpropagation.
    [dW1, db1, dW2, db2] = backward_propagation(m, W2, A1, A2, X, Y);

    % Update Parameters
    [W1, b1, W2, b2] = update_parameters(W1, b1, W2, b2, dW1, db1, dW2, db2, learning_rate);

    if mod(i,100) == 0
        iteration(k,1) = k;
        costing(k,1) = cost;
        k = k + 1;
    end
end
figure(2)
plot(iteration*100, costing)
xlabel('Iterations')
ylabel('Cost Function')
%% Prediction section
Predictions = predict(X,W1,b1,W2,b2);
%% Accuracy
Accu = (dot(Y,Predictions') + dot((1-Y),(1-Predictions'))) / size(Y,2) * 100;
disp(['Accuracy of the model: ' num2str(Accu) '%'])