function [x0,y0,err] = findZero (F, a, b, c, d)
% finde (x0,y0) in [a,b]x[c,d] mit F(x0,y0)=0 

mx = (a+b)/2;
my = (c+d)/2;

if isZero(F(mx,my))
    x0y0 = [mx,my];
else
    if F(mx,my) > 0
        x0y0 = findZero2 (F,a,b,c,d);
    else
        x0y0 = findZero2 (@(x,y)-F(x,y),a,b,c,d);
    end
end
x0=x0y0(1);
y0=x0y0(2);

if isZero(F(x0,y0))
    err=0;
else
    err=1;
end
end

function [X0Y0,err] = findZero2 (F, a, b, c, d)
% finde (x0,y0) in [a,b]x[c,d] mit F(x0,y0)=0 
% fuer den Spezialfall F(mx,my) > 0

mx = (a+b)/2;
my = (c+d)/2;


%finde Funktionswert kleiner null, der nach möglichkeit nahe an mx,my ist
[x0y0,err]=findNegVal(F,a,b,c,d,4,20);

if err==1
    [x0y0,err]=findNegVal(F,a,b,c,d,4,99); %99 statt 100 um andere Funktionswerte zu treffen
end
if err==1
    X0Y0=[0,0];
    return; %kein vorzeichen welchsel, also wird es nix
end



%transformiere auf Funktion F(Psi)=G: [0,1]-> R
Psi1= @(t) mx + t*(x0y0(1)-mx);
Psi2= @(t) my + t*(x0y0(2)-my);
G = @(t) F(Psi1(t),Psi2(t));


%finde Nullstelle von G in [0,1]
t0 = bisection(G,0,1);

%transfomiere Nullstelle in [0,1] zurück auf NSt in R^2
X0Y0 = [mx+t0*(x0y0(1)-mx),my+t0*(x0y0(2)-my)];

end


function  [x0y0, err] = findNegVal(F,a,b,c,d,k,n)
% n anzahl der einzelnen zerteilung 
% k anzahl der intervallverkleinerungen

mx = (a+b)/2;
my = (c+d)/2;
err = 0;


for j=k:-1:1
    [x0y0, err2] = findNegVal2(F,mx-(b-a)/2^j,mx+(b-a)/2^j,my-(d-c)/2^j,my+(d-c)/2^j,n);
    %suche_in = [[mx-(b-a)/2^j,mx+(b-a)/2^j],[my-(d-c)/2^j,my+(d-c)/2^j]]
    if err2==0
        return;
    end
end
%wenn man bis daher kommt wurde nix gefunden
warning('gar keine NSt gefunden');
err=1;
x0y0=[0,0];

end

function [x0y0,err]=findNegVal2(F,a,b,c,d,n)
% n gibt die Feinheit der Suche an: [a,b] resp [c,d] wird in ca 2n
%intervalle zerlegt

err=0;

mx = (a+b)/2;
my = (c+d)/2;

dx = (b-a)/(2*n);
dy = (d-c)/(2*n);

for j=-n:n
    for k=-n:n
        %[mx+j*dx,my+k*dy]
        if F(mx+j*dx,my+k*dy) < 0
            x0y0 = [mx+j*dx,my+k*dy];
            return;
        end
    end
end

% 
% 
% for j=1:n %durchsuche in schleifen von der mitte aus
%     curr_x=mx + j*dx;
%     if F(curr_x,my) <0
%         x0y0=[curr_x,my];
%         return;
%     end
%     for k=1:j
%        if F(curr_x,my+k*dy) <0
%            x0y0=[curr_x,my+k*dy];
%            return;
%        end
%        if F(curr_x,my-k*dy)  <0
%            x0y0=[curr_x,my-k*dy];
%            return;
%        end
%     end
%     
%     curr_x=mx - j*dx;
%     if F(curr_x,my)  <0
%        x0y0=[curr_x,my];
%        return;
%     end
%     for k=1:j
%        if F(curr_x,my+k*dy) <0
%            x0y0=[curr_x,my+k*dy];
%            return;
%        end
%        if F(curr_x,my-k*dy)  <0
%            x0y0=[curr_x,my-k*dy];
%            return;
%        end
%     end
%     
%     %und nochmal umgedreht
%     curr_y=my + j*dy;
%     if F(mx,curr_y)  <0
%        x0y0=[mx,curr_y];
%        return;
%     end
%     for k=1:j-1
%        if F(mx+k*dx,curr_y)  <0
%            x0y0=[mx+k*dx,curr_y];
%            return;
%        end
%        if F(mx-k*dx,curr_y)  <0
%            x0y0=[mx-k*dx,curr_y];
%            return;
%        end
%     end
%     
%     curr_y=my - j*dy;
%     if F(mx,curr_y)  <0
%        x0y0=[mx,curr_y];
%        return;
%     end
%     for k=1:j-1
%        if F(mx+k*dx,curr_y)  <0
%            x0y0=[mx+k*dx,curr_y];
%            return;
%        end
%        if F(mx-k*dx,curr_y)  <0
%            x0y0=[mx-k*dx,curr_y];
%            return;
%        end
%     end
%        
% end
%     

%wenn wir bis daher kommen waren wir erfolglos
x0y0=[0,0];
err=1; 
%warning('jetzt keine NSt gefunden');

end




