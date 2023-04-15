imtool close all;
clc;

I = (gif2int(imread('texture2.gif')));
imtool(I);
[M, N] = size(I);

I1 = zeros(M,N);

F = 0.059;
theta = 135;
sigma = 8;
for x = 1+2*sigma:M - 2*sigma
    for y = 1:N
        I1(x,y) = i1(I,x,y,F,theta,sigma);
    end
end
imtool(I1);
I2 = zeros(M,N);
for x = 1+2*sigma:M - 2*sigma
    for y = 1+2*sigma:N - 2*sigma
        I2(x,y) = i2(I1,x,y,F,theta,sigma);
    end
end

m = zeros(M,N);
for x = 1+2*sigma:M - 2*sigma
    for y = 1+2*sigma:N - 2*sigma
        m(x,y) = m(I2,x,y);
    end
end

imtool(m);
