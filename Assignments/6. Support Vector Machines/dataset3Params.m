function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
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

C_list = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_list = [0.01 0.03 0.1 0.3 1 3 10 30];
error_min = 2147483647;

for i=1:size(C_list, 2)
    curr_c = C_list(i);
    for j=1:size(sigma_list, 2)
        curr_sigma = sigma_list(j);
        model = svmTrain(X, y, curr_c, @(x1, x2) gaussianKernel(x1, x2, curr_sigma));
        err = mean(double(svmPredict(model, Xval) ~= yval));

        if(err <= error_min)
            C = curr_c;
            sigma = curr_sigma;
            error_min = err;
        end
    endfor
endfor




% =========================================================================

end
