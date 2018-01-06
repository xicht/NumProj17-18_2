function [ d ] = ImplicitDiff( F, x, y, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

assert(~isZero(F(x,y)));

Fx = (F(x,y)-F(x+w,y))/w;
Fy = (F(x,y)-F(x,y+w))/w;

d = -Fx/Fy;


end

