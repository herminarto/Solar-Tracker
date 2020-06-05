function X = irradiance_m(x)
a0 = 302.1332; a1 = -372.9955; b1 = -250.6906; a2 = 49.4091; b2 = 146.8812; w = 0.005191; 
X =  a0 + a1*cos(x*w) + b1*sin(x*w) + 
               a2*cos(2*x*w) + b2*sin(2*x*w);