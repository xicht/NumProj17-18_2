function t = bisection(F,a,b)
%returns t in [a,b]: F(t)=0

if isZero(F(a))
    t=a;
    return;
end
    
if isZero(F(b))
    t=b;
    return;
end

assert(F(a)*F(b) <= 0);

if F(a) > 0
    F= @(x)-F(x);
end

t = (a+b)/2;

while (~isZero(F(t)))   
   if F(t)>0
       b=t;
   else
       a=t;
   end
   t = (a+b)/2;   
end
end