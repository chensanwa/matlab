function t=maxnorm(a)
%�������а�ģ���ķ���
n=length(a);
t=0;
for i=1:n
   if abs(a(i)/max(abs(a)))>=1
      t=a(i); 
   end
end