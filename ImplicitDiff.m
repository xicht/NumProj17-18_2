function [ d ] = ImplicitDiff( F, x, y, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

assert(isZero(F(x,y)));
assert(w>0);

fx = @(z) F(z, y)
fy = @(z) F(x, z)

Fx = myDiff(fx, x, w);
Fy = myDiff(fy, y, w);
assert(~isZero(Fy));

d = -Fx/Fy;


end

function [ phi2 ] = myDiff( F, x, w )
global epsZero;
phi2 = (F(x+w)-F(x))/w;
while(true)
    w = w/2;
    phi1 = phi2;
    phi2 = (F(x+w)-F(x))/w;
    if(diffLoopCheck(phi1, phi2, epsZero))
        break;
    end
end

end

function [ retval ] = diffLoopCheck( phi1, phi2, tau )
    retval = true;
    phidiff = abs(phi1 - phi2);
    
    if(phi1 <= tau)
        retval = (phidiff <= tau);
    else
        retval = (phidiff <= (tau * abs(phi1)));
    end
end
