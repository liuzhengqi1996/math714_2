T=3;
d=[0.01 0.005 0.025 0.02 0.01 0.005  ];
for l=1:6
h=d(l);
n=(1/h);
t=0.001;
m=(T/t);
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
   U=(M^m)*U0
   plot(x,U);
   hold on
end
