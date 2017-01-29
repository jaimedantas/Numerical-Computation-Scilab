clc
//AJUSTE EXPONECIAL
//a funcao eh ln(y) = ln(a) + x ln(b) ou h = a1 + a2 x
//Xt*X*a = Xt*y, sendo que y é ln(y)
//a = e^a1 e b = e^a2
t = [1;2;3;4;5;6;7];
y = [1;1.5;2;4;7;12;21];
x = [1 1; 1 2; 1 3; 1 4; 1 5; 1 6; 1 7];
ln_y = log(y);
A = inv(x' * x) * x' * ln_y;
//agora converte a1 e a2 em ln(a) e ln(b)
a = exp(A(1))
b = exp(A(2)) 
tempo = 1:0.1:7;
plot(t, y , '* red')
plot(tempo , a*b^tempo)
//xgrid()