imtool close all;
clc;

I = (gif2int(imread('texture1.gif')));
imtool(I);
[M, N] = size(I);

I1 = zeros(M,N);
maximum = realmax;
F = 0.059;
theta = 135;
sigma = 8;
for y = 1:N
    for x = 1+2*sigma:M - 2*sigma
        I1(x,y) = i1(I,x,y,F,theta,sigma) * realmax;
    end
end


I2 = zeros(M,N);
for x = 1+2*sigma:M - 2*sigma
    for y = 1+2*sigma:N - 2*sigma
        I2(x,y) = i2(I1,x,y,F,theta,sigma);
    end
end
imtool(I2);
m0 = abs(I2);

imtool(m0);
