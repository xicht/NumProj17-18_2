function [ x, y ] = implicitCurve( F, dFx, dFy, x0, y0, curvelen, stepWidth )
%implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0 und
%xi=x0+stepWidth*i mit i aus 0 bis steps
%
% F Funktion mit 2 veränderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

assert(isZero(F(x0, y0)));

steps = ceil(curvelen/stepWidth);
x = zeros(1,steps+1);
y = zeros(1,steps+1);
y(1) = y0;
x(1) = x0;
lastphi = 0;
lastchi = 0;
lengthsum = 0;
i = 1;

while(lengthsum < curvelen)
    i = i+1;
    [ xr, yr, phi, chi, length ] = generateNextStep( F, dFx, dFy, x, y, i, stepWidth );
    x(i) = xr;
    y(i) = yr;
    lastphi = phi;
    lastchi = chi;
    lengthsum = lengthsum +length;
end

end


function [ xr, yr, phi, chi, length ] = generateNextStep( F, dFx, dFy, x, y, i, stepWidth )
    dy = dFy(x(i-1), y(i-1));
    dx = dFx(x(i-1), y(i-1));
    
    if(dx == 0)
        assert(dy ~= 0);
        xr = x0 + (i-1)*stepWidth;
        yr = y(i-1) - dx/dy * stepWidth;    %predictor
        G = @(z)F(xr, z);
        g = @(z)dFy(xr, z);
        yr = Newton(G, g, yr);            %corrector
        lastchi = 0;
        lastphi = pi/2;
        length = stepWidth;
    else
        phi = atan(dy/dx); %richtungsableitung maximieren
        chi = phi - pi/2; %minimale richtungsableitung, orthogonal zu phi
        if(i > 2) %evtl chi und phi umdrehen
            sp = [x(i-1)-x(i-2) y(i-1)-y(i-2)] * [cos(chi); sin(chi)];
            if(~isZero(sp) && sp < 0)
                phi = phi-pi;
                chi = chi - pi;
            elseif(isZero(sp))
                if(abs(F(stepWidth*sin(chi),stepWidth*cos(chi))) < abs(F(stepWidth*sin(chi+pi),stepWidth*cos(chi+pi))))
                    phi = phi - pi;
                    chi = chi - pi;
                end
            end
        else
            if(abs(F(stepWidth*sin(chi),stepWidth*cos(chi))) < abs(F(stepWidth*sin(chi+pi),stepWidth*cos(chi+pi))))
                phi = phi + pi;
                chi = chi + pi;
            end
        end
        
        dir = [cos(chi);sin(chi)];
        dir_ortho = [cos(phi);sin(phi)];
        
        xr = x(i-1)+stepWidth*dir(1);
        yr = y(i-1)+stepWidth*dir(2);
        
        G = @(z) F(xr+z*dir_ortho(1), yr+z*dir_ortho(2));
        gx = @(z) dFx(xr+z*dir_ortho(1), yr+z*dir_ortho(2));
        gy = @(z) dFy(xr+z*dir_ortho(1), yr+z*dir_ortho(2));
        g = @(z) dir_ortho' * [gx(z); gy(z)];
        
%        figure(1);     
%        l = linspace(-0.5,0.5,10000);
%        plot(l, G(l),l,gx(l),l,gy(l),l,g(l));
%        legend('G','gx', 'gy', 'g')
    
    
        h = Newton(G, g, 0);            %corrector
        %h = fzero(G,0);
        
        xr = xr+ h*dir_ortho(1);
        yr = yr+ h*dir_ortho(2);
        length = stepWidth;
%        figure(2);
%        plot(x(1:i-1), y(1:i-1));
    end
end
