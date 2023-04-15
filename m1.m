function [rt] = m1(m,x,y,sigma)
rt = 0;
for tempX= x-2*sigma : x+2*sigma
    rt = rt + m((x-tempX),y) * g(tempX,y,sigma);
end

end

