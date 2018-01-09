function [ x2 ] = Newton( F, x )
%NEWTON Implementiert das Newtonverfahren auf R->R
% F soll die Funktioin sein
% x soll der Startpunkt sein
% Die Funktion beendet wenn der Unterschied zwischen 2 aufeinanderfolgenden
% absolut oder relativ nahe 0 ist

f = myDiff(F, x, 0.00001);
assert(~isZero(f));
x1 = x;
x2 = x - F(x)/f;

while(~isZero(x1-x2) && ~isZero((x1-x2)/x1))
x1 = x2;
f = myDiff(F, x2, 0.00001);
assert(f ~= inf);
assert(f ~= 0);
x2 = x2 - F(x2)/f;
end


end

