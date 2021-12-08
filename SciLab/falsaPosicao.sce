

mprintf(" \n Aluno: Arthur Orsolin \n");
mprintf(" \n");
mprintf("Este programa encontra uma raiz aproximada de f(x) = x^3 - x - 1 no intervalo (1,2), com tolerância de 10^-4\n")
mprintf("\nMétodo da Posição Falsa\n")
// Definição da função f(x)
function y = f(x)
    y = (x^3) - x -1
endfunction

// Implementação Falsa Posição
function [it, x, Er] = falsaposicao(a, b, p, itMax)
    it = 0;
    x = a;
    Er = 1
     mprintf("Iteraçõe               ak                           bk                          xk                       f(xk)                   (bk - ak): \n")
    while (Er > 10^(-p) & it < itMax)
        it = it + 1;
        xOld = x;
        x = a - (f(a)*(b-a))/(f(b) - f(a));
        if (f(x)*f(a)) < 0
            b = x;
        else
            a = x;
        end
        Er = abs((x - xOld)/x); 
        mprintf("%d               %f               %f               %f               %f               %f\n", it, a, b, x,f(x ), (b-a))
    end  
endfunction

// Exemplo de chamada
[it, x, Er] = falsaposicao(1, 2, 4,50 )
mprintf("\n\nA raiz aproximada desta funcao eh %f",x)
