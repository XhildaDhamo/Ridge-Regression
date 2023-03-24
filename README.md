# Ridge-Regression
MATLAB code for Ridge Regression computation

Our intention is to find the prediction:

        f(x,w)=w0+w1*x1+w2*x2+...+wd*xd
        
This is an improvement of the linear regression model.

The optimization problem in this case is defined as:

           min R(W)=E(W)+lambda*||W||, where lambda is defined as the penalty

Here, we will define two cases:
1. If we take the Euclidean norm (L2) then we define Ridge Regression
2. If we take the Manhattan norm (L1) then we define LASSO Regression
Here we consider Ridge Regression.
HINT: lambda = 0 is the "non penalty" ridge regression. (Linea regression case)
