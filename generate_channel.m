function [hrc,G,hrt] = generate_channel(M,N,angle1,angle2,angle3,angle4,hrc_pl,G_pl,hrt_pl)
% channel
kappa = 10;

hrc_LOS = sqrt(1/N) * ULA(angle3,N);
hrc_NLOS = sqrt(1/2/N)*(randn(N,1)+1j*randn(N,1)); 
hrc = (sqrt(kappa/(kappa+1))*hrc_LOS+sqrt(1/(kappa+1))*hrc_NLOS) * hrc_pl; % RIS-> UE

hrt_LOS = sqrt(1/N) * ULA(angle4,N);
hrt_NLOS = sqrt(1/2/N)*(randn(N,1)+1j*randn(N,1)); 
hrt = (sqrt(kappa/(kappa+1))*hrt_LOS+sqrt(1/(kappa+1))*hrt_NLOS) * hrt_pl; % RIS-> UE

G_LOS = sqrt(1/N/M) * ULA(angle2,N)*ULA(angle1,M)';
G_NLOS = sqrt(1/2/M)*(randn(N,M)+1j*randn(N,M));
G = (sqrt(kappa/(kappa+1))*G_LOS+sqrt(1/(kappa+1))*G_NLOS) * diag(G_pl); % BS->RIS


end