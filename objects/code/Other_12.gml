/// @description Insert description here
// check all points whether they're in certain circumcircle or not

//target point num
var t1 = 0
var t2 = 1
var t3 = 2

if xx[t1] != -4 && xx[t2] != -4 && xx[t3] != -4
{
//length from (x2,y2) to (x1,y1) <line AB>
var L1 = sqrt(power(xx[t2] - xx[t1],2) + power(yy[t2] - yy[t1],2))

//length from (x1,y1) to (x3,y3) <line AC>
var L2 = sqrt(power(xx[t1] - xx[t3],2) + power(yy[t1] - yy[t3],2))

//length from (x3,y3) to (x2,y2) <line CB>
var L3 = sqrt(power(xx[t3] - xx[t2],2) + power(yy[t3] - yy[t2],2))


//angles from triangles
var numerator1 = (power(L2,2) + power(L1,2) - power(L3,2))
var denominator1 = (2*L2*L1)
var cosA = numerator1/denominator1
show_debug_message("num "+string(numerator1)+" / deno "+string(denominator1)+" = "+string(cosA))

var numerator2 = (power(L3,2) + power(L1,2) - power(L2,2))
var denominator2 = (2*L3*L1)
var cosB = numerator2/denominator2
show_debug_message("num "+string(numerator2)+" / deno "+string(denominator2)+" = "+string(cosB))

var numerator3 = (power(L3,2) + power(L2,2) - power(L1,2))
var denominator3 = (2*L3*L2)
var cosC = numerator3/denominator3
show_debug_message("num "+string(numerator3)+" / deno "+string(denominator3)+" = "+string(cosC))

var sinA = sqrt(1 - power(cosA,2))
var sinB = sqrt(1 - power(cosB,2))
var sinC = sqrt(1 - power(cosC,2))

var sin2A = sinA*cosA + cosA*sinA
var sin2B = sinB*cosB + cosB*sinB
var sin2C = sinC*cosC + cosC*sinC

//circumcenter position
var cir_xx = (xx[t1]*sin2A + xx[t2]*sin2B + xx[t3]*sin2C) / (sin2A + sin2B + sin2C)
var cir_yy = (yy[t1]*sin2A + yy[t2]*sin2B + yy[t3]*sin2C) / (sin2A + sin2B + sin2C)


//radius (2R)
var rad_cir = L3/sinA

var check_only_three_points_in = 0
//check whether the points are in the circumcircle
for(var i = 0; i < 256; i++)
{
	//stop repeating when it dont need to do this   OR   when there're points more than 3
	if xx[i] = -4 || check_only_three_points_in > 3
	{
	break;
	}

//distance from certain point to circumcenter
var r_point_length = sqrt(power(cir_xx - xx[i],2) + power(cir_yy - yy[i],2))

	if r_point_length <= rad_cir
	{
	check_only_three_points_in ++
	}
}

show_debug_message("cosA : "+string(cosA))
show_debug_message("cosB : "+string(cosB))
show_debug_message("cosC : "+string(cosC))
show_debug_message("sinA : "+string(sinA))
show_debug_message("sinB : "+string(sinB))
show_debug_message("sinC : "+string(sinC))
show_debug_message("line AB : "+string(L1))
show_debug_message("line AC : "+string(L2))
show_debug_message("line CB : "+string(L3))
show_debug_message("check_only_three_points_in : "+string(check_only_three_points_in))
show_debug_message("rad_cir (2R) : "+string(rad_cir))
show_debug_message("cir_xx : "+string(cir_xx))
show_debug_message("cir_yy : "+string(cir_yy))

cir_xx_s = cir_xx;
cir_yy_s = cir_yy;
cir_rad_s = rad_cir;
}