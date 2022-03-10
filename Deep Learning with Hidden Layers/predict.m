function Predictions = predict(X,W1,b1,W2,b2)
% Using the learned parameters, predicts a class for each example in X
% 
% Arguments:
% parameters -- python dictionary containing your parameters 
% X -- input data of size (n_x, m)
% 
% Returns
% predictions -- vector of predictions of our model (red: 0 / blue: 1)

[~,~,~,A2] = forward_propagation(X,W1,b1,W2,b2);
Predictions = (A2);

end