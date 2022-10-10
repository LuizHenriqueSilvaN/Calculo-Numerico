clear;clc;

mprintf(" \n");
mprintf("Este programa calcula a decomposição em LU de uma matrix 3x3 não singular \n")
mprintf("Ax = b \n\n")

function [L,U,y,x,I] = decomposicaoLU (A,b)
    //pegando o tamanho(dimensões) da Matriz de coeficientes
    [l,c] = size(A);      
    //Matriz Lower(L) recebendo a função que gera a Matriz identidade     
    L = eye(l,c);   
    //Matriz Upper(U) recebendo os valores da matriz passada p/ a função                
    U = A;                     
    for i = 1:l-1
        //Definindo o pivô em cada iteração da matriz
        pivo = U(i,i);
        for j = i+1:c
            //definindo o fator que zera os elementos abaixo dos pivôs
            fator = U(j,i)/pivo;
            //preenchendo os valores das matrizes L e U com iterações
            L(j,i) = fator;
            U(j,:) =  U(j,:) - fator*U(i,:);
        end
    end
    y = L\b
    x = U\y
    I = eye(l,c)
endfunction
A = input('Insira a matriz A(Obs.: Lembrar dos colchetes -> [ ; ; ] ) : ')
b = input('Insira a matriz b: ')
[L,U,y,x,I] = decomposicaoLU(A,b);
mprintf('x1 = %.2f\n', x(1));
mprintf('x2 = %.2f\n', x(2));
mprintf('x3 = %.2f\n\n', x(3));
