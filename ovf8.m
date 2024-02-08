clear all;
close all;
%% non yavnaya 1, u(x,y)
h=0.1;
epsil=1e-5;
t=0:h:10;
N=size(t,2);
u=zeros(2,N);
u(1,1)=1;
u(2,1)=1;
J=[998,1998;
   -999,-1999];
E=[1,0;
   0, 1];
[a,b]=alphaBeta(u(1,1),u(2,1));
inversMatr=inv(E-h*J/2);
u(:,2)=[1,1];
for i=1:N-1
    while(true)
    tmp=u(:,i+1);
    u(:,i+1)=tmp-inversMatr*(tmp-u(:,i)-h*F8(tmp(1),tmp(2))/2-h/2*F8(u(1,i),u(2,i)));
     if(abs(tmp-u(:,i+1))<epsil)
        break;
     end
    end
end
uA=2*a*exp(-t)+b*exp(-1000*t);
vA=-a*exp(-t)-b*exp(-1000*t);
hold on
plot(t,u(1,:),'color','red','DisplayName','u');
plot(t,u(2,:),'color','b','DisplayName','v');
plot(t,uA,'color','black','DisplayName','u Analitic');
plot(t,vA,'color','yellow','DisplayName','v Analitic');
hold off
legend;
