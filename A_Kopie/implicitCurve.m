function [ x, y ] = implicitCurve( F, dFx, dFy, x0, y0, steps, stepWidth )
%implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0 und
%xi=x0+stepWidth*i mit i aus 0 bis steps
%
% F Funktion mit 2 veränderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

assert(isZero(F(x0, y0)));

x = x0 + stepWidth * (0:steps);
y = zeros(1,steps+1);
y(1) = y0;

for i = 2:steps+1
    dy = dFy(x(i-1), y(i-1));
    dx = dFx(x(i-1), y(i-1));
    assert(dy ~= 0);
    assert(abs(dx/dy) ~= Inf);
    
    y(i) = y(i-1) - dx/dy * stepWidth;    %predictor
    G = @(z)F(x(i), z);
    g = @(z)dFy(x(i), z);
    y(i) = Newton(G, g, y(i));            %corrector
end

end

