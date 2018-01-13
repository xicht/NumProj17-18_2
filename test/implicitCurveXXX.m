function [ x, y ] = implicitCurveXXX( F, dFx, dFy, x0, y0, steps, stepWidth )
%implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0 und
%xi=x0+stepWidth*i mit i aus 0 bis steps
%
% F Funktion mit 2 veränderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

% if ~isZero(F(x0, y0))
%     x0=x0
%     y0=y0
%     Fx0y0=F(x0,y0)
%     error('abs(F(x0,y0)) >epsZerp');
% end


x = zeros(1,steps+1);
y = zeros(1,steps+1);
y(1) = y0;
x(1) = x0;

for i = 2:steps+1
    dy = dFy(x(i-1), y(i-1));
    dx = dFx(x(i-1), y(i-1));
    if(abs(dy) < 10^-1 && abs(dy) < abs(dx))
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
        %ausgabe vor der achsenverdrehung
        x_flip=x(i-1)
        y_flip=y(i-1)
        [y_rek, x_rek] = implicitCurveXXX(G, dGx, dGy, y(i-1), x(i-1), steps+1-i, abs(stepWidth)*dir);
        x(i:end) = x_rek; 
        y(i:end) = y_rek; 
        break;
    else
        assert(abs(dx/dy) ~= Inf);

        x(i) = x0 + (i-1)*stepWidth;
        y(i) = y(i-1) - dx/dy * stepWidth;    %predictor
        G = @(z)F(x(i), z);
        g = @(z)dFy(x(i), z);
        %y(i) = Newton(G, g, y(i));            %corrector
        
        %assert(isZero(F(x(i),y(i))/2));
    end
end

end

