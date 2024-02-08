clear all;
close all;
x0=3;
y0=1;
h=0.0002;
t=0:h:1;
N=size(t,2);
y=zeros(1,N);
x=zeros(1,N);
x(1)=x0;
y(1)=y0;
for i=1:N-1
    y(i+1)=y(i)+h*(1/4*Fy(x(i),y(i))+3/4*Fy(x(i)+h/2*4/3*Fx(x(i),y(i)),y(i)+h/2*4/3*Fy(x(i),y(i))));
    x(i+1)=x(i)+h*(1/4*Fx(x(i),y(i))+3/4*Fx(x(i)+h/2*4/3*Fx(x(i),y(i)),y(i)+h/2*4/3*Fy(x(i),y(i))));
end
plot(t,x,'DisplayName','x');
plot(t,y,'DisplayName','x');
hold on
plot(x,y);
plot(x0,y0,'O','Color', 'r');
xlabel('rabbit');
ylabel('wolf');
hold off

