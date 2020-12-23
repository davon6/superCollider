
Server.default.options.outDevice_("Audient iD14");
s.options.memSize = 1048576;



s.boot;

b = Buffer.readChannel(s,"/Users/MisterGadou/Desktop/music/SAMPLES:PRESETS/noVS4.wav",channels:[0]);

b.play;



s.reboot;


//wtch for pattern [sig = VarSaw.ar(84.2)!2 ;]


//original

{ SinOsc.ar(200, 0, 0.5) }.play;

(
x = {

	arg gate = 0;
	var sig, env;
	env = EnvGen.kr(Env.adsr, gate);
	sig = VarSaw.ar(SinOsc.kr(16).range(500, 1000)) *env;

}.play;
)


x.set(\gate, 0);



(
x = {

	//arg gate = 0;
	var sig, env,src, sin;

sin = SinOsc.kr(10.3).range(329.63, 1318.51);

	env = EnvGen.ar(
		Env.new(
	[5274.04,2637.02,   2637.02, 10.3,   1318.51,   164.81,   659.25,   20.60,    10.3   ,  20.6,    10.3 , 659.25 ,    10.3  ],
	[4,         2        ,3.0976,   0.7744, 0.1936,  0.3872,    1.5488,   0.3872 , 0.3872,    0.3872 , 0.3872 ,0.3872,0.3872  ],
	[-2,          0,        -1,       2,       -1,       -1,       -2,        0.5,  0.5,           -0.5,       0.5  ,      -0.5     ,-0.5 ]
	)//.plot;

);




	//env = EnvGen.ar(Env.ar([],[],[],[]))


	//sig = VarSaw.ar(SinOsc.kr(env).range(329.63, 1318.51)!2) ;


//sig = VarSaw.ar(SinOsc.kr(16).range(500, 1000)!2) ;


	//src = VarSaw.ar(SinOsc.kr(16).range(500, 1000)!2) ;

	//src = VarSaw.ar(SinOsc.kr(env).range(500, 1000)!2) ;

	//src = VarSaw.ar(SinOsc.kr(env).range(329.63, 1318.51)!2) ;


//10.3

/*

	sig = GrainBuf.ar(
		1,
		//Impulse.ar(82.4)!2,
		//Impulse.ar(SinOsc.kr(env).range(500, 1000))!2,

		//Impulse.ar(SinOsc.kr(10.3).range(329.63, 1318.51))!2,

		Impulse.ar(SinOsc.kr(env).exprange(82.41, 1318.51)),

		//Impulse.ar(10.3)!2,

		// LFNoise1.kr(0.8!12).exprange(12.1, 12.3),
		1,
		b.bufnum,
		1,
		//30.midiratio,
		0.1,
		2,
		0.28,
		-1,
		1048576 ,
		1
	);
*/

src = SyncSaw.ar(SinOsc.kr(env).range(82.41, 1318.51)) ;

}.play;
)

