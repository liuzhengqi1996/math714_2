h=0.1;
t=h/10;
n=1/h;
e=ones(n,1);
A=spdiags([e -2*e e],-1:1,n,n);
A=A/(h*h);
I=eye(n);
U0=ones(n,1);
M=(inv(I-A*t/2))*(I+A*t/2);
for i=1:n
    if (i*h>0.4 && i*h<0.6)
        U0(i)=2;
    end
    x(i)=i*h;
end
K=[3 5 9 15 18];
for j=1:5
    k=K(j);
    U=(M^k)*U0
    plot(x,U);
    hold on
end
    
    