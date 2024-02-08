function [h]=hana(N)
h=zeros(1,N+1);
k=1:1:N;
h(1:end-1)=1/2*(1-cos(2*pi*k/N));
end