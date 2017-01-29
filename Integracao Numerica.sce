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