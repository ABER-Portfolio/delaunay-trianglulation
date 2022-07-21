/// @description Insert description here
// You can write your code in this editor

var total_cal_num = 0

//reset all circumcirle and lines
n_circle = 0


for(var i = 0; i < 9999; i++)
{
cir_xx_s[i] = -4;
cir_yy_s[i] = -4;
cir_rad_s[i] = -4;
cir_col[i] = -4;
}



for(var i = 0; i <= n_point_num; i++)
{
	for(var ii = 0; ii <= n_point_num; ii++)
	{
		if ii != i
		{
			for(var iii = 0; iii <= n_point_num; iii++)
			{
				if iii != ii && iii != i
				{
				//check script folder for check algorithm
				var _total_checker = get_triangle(i,ii,iii)

				
				if _total_checker <= 3
				{
				var line_ = instance_create_depth(x,y,depth,obj_line)
				line_.x1 = xx[i]
				line_.y1 = yy[i]
				line_.x2 = xx[ii]
				line_.y2 = yy[ii]
				
				var line_ = instance_create_depth(x,y,depth,obj_line)
				line_.x1 = xx[ii]
				line_.y1 = yy[ii]
				line_.x2 = xx[iii]
				line_.y2 = yy[iii]
				
				var line_ = instance_create_depth(x,y,depth,obj_line)
				line_.x1 = xx[iii]
				line_.y1 = yy[iii]
				line_.x2 = xx[i]
				line_.y2 = yy[i]
				}
				
				n_circle ++
				total_cal_num ++
				}
			}
		}
	}
}
total_circle = total_cal_num
show_debug_message("total_cal_num : "+string(total_cal_num))