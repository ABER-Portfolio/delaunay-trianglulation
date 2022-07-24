/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
var draw_mode_text = "lines and each points"
if draw_mode = 1
{
draw_mode_text = "lines, each points and every circumcircle"
}
if draw_mode = 2
{
draw_mode_text = "lines only"
}
if draw_mode = 3
{
draw_mode_text = "lines, each points and blue circumcircle"
}

var c_x = camera_get_view_x(view_camera[0])
var c_y = camera_get_view_y(view_camera[0])
var c_s = camera_get_view_width(view_camera[0])/1280

draw_text_ext_transformed(c_x+32*c_s,c_y+32*c_s,"draw mode : "+string(draw_mode_text)+" (F1)",128,999999,c_s,c_s,0)
draw_text_ext_transformed(c_x+32*c_s,c_y+64*c_s,"reset (R)",128,999999,c_s,c_s,0)
draw_text_ext_transformed(c_x+32*c_s,c_y+128*c_s,"camera zoom in/out (Ctrl + mousewheel)",128,999999,c_s,c_s,0)
draw_text_ext_transformed(c_x+32*c_s,c_y+160*c_s,"camera move (RMB)",128,999999,c_s,c_s,0)
draw_text_ext_transformed(c_x+32*c_s,c_y+camera_get_view_height(view_camera[0])-32*c_s,"total number of cases : "+string(total_circle),128,999999,c_s,c_s,0)



//draw lines
for(var i = 0; i < n_line*3+2; i++)
{
draw_set_color(c_black)
draw_line_width(line_xx1[i],line_yy1[i],line_xx2[i],line_yy2[i],1.5)
}


//draw points
if draw_mode != 2
{
draw_set_color(c_red)
	for(var i = 0; i < n_point_num; i++)
	{
	draw_circle(xx[i],yy[i],2,false)
	}
}

if draw_mode = 1 || draw_mode = 3
{
var can_draw = true
	
	for(var i = 0; i <= total_circle; i++)
	{
		if draw_mode = 3
		{
			if cir_col[i] = c_blue
			{
			can_draw = true
			}
			else
			{
			can_draw = false
			}
		}
		
		if cir_col[i] != -4 && can_draw = true
		{
		draw_set_color(cir_col[i])
		draw_circle(cir_xx_s[i],cir_yy_s[i],2,false)
		draw_circle(cir_xx_s[i],cir_yy_s[i],cir_rad_s[i]/2,true)
		}
	}
}



