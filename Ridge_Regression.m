% -------------------Ridge Regression-------------------------------------

% Our intention is to find the prediction:
%         f(x,w)=w0+w1*x1+w2*x2+...+wd*xd
% This is an improvement of the linear regression model.
% The optimization problem in this case is defined as:
%           min R(W)=E(W)+lambda*||W||
% where, lambda is defined as the penalty
% Here, we will define two cases:
% 1. If we take the Euclidean norm (L2) then we define Ridge Regression
% 2. If we take the Manhattan norm (L1) then we define LASSO Regression
% Here we consider Ridge Regression.
% HINT: lambda = 0 is the "non penalty" ridge regression. (Linear
% regression case)


% 0. Clear all
clear all;
close all;
clc;

% Set Parameters
Parameter.Fig=false; % true
Parameter.ErrorThreshold=0.005; % External knowledge based on your data

% 1. Load the dataset as a matrix named 'data' and define the independent
% variabel(s) 'x' and the dependent variable 'y'.
[m, d]=size(x); % 'm' is the number of samples and 'd' is the number of features

% 2. Take some values for lambda and decide which one will be the most
% suitable for your data

lambda=[0 : 0.1 : 20]';
H0 = x' * x;

for model=1:length(lambda)

    Parameter.lambda=lambda(model);

    % 3.1 Define the model
    w = inv((H0 + Parameter.lambda*eye(d)))*(x'*y);
    y_tilde = x*w;
    w0 = mean(y - y_tilde); %intercept

    RidgeModel.lambda=Parameter.lambda;
    RidgeModel.w=w;
    RidgeModel.w0=w0;

    % 3.2 Make predictions
    y_pred = RidgeModel.w0 + y_tilde;

    % 3.3 Calculate learning error
    Lerror=sum((y-y_pred).^2);
    Lerror (Lerror > Parameter.ErrorThreshold) = Inf;

    % 3.4 Save all w for each model
    RIDGEMODEL{model}=RidgeModel;
    Norm_w(model)=norm(w);
    Errors(model)=Lerror;

end

% 4. Choose the best model
[min_error, best_model]=min(Errors);
RidgeModel=RIDGEMODEL{best_model};

% 5. Save the best model as .mat file
save('RidgeModel.mat');

% 6. Visualize lambda, norm_wopt and learning errors
if Parameter.Fig
    f_Visualize(lambda,w,Norm_w,Errors)
end

