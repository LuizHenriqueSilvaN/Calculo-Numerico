clear;clc;
mprintf(" \n Aluno: Arthur Orsolin \n");
mprintf(" \n");
mprintf("Este programa retorna a inversa de uma matrix 3x3 não singular através do método LU \n")
mprintf("A*A^(-1) = I \n\n")

function [L,U,inversaA] = inversaLU (A)
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
    y = L\eye(l,c) //matriz identidade, onde cada vetor da matriz é um vetor da base canônica
    x = U\y
    inversaA = [x]
endfunction
A = input('Insira a matriz A(Obs.: Lembrar dos colchetes -> [ ; ; ] ): ')
[L,U,inversaA] = inversaLU(A);
mprintf('\nMatriz L')
disp(L)
mprintf('\nMatriz U')
disp(U)
mprintf('\nMatriz Inversa de A')
disp(inversaA)

