function K = kVigaCompleta(A, E, L, theta, beta)
    % Función para calcular la matriz de rigidez de una viga en un pórtico plano.
    % A: Área transversal de la viga
    % E: Módulo de elasticidad del material
    % L: Longitud de la viga
    % theta: Ángulo de orientación de la viga (en radianes)

    % Coeficientes trigonométricos
    c = cos(theta);
    s = sin(theta);

    % Matriz de rigidez para una viga en un pórtico plano
    K = (E * I / L^3) * [12*c^2, 6*c*s, -12*c^2, 6*c*s; 
                         6*c*s, 4*c^2+4*s^2, -6*c*s, 2*c^2-2*s^2; 
                         -12*c^2, -6*c*s, 12*c^2, -6*c*s; 
                         6*c*s, 2*c^2-2*s^2, -6*c*s, 4*c^2+4*s^2];
end