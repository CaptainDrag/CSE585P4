function [rt] = m2(m1,x,y,sigma)
rt = 0;
for tempY= y-2*sigma : y+2*sigma
    rt = rt + m1(x,y-tempY) * g(x,tempY,sigma);
end

end

