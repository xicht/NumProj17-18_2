function [ x, y ] = implicitCurve( F, x0, y0, steps, stepWidth )
%implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0 und
%xi=x0+stepWidth*i mit i aus 0 bis steps
%
% F Funktion mit 2 veränderlichen, dF/dy ~=0 in allen relevanten Bereichen
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

assert(isZero(F(x0, y0)));

x = x0 + stepWidth * (0:steps);
y = zeros(1,steps+1);
y(1) = y0;

for i = 2:steps+1
    y(i) = y(i-1)+ ImplicitDiff(F, x(i-1), y(i-1), 0.00001) * stepWidth;    %predictor
    f = @(z)F(x(i), z);
    y(i) = Newton(f, y(i));                             %corrector
end

end

