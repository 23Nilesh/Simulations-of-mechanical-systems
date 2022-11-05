clc; clearvars;
a = 5; b = 13; c = 10; d = 15;
th_2 = 0:1:360;

Ax = a*cosd(th_2);
Ay = a*sind(th_2);
%%
for i = 1:length(th_2)
    S(i) = 0.5*(a^2-b^2+c^2-d^2)/(Ax(i)-d);
    P(i) = 1 + (Ay(i)^2/(Ax(i)-d)^2);
    Q(i) = 2*Ay(i)*(d-S(i))/(Ax(i)-d);
    R(i) = (d-S(i))^2-c^2;  
    
    By(i) = ((Q(i)^2-4*P(i)*R(i))^0.5 - Q(i))/2*P(i);
    Bx(i) = S(i)-Ay(i)*By(i)/(Ax(i)-d);    
    lx(i) = (Ax(i)+Bx(i))/2;
    ly(i) = (Ay(i)+By(i))/2;

    plot([0 Ax(i) Bx(i) d 0], [0 Ay(i) By(i) 0 0], 'b-o', 'LineWidth',2);
    hold on;
    plot( lx, ly, 'g');
    plot(lx(i), ly(i), 'r-o', 'LineWidth',2);
    hold off;
    axis([-10 20 -10 20]);
    axis("square");

    pause(0.001);

end

