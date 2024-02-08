clear all;
close all;
h=0.01;
tau=0.01;
L=1;
t=0:tau:1;
x=0:h:L;
N=size(x,2);
Ntime=size(t,2);

a=zeros(1,N);
c=zeros(1,N);
b=zeros(1,N);
u=zeros(Ntime,N);
d=zeros(Ntime,N);
a(2:end)=-tau/h^2/2;
c(1:end-1)=-tau/h^2/2;
b(:)=1+tau/h^2;

u(:,1)=F11(x,L);% начальные условия т=0;
u(1,:)=0;
u(end,:)=0;
%t=0  
%plot(x,u(:,1));
for j=2:N  %j-time
for i=2:N-1  %i-space
    d(i,j)=u(i,j-1)+tau/2/h^2*(u(i+1,j-1)-2*u(i,j-1)+u(i-1,j-1));
end
u(:,j)=ovf11progonka(a,b,c,d(:,j),N,u(:,j));
% plot(x,u(:,j));
end
mesh(x,t,u);
hold on
%plot(t,u_max');

hold off
%