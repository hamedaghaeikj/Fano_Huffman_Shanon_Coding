function [Sym,Prob]=MArray(MA,n) % MA : Number of Symbols & n : Number of Experiences
    %This Function can generate MArray Symbols.
    M=randi([65,65+MA-1],1,n);
    V=unique(M);

    N=[];
    for j=V
        l=0;
       for k=M
           if j==k
               l=l+1;
           end
       end
        N=[N;j,l];
    end

    F=[];
    for i=N(:,1)
        F=[F; char(i)];
    end
    Z={F,N(:,2)};

    P=[];
    %Probability 
    for v=1:length(Z{1,1})
        P=[P,Z{1,2}(v)/sum(Z{1,2})];
    end
    Z={F,N(:,2),P'};
    Sym=Z{1,1};
    Prob=100*Z{1,3};
end