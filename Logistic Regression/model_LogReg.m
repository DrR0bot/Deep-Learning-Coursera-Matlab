function[Result] = model_LogReg(X_train, Y_train, X_test, Y_test, num_iterations, learning_rate)

% Model Implementation
%initialize parameters with zeros
[w,b] = initialize_with_zeros(size(X_train,1));

%# Gradient descent
[w,b,~,~,costs] = gradient_opt(w, b, X_train, Y_train, num_iterations, learning_rate);

Y_prediction_test = predict_y(w, b, X_test);
Y_prediction_train = predict_y(w, b, X_train);

train_accuracy = 100 - mean(abs(Y_prediction_train - Y_train)) * 100;
test_accuracy = 100 - mean(abs(Y_prediction_test - Y_test)) * 100 ;

Result.costs = costs;
Result.train_accuracy = train_accuracy;
Result.test_accuracy = test_accuracy;
Result.Y_prediction_test = Y_prediction_test;
Result.Y_prediction_train = Y_prediction_train;
end