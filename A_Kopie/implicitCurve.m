function [ x, y, z, polygon_length, steps ] = implicitCurve( F, dFx, dFy, x0, y0, length, stepWidth )
% implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0, 
% gibt weiters zurueck: polygon_length: laenge des Polygonzuges , 
% steps: anzahl der berechnungsschritte, z: kruemmungsschaetzer
%
% eingabe parameter length fuer gewuenschte polygonlaenge
%
% F Funktion mit 2 veraenderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

assert(isZero(F(x0, y0)));

x = x0 + stepWidth * (0:100);
y = zeros(1,100+1);
z = zeros(1,100+1);
y(1) = y0;

polygon_length=0;

k=0;
while true %quasi eine for-schleife der art for k=0:infinity 
    %das soll einfach den speicher allokieren
    x(100*2^k+1) = 0;
    y(100*2^k+1) = 0;
    z(100*2^k+1) = 0;
    
    if k==0
        prev_steps=1;
    else
        prev_steps=100*2^(k-1)+1;
    end
    
    for i = prev_steps+1:100*2^k+1
        dy = dFy(x(i-1), y(i-1));
        dx = dFx(x(i-1), y(i-1));
        assert(dy ~= 0);
        assert(abs(dx/dy) ~= Inf);
        
        x(i) = x(i-1) +stepWidth;
        
        y(i) = y(i-1) - dx/dy * stepWidth;    %predictor
        G = @(z)F(x(i), z);
        g = @(z)dFy(x(i), z);
        y(i) = Newton(G, g, y(i));            %corrector    
        
        if i>2
            z(i) = (y(i-2)-2*y(i-1)+y(i))/stepWidth^2; %kruemmungsschaetzer
        end
        
        polygon_length = polygon_length + sqrt((x(i)-x(i-1))^2+(y(i)-y(i-1))^2);
        
        if polygon_length >= length
            steps=i; %so viele wurden bisher benoetigt
            break;
        end
    end
        
    if polygon_length >= length
        %nicht benoetigten speicher freigeben
        x=x(1:steps);
        y=y(1:steps);
        z=z(1:steps);
        
        break; 
    end
k=k+1;        
end
    
    
    
end



