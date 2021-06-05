m1 = 10;   %Mass1(kg)
m2 = 100;  %Mass2(kg)
c1 = 100;
c2 = 1000;
k1 = 10000;
k2 = 100000;
syms t;
f = 5*sin(10*t);   %The required force
fun = @(t,y)[y(3); y(4); (f+k1*y(2)+c1*y(4)-k1*y(1)-c1*y(3))/m1; (k1*y(1)+c1*y(3)-(k1+k2)*y(2)-(c1+c2)*y(4))/m2]
tspan = linspace(0, 10, 800);
[T,Y] = ode45(fun,tspan,[0;0;0;0]);
plot(T,Y(:,1));
xlabel('Time(s)');ylabel('x1(m)');
hold on;
plot(T,Y(:,2));
xlabel('Time(s)');ylabel('x2(m)');
hold off;