%Taking normal distribution for (0,0) of unit variance for training and
%Testing
rng(3);
x=randn(2000,1);
y=randn(2000,1);
%Taking Normal Distribution for (2.5,0) of unit variance for training and
%Testing
rng(6);
x1=2.5+randn(2000,1);
y1=randn(2000,1);

%Plotting Two Gaussian Distributions
figure(1);
plot(x,y,x1,y1,'Marker','.','LineStyle','none')

%Training Dataset
x_train=x(1:500);
y_train=x(1:500);
x_train(501:1000)=x1(1:500);
y_train(501:1000)=y1(1:500);
x_train(1001:1500)=x(501:1000);
y_train(1001:1500)=y(501:1000);
x_train(1501:2000)=x1(501:1000);
y_train(1501:2000)=y1(501:1000);

%Testing Dataset
x_test=x1(1001:2000);
y_test=y1(1001:2000);
x_test(1001:2000)=x(1001:2000);
y_test(1001:2000)=y(1001:2000);

%Vectors of Zeros and ones for classification labels for training
t1=zeros(1000,1);
t2=ones(1000,1);
%Label for training
t=t1(1:500);
t(501:1000)=t2(1:500);
t(1001:1500)=t1(1:500);
t(1501:2000)=t2(1:500);
t=t';
%Labels for Testing
t3=t2;
t3(1001:2000)=t1;
t3=t3';
 

%Training Data Set
p=[x_train,y_train];
p=p';
%Testing Data Set
p2=[x_test,y_test];
p2=p2';
% %with 1 hidden layer 88.7%
% trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.
% 
% hiddenLayerSize = 1;
% net = patternnet(hiddenLayerSize, trainFcn);
% [net,tr] = train(net,p,t);
% view(net)
% r = net(p2);
% figure, plotconfusion(t3,r)