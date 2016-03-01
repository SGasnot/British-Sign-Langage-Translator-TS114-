function [Cm]= confusion(train,test,K)

Cm=zeros(31,31);
L=length(test);
for l = 0 :30
    
  for k = 1:L
      
      if (test(1,k)==l)
          
[M,N]=size(train);
A=zeros(2,N);

for i = 1:N
    for j =2:M
    A(1,i) = A(1,i) + norm((train(j,i)-test(j,k))*(train(j,i)-test(j,k)),2);
    end   
end 

A(2,:)=train(1,:);

[~,idx] = sort(A(1,:));
 
Y = A(:,idx);
Z=Y(2,(1:K));
B=0;

for i = 0:30;
    s=sum(ismember(Z,[i]));
    if (s>B)
        B=i;
    end
end

Cm(l+1,B+1)=Cm(l+1,B+1)+1;
      end
  end
end
for i = 1:31
    Cm(i,:)=Cm(i,:)/sum(Cm(i,:));
end
end
    
    
    