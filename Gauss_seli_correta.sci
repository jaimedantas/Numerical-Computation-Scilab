function x = Gauss_seli(x0, a, b, p)
[l,c] = size(a);
x = x0;
for i=1:l
    pivo = a(i,i);
    a(i, :) = a(i, :)/pivo;
    b(i) = b(i)/pivo
    a(i,i) = 0;
end
B = ones(c,l);
for i=1:l
    b(i) = a(i, :)*b;
end
if norm(a, 'inf') < 1 | max(b) <1  | norm(a, 1) < 1 then
    convergencia = 'Sim';
else
    convergencia = 'Nao';
end
printf("Convergencia: %s\n", convergencia);
if convergencia == 'Sim' then
    erro = 1
    while erro >= 10^-p
        x_old = x;
        for i=1:l
            x(i) = -a(i,:)*x_old + b(i);
        end
        erro = norm(x - x_old, 'inf')/ norm(x, 'inf')
    end
else 
    x = "A matriz nao converge";
end
endfunction
a = [0.5 -0.2 0.5; 0.1 0.6 0.4; -0.3 0.1 0.0];
b = [5; 6; 0];
x0 = [0; 0; 0];
clc
[x] = Gauss_seli(x0,a,b,2)