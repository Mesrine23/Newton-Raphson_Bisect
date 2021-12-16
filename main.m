%g = @(x) ((x+1).^3).*(x-2);
%dg = @(x) ((x+1).^2).*(4*x-5);

%f = @(x) exp(x) -x.^2 -2;
%df = @(x) exp(x) -2*x;

f = inline('exp(x) - x.^2 -2');
df = inline('exp(x) - 2*x');

g = inline('((x+1).^3).*(x-2)');
dg = inline('((x+1).^2).*(4*x-5)');


'first D_NR'

[x1,iterations] = syndyasmos_D_NR(f,df,1,3);

for i=2:(iterations-1)
    e1(i-1) = abs((x1(i+1)-x1(i))) / ((x1(i)-x1(i-1)).^2);
end
'For exp'
e1;

'next D_NR'

[x2,iterations] = syndyasmos_D_NR(g,dg,-1.5,0);

z1(1) = abs(x2(1)+1);
for i=2:iterations
    z1(i) = abs(x2(i)+1);
    e2(i-1) = abs((x2(i)+1)) / abs(x2(i-1)+1);
end
'Not for exp'
e2;

'next D_NR'

[x3,iterations] = syndyasmos_D_NR(g,dg,1.5,3);

z2(1) = abs(x3(1)-2);
for i=2:iterations
    z2(i) = abs(x3(i)-2);
    e3(i-1) = abs(((x3(i)-2)) / (((x3(i-1)-2)).^2));
end
'Not for exp'
e3;

'first D_T'

[x4,iterations] = syndyasmos_D_T(f,df,1,3);

for i=2:(iterations-1)
    e4(i-1) = abs((x4(i+1)-x4(i))) / ((abs(x4(i)-x4(i-1))));
end
'For exp'
e4;

'next D_T'

[x5,iterations] = syndyasmos_D_T(g,dg,-1.5,0);

z3(1) = abs(x5(1)+1);
for i=2:iterations
    z3(i) = abs(x5(i)+1);
    e5(i-1) = abs(((x5(i)+1)) / abs(x5(i-1)+1));
end
'Not for exp'
e5;

'next D_T'

[x6,iterations] = syndyasmos_D_T(g,dg,1.5,3);

z4(1) = abs(x6(1)-2);
for i=2:iterations
    z4(i) = abs(x6(i)-2);
    e6(i-1) = abs((x6(i)-2)) / (abs((x6(i-1)-2)));
end
'Not for exp'
e6;


'time for the graphs'

x=-10:0.001:10;
y1 = ((x+1).^3).*(x-2);
y2 = ((x+1).^2).*(4*x-5);
graph_NR(x,y1,y2)
%graph_temnousa(x,y1,y2)