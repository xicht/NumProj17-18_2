function [ x, y ] = implicitCurve_ortho( F, dFx, dFy, x0, y0, steps, stepWidth,plottinator )
%implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0 und
%xi=x0+stepWidth*i mit i aus 0 bis steps
%
% F Funktion mit 2 veraenderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.
global print_error

assert(isZero(F(x0, y0)));

x = zeros(1,steps+1);
y = zeros(1,steps+1);
y(1) = y0;
x(1) = x0;

for i = 2:steps+1
    dy = dFy(x(i-1), y(i-1));
    dx = dFx(x(i-1), y(i-1));
    if(abs(dy) < abs(dx))
        G = @(x,y) F(y,x);
        dGy = @(x,y) dFx(y,x);
        dGx = @(x,y) dFy(y,x);
        if(i > 2)
            dir = sign(y(i-1)-y(i-2));
        elseif(abs(dy) > 10^-12)
            dir = sign(dy);
        else
            dir = 1;
        end
if nargin >= 8
        p = @(a,b) plottinator(b,a);
        [y_rek, x_rek] = implicitCurve_ortho(G, dGx, dGy, y(i-1), x(i-1), steps+1-i, abs(stepWidth)*dir,p);
else
        [y_rek, x_rek] = implicitCurve_ortho(G, dGx, dGy, y(i-1), x(i-1), steps+1-i, abs(stepWidth)*dir);
end
        x(i:end) = x_rek; 
        y(i:end) = y_rek; 
        break;
    else
        assert(abs(dx/dy) ~= Inf);

        x(i) = x0 + (i-1)*stepWidth;
        y(i) = y(i-1) - dx/dy * stepWidth;    %predictor
        G = @(z)F(x(i), z);
        g = @(z)dFy(x(i), z);
        h = Newton(G, g, y(i));            %corrector
        tmp = h-y(i);
        y(i) = h;
if(print_error == true)
    th = 0:pi/50:2*pi;
    xunit = 10*tmp * cos(th) + x(i);
    yunit = 10*tmp * sin(th) + y(i);
    plottinator(xunit, yunit);
end
    end
end

end

