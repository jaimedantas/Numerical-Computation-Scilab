//METODO DE GAUSS
clc;
//matriz
//cria
a = [0.913 0.659; 0.457 0.330];
b = [0.254 ; 0.127];
c = [6 2 -1; 2 4 1; 3 2 8];
d = [7; 7; 13];
//pivor nulo
e = [0.5 -0.2 0.5; 0.1 0.6 0.4; -0.3 0.1 0.0];
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



