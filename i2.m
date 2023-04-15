function [rt] = i2(i1,x,y,F,theta,sigma)
rt = 0;
[M,N] = size(i1);
for tempY= y-2*sigma : y+2*sigma
    if y-tempY < 1
        temp = N + y-tempY;
    else
        temp = y-tempY;
    end
    rt = rt + double(i1(x,temp)) * h2(x,tempY,F,theta,sigma) * realmax;
end

end

