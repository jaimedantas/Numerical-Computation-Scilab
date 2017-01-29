clc
//metodo de newton
//funcao juros compostor
function y = modelo(x)
  y=0.04+(x)/(1-x)*sqrt(2*3.5/(2+x));
endfunction
//funcao principal
function x = newton(x0, prec, cont_max)
  cont=0;
  x=x0;
  e=1;//maior erro
  x_old=x0;
  while (e>=10^(-prec) & cont<=cont_max)
    x_antes=x_old;
    x_old=x;
    x=x_old - (modelo(x_old)*(x_antes-x_old)/(modelo(x_antes)-modelo(x_old)));
    e=abs(x-x_old)/x;
    cont=cont+1;
  end
endfunction

//entrada
x=newton(0.5, 3, 10)//nao entra com o a entrada da funcao secundaria(derivada e funcao)
    
