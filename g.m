function [rt] = g(in,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rt = (sqrt(2 * pi) * sigma)^(-1) * exp(-in^2 / (2 * sigma^2));
end