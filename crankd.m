T=3;
d=[ 0.025 0.02 0.01 0.005 0.0025 0.002  ];
for l=1:6
h=d(l);
n=(1/h);
t=h/5;
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

U=(M^m)*U0;
for j=1:n
for i=1:50
    a(i)=2*(1-cos(n*pi))/(i*pi)+2*(cos(0.4*i*pi)-cos(0.6*i*pi))/(i*pi);
    b(i)=a(i)*exp(-i*i*pi*pi*3)*sin(i*pi*j*h);
end
    u(j)=sum(b);
    error(j)=abs(u(j)-U(j));
end
er(l)=sum(error)/n;

end
plot(log(d),log(er));
p=polyfit(log(d),log(er),1);
