function [w,b, dw,db, costs] = gradient_opt(w, b, X, Y, num_iterations, learning_rate)
%     This function optimizes w and b by running a gradient descent algorithm
%     
%     Arguments:
%     w -- weights, a numpy array of size (num_px * num_px * 3, 1)
%     b -- bias, a scalar
%     X -- data of shape (num_px * num_px * 3, number of examples)
%     Y -- true "label" vector (containing 0 if non-cat, 1 if cat), of shape (1, number of examples)
%     num_iterations -- number of iterations of the optimization loop
%     learning_rate -- learning rate of the gradient descent update rule
%     print_cost -- True to print the loss every 100 steps
%     
%     Returns:
%     params -- dictionary containing the weights w and bias b
%     grads -- dictionary containing the gradients of the weights and bias with respect to the cost function
%     costs -- list of all the costs computed during the optimization, this will be used to plot the learning curve.
%     
%     Tips:
%     You basically need to write down two steps and iterate through them:
%         1) Calculate the cost and the gradient for the current parameters. Use propagate().
%         2) Update the parameters using gradient descent rule for w and b.
%     """
    
costs = [];
for i = 1:num_iterations
    [dw,db,cost] = propagate(w, b, X, Y);
    % update rule
    w = w - learning_rate .* dw;  % need to broadcast
    b = b - learning_rate .* db;

    if i == 100
        costs = cost;
    elseif mod(i,100) == 0
        costs = [costs ;cost];
    end
end

end