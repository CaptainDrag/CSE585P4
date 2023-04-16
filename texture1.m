imtool close all
clear, clc
close all

I = imbinarize(imread("texture1.gif"));
imtool(I);

[M, N] = size(I);

F = 0.042;
theta = 0;
sigma = 24;

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
title('Gabor filter for texture 1'), xlabel('x'), ylabel('y'), zlabel('m(x,y)')

%--------------------------- Smoothing filter -----------------------------
sigma_s = 24;    % for smoothing filter 
i_p = zeros(M,N);
m_p = zeros(M,N);

% i_prime
for i = 1 + 2 * sigma_s : M - 2 * sigma_s
    for j = 1 : N
        for x = i - 2 * sigma_s : i + 2 * sigma_s
            i_p(i,j) = i_p(i,j) + m(x,j)*g(i,sigma_s,x);
        end
    end
end

% m_prime
for i = 1 + 2 * sigma_s : M - 2 * sigma_s
    for j = 1 + 2 * sigma_s : N - 2 * sigma_s
        for y = j - 2 * sigma_s : j + 2 * sigma_s
            m_p(i,j) = m_p(i,j) + i_p(i,y)*g(j,sigma_s,y);
        end
    end
end

m_prime = m_p(1 + 2 * sigma_s : M - 2 * sigma_s, 1 + 2 * sigma_s : N - 2 * sigma_s);
figure(3)
mesh(m_prime)
title('Smoothing filter for texture 1'), xlabel('x'), ylabel('y'), zlabel('m^p(x,y)')

%---------------Threshold the filtered output------------------------------
I_new = I(1 + 2 * sigma_s : M - 2 * sigma_s, 1 + 2 * sigma_s : N - 2 * sigma_s);
[M1,N1] = size(I_new);

im = zeros(M1,N1);
threshold = 1.3e-6;
for i = 1 : M1
    for j = 1 : N1
        if (m_prime(i,j) > threshold)
            im(i,j) = 1;
        end
    end
end

figure(4)
imshowpair(im,I_new);