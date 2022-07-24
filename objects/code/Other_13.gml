/// @description Insert description here
// You can write your code in this editor

var total_cal_num = 0




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
				get_triangle(i,ii,iii)

				
				n_circle ++
				total_cal_num ++
				}
			}
		}
	}
}
total_circle = total_cal_num
show_debug_message("total_cal_num : "+string(total_cal_num))