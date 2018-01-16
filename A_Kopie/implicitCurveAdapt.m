function [ x, y, z, polygon_length, steps ] = implicitCurveAdapt( F, dFx, dFy, x0, y0, length, maxStepWidth, minStepWidth )
% implicitCurve Generiert eine Menge von Wertepaaren mit F(xi,yi)==0, 
% gibt weiters zurück: polygon_length: länge des Polygonzuges , 
% steps: anzahl der berechnungsschritte, z: krümmungsschätzer
%
% eingabe parameter length für gewünschte polygonlänge
%
% F Funktion mit 2 veränderlichen, dF/dy ~=0 in allen relevanten Bereichen
% dFx und dFy sind die Ableitungen von F, jeweils nach x und y
% x0,y0 Startpunkt, es muss F(x0,y0) == 0 gelten
% Anzahl der zu berechnenten Wertepaare
% Schrittweite an der x-Achse.

assert(isZero(F(x0, y0)));

x = zeros(1,100+1);
y = zeros(1,100+1);
z = zeros(1,100+1);
y(1) = y0;

polygon_length=0;

minsw=10;

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
        
        %schrittweitenberechnung
        if i <=4
            currStepWidth = minStepWidth;
        else
            dritte_abl = (z(i-1)-z(i-2))/(x(i-1)-x(i-2));
            %corr3 = max([sign(dritte_abl*z(i-1)) 0]) * abs(dritte_abl)/(5+abs(z(i-1)));
            corr3=0;
            currStepWidth = maxStepWidth/(1+abs(z(i-1))/20 + corr3/5 );
            if currStepWidth < minStepWidth
                currStepWidth = minStepWidth;
            end
        end
        if currStepWidth < minsw
        minsw=currStepWidth;
        end;
        x(i) = x(i-1) +currStepWidth;
        
        y(i) = y(i-1) - dx/dy * currStepWidth;    %predictor
        G = @(z)F(x(i), z);
        g = @(z)dFy(x(i), z);
        y(i) = Newton(G, g, y(i));            %corrector    
        
        if i>2  %krümmungsschätzer, vlt weißt du wie man eine codezeile auf 2 textzeilen aufteilt...
            z(i) = 2* ( (y(i-2)-y(i-1))*(x(i-1)-x(i)) + (y(i-1)-y(i))*(x(i-1)-x(i-2))  ) /(x(i-2)-x(i-1)) / (x(i-1)-x(i))  / (x(i-2)-x(i))  ;
        end
        
        polygon_length = polygon_length + sqrt((x(i)-x(i-1))^2+(y(i)-y(i-1))^2);
        
        if polygon_length >= length
            steps=i; %so viele wurden bisher benötigt
            break;
        end
    end
        
    if polygon_length >= length
        %nicht benötigten speicher freigeben
        x=x(1:steps);
        y=y(1:steps);
        z=z(1:steps);
        
        break; 
    end
k=k+1;        
end
    minsw
    
    
end



