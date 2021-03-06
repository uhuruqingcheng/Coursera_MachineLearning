function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%========Added by Qingcheng Liu(20140817)>>>>>>>>>>>
% C和sigma 的选择范围
C_try = [0.01;0.03;0.1;0.3;1;3;10;30];
sigma_try = [0.01;0.03;0.1;0.3;1;3;10;30];
prediction_error = zeros(length(C_try), length(sigma_try));

for i = 1:length(C_try)
    for j = 1:length(sigma_try)
    model= svmTrain(X, y, C_try(i), @(x1, x2) gaussianKernel(x1, x2, sigma_try(j)));
    predictions = svmPredict(model, Xval);
    prediction_error(i, j)  = mean(double(predictions ~= yval));
    end
end
% 找出错误率最低的C和sigma组合
[C1,I1] = min(prediction_error);
[C2,I2] = min(C1);

C = C_try(I1(I2));
sigma = sigma_try(I2);
%<<<<<<<<Added by Qingcheng Liu(20140817)===========


% =========================================================================

end
