function [UE_loc] = generate_UE_loc(UE_center,UE_range,K)
UE_radius = UE_range*rand(K,1);
UE_direction = 2*pi*rand(K,1);
UE_x = UE_center(1)+UE_radius.*cos(UE_direction);
UE_y = UE_center(2)+UE_radius.*sin(UE_direction);
UE_loc = [UE_x,UE_y];

end