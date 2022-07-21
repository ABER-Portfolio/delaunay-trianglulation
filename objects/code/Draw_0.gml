/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_red)
for(var i = 0; i < 256; i++)
{
draw_circle(xx[i],yy[i],2,false)
}

draw_set_color(c_blue)
draw_circle(cir_xx_s,cir_yy_s,2,false)
draw_circle(cir_xx_s,cir_yy_s,cir_rad_s/2,true)
