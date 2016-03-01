function [gam_x, p] = autocorr(x,maxP)

N=length(x);
gam_x=zeros(1,2*maxP+1);


for p=1-maxP:1:maxP-1;
    if (p<=-1)
    gam_x(maxP+1-p)=conj(gam_x(p+maxP+1));
    else
         for k=p:N-1;
         gam_x(p+maxP)=gam_x(p+maxP)+(x(k+1)*conj(x(k-p+1)))*(1/(N-p));   
         gam_x(maxP-p)=gam_x(maxP-p)+(x(k+1)*conj(x(k-p+1)))*(1/(N-p));
         end
    end      
end
             