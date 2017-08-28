function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
J1=0;
J2=0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h_theta = sigmoid(theta' * X');
for iter = 1:m
  J1 += -y(iter)*log(h_theta(iter)) - (1-y(iter))*log(1-h_theta(iter)); 
  grad(1) += (h_theta(iter) - y(iter))*X(iter,1);
  for ii = 2:length(theta)
    grad(ii) += (h_theta(iter) - y(iter))*X(iter,ii);
  endfor
endfor
for ii = 2:length(theta)
  J2 += theta(ii)^2;
  grad(ii) += (lambda/m)*theta(ii);
endfor

J = (1/m)*J1 + (lambda/(2*m))*J2;
grad(1) = (1/m)* grad(1);
% =============================================================

end
