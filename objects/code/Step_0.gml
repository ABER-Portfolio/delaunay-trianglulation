/// @description Insert description here
// You can write your code in this editor

x = floor(x)
y = floor(y)


v_x += (tv_x - v_x)*0.1;
v_y += (tv_y - v_y)*0.1;
camera_set_view_size(view_camera[0],floor(v_x),floor(v_y));

if v_x < 1280*0.4
{
tv_x = 1280*0.4
tv_y = 720*0.4
}


if mouse_wheel_up() && keyboard_check(vk_control)
{
tv_x -= 1280*0.05
tv_y -= 720*0.05

t_x = mouse_x
t_y = mouse_y
}

if mouse_wheel_down() && keyboard_check(vk_control)
{
tv_x += 1280*0.05
tv_y += 720*0.05

t_x = mouse_x
t_y = mouse_y
}

x += (t_x - x)*0.1
y += (t_y - y)*0.1