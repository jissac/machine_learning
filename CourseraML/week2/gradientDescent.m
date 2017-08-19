function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    partial_0 = 0;
    partial_1 = 0;
    h_theta = theta' * X';
    for ii = 1:m
      partial_0 += (h_theta(ii) - y(ii));
      partial_1 += X(ii,2)*(h_theta(ii) - y(ii));
    endfor
    
    theta0 = theta(1) - alpha*(1/m)*partial_0;
    theta1 = theta(2) - alpha*(1/m)*partial_1;   
    theta = [theta0; theta1]
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
