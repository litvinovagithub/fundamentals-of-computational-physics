function [u]=ovf11progonka(a,b,c,d,N,u)
et=zeros(1,N);
ks=zeros(1,N);
for i=1:N-1
et(i+1)=(a(i)*et(i)-d(i))/(b(i)-a(i)*ks(i));
ks(i+1)=c(i)/(b(i)-a(i)*ks(i));
end

u(N)=0;
u(1)=0;

i=N-1;
while (i~=1)
u(i)=u(i+1)*ks(i+1)+et(i+1);
i=i-1;
end
end
