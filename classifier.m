function [output_class] = classifier(class_dist)

class_dist= sortrows(transpose(class_dist,2);
class=zeros(30,1);
for l=1:5
    class(class_dist(l,1)+1)=class(class_dist(l,1)+1)+1;
end
max=0;
for m=1:31
    if class(m)>max
        max=class(m);
        output_class=m-1;
    end
end
end
