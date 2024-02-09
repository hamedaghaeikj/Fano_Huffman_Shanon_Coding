clc;
clear;
close all;
% Huffman Coding
n=100; %Number of Data
M=5;  %Number of Symbols
%Symbols and Probability
[S,P]=MArray(M,n);
p=P;
P=P';

%Sort
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
tempfinal=[0];
sumarray=[];
w=length(P);
lengthp=[w];
i=1;
b(i,:)=P;
Output={};
while length(P)>2
    temp=P(length(P))+P(length(P)-1);
    sumarray=[sumarray , temp];
    P=[P(1:length(P)-2),temp];
    P=sort(P,'descend');
    i=i+1;
    b(i,:)=[P,zeros(1,w-length(P))];
    w1=0;
    lengthp=[lengthp,length(P)];
    
    for temp0=1:length(P)
       if P(temp0)==temp
          w1=temp0; 
       end
    end
    tempfinal=[w1,tempfinal];
end

tempdisplay=0;
temp2=b(1,:);
sumarray=[0,sumarray];
var=[];
e=1;

for index=1:size(b,2)
   code=[S(index),'     ']; 
    for j=1:size(b,1)
       tempdisplay=0;
       for ii=1:size(b,2)
          if b(j,ii)==temp2(e)
              tempdisplay=b(j,ii);
          end
          if tempdisplay==0 && b(j,ii)==sumarray(j)
              tempdisplay=b(j,ii);
          end
       end
       var=[var,tempdisplay];
       if tempdisplay==b(j,lengthp(j))
           code=[code,'1'];
       elseif tempdisplay==b(j,lengthp(j)-1)
           code=[code,'0'];
       else 
           code=[code,''];
       end
       temp2(e)=tempdisplay;
    end
    display(code);
    e=e+1;
end
