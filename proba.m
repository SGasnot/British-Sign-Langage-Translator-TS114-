function [P]=proba(train,test,K)
Q=0;
L=length(test);

for k=1:L
    
[M,N]=size(train);
A=zeros(2,N);

    for i = 1:N
        for j =2:M
    A(1,i) = A(1,i) + norm((train(j,i)-test(j,k))*(train(j,i)-test(j,k)),2);
        end
    end 

A(2,:)=train(1,:);
[~,E] = sort(A(1,:));
 
Y = A(:,E);
Z=Y(2,(1:K));
B=0;

for i = 0:30;
    s=sum(ismember(Z,[i]));
    if (s>B)
        B=i;
    end
end

if (B==test(1,k))
    Q=Q+1;
end
P=Q/length(test);
end


    
