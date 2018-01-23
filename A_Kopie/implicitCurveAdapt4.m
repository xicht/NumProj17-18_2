function [ x, y, z, polygon_length, steps ] = implicitCurveAdapt4( F, dFx, dFy, d2Fxx, d2Fxy, d2Fyy, x0, y0, length, maxStepWidth, minStepWidth, c )
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

%STRATEGIE FUER ADAPTIVE SCHRITTWEITE: LAENGE DES KORREKTORSCHRITT

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
    zz(100*2^k+1) = 0;
    
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
        if i<=1
            currStepWidth= minStepWidth;
        else
            currStepWidth = sqrt(8*c/(abs(zz(i-1))+8*c/maxStepWidth));
        end
        if currStepWidth < minStepWidth
                currStepWidth = minStepWidth;
        end 
        z(i)=inf;
        err=1;   
        while (err==1 || z(i)>5*c  )&& currStepWidth >= minStepWidth
            if currStepWidth < minsw && i>1 %zum testen
            minsw=currStepWidth;
            end
               
            x(i) = x(i-1) +currStepWidth;
        
            y(i) = y(i-1) - dx/dy * currStepWidth;%predictor
            pred=y(i);
            G = @(z)F(x(i), z);
            g = @(z)dFy(x(i), z);
            [y(i), err] = Newton(G, g, y(i)); %corrector  
            
            if err==1
                currStepWidth = currStepWidth/2;
                continue;
            end
        
            z(i)=abs(y(i)-pred);
            zz(i) = (-d2Fxx(x(i),y(i))*(dFy(x(i),y(i)))^2 +2*d2Fxy(x(i),y(i))*dFx(x(i),y(i))*dFy(x(i),y(i)) -d2Fyy(x(i),y(i))*(dFx(x(i),y(i)))^2 ) /(dFy(x(i),y(i)))^3;
            currStepWidth = currStepWidth/2/sqrt(z(i)/c);
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
    minsw
end