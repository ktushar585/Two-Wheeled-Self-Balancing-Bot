mc = 1.5;
mp = 0.5;
g = 9.82;
L = 1;
d1 = 0.1;
d2 = 0.1;
A = [0           0               1                 0;
     0           0               0                 1;
     0       (g*mp)/mc        -d1/mc          -d2/(L*mc);
     0    (g*(mc+mp))/(mc*L)   -d1/(L*mc)    -(d2*(mc+mp))/(L*L*mc*mp)];
B = [0 0 1/mc 1/(L*mc)]';
C1 = [0 1 0 0]; %q2 as output
C2 = [1 0 0 0]; %q1 as output 
D = 0;
sys1 = ss(A,B,C1,D);
sys2 = ss(A,B,C2,D);
rlocus(sys1,'b',sys2,'r')
hold on
legend('sys1','sys2')
hold off
