function [rt] = g(in,sigma,mu)
rt = 1/(2*pi*sigma)*exp(-0.5*(sigma/(in-mu))^2);
end