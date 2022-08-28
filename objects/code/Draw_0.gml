/// @description Insert description here
// You can write your code in this editor

//code for drawing
draw_set_color(c_black)
var draw_mode_text = "lines & each points"
if draw_mode = 1
{
draw_mode_text = "lines, each points & every circumcircle"
}
if draw_mode = 2
{
draw_mode_text = "lines only"
}
if draw_mode = 3
{
draw_mode_text = "lines, each points & main circumcircle"
}


//var draw_type_text = "delaunay triangulation"
//if draw_target = 1
//{
//draw_type_text = "delaunay triangulation & voronoi diagram"
//}
//if draw_target = 2
//{
//draw_type_text = "voronoi diagram"
//}


var c_type = "using trigonometric functions"
if cal_type = 1
{
c_type = "using polynomial functions"
}


var c_x = camera_get_view_x(view_camera[0])
var c_y = camera_get_view_y(view_camera[0])
var c_s = camera_get_view_width(view_camera[0])/1280

//draw_text_ext_transformed(c_x+32*c_s,c_y+24*c_s,"draw target : \n"+string(draw_type_text)+" (F10)",24,999999,c_s,c_s,0)

draw_text_ext_transformed(c_x+32*c_s,c_y+32*c_s,"draw mode : \n"+string(draw_mode_text)+" (F1)",24,999999,c_s,c_s,0)
draw_set_halign(fa_right)
draw_text_ext_transformed(c_x+1250*c_s,c_y+32*c_s,"calculation type : \n"+string(c_type)+" (F2)",24,999999,c_s,c_s,0)
if n_point_num >= 1
{
draw_set_color(c_red)
draw_text_ext_transformed(c_x+1250*c_s,c_y+96*c_s,"last point pos : \n("+string(xx[n_point_num-1])+", "+string(yy[n_point_num-1])+")",24,999999,c_s,c_s,0)
}
draw_set_halign(fa_left)
draw_set_color(c_black)
draw_text_ext_transformed(c_x+32*c_s,c_y+128*c_s,"camera zoom in/out (Ctrl + mousewheel)",128,999999,c_s,c_s,0)
draw_text_ext_transformed(c_x+32*c_s,c_y+160*c_s,"camera move (RMB)",128,999999,c_s,c_s,0)
draw_set_color(c_red)
draw_text_ext_transformed(c_x+32*c_s,c_y+196*c_s,"reset (R)",128,999999,c_s,c_s,0)
draw_set_color(c_black)
draw_text_ext_transformed(c_x+32*c_s,c_y+camera_get_view_height(view_camera[0])-32*c_s,"total number of cases : "+string(total_circle),128,999999,c_s,c_s,0)




//draw_mouse_pos
draw_set_color(c_red)
draw_text_ext_transformed(mouse_x+16*c_s,mouse_y+16*c_s,"("+string(mouse_x)+", "+string(mouse_y)+")",128,999999,c_s,c_s,0)


//draw lines
//if draw_target <= 1
//{
draw_set_color(c_black)
	for(var i = 0; i < n_line*3+2; i++)
	{
	draw_line_width(line_xx1[i],line_yy1[i],line_xx2[i],line_yy2[i],1.5)
		//if (line_xx1[i] > 0 && line_xx2[i] > 0)
        //{
		//show_debug_message("test1-line_xx1[k] : "+string(i))
        //}
	}
//}



//draw points
if draw_mode != 2
{
draw_set_color(c_red)
	for(var i = 0; i <= n_point_num; i++)
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



