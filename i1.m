function [rt] = i1(I,x,y,F,theta,sigma)
rt = 0;
[M, N] = size(I);
for tempX= x-2*sigma : x+2*sigma
    rt = rt + double(I((tempX),y)) * h1(tempX,y,F,theta,sigma);
end

end

