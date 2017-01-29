clc
//AJUSTES DE CURVAS
//o problema eh resolver o sitema linear Xa = y
//o produto escalar do erro com a funcao eh zero
//logo fica xT*x = xT*y + xT*e onde xT*e eh zero
//operacao eh a = (xT*x)^-1 * xT*y
//por comparacao coma funcao f(t) = a1 + a2t com a funcao f() = a1g(t) + a2(g2(t) .....
//exemplo 1
//t = [0.5; 1; 3];
//y = [0.5; 2; 2.5];
//x = [1 0.5; 1 1; 1 3];
//a = (x' *x)^-1 * x'*y//ou utiliza inv(a) para inversa
//exemplo 2
t = [0.5; 1.5; 2];
y = [0.5; 1.5; 2.8];
x = [1 0.5; 1 1.5; 1 2];
a = inv(x'*x)*x'*y;
plot(t,y, 'o')
tempo = 0:0.1:2.5;
plot(t, y, 'o', tempo, a(1) + a(2)*tempo)
//pode usar x = [t^0 t^1 t^2...]