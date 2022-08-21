// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@param t1
///@param t2
///@param t3
///@param method
function get_triangle(argument0,argument1,argument2,argument3)
{
var t1 = argument0;
var t2 = argument1;
var t3 = argument2;

//inclinations
var inclination_n1 = floor((yy[t1] - yy[t2]) / (xx[t1] - xx[t2])*10)
var inclination_n2 = floor((yy[t2] - yy[t3]) / (xx[t2] - xx[t3])*10)
var inclination_n3 = floor((yy[t1] - yy[t3]) / (xx[t1] - xx[t3])*10)
	
//GML only function (to know values on console)
show_debug_message("inclination_n1 : "+string(inclination_n1));
show_debug_message("inclination_n2 : "+string(inclination_n2));
	
	//check whether are three points on same straight line by checking inclination
	if (inclination_n1 != inclination_n2 && inclination_n2 != inclination_n3 && inclination_n1 != inclination_n3)
	{
		//check whether are there more than three points
		if (xx[t1] != -4 && xx[t2] != -4 && xx[t3] != -4)
		{
		//length from (x2,y2) to (x1,y1) <line AB>
		var L1 = sqrt(power(xx[t2] - xx[t1],2) + power(yy[t2] - yy[t1],2));

		//length from (x1,y1) to (x3,y3) <line AC>
		var L2 = sqrt(power(xx[t1] - xx[t3],2) + power(yy[t1] - yy[t3],2));

		//length from (x3,y3) to (x2,y2) <line CB>
		var L3 = sqrt(power(xx[t3] - xx[t2],2) + power(yy[t3] - yy[t2],2));
		
		//GML only function (to know values on console)
		show_debug_message("line AB : "+string(L1));
		show_debug_message("line AC : "+string(L2));
		show_debug_message("line CB : "+string(L3));


		//angles from triangles (cosine formula)
		var numerator1 = (power(L2,2) + power(L1,2) - power(L3,2));
		var denominator1 = (2*L2*L1);
		var cosA = numerator1/denominator1;
		//GML only function (to know values on console)
		show_debug_message("num "+string(numerator1)+" / deno "+string(denominator1)+" = "+string(cosA));
	
			if (argument3 == 0) //method 1 (using trigonometric function to get circumcenter)
			{

			var numerator2 = (power(L3,2) + power(L1,2) - power(L2,2));
			var denominator2 = (2*L3*L1);
			var cosB = numerator2/denominator2;
			//GML only function (to know values on console)
			show_debug_message("num "+string(numerator2)+" / deno "+string(denominator2)+" = "+string(cosB));

			var numerator3 = (power(L3,2) + power(L2,2) - power(L1,2));
			var denominator3 = (2*L3*L2);
			var cosC = numerator3/denominator3;
			//GML only function (to know values on console)
			show_debug_message("num "+string(numerator3)+" / deno "+string(denominator3)+" = "+string(cosC));

			var sinA = sqrt(1 - power(cosA,2));
			var sinB = sqrt(1 - power(cosB,2));
			var sinC = sqrt(1 - power(cosC,2));
		
			//GML only function (to know values on console)
			show_debug_message("cosA : "+string(cosA));
			show_debug_message("cosB : "+string(cosB));
			show_debug_message("cosC : "+string(cosC));
			show_debug_message("sinA : "+string(sinA));
			show_debug_message("sinB : "+string(sinB));
			show_debug_message("sinC : "+string(sinC));

			//formula
			var sin2A = (sinA*cosA)*2; // = sinA*cosA + cosA*sinA
			var sin2B = (sinB*cosB)*2; // = sinB*cosB + cosB*sinB
			var sin2C = (sinC*cosC)*2; // = sinC*cosC + cosC*sinC

			//circumcenter position
			var cir_xx = (xx[t1]*sin2A + xx[t2]*sin2B + xx[t3]*sin2C) / (sin2A + sin2B + sin2C);
			var cir_yy = (yy[t1]*sin2A + yy[t2]*sin2B + yy[t3]*sin2C) / (sin2A + sin2B + sin2C);
			}
			else
			{
			//these value is for to get radius of circle
			var sinA = sqrt(1 - power(cosA,2));
		
		
			var L1_midpoint_xx = (xx[t1] + xx[t2])/2; //mid point of line AB
			var L1_midpoint_yy = (yy[t1] + yy[t2])/2;
	
			var L2_midpoint_xx = (xx[t1] + xx[t3])/2; //mid point of line AC
			var L2_midpoint_yy = (yy[t1] + yy[t3])/2;
		
			//GML only function (to know values on console)
			show_debug_message("L1_midpoint_xx : "+string(L1_midpoint_xx));
			show_debug_message("L1_midpoint_yy : "+string(L1_midpoint_yy));
	
			//inclination of line
			var inclination_m1 = -(xx[t1] - xx[t2])/(yy[t1] - yy[t2]);
			var inclination_m2 = -(xx[t1] - xx[t3])/(yy[t1] - yy[t3]);
	
			//z = m1*α1 + m2*α2 + β1 - β2 (substitution)
			var substitution_z = -(inclination_m1*L1_midpoint_xx) + inclination_m2*L2_midpoint_xx + L1_midpoint_yy - L2_midpoint_yy;
		
			//circumcenter position
			var cir_xx = -substitution_z/(inclination_m1 - inclination_m2);
			var cir_yy = inclination_m1*(cir_xx - L1_midpoint_xx) + L1_midpoint_yy;
		
			//GML only function (to know values on console)
			show_debug_message("cir_xx : "+string(cir_xx));
			show_debug_message("cir_yy : "+string(cir_yy));
			}


		//radius (2R)
		var rad_cir = L3/sinA;

		var check_only_three_points_in = 0;
		//check whether the points are in the circumcircle
		for(var i = 0; i < 256; i++)
		{
			//stop repeating when it dont need to do this   OR   when there're points more than 3
			if (xx[i] == -4)
			{
			break;
			}
		

		//distance from certain point to circumcenter
		var r_point_length = sqrt(power(cir_xx - xx[i],2) + power(cir_yy - yy[i],2));

			if (r_point_length*2 <= rad_cir)
			{
			check_only_three_points_in ++;
			}
		
			if (check_only_three_points_in > 3)
			{
			cir_col[n_circle] = c_gray;
			break;
			}
			else
			{
			cir_col[n_circle] = c_blue;
			}
		}
	
	
		//GML only function (to know values on console)
		show_debug_message("check_only_three_points_in : "+string(check_only_three_points_in));
		show_debug_message("rad_cir (2R) : "+string(rad_cir*100));
		show_debug_message("cir_xx : "+string(cir_xx));
		show_debug_message("cir_yy : "+string(cir_yy));


		cir_xx_s[n_circle] = cir_xx;
		cir_yy_s[n_circle] = cir_yy;
		cir_rad_s[n_circle] = rad_cir;
	
	
			//line
			if (check_only_three_points_in <= 3)
			{
			line_xx1[n_line*3] = xx[t1];
			line_yy1[n_line*3] = yy[t1];

			line_xx2[n_line*3] = xx[t2];
			line_yy2[n_line*3] = yy[t2];
				
				
			line_xx1[n_line*3+1] = xx[t2];
			line_yy1[n_line*3+1] = yy[t2];

			line_xx2[n_line*3+1] = xx[t3];
			line_yy2[n_line*3+1] = yy[t3];
				
				
			line_xx1[n_line*3+2] = xx[t3];
			line_yy1[n_line*3+2] = yy[t3];

			line_xx2[n_line*3+2] = xx[t1];
			line_yy2[n_line*3+2] = yy[t1];
		
			n_line ++;
			}
	
		//return check_only_three_points_in;
		}
	}
}