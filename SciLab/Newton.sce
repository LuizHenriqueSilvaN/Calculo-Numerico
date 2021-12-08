clear;
clc;
mprintf(" \n Aluno: Arthur Orsolin \n");
mprintf(" \n");
mprintf("Este programa encontra uma raiz aproximada de f(x) = x*ln(x) - 1 no intervalo (1,2), com tolerância de 10^-7\n")
mprintf("\nMétodo de Newton\n")
// Definição da função f(x)
function y = f(x)
    y = x*log(x) -1
endfunction

// Derivada de (f)
function y = df(x)
    y = log(x) + 1
endfunction

// Implementação Newton
function [it, x, Er] = newton(x0, p, itMax)
    it = 0;
    x = x0;
    Er = 1
    mprintf("Iteraçõe                xk                    f(xk)                       (xk - ak): \n")
    while (Er > 10^(-p) & it < itMax)
      it = it+1;
      xOld = x;
      x = x - f(x)/df(x);
      Er = abs((x - xOld)/x); 
      mprintf("%d               %f               %f                  %f\n", it, x,f(x), x - xOld)
    end  
endfunction

// Exemplo de chamada
[it, x, Er] = newton(2.5, 7, 50)
mprintf("\n\nA raiz aproximada desta funcao eh %f",x)
