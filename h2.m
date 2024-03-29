function [rt] = h2(y, sigma, F, theta)
g = 1/(2*pi*sigma^2)*exp(-0.5*y^2/sigma^2);
rt = g*exp(complex(0,2*pi*F*y*sind(theta)));
end

