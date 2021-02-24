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

Pdef(\ttt4,
Pbind(\instrument, \lead, \dur, Pseq([1/4], 14)

		//,\type,Pseq([\note,\note,\note*2],inf)

		//,\decE, 0.01

		,\freq,



		Pseq([exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
		exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
			exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
			exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100)
		],inf)



		,
	\amp,0.22,

	//,\which,4,\whichMod,2,\wCar,exprand(0,1),\whichEnv,0

	\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,\wCar,Pseq([exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1)],inf)
));


Pdef(\ttt6,
Pbind(\instrument, \lead, \dur, Pseq([1/2], 1)

		//,\type,Pseq([\note,\note,\note*2],inf)

		,\decE, 0.4

		,\freq,



		Pseq([exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
		exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
			exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100),
			exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(100,5100),exprand(200,5100),exprand(200,5100)
		],inf)



		,
	\amp,0.22,

	//,\which,4,\whichMod,2,\wCar,exprand(0,1),\whichEnv,0

	\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,\wCar,Pseq([exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),
			exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1),exprand(0,1)],inf)
));


Pseq([Pdef(\ttt4),Pdef(\ttt6)],inf).play(t);




Pdef(\ttt,

Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592,
\decE,1,
\bus, ~bus5,
		\bus4,24,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
		\amp,0.0022
));








)