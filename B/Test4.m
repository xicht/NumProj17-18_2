
global epsZero;
epsZero = 100*eps;

G = @(x,y) sin(x.^2+y.^2-atan2(y,x))
dGx = @(x,y) 2*x + y.*cos(x.^2+y.^2-atan2(y,x))./(x.^2+y.^2) 
dGy = @(x,y) 2*y - cos(x.^2+y.^2-atan2(y,x))./(x+y.^2./x) 

G(0,sqrt(pi/2))
figure(1)
[x y] = implicitCurve(G, dGx, dGy, 0, sqrt(3*pi/2), 10^5, 10^-4); 
%bei 120000 wird 0 erreicht und mist passiert (dort sind aber die
%ableitungen auch undefiniert, also das ist kein fehler im programm)
plot(x,y);
figure(2)
[x y] = implicitCurve(G, dGx, dGy, 0, sqrt(3*pi/2), 2000, 5*10^-3); %stepsize schon zu gross
plot(x,y);



