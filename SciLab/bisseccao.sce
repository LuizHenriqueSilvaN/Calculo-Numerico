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

mprintf(" \n Aluna: Arthur Orsolin \n");
mprintf(" \n");
mprintf("Este programa encontra uma raiz aproximada de f(x) = x*log(x) - 1 no intervalo [2, 3], com tolerância de 0.00001\n")
mprintf("\nUma equação não linear usando o método da Bissecção\n")
    
    f = "x*log10(x) - 1" // -------->>>>>>>>>>FUNÇÃO <<<<<<<<<<<<<<<<<<<
    xl = 2 // ---------->>>>>LIMITE INFERIOR<<<<<<<<<<<<<<
    x = xl
    fl = evstr(f)
        
xu = 3 //---------->>>>>>LIMITE SUPERIOR<<<<<<<<<<<
x = xu
fu = evstr(f)
        if(fu == 0)then
            mprintf("Limite superior é raíz")
           abort
          end
            
es = 10^-5 //---------->>>>>>TOLERÂNCIA<<<<<<<<<<
imax = 100 //--------->>>>>>Nº MÁXIMO DE ITERAÇÕES<<<<<<<<
iter = 1
            mprintf("     Iter               a                   b                      Xk                       f(Xk)                        (b - a)\n"); //para saída na tabela
    bisseccao(xl, xu, es, imax)
