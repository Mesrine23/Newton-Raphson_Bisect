function[x,iterations] = syndyasmos_D_NR(f,df,a,b)

 out1 = bisect_m(f,a,b,0.005,50);
 [rows1,columns1] = size(out1);
 afterDixot = out1(rows1,4)
 out2 = rf_newton2(f,df,afterDixot,0.0000005,50);
 [rows2,columns2] = size(out2);
 finalX = out2(rows2,2)
 x = [out1(:,4) ; out2(:,2)];
 iterations = rows1 + rows2