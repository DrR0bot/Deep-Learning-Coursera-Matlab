function [cost] = Compute_cost(A2,Y,m)
cost = (- 1 / m) * sum(Y .* log(A2) + (1 - Y) .* (log(1 - A2)));
end