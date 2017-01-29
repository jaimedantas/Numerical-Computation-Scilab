//MEODO DE GAUSS SEIDEL
//a = [10 2 1; 1 5 1; 2 3 10];
//b = [7; -8; 6];
x0=[0.7; -1.6; 0.6];
a = [5 1 1; 3 4 1; 3 3 6];
b = [5;6;0];
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
      x(i) = -a(i,:)*x + b(i);//formula eh x(k+1) = -L_ast*x(k+1) - R_ast*x(k) + b
    end
      erro = norm(x - x_old, 'inf')/ norm(x, 'inf') //tipo de norma tb e o erro eh ||x1 - x0||_inf / ||x1||_inf
  end
endfunction
//formula de gauss seli x=-l_ast*x - r_ast*x0 + b
//entrada 
[x] = gauss_seli(x0, a, b, 2)
