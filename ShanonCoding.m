clc;
clear;
close all;

% Shanon Coding
n=15; %Number of Data
M=5;  %Number of Symbols
%Symbols and Probability
[S,P]=MArray(M,n);
P=P';
%Sort
L=length(S);
for i=1:length(P)
   for j=1:length(P)
       if P(i)>P(j)
          Temp1=P(i);
          Temp2=S(i);
          P(i)=P(j);
          S(i)=S(j);
          P(j)=Temp1;
          S(j)=Temp2;
       end 
   end
end
Li=ceil(-log2(P/100));

c=[0];

for j=1:L-1
    sum=0;
    for k=1:j
        sum=sum+P(k);
    end
    c=[c,sum/100];
end

b=0;
codes=[];
for v=Li
    b=b+1;
    code=[];
    n=c(b);
    for u=1:v
        n=2*n;
        if n>=1
            code=[code,1];
            n=n-1;
        else
            code=[code,0];
        end
    end
for i=1:max(Li)-Li(b)
    code=[code,nan];
end
    codes=[codes;code]; 
end

for j=1:L
   fprintf('%c is %d \n',S(j))
   display(codes(j,1:Li(j)))
end
