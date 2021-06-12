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
%C = [0 1 0 0]; %q2 as output
C = [1 0 0 0]; %q1 as output
D = 0;
sys = ss(A,B,C,D);
eigs = eig(A)
pole(sys)
isstable(sys)
Q = ctrb(sys); % Returns matrix Q
rank(Q)