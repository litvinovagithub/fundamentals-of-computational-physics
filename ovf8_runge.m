clear all;
close all;
%% non yavnaya 1
h=0.0001;
t=0:h:10;
u=zeros(size(t));
v=zeros(size(t));
N=size(t,2);
u(1)=1;
v(1)=1;
[a,b]=alphaBeta(u(1),v(1));
for i=1:N-1
u0=u(i)+h*F8U(u(i),v(i));
v0=v(i)+h*F8V(u(i),v(i));
u(i+1)=u(i)+h*F8U(u(i),v(i))/2+h/2*F8U(u0,v0);
v(i+1)=v(i)+h*F8V(u(i),v(i))/2+h/2*F8V(u0,v0);
end
uA=2*a*exp(-t)+b*exp(-1000*t);
vA=-a*exp(-t)-b*exp(-1000*t);
hold on
plot(t,u,'color','red','DisplayName','u');
plot(t,v,'color','b','DisplayName','v');
plot(t,uA,'color','black','DisplayName','u Analitic');
plot(t,vA,'color','yellow','DisplayName','v Analitic');
hold off
legend;
clf('reset')
U=zeros(size(t));
V=zeros(size(t));
U(1:3)=u(1:3);
V(1:3)=v(1:3);
%% non yavnaya 2
for i=1:N-3
 cu=U(i+2)+h/12*(23*F8U(U(i+2),V(i+2))-16*F8U(U(i+1),V(i+1))+5*F8U(U(i),V(i)));
 cv=V(i+2)+h/12*(23*F8V(U(i+2),V(i+2))-16*F8V(U(i+1),V(i+1))+5*F8V(U(i),V(i)));
 U(i+3)=U(i+2)+h/12*(5*F8U(cu,cv)+8*F8U(U(i+2),V(i+2))-F8U(U(i+1),V(i+1)));
 V(i+3)=V(i+2)+h/12*(5*F8V(cu,cv)+8*F8V(U(i+2),V(i+2))-F8V(U(i+1),V(i+1)));
end
hold on 
plot(t,U,'color','red','DisplayName','u');
plot(t,V,'color','b','DisplayName','v');
plot(t,uA,'color','black','DisplayName','u Analitic');
plot(t,vA,'color','yellow','DisplayName','v Analitic');
hold off
clf('reset')
hold on 
plot(t,U-uA,'color','red');
plot(t,V-vA,'color','b')
hold off