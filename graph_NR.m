function graph_NR(x,y1,y2)
figure
plot(x,y1,'r-',x,y2,'b-*','MarkerSize',2)
xlabel ( 'Axonas x','FontName','Arial','FontSize',10); 
ylabel ( 'Axonas y','FontName','Arial','FontSize',10);
%legend('y1','y2');
title( 'Grafiki parastasi y1, y2','FontSize',10 );