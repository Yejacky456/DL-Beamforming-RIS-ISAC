function [steering_vec] = ULA(angle,M)
    steering_vec = exp(1j*pi*(0:M-1)'*sin(angle*pi/180).');
end
