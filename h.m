function [rt] = h(x,y,F,theta,sigma)
%H_X_Y 此处显示有关此函数的摘要
%   此处显示详细说明
j = sqrt(-1);
U = F * cosd(theta);
V = F * sind(theta);
rt = g(x,y,sigma) * exp(j * 2 * pi * ( U*x + V*y));
end

