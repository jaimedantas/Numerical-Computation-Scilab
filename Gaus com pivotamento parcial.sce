//METODO DE GAUSS COM PIVOTAMENTO PARCIAL
a = [10 2 1; 1 5 1; 2 3 10];
b = [7; -8; 6];
//f = [1.00 1 1; 2.00 1 1; 1 1 1];
function u = gauss(a, b)
  [l,c] = size(a);//sabe as linhas e colunas de a
  //concatena
  u = [a b];
  //percorrer o pivo
  for j=1:c//coluna
    pivo = u(j, j); 
    //pivotamento parcial
    for k = j+1:l
        if abs(pivo)<abs(u(k, j)) then
            aux2 = u(j, :);
            pivo = u(k,j);
            u(j,:)=u(k, :);
            u(k,:)=aux2;
        end
    end
    for i=j+1:l//percorre a linha abaixo do pivo
      fator=u(i,j)/pivo;
      //calculo
      u(i, :) = u(i, :) - fator*u(j, :);
    end
  end
endfunction
[r] = gauss( a, b)
//subida TRIANGULAR
[l,c] = size(a);
for i =l:-1:1
    x(i) = b(i)/a(i,i);
    for j=i+1:c
    x(i) = x(i) -(a(i,j)/a(i,i)) *x(j);
    end
end
x