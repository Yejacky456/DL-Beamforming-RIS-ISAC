function [dist_br,dist_ru,dist_rt] = cal_dist(BS_loc,RIS_loc,UE_loc,Target_loc)
    br_relative_loc = RIS_loc-BS_loc;
    dist_br = norm(br_relative_loc);
    
    ru_relative_loc = RIS_loc-UE_loc;
    dist_ru = vecnorm(ru_relative_loc);
    
    rt_relative_loc = RIS_loc-Target_loc;
    dist_rt = vecnorm(rt_relative_loc);

end