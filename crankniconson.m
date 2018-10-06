h=0.05;
n=1/h;
t=h/10;
m=1/t;
e=ones(n,1);
A=spdiags([e -2*e e],-1:1,n,n);
A=A/(h*h);
I=eye(n);
U=ones(n,1);
for i=1:n
    if (i*h>0.4 && i*h<0.6)
        U(i)=2;
    end
end
M=inv(I-A*t/2)*(I+A*t/2);
j=1;
while(j<1+1/t)
    u(j)=U(5);
    U=M*U;
    j=j+1;
end
for i=1:m
    T(i)=i*t;
end
plot(T,u)

