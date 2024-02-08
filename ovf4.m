clear all;
close all;
h=zeros(1,15, 'double');
for i=1:15
    h(i)=10^(-i);
end
k=readmatrix("D:\work_matlab\Task4.txt");
k=k';
loglog(h,abs(k));