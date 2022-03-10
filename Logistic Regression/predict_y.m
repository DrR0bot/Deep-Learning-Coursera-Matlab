function Y_predict = predict_y(w,b,X)
    % Predict whether the label is 0 or 1 using learned logistic regression parameters (w, b)
    % 
    % Arguments:
    % w -- weights, a numpy array of size (num_px * num_px * 3, 1)
    % b -- bias, a scalar
    % X -- data of size (num_px * num_px * 3, number of examples)
    % 
    % Returns:
    % Y_prediction -- a numpy array (vector) containing all predictions (0/1) for the examples in X
m = size(X,2);
Y_predict = zeros(1, m);
w = reshape(w,[size(X,1), 1]);

A = sigmoid_f((w'*X) + b);
for i = 1:size(A,2)
    if A(1,i) > 0.5
        Y_predict(1,i) = 1;
    else
        Y_predict(1,i) = 0;
    end
end
end