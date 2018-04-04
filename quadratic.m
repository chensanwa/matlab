function [x1,x2]=quadratic(a,b,c)
d=disc(a,b,c);
x1=(-b+d)/(2*a);
x2=(-b-d)/(2*a);
end

function dis=disc(a,b,c)
dis=sqrt(b^2-4*a*c);
end
