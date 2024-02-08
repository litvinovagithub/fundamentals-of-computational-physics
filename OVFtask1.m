N=1000;
e=double(1);
del=double(2.0);
for i=1:N
e=e/del;
if (1+e/2)==1
    if(1+e~=1) 
        count=i;
        break;
    end
end
end
disp(i);
disp(e);
number=single(1);
factor=single(2);
for i=1:N
previousNumber=number;
number=number*factor;

if (number==inf) 
    res=previousNumber*2-1;
    max=i;
    break; 
end
end



