imtool close all;

%clear
clc;

I = (gif2int(imread('texture1.gif')));
imtool(I);

[M, N] = size(I);

F = 0.059;
theta = 135;
sigma = 8;

% g1(x) and h1(x)
g1 = zeros(1,M);
h1 = zeros(1,M);
for i = 1 : M
    g1(i) = g(i,sigma);
    tmp_x = exp(1i * 2 * pi * F * cosd(theta) * i);
    h1(i) = g1(i) * tmp_x;
end

% g2(y) and h2 (y)
g2 = zeros(1,N);
h2 = zeros(1,N);
for i = 1 : N
    g2(i) = g(i,sigma);
    tmp_y = exp(1i * 2 * pi * F * sind(theta) * i);
    h2(i) = g2(i) * tmp_y;
end

% i1(x,y)
i1 = zeros(M,N);
for j = 1 : N
    for i = 1 + 2 * sigma : M - 2 * sigma
        tmp = 0;
        for x = i - 2 * sigma : i + 2 * sigma
            tmp = tmp + double(I(x,j)) * h1(x);
        end
        i1(i,j) = tmp;
    end
end

% i2(x,y)
i2 = zeros(M,N);
for i = 1 : M
    for j = 1 + 2 * sigma : N - 2 * sigma
        tmp = 0;
        for y = j - 2 * sigma : j + 2 * sigma
            tmp = tmp + double(i1(i,y)) * h2(y);
        end
        i2(i,j) = tmp;
    end
end

m = abs(i2);

x = 1 : 512;
y = 1 : 512;
[X,Y] = meshgrid(x,y);
mesh(x,y,m)

