function [rt] = i2(i1,x,y,F,theta,sigma)
rt = 0;
for tempY= y-2*sigma : y+2*sigma
    rt = rt + double(i1(x,tempY)) * h2(x,tempY,F,theta,sigma);
end

end

