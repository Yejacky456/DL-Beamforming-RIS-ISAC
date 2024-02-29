function [steering_vec] = ULA(angle,M)
    %%% input
    % angle: signal direction (not rad)
    % M : array element number
    
    %%% output
    % steering vector
    steering_vec = exp(1j*pi*(0:M-1)'*sin(angle*pi/180).');
end