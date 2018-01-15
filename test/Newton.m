function [ x2,wrong ] = Newton( F, f, x , nowarning)
%NEWTON Implementiert das Newtonverfahren auf R->R
% F soll die Funktion sein
% f soll die Ableitung der Funktion sein
% x soll der Startpunkt sein
% Die Funktion beendet wenn der Unterschied zwischen 2 aufeinanderfolgenden
% absolut oder relativ nahe 0 ist

assert(~isZero(f(x)));
x1 = x;
x2 = x - F(x)/f(x);

syms xx;

iters=0;
wrong=0;
while(~isZero(x1-x2) && ~isZero((x1-x2)/x1) && ~isZero(F(x2)) )
%while( ~isZero(F(x2)) )
x1 = x2
fx2=f(x2)
Fx2=F(x2)

assert(abs(f(x2)) ~= Inf);
if f(x2) ==0
    Ableitung=f(xx)
    Funktion=F(xx)
    o = 3;
    plot(linspace(0,o,1000),F(linspace(0,o,1000)),linspace(0,o,1000),f(linspace(0,o,1000)));
end
    
assert(f(x2) ~= 0);
x2 = x2 - F(x2)/f(x2);
iters=iters+1;
if iters == 100
    if ~exist('nowarning')
        Fx2=F(x2)
        warning('Newton probably wrong');
    end
    wrong=1;
    break;
end
end


end

