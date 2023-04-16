imtool close all
clear, clc
close all

I = imbinarize(imread("d9d77.gif"));
imtool(I);

[M, N] = size(I);

F = 0.063;
theta = 60;
sigma = 36;

% i1(x,y)
i1 = zeros(M,N);
for i = 1 + 2 * sigma : M - 2 * sigma
    for j = 1 : N
        for x = i - 2 * sigma : i + 2 * sigma
            i1(i,j) = i1(i,j) + I(x,j) * h1(i - x, sigma, F, theta);
        end
    end
end

% i2(x,y)
i2 = zeros(M,N);
for i = 1 + 2 * sigma : M - 2 * sigma
    for j = 1 + 2 * sigma : N - 2 * sigma
        for y = j - 2 * sigma : j + 2 * sigma
            i2(i,j) = i2(i,j) + i1(i,y) * h2(j - y, sigma, F, theta);
        end
    end
end

% m(x,y)
m = zeros(M,N);
for i = 1 : M
    for j = 1 : N
        m(i,j) = abs(i2(i,j));
    end
end

figure(1)
mesh(m)
title('Gabor filter for d9d77'), xlabel('x'), ylabel('y'), zlabel('m(x,y)')

%---------------Threshold the filtered output------------------------------
I_new = I(1 + 2 * sigma : M - 2 * sigma, 1 + 2 * sigma : N - 2 * sigma);
[M1,N1] = size(I_new);

im = zeros(M1,N1);
threshold = 1.5e-6;
for i = 1 : M1
    for j = 1 : N1
        if (m(i,j) > threshold)
            im(i,j) = 1;
        end
    end
end

figure(4)
imshowpair(im,I_new);