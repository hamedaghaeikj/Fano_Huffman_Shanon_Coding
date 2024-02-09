clc;
clear;
close all;
% Fano Coding
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
state=[]; 
temp2=[]; 
code=[]; 
temp=[]; 
a=0; 
b=length(P); 
state=[a b]; 
for i1=1:length(P)  
    temp=[]; 
    temp2=[]; 
    for j1=1:(length(state)-1) 
    a=state(j1)+1;  b=state(j1+1); 
    if(a >=b) 
    temp=[temp; 2];
    continue 
    end
    sum=0;
    temp1=[]; 
    for i=a:b %loop for finding difference vector 
    sum=sum+P(i); 
    sum1=0; 
    for j=i+1:b 
    sum1=sum1+P(j); 
    end  
    temp1=[temp1 abs(sum-sum1)]; 
    end 
    small=min(temp1); 
    k=1; 
        for i=a:b
            if(small==temp1(k)) 
                break; 
            end 
        k=k+1; 
        end
    Index=i;
    temp2=[temp2 Index];
    ind=(Index+1)-a;
    remind=b -Index ;
    temp=[temp; zeros(ind ,1); ones(remind ,1)]; 
    end 
    state=[temp2 state]; 
    state=sort(state); 
    code=[code temp]; 
    if(length(state)>length(P))
        break; 
    end 
end
L=[];
for i=1:length(P) 
    W=[]; 
    for(j=1:i1)
        if(code(i,j)==2)
            break; 
        end 
        W=[W code(i,j)]; 
    end 
    L=[L length(W)]; 
    fprintf('\n%c is',S(i)); 
    disp(W) 
end 
