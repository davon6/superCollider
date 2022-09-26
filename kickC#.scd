SynthDef(\lfoSaw, {|out, val, dur, ph =0,gte=(-4)|Out.kr(0,

		Saw.ar(23.midicps,-1,-0.4).lincurve(-1,2,5,-3,gte))}).play;



({Pan2.ar(Saw.ar(29.midicps*(432/440),mul: 1,add: 0.4).lincurve(-1,1,-1,1,5).round(2**(-8)))}.play)



Pseq([Pbindf(~kick,\out,~kToPan/*~limitKick*/)],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[102.midicps*(432/440),49.midicps*(432/440),
				30.midicps*(432/440),6.midicps*(432/440)],
			[t.beatDur/8,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.6 ,   0.3 ,  0.91,0.5,0.5],
		[ t.beatDur*0.02,t.beatDur*0.05 ,   t.beatDur*0.3155   , t.beatDur*0.55 , t.beatDur*0.005  ],[-8,-3.66,-4,-8.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[102.midicps*(432/440),49.midicps*(432/440),
				30.midicps*(432/440),6.midicps*(432/440)],
			[t.beatDur/8,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.25 ,   0.13 ,  0.91,0.5,0.5],
		[ t.beatDur*0.05,t.beatDur*0.010 ,   t.beatDur*0.3155   , t.beatDur*0.55 , t.beatDur*0.005  ],[-8,-3.66,-4,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

/////////
below is good



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[102.midicps*(432/440),49.midicps*(432/440),
				30.midicps*(432/440),6.midicps*(432/440)],
			[t.beatDur/8,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.3, 0.25 ,   0.13 ,  0.91,0.1,0],
		[ t.beatDur*0.05,t.beatDur*0.070 ,   t.beatDur*0.8155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-3.66,-4,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;









SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[102.midicps*(432/440),49.midicps*(432/440),
				30.midicps*(432/440),6.midicps*(432/440)],
			[t.beatDur/8,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.58 ,   0.11 ,  1,0.1,0],
		[ t.beatDur*0.005,t.beatDur*0.070 ,   t.beatDur*0.8155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[0,-3.66,-4,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


++++++++++++++++++++++++++++++

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[109.midicps*(432/440),57.midicps*(432/440),
				33.midicps*(432/440),2.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-10,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.8, 0.68 ,   0.68 , 0.085 ,  1,0.1,0],
		[ t.beatDur*0.003, t.beatDur*0.002 ,t.beatDur*0.0085 ,   t.beatDur*0.8155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[0,-3.66,-23.6,-84,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

+++++++++++++++++++++++++++++++++++++++

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[109.midicps*(432/440),57.midicps*(432/440),
				33.midicps*(432/440),2.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-10,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.8, 0.68 ,   0.515 , 0.085 ,  1,0.1,0],
		[ t.beatDur*0.003, t.beatDur*0.02 ,t.beatDur*0.0085 ,   t.beatDur*0.8155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[0,-3.66,-13.6,-14,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

2em strong

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[109.midicps*(432/440),57.midicps*(432/440),
				45.midicps*(432/440),2.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-10,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.8, 0.68 ,   0.515 , 0.085 ,  1,0.1,0],
		[ t.beatDur*0.003, t.beatDur*0.02 ,t.beatDur*0.0085 ,   t.beatDur*0.8155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[0,-3.66,-13.6,-14,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


=======================================================
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[103.midicps*(432/440),51.midicps*(432/440),
				39.midicps*(432/440),8.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-10,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.8, 0.68 ,   0.185 ,  1,0.3,0],
		[ t.beatDur*0.003, t.beatDur*0.04 ,   t.beatDur*0.9155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[0,-5.66,-13.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

