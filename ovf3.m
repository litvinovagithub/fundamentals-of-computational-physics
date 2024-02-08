clear all;
close all;
name='D:\work_matlab\TestsinTr.txt';
name1='D:\work_matlab\TestTr.txt';
name2='D:\work_matlab\TestsinS.txt';
name3='D:\work_matlab\TestS.txt';
m=readmatrix(name);
m1=readmatrix(name1);
m2=readmatrix(name2);
m3=readmatrix(name3);
I=func(m);
I1=func(m1);
I2=func(m2);
I3=func(m3);
x=m(1:end-1,1).^4;
x1=m(1:end-1,1).^2;
hold on
plot(log(m(1:end-1,1)),log(I3(1:end)),'color','red');
plot(log(m(1:end-1,1)),-log(x1),'color','blue');
plot(log(m(1:end-1,1)),-log(x),'color','green');
hold off
loglog(m1(1:end-1,1),I1(1:end));
loglog(m2(1:end-1,1),I2(1:end));
loglog(m2(1:end-1,1),I3(1:end));
% title('kvadrS');

