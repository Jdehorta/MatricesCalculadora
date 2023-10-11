%FUERZAS INTERNAS ELEMENTO 1
function [kv ke] = kvigagral(E,I,A,x1,y1,x2,y2) 
lb=sqrt((x2-x1)^2+(y2-y1)^2);
s=(y2-y1)/lb;
c=(x2-x1)/lb;
T=[c s 0 0 0 0
  -s c 0 0 0 0
   0 0 1 0 0 0
   0 0 0 c s 0
   0 0 0 -s c 0
   0 0 0 0 0 1];

ke=E*I*[A/lb 0       0  -A/lb  0     0;
        0 12/lb^3 6/lb^2 0 -12/lb^3 6/lb^2;
        0 6/lb^2 4/lb    0 -6/lb^2  2/lb;
       -A/lb 0       0   A/lb  0     0;
        0 -12/lb^3 -6/lb^2 0 12/lb^3 -6/lb^2;
        0 6/lb^2  2/lb 0 -6/lb^2   4/lb];

kv= T'*ke*T;