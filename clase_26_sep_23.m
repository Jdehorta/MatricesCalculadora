 %CLASES ANALISIS II 26 SEPTIEMBRE/23
%VIGA 1
clc
clear
E1=2e7;
b=0.20;
h=0.40;
A1=h*b;
I1=b*h^3/12
l=5.00;
%MATRICES kv DE CADA VIGA
[kv1 ke1] = kviga(E1,I1,0,0,5,0)
[kv2 ke2] = kviga(E1,I1,5,0,9,0)
[kv3 ke3] = kviga(E1,I1,9,0,14,0)

%EXPANSIÓN DE MATRICES kv
DK1=zeros(8);
DK1([7 8 1 2],[7 8 1 2])=kv1;
DK2=zeros(8);
DK2([1 2 3 4],[1 2 3 4])=kv2;
DK3=zeros(8);
DK3([3 4 5 6],[3 4 5 6])=kv3;

%ENSAMBLAJE DE MATRIZ DE RIGIDEZ
K= DK1+DK2+DK3

%VECTOR FN
F=[72.4 -9.333 62.5 -1.667 52.5 -37.5 17.6 24]'
a=[2 4 6 8];
b=[1 3 5 7];
%PARTICIÓN D ELA MATRIZ
knn=K(a,a)
kaa=K(b,b)
kan=K(b,a)
Fn=F(a,1)
kordenado=[knn kan
    kan' kaa]
dn=knn\Fn
R=kan*dn
da=[0 0 0 0]'
d(a,1)=dn
d(b,1)=da
d
f1=kv1*d([7 8 1 2],1)
f2=kv2*d([1 2 3 4],1)
f3=kv3*d([3 4 5 6],1)
