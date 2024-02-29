function [angle1,angle2,angle3,angle4] = cal_angle(BS_loc,RIS_loc,UE_loc,Target_loc)
    angle1 = 0; % BS->RIS
    angle2 = 0; % RIS->BS
    
    ru_relative_loc = UE_loc-RIS_loc;
    angle3 = atan(ru_relative_loc(2)./ru_relative_loc(1)) * 180/pi;
    
    rt_relative_loc = Target_loc-RIS_loc;
    angle4 = atan(rt_relative_loc(2)./rt_relative_loc(1)) * 180/pi;
end