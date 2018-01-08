function [ bool ] = isZero( val )
%isZero Funktion überprüft ob val in Umgebung von 0 liegt.
% Umgebung definiert durch glob. Var epsZero - Unbedingt initialisieren!!!

global epsZero;
if((epsZero == 0))
    epsZero = 100*eps;
end 

if(abs(val) > epsZero) 
    bool = false;
else
    bool = true;
end

