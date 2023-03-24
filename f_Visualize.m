function []=f_Visualize(lambda,w,Norm_w,Errors)  
  
% This functions visualizes the results of Ridge Regression

subplot(3,1,1)
plot(lambda,Norm_w,'-b')
xlabel('Lambda'), ylabel('Norm W')
subplot(3,1,2)
plot(lambda,Errors,'-r')
xlabel('Lambda'), ylabel('Error')

subplot(3,1,3)
histogram(w,31)
xlabel('w values'), ylabel('Distribution')

end