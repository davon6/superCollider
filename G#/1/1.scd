
SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
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

	sig = sig * 28 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



pas mal
SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0245,t.beatDur/64,t.beatDur*0.9,0],
			[-11,-2,-7.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.4 , 0.015,   0.085 ,  0.5,0,0],
			[ 0.02 , 0.001,   t.beatDur*0.08   , t.beatDur*0.300 , t.beatDur*0.4  ],[-2.66,-5.5,-1.6,2.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 28 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0215,t.beatDur/64,t.beatDur*0.9,0],
			[-15,-2,-7.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.4 , 0.075,   0.085 ,  0.5,0,0],
			[ 0.02 , 0.001,   t.beatDur*0.08   , t.beatDur*0.300 , t.beatDur*0.4  ],[-2.66,-5.5,-1.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 20 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




c ca
SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0235,t.beatDur/64,t.beatDur*0.7,0],
			[-15,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.6 , 0.055,   0.085 ,  0.5,0,0],
			[ 0.008 , 0.001,   t.beatDur*0.08   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-5.5,-1.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 20 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0255,t.beatDur/64,t.beatDur*0.7,0],
			[-18,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.6 , 0.15,   0.085 ,  0.5,0,0],
			[ 0.005 , 0.01,   t.beatDur*0.16   , t.beatDur*0.200 , t.beatDur*0.02  ],[-1.66,-7.5,-4.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 28;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0245,t.beatDur/64,t.beatDur*0.7,0],
			[-18,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.7 , 0.055,   0.085 ,  0.5,0,0],
			[ 0.012 , 0.01,   t.beatDur*0.08   , t.beatDur*0.200 , t.beatDur*0.1  ],[-1.66,-5.5,-4.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 38 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

oui

SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0235,t.beatDur/64,t.beatDur*0.7,0],
			[-15,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.6 , 0.055,   0.085 ,  0.5,0,0],
			[ 0.008 , 0.001,   t.beatDur*0.08   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-5.5,-1.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0235,t.beatDur/64,t.beatDur*0.7,0],
			[-12,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.4 , 0.055,   0.055 ,  0.9,0,0],
			[ 0.008 , 0.001,   t.beatDur*0.18   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-5.5,-1.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


voui

	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0295,t.beatDur/64,t.beatDur*0.7,0],
			[-12,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.1 , 0.22,   0.22 ,  0.9,0,0],
			[ 0.008 , 0.012,   t.beatDur*0.18   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-3.5,-2.4,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0235,t.beatDur/64,t.beatDur*0.7,0],
			[-12,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.4 , 0.055,   0.055 ,  0.9,0,0],
			[ 0.008 , 0.002,   t.beatDur*0.18   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-3.5,-2.4,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),56.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0235,t.beatDur/64,t.beatDur*0.7,0],
			[-12,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.4 , 0.055,   0.055 ,  0.9,0,0],
			[ 0.008 , 0.001,   t.beatDur*0.18   , t.beatDur*0.200 , t.beatDur*0.1  ],[-4.66,-5.5,-1.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[121.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0135,t.beatDur/64,t.beatDur*0.7,0],
			[-12,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.920 , 0.055,   0.4 ,  1,0.14,0],
			[ 0.028 , 0.001,   0.01  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,4.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0105,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.920 , 0.355,   0.4 ,  1,0.14,0],
			[ 0.024 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[97.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0175,t.beatDur/32,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.980 , 0.155,   0.4 ,  1,0.14,0],
			[ 0.014 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;








OUI

	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.920 , 0.355,   0.4 ,  1,0.14,0],
			[ 0.024 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.980 , 0.355,   0.4 ,  1,0.14,0],
			[ 0.024 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 50 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.980 , 0.155,   0.4 ,  1,0.14,0],
			[ 0.024 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-4.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 10 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.360 , 0.155,   0.4 ,  1,0.14,0],
			[ 0.012 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-1.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 50 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

















SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.960 , 0.155,   0.4 ,  1,0.14,0],
			[ 0.012 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-3.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * amp.dbamp  ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.960 , 0.155,   0.4 ,  1,0.142,0],
			[ 0.012 , 0.005,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-3.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * amp.dbamp  ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-48,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.960 , 0.155,   0.4 ,  1,0.142,0],
			[ 0.012 , 0.005,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-3.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * amp.dbamp  ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;