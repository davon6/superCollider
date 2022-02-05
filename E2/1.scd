SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[121.midicps*(432/440),97.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.7,0],
			[0,0,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.8 , 0.155,   0.155 ,  1,1,0],
			[ 0.008 , 0.001,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-6.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


above is now


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[121.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0175,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.760 , 0.155,   0.155 ,  1,1,0],
			[ 0.018 , 0.001,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-3.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


above is base

SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[105.midicps*(432/440),56.midicps*(432/440),45.midicps*(432/440),4.midicps*(432/440),0,0],
			[0.0215,t.beatDur/64,t.beatDur*0.9,0],
			[-11,-2,-7.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.4 , 0.015,   0.085 ,  0.5,0,0],
			[ 0.014 , 0.001,   t.beatDur*0.08   , t.beatDur*0.300 , t.beatDur*0.4  ],[-2.66,-5.5,-1.6,2.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


{EnvGen.ar(Env(
				[121.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0175,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
))}.plot(duration:0.2)


{EnvGen.ar(Env(
				[121.midicps*(432/440),97.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0030,0.0105,t.beatDur/64,t.beatDur*0.7,0],
			[0,0,-2,-2.4]
))}.plot(duration:0.2)


121-24