function [ x2 ] = Newton( F, x )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

f = myDiff(F, x, 0.00001);
assert(f ~= 0);
x1 = x;
x2 = x - F(x)/f;

while(~isZero(x1-x2) && ~isZero((x1-x2)/x1))
x1 = x2;
x2 = x2 - F(x2)/f;
end


end

