% ==============================================================
% Module: gif2int.m
%
% Usage: Helper function
%
% Purpose:
%   Transfer gif after imread()
%
% Input Variables:
%   X original image
%   
%   
%
% Returned Results:
%   trans transformed image
%   
%
% Processing Flow:
%   transform each pixel
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 02/19/2023
% ===============================================================*
function [trans] = gif2int(X)

trans = X;
[M,N] = size(trans);
for i = 1 : M
    for j = 1 : N
        if trans(i,j) == 0
            trans(i,j) = 0;
        elseif trans(i,j) == 1
            trans(i,j) = 255;
        end
    end
end
end
