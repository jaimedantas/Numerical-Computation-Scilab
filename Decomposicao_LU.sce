//DECOMPOSIÇÃO LU:
//A = LU
//Ax = b
//a matriz L eh formada p parti dos fatores calculados com a decomposição de gauss
clc
a = [10 2 1; 1 5 1; 2 3 10];
b = [7; -8; 6];
//a = [5 2 1; 3 1 4; 1 1 3];
e = [0 -0.2 0.5; 0.1 0 0.4; -0.3 0.1 0];
h = [0 0 1; 1 0 0; 3 0 0];
function [L,U,d] = decom_lu(a)
  [l,c] = size(a);//sabe as linhas e colunas de a
  U = a;
  //cria matriz identidade
  L = eye(l,c)
  for j=1:c//coluna
    pivo=U(j,j);//sempre esta na diagonal principal
    //ver se tem pivor nulo
   for k = j+1:l
       if  pivo == 0 then
           aux2 = U(j, :);
           pivo = U(k,j);
           U(j,:)=U(k, :);
           U(k,:)=aux2;
       end
    end
    for i=j+1:l//percorre a linha abaixo do pivo
      fator=U(i,j)/pivo;
      //calculo
      U(i, :) = U(i, :) - fator*U(j, :);
      L(i,j) = fator;
    end
  end
  //d = U(:,c+1);
endfunction
d=b;
[L,U,d] = decom_lu(e)
//subida TRIANGULAR
[l,c] = size(a);
for i =l:-1:1
    x(i) = b(i)/a(i,i);
    for j=i+1:c
    x(i) = x(i) -(a(i,j)/a(i,i)) *x(j);
    end
end
x