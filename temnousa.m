function out=temnousa(f, x1, x0, tol, n)
x(2)=x1;
x(1)=x0;
i=3;
ksi=1.1986912435;
while i<=n
    x(i)=x(i-1)-(f(x(i-1))*(x(i-1)-x(i-2))/(f(x(i-1))-f(x(i-2))));
    eps(i)=abs(x(i)-ksi);
    conv_rate(i)=eps(i)/(eps(i-1).^(1.6));
    if  abs(x(i)-x(i-1))<tol    %abs(f(x(i)))<tol
        break;
    end
i = i + 1;
end
if i>n
    k=1:n;
else
    k=1:i;
end
   out=[k', x(k)', f(x(k))', eps(k)', conv_rate(k)'];
 
