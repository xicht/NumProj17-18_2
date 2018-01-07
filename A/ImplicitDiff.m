function [ d ] = ImplicitDiff( F, x, y, w )
%ImplicitDiff Differentation einer impliziten Funktion f(x) 
%die F(x, f(x))= löst.
% Vorr entsprechend Satz über implizite Funktionen für dF/dy in (x,f(x))!=0
% df/dx = -dF/dx / dF/dy
% F die Funktion
% x,y eine Nullstelle von F
% w Startschrittweit für Annäherung der Differentation

assert(isZero(F(x,y)));
assert(w>0);

fx = @(z) F(z, y);
fy = @(z) F(x, z);

Fx = myDiff(fx, x, w);
Fy = myDiff(fy, y, w);
assert(~isZero(Fy));

d = -Fx/Fy;


end

