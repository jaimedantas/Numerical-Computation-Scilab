clc
function y = modelo_funcao(x)
  y=-0.04+(x)/(1-x)*sqrt(2*3.5/(2+x));
endfunction
function x = bisc(a,b,prec,cont_max)
  x=a;
  cont=0;
  Er=1;//valor aleatorio para o while
  while (Er>=10^(-prec)) & (cont<=cont_max)
    x_old=x;
    x=(a+b)/2;
    cont=cont+1;
    Er=abs((x-x_old)/x);
    //funcao do problema
    if  modelo_funcao(a) * modelo_funcao(x) < 0//Pode chamar a função assim
      b=x;
    else
      a=x;
    end
  end
endfunction
x=-100:1:100;
y=modelo_funcao(x);
plot(x,y)
xgrid();//grade

x = bisc(-5,0,5,1000)