function [cost] = Compute_cost(A,Y,m)
cost = (- 1 / m) * sum(Y .* log(A) + (1 - Y) .* (log(1 - A)));
end