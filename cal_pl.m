function [hrc_pl,G_pl,hrt_pl] = cal_pl(dist_br,dist_ru,dist_rt)
% pathloss
fc = 2.4; % GHz, carrier freq
n_pw_sp = -76; % Noise power spectral density

hrc_pl = sqrt(10.^((-n_pw_sp-LOS_PL(dist_ru,fc)) /10));
hrt_pl = sqrt(10.^((-n_pw_sp-LOS_PL(dist_rt,fc)) /10));
G_pl = sqrt(10.^((-n_pw_sp-LOS_PL(dist_br,fc)) /10));
end

function [pl] = LOS_PL(d,fc)
pl = 22*log10(d)+28+20*log10(fc);
end

% function [pl] = NLOS_PL(d,fc)
% pl = 36.7*log10(d)+22.7+26*log10(fc);
% end