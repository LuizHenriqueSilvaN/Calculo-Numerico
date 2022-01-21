clear;
clc;

///////////////////////////////////////////////////////////////////////Questão 1(Valores do exemplo 5 do Livro )////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// sistema não linear
function y=F(x)
    y= [x(1)+x(2)-3; x(1)^2+x(2)^2 - 9]; //>>>>>>Vetor com as funções do sistema não linear
endfunction  
//Jacobiano
function y=JF(x)  
    y=[1  1; 2*x(1) 2*x(2)];//>>>>>>>matriz do jacobiano
endfunction
//Vetor dos valores iniciais
x0 = [1;5];
//tolerancia
TOL = 10^-4;
//numero de iterações
N =100;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//algoritimo para resolução de sistemas não lineares: Metod de NEWTON
function [x] = newton(F,JF,x0,TOL,N)  
  x = x0 ;
  k = 1;
  //iteracoes  
  while (k<=N)  
    //iteracao de Newton  
    s= -inv(JF(x))*F(x);
    x = x + s;
    //criterio de parada  
    if (norm(s,%inf)<TOL) then  
      x;
    end 
    k = k+1  
  end  
endfunction


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//algoritimo para resolução de sistemas não lineares: Metod de NEWTON MODIFICADO
//Para este métod teremos a não iteração da matriz Jacobiana
function [x_m] = newtonModificado(F,JF,x0,TOL,N)  
  x_m = x0 ;
  k = 1;
  J= JF(x0)
  //iteracoes  
  while (k<=N)  
    //iteracao de Newton  
    s = (J)\-F(x_m);
    x_m = x_m + s;
    //criterio de parada  
    if (norm(s,%inf)<TOL) then  
      x_m;
    end 
    k = k+1  
  end  
endfunction


mprintf('Método de Newton para sistemas não-linares\n');
[x] = newton(F,JF,x0,TOL)
disp(x)
mprintf('\nMétodo de Newton Modificado para sistemas não-linares\n');
[x_m] = newtonModificado(F,JF,x0,TOL,N) 
disp(x_m)
