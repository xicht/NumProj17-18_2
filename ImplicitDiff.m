function [ d ] = ImplicitDiff( F, x, y, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

assert(isZero(F(x,y)));
assert(w>0);

fx = @(z) F(z, y);
fy = @(z) F(x, z);

Fx = myDiff(fx, x, w);
Fy = myDiff(fy, y, w);
assert(~isZero(Fy));

d = -Fx/Fy;


end

