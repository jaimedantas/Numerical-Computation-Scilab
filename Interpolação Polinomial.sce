//INTERPOLACAO POLINOMIAL
clc
//ajuste imterpolacao polinomial ordem n - 1, ou seja ordem 6
t = [5;6;7;8;9;10];
y = [90;129;175;228;288;355];
x = [t^0 t^1 t^2 t^3 t^4 t^5]
A = inv(x' * x) * x' * y;
tempo = 5:0.1:10;
plot(t, y , '* red')
plot(tempo , A(1) + A(2)*tempo + A(3)*tempo^2 + A(4)*tempo^3 + A(5)*tempo^4 + A(6)*tempo^5)
//xgrid()
