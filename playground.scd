(
o = {Out.kr(~bus1, SinOsc.ar(1.2875).range(5274.04,81.41))  ;
	Out.kr(~bus2, SinOsc.ar(5.15).range(164.81,81.41));
	Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));
	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0,2.575)  ).range(10.3,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3
	Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );

	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	 Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));
	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
 Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));



 }.play;









)