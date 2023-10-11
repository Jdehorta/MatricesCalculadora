%%%%%INTRODUCCIÓN DE DATOS %%%%%
clc
longitud = [4 4 4 3 3 3 4.5 5.5 4.5 5.5];
angulo = [90 90 90 90 90 90 0 0 0 0 0];
moduloElasticidad = 21e6*[1 1 1 1 1 1 1 1 1 1];
areaColumna = 0.30*0.40;
areaViga = 0.30*0.5;
areasCV = [areaColumna areaColumna areaColumna areaColumna areaColumna areaColumna ...
        areaViga areaViga areaViga areaViga];
inerciaColumna = 0.4*0.3^3/12;
inerciaViga = 0.3*0.5^3/12;


inerciaCV = [inerciaColumna inerciaColumna inerciaColumna inerciaColumna inerciaColumna inerciaColumna ...
        inerciaViga inerciaViga inerciaViga inerciaViga];

conexion = [ 7 1;
             8 2;
             9 3;
             1 4;
             2 5;
             3 6;
             1 2;
             2 3;
             4 5;
             5 6]; 

%%%%%MATRIZ DE RIGIDEZ DE CADA ELEMENTO %%%%%        
for i=1:10
  EAL = moduloElasticidad(i)*areasCV(i)/longitud(i);
  EI12 = 12*moduloElasticidad(i)*inerciaCV(i)/longitud(i)^3;
  EI6 = 6*moduloElasticidad(i)*inerciaCV(i)/longitud(i)^2;
  EI4 = 4*moduloElasticidad(i)*inerciaCV(i)/longitud(i);
  EI2 = 2*moduloElasticidad(i)*inerciaCV(i)/longitud(i);

  Klocal=[EAL 0 0 -EAL 0 0; 
          0 EI12 EI6 0 -EI12 EI6;
          0 EI6 EI4 0 -EI6 EI2;
          -EAL 0 0 EAL 0 0;
          0 -EI12 -EI6 0 EI12 -EI6;
          0 EI6 EI2 0 -EI6 EI4];

  cs = cosd(angulo(i));
  sn = sind(angulo(i));
  B = [cs sn 0 0 0 0;
       -sn cs 0 0 0 0;
        0 0 1 0 0 0;
        0 0 0 cs sn 0;
        0 0 0 -sn cs 0;
        0 0 0 0 0 1];
  end
  Kelem(:,:,i) = B'*Klocal*B
  
  