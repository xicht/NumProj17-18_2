function [ d ] = ImplicitDiff( F, x, y, w )
%ImplicitDiff Differentation einer impliziten Funktion f(x) 
%die F(x, f(x))= l�st.
% Vorr entsprechend Satz �ber implizite Funktionen f�r dF/dy in (x,f(x))!=0
% df/dx = -dF/dx / dF/dy
% F die Funktion
% x,y eine Nullstelle von F
% w Startschrittweit f�r Ann�herung der Differentation

assert(isZero(F(x,y)));
assert(w>0);

fx = @(z) F(z, y);
fy = @(z) F(x, z);

Fx = myDiff(fx, x, w);
Fy = myDiff(fy, y, w);
assert(~isZero(Fy));

d = -Fx/Fy;


end

