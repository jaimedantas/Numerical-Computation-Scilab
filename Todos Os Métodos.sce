//METODO DE GAUSS
clc;
//matriz
//cria
a = [0.913 0.659; 0.457 0.330];
b = [0.254 ; 0.127];
c = [6 2 -1; 2 4 1; 3 2 8];
d = [7; 7; 13];
//pivor nulo
e = [1 1 2 1; 2 2 5 3; 1 3 3 3; 1 1 4 5];
f = [2;4;-2;-2];
//pegar
//a(3, :)
//troca a linha 2 coma a 3
//x = a(2, :)
//a(2,:) = a(3,:)
//a(3,:) = x
//algoritimo para gauss é Xi = bi - somatorio de j = i+1 até n de aij*Xj tudo dividido por aii.
//fator multiplicativo é:
//fator = a4/a1, agora faz l2 = l2 - l1*fator
//algoritimo:
//tem que entrada a matriz A e o vetor b
//saida uma matriz triangular superior u
//ELIMINACAO DE GAUSS
function u = gauss(a, b)
  [l,c] = size(a);//sabe as linhas e colunas de a
  //concatena
  u = [a b];
  //percorrer o pivo
  for j=1:c//coluna
    pivo = u(j, j); 
    //pivotamento parcial
    while pivo == 0 
        aux = u(j, :);
        u(j, :) = u(j+1 , :);
        u(j+1, :) = aux;
        pivo = u(j,j);
    end
    for i=j+1:l//percorre a linha abaixo do pivo
      fator=u(i,j)/pivo;
      //calculo
      u(i, :) = u(i, :) - fator*u(j, :);
    end
  end
endfunction
//entrada
[r] = gauss( e, f)

//METODO DE GAUSS COM PIVOTAMENTO PARCIAL
c = [6 2 -1; 2 4 1; 3 2 8];
d = [7; 7; 13];
//pivor nulo
e = [0.0001 1.00; 1.00 1.00];
f = [1.00 ; 2.00];
function u = gauss(a, b)
  [l,c] = size(a);//sabe as linhas e colunas de a
  //concatena
  u = [a b];
  //percorrer o pivo
  for j=1:c//coluna
    pivo = u(j, j); 
    //pivotamento parcial
    for k = j:l
        if abs(pivo)<abs(u(k, j)) then
            aux2 = u(j, :);
            pivo = u(k,j);
            u(j,:)=u(k, :);
            u(k,:)=aux2;
        end
    end
    while pivo == 0 
        aux = u(j, :);
        u(j, :) = u(j+1 , :);
        u(j+1, :) = aux;
        pivo = u(j,j);
    end
    for i=j+1:l//percorre a linha abaixo do pivo
      fator=u(i,j)/pivo;
      //calculo
      u(i, :) = u(i, :) - fator*u(j, :);
    end
  end
endfunction
[r] = gauss( e, f)

//DECOMPOSIÇÃO LU:
//A = LU
//Ax = b
//a matriz L eh formada p parti dos fatores calculados com a decomposição de gauss
clc
a = [5 2 1; 3 1 4; 1 1 3];
function [L,U] = decom_lu(a)
  [l,c] = size(a);//sabe as linhas e colunas de a
  U = a;
  //cria matriz identidade
  L = eye(l,c)
  for j=1:c//coluna
    pivo=U(j,j);//sempre esta na diagonal principal
    while pivo == 0 
        aux = u(j, :);
        u(j, :) = u(j+1 , :);
        u(j+1, :) = aux;
        pivo = u(j,j);
    end
    for i=j+1:l//percorre a linha abaixo do pivo
      fator=U(i,j)/pivo;
      //calculo
      U(i, :) = U(i, :) - fator*U(j, :);
      L(i,j) = fator;
    end
  end
endfunction
[L,U] = decom_lu(a)

//METODO DE JACOBI
//matriz L eh a matria da esquerada e a R eh a da direita ambas decompostas triangulares
a = [10 2 1; 1 5 1; 2 3 10];
b = [7; -8; 6];
x0=[0.7; -1.6; 0.6];
function x = jacobi(x0, a, b, p)
  [l,c] = size(a);
  x = x0;//iniciar o vetor soluçao
  //normalizaçao da matriz
  for i=1:l
    pivo = a(i,i);
    a(i, :) = a(i, :)/pivo;
    b(i) = b(i)/pivo//tem q fazer a operaçao com o vetor tb
    a(i,i) = 0;//tem q zera a diagomal principal para obter (l_ast+r_ast)
    //ou pode fazer tb a = a - eye(a)
  end 
  //processo interativo
  erro = 1
  while erro >= 10^-p
    x_old = x;
    x = -a*x + b;
    erro = norm(x - x_old, 'inf')/ norm(x, 'inf') //tipo de norma tb e o erro eh ||x1 - x0||_inf / ||x1||_inf
  end
endfunction
[x] = jacobi(x0, a, b, 2)
//norma infinita eh o maior elemento dio somatorio de cada linha

//MEODO DE GAUSS SEIDEL
a = [10 2 1; 1 5 1; 2 3 10];
b = [7; -8; 6];
x0=[0.7; -1.6; 0.6];
function x = gauss_seli(x0, a, b, p)
  [l,c] = size(a);
  x = x0;//iniciar o vetor soluçao
  //normalizaçao da matriz
  for i=1:l
    pivo = a(i,i);
    a(i, :) = a(i, :)/pivo;
    b(i) = b(i)/pivo//tem q fazer a operaçao com o vetor tb
    a(i,i) = 0;//tem q zera a diagomal principal para obter (l_ast+r_ast)
    //ou pode fazer tb a = a - eye(a)
  end 
  //processo interativo
  erro = 1
  while erro >= 10^-p
    x_old = x;
    for i=1:l
      x(i) = a(i,:)*x + b(i);//formula eh x(k+1) = -L_ast*x(k+1) - R_ast*x(k) + b
    end
      erro = norm(x - x_old, 'inf')/ norm(x, 'inf') //tipo de norma tb e o erro eh ||x1 - x0||_inf / ||x1||_inf
  end
endfunction
//formula de gauss seli x=-l_ast*x - r_ast*x0 + b
//entrada 
[x] = gauss_seli(x0, a, b, 2)

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
//pode usar x = [t^0 t^1 t^2]

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

//INTERPOLACAO POLINOMIAL
clc
//ajuste imterpolacao polinomial ordem n - 1, ou seja ordem 6
t = [1;2;3;4;5;6;7];
y = [1;1.5;2;4;7;12;21];
x = [t^0 t^1 t^2 t^3 t^4 t^5]
A = inv(x' * x) * x' * y;
tempo = 1:0.1:7;
plot(t, y , '* red')
plot(tempo , A(1) + A(2)*tempo + A(3)*tempo^2 + A(4)*tempo^3 + A(5)*tempo^4 + A(6)*tempo^5)
//xgrid()

//INTEGRACAO NUMERICA
//A = (A+b)*h/2
//A = (f(a) + f(b))*(b-a)/2
function y = funcao(x)
  y = sin(x);
endfunction
//TRAPEZIO
function integral = trapezio( a, b, n, funcao)
  h = (b-a)/n;
  integral = 0;
  for i = a:h:(b-h)
    integral = integral + (funcao(i)+ funcao(i+h))*h/2;// f eh uma funcao
  end
endfunction
x = trapezio(0, %pi/2, 8, funcao )
//UM TERCO DE SIMPSON
clc
//metoro de um terco simpson
//integral = h/3*(f(x0) + 4f(x1) + f(x2))
//h = (b-a)/2n

function y = funcao(x)
  y = sin(x);
endfunction
function integral = simp13( a, b, n, funcao)
  h = (b-a)/(2*n);
  integral = 0;
  for i = a:2*h:(b-2*h)
    integral = integral + (funcao(i)+ 4*funcao(i+h) + funcao(i+2*h))*h/3;// f eh uma funcao
  end
endfunction
x = simp13(0, %pi/2, 10000, funcao )



