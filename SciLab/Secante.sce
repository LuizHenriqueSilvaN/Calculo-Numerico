clear;
clc;

mprintf("Este programa encontra uma raiz aproximada de f(x) = 4*sin(x) - exp(x) no intervalo (0,2), com tolerância de 10^-5\n")
mprintf("\nMétodo da Secante\n")
// Definição da função f(x)
function y = f(x)
    y = 4*sin(x) - exp(x)
endfunction

// Implementação Secante
function [it, x, Er] = secante(x0, x1, p, itMax)
    it = 0;
    Er = 1;
    xOld1 = x0;
    x = x1;
    mprintf("Iteraçõe                xk                    f(xk)                       (xk - ak): \n")
    while (Er > 10^(-p) & it < itMax)
        xOld0 = xOld1;
        xOld1 = x;
        x = xOld1 - (f(xOld1)*(xOld1 - xOld0))/(f(xOld1) - f(xOld0));
        Er = abs((x - xOld1)/x);
        it = it + 1;
        mprintf("%d               %f               %f                  %f\n", it, x,f(x), x - xOld1)
    end
endfunction

// Exemplo de chamada
[it, x, Er] = secante(-1, 1, 5, 50) //>>>>secante(x0, x1, expoente do erro, iterações máximas)
mprintf("\n\nA raiz aproximada desta funcao eh %f",x)
