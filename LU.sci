//A=[3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10]
A = [5 2 1; 3 1 4; 1 1 3];
function [L,U,I]=LU(A)
    [l,c]=size(A)//"l" e "c" indicam a dimensão da matriz, numero de linhas e colunas
    U = A;
    L=eye(l,c) // A função eye cria uma matriz identidade de dimensão l,c.
    for j=1:c
        pivo = U(j,j)
        for i=(j+1):l
            fator=U(i,j)/pivo
            U(i,:)=U(i,:)-fator*U(j,:)
            L(i,j)=fator
        end
    end
    I = eye(l,c);
    for k=1:c // vai achando a inversa coluna por coluna
        X = [0;0;0]
        b = I(:,k) // Calcula L*y = I
        X(1) = b(1)/L(1,1);
        for i=2:l
            soma = 0;
            for j=1:(l-1)
                soma = soma + L(i,j)*X(j)
            end
        X(i) = (b(i) - soma)/L(i, i)
        end
        b = X // Calcula U*x = y, onde x é a inversa
        X(l) = b(l)/U(l,c);
            for i=(l-1):(-1):1
                soma = 0;
                for j=(i+1):l
                    soma = soma + U(i,j)*X(j)
                end
            X(i) = (b(i) - soma)/U(i, i)
            end
        I(:,k) = X;
    end
endfunction

[L,U,I]=LU(A)