function [rt] = i1(I,x,y,F,theta,sigma)
rt = 0;
[M,N] = size(I);
for tempX= x-2*sigma : x+2*sigma
    if x-tempX < 1
        temp = M + x-tempX;
    else
        temp = x-tempX;
    end
    rt = rt + double(I(temp,y)) * h1(tempX,y,F,theta,sigma) * realmax;
end

end

