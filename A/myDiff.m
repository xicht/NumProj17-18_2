function [ phi2 ] = myDiff( F, x, w )
%MYDIFF Summary of this function goes here
%   Detailed explanation goes here

global epsZero;
phi2 = (F(x+w)-F(x))/w;
while(true)
    w = w/2;
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
