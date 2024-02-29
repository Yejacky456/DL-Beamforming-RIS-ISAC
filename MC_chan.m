clear
clc
close all

M = 8;   N = 32;    K = 1;

% MC = 500000;
% MC = 100;
% MC = 3;

BS_loc = [0,0];     RIS_loc = [220,0];
UE_center = [200,30];   radius = 10;
Target_loc = [200,-50];

G_all = zeros(N,M,MC);
hrc_all = zeros(N,MC);
hrt_all = zeros(N,MC);
GH_all = zeros(M,N,MC);
hrcH_all = zeros(N,MC);
hrtH_all = zeros(N,MC);

for mc = 1:MC
    disp(num2str(mc))
    [UE_loc] = generate_UE_loc(UE_center,radius,K);
    [dist_br,dist_ru,dist_rt] = cal_dist(BS_loc,RIS_loc,UE_loc,Target_loc);
    [angle1,angle2,angle3,angle4] = cal_angle(BS_loc,RIS_loc,UE_loc,Target_loc);
    [hrc_pl,G_pl,hrt_pl] = cal_pl(dist_br,dist_ru,dist_rt);
    [hrc,G,hrt] = generate_channel(M,N,angle1,angle2,angle3,angle4,hrc_pl,G_pl,hrt_pl);

    G_all(:,:,mc) = G;      GH_all(:,:,mc) = G';
    hrc_all(:,mc) = hrc;    hrcH_all(:,mc) = conj(hrc);
    hrt_all(:,mc) = hrt;    hrtH_all(:,mc) = conj(hrt);
end

% filename = ['Train_Channel_N_',num2str(N),'.mat'];
filename = ['Test_Channel_N_',num2str(N),'.mat'];
save(filename,'G_all','hrc_all','GH_all','hrcH_all','hrt_all','hrtH_all')