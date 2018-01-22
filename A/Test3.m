
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
k = [ 0.5 1 3 4]% 0.9 0.95 1 10 100]
s = [ '-x'; '-o'; '-*'; '-d']
for l = [1:length(k)]
    i = k(l)
    [x y] = implicitCurve(G, dGx, dGy, 0, 0, floor(10*i), pi/(2*i));
    plot(x,y, s(l,:),'LineWidth',2);
    hold on
end
legend('h = pi','h = pi/2','h = pi/6','h = pi/8')
%k = 0.5
%[x y] = implicitCurve(G, dGx, dGy, 0, 1, floor(20*i), pi/(2*i));
%plot(x,y);
hold off

figure(3)
k = [ 0 0.1 0.2 ]% 0.9 0.95 1 10 100]
for l = [0:10]
    i = 0.1*l
    [x y] = implicitCurve(G, dGx, dGy, 0, i, floor(20*10), pi/(2*20));
    plot(x,y);
    hold on
end
%k = 0.5
%[x y] = implicitCurve(G, dGx, dGy, 0, 1, floor(20*i), pi/(2*i));
%plot(x,y);
hold off

