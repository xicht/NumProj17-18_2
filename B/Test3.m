
global epsZero;
epsZero = 1000*eps;

G = @(x,y) sin(sin(x)-y);
dGx = @(x,y) cos(sin(x)-y)*cos(x) 
dGy = @(x,y) -cos(sin(x)-y) 

figure(1)
k = [0.5 0.9 1 10 ]% 0.9 0.95 1 10 100]
for i = k
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, floor(20*i), pi/(2*i));
    plot(x,y);
    hold on
end
hold off

c=10*pi;
G = @(x,y) sin(c*(sin(x)-y));
dGx = @(x,y) c*cos(sin(x)-y)*cos(x) 
dGy = @(x,y) -c*cos(sin(x)-y) 

figure(2)
k = [ 0.5 0.9 1 10 ]% 0.9 0.95 1 10 100]
for i = k
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, floor(20*i), pi/(2*i));
    plot(x,y);
    hold on
end
hold off

figure(3)
k = [ pi/2 pi/2+eps pi/2+3*10^-14 ]  %pi/2+10^-12 is auch witzig
for i = k
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, floor(50/i), i);
    plot(x,y);
    hold on
end
hold off

figure(4)
k = pi/2+ 10^-14*[0 1 2 3 4 7 8 10]  %5, 6 , 9  und 10 
for i = k
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, floor(50/i), i);
    plot(x,y);
    hold on
end
hold off

