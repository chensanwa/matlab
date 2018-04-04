function t=maxnorm(a)
%求数列中按模最大的分量
n=length(a);
t=0;
for i=1:n
   if abs(a(i)/max(abs(a)))>=1
      t=a(i); 
   end
end