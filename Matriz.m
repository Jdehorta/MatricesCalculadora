%Multiplicacion de matrices

A=input('A = '); %Matriz A
B=input('B = '); %Matriz B

%verificador de tamaño de cada matriz

[F0, C0] = size(A);
[F1, C1] = size(B);

%comprobar si es posible multiplica matriz ~=(no igual a)
if C0 ~= F1
    disp('Esta operacion no se puede realizar')
end

%multiplicacion de la matriz
for i = 1:F0
    for j = 1:C1
        x = 0; %acumulador de la suma de cada fila por cada columna

        for k = 1:C0
            A(i,k)
            B(k,j)

            x = x + A(i,k) * B(k,j); %numero de columnas = a numero de filas 
        end
        R(i,j) = x
    end
    
end