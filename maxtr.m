function [mt,my]=maxtr(a,eps)
%用幂法求矩阵的主特征值和对应的特征向量
n=length(a);
x0=diag(ones(n));
k=1
x=a*x0
while norm(x-x0)>eps
   k=k+1
   q=x;
   y=x/maxnorm(x)
   x=a*y;
   x0=q;
end
mt=maxnorm(x)
my=y