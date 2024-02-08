clear all;
close all;
x0=0;
y0=1;
h=0.002;
x=0:h:3;
xK=0:h:3;
N=size(x,2);
y=zeros(1,N);
yK=zeros(1,N);
x(1)=x0;
y(1)=y0;
xK(1)=x0;
yK(1)=y0;
xK4(1)=x0;
yK4(1)=y0;
%% Euler
for i=1:N-1
x(i+1)=x(i)+h;
y(i+1)=y(i)+h*(-y(i));
end
%% Kutta 2
for i=1:N-1
xK(i+1)=xK(i)+h;
yK(i+1)=yK(i)+h*(-yK(i)/4-3/4*(yK(i)-h/2*4/3*yK(i)));
end
%% Kutta 4
for i=1:N-1
yK4(i+1)=yK4(i)+h/6*(-yK4(i)+2*yK4(i)*(h/2-1)-2*yK4(i)*(h/2-1)^2-(yK4(i)-h*yK4(i)*(h/2-1)^2));
end
y1=exp(-x);
% hold on
% plot(xK,yK,'Color','red');
% plot(x,y1);
% plot(xK,yK4,'Color','blue');
% hold off
hold on
plot(x,log(y1-y),'Color','red');%error Euler
plot(xK,log(y1-yK),'color','green');% error Kutta2
plot(x,log(yK4-y1),'Color','blue')%kutta 4
hold off
