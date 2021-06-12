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
%eigs = eig(A)
%p1 = pole(sys1)
%p2 = pole(sys2)
%z1 = zero(sys1)
%z2 = zero(sys2)
pzmap(sys1)
pzmap(sys2)
grid on
%isstable(sys1) #This will be 1 if the system is stable. 
Q = ctrb(sys1); % Returns matrix Q
i = rank(Q) %If rank(i) is 4 then the system is controllable.
R = obsv(sys1);
j = rank(R) %If rank(j) is 4 then system is observable.


% In both the cases of q1 and q2 the system is unstable as it can be seen that we recieve a positive eigenvalue.
