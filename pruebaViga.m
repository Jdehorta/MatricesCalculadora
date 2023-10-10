clear
E=2e7;
A=2;
L=5;
beta =5;
 % Calcular el momento de inercia
I = (beta * A * L^2) / 12;

[matriz matriz2] = kVigaCompleta(I, E, L, 5 , beta )