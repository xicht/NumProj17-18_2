function [ phi2 ] = myDiff( F, x, w )
%MYDIFF Nähert Ableitung einer Funktion R->R an.
% F funktion
% x Punkt in dem die Ableitung gesucht wird
% w Startschrittweite
%
%Schrittweite hn wird mit jeder Iteration halbiert bis die Differenz der
%Differentenquotion für hn und hn+1 absolut oder relativ kleiner 10^5*eps
%ist

global epsZero;
phi2 = (F(x+w)-F(x))/w;
while(true)
    w = w/2;
    assert(~isZero(w));
    phi1 = phi2;
    phi2 = (F(x+w)-F(x))/w;
    if(diffLoopCheck(phi1, phi2, eps*10^5))
        break;
    end
end

end

function [ retval ] = diffLoopCheck( phi1, phi2, tau )
    retval = true;
    phidiff = abs(phi1 - phi2);
    
    if(abs(phi1) <= tau)
        retval = (phidiff <= tau);
    else
        retval = (phidiff <= (tau * abs(phi1)));
    end
end
