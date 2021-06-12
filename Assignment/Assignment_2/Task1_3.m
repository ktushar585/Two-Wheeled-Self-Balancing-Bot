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
C = [0 1 0 0]; %q2 as output
D = 0;
[num,den] = ss2tf(A,B,C,D);
sys = tf(num,den)
[z,p,k] = ss2zp(A,B,C,D);
sysm = zpk(z,p,k)
