clc; 
clear;

function []=bisseccao(xl, xu, es, imax)
    ea=100;
    xr =(xu+xl)/2
    x = xr
    fr=evstr(f)
    while(ea>es)
        test = fl * fr;
        mprintf("    %d          %10f         %10f          %10f           %12.f          %10f\n", iter, xl, xu, xr, fr, xu - xl);
        if(test <0)then
            xu = xr;
        elseif(test > 0)then
            xl = xr;
        elseif(test == 0)then
            mprintf("A raiz da equação é %f", xr);
           abort
        end
        x = xl
        fl = evstr(f)
        x = xu
        fu = evstr(f)
        xrold = xr
        xr = (xl+xu)/2;
        x = xr
        fr = evstr(f)
        ea = abs((xr - xrold) / xr)*100;
        iter = iter +1;
        test = fl*fr;
        if(ea< es)then
            mprintf("    %d          %10f         %10f          %10f           %12.f          %10f\n", iter, xl, xu, xr, fr, xu - xl);
            mprintf("\n\nA raiz aproximada desta funcao eh %f",xr)
           abort
        end
        if(iter > imax)then
            mprintf("\n\nA raiz aproximada desta funcao eh %f",xrold)
           abort
        end
  end
endfunction
//main

mprintf("Este programa encontra uma raiz aproximada de f(x) = x*log(x-1)\n")
mprintf("\nUma equação não linear usando o método da Bissecção\n")
    
    f = "x*log(x-1)" // -------->>>>>>>>>>FUNÇÃO <<<<<<<<<<<<<<<<<<<
    xl = input("Digite o limite inferior: ")
    x = xl
    fl = evstr(f)
        if(fl==0)then
            mprintf("limite inferior é a raiz. ");
           abort
        end
xu = input("Digite o limite Superior: ")
x = xu
fu = evstr(f)
        if(fu == 0)then
            mprintf("Limite superior é raíz")
           abort
          end
            
b = fl*fu;
        if(b>0)then
            mprintf("Entradas Invalidas. f(a) * f(b) devem ser menor que zero. ")
           abort
        end
es = input("insira o valor da tolerância aceita de erro: ")
imax = input("Número máximo de iterações: ");
iter = 1
            mprintf("     Iter               a                   b                      Xk                       f(Xk)                        (b - a)\n"); //para saída na tabela
    bisseccao(xl, xu, es, imax)
