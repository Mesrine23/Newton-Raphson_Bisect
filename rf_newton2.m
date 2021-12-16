function out=rf_newton2(f, df, x1, tol, n)
x(1)=x1;e(1)=0;
i=2;xi=1.1986912435;
while i<=n
    x(i)=x(i-1)-f(x(i-1))/df(x(i-1));
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

  out=[k', x(k)', f(x(k))'];


