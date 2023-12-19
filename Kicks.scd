SynthDef(\lfoSaw, {|out, val, dur, ph =0,gte=(-4)|Out.kr(0,

		Saw.ar(23.midicps,-1,-0.4).lincurve(-1,2,5,-3,gte))}).play;

({Pan2.ar(Saw.ar(29.midicps*(432/440),mul: 1,add: 0.4).lincurve(-1,1,-1,1,5).round(2**(-8)))}.play)



Pseq([Pbindf(~kick,\out,~kToPan,/*~limitKick*/\dur,0.5),],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0,\amp,1],~stereoGrp);

76.midicps*(432/440)

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00071, t.beatDur*0.0014,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.012,t.beatDur*0.22,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]
		)
);


	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00071, t.beatDur*0.0014,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.012,t.beatDur*0.12,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]
		)
);


	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00051, t.beatDur*0.0014,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.012,t.beatDur*0.12,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]
		)
);


	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),40.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00051, t.beatDur*0.0034,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.008,t.beatDur*0.08,t.beatDur*0.1,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,6,40,0]
		)
);

	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),40.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00051, t.beatDur*0.0014,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.008,t.beatDur*0.02,t.beatDur*0.02,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,6,40,0]
		)
);

	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.00051, t.beatDur*0.0014,t.beatDur*0.0041,t.beatDur*0.004,/*8*/t.beatDur*0.004,t.beatDur*0.12,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);
/*
	env =
EnvGen.kr(
		Env([0.30,0.9,0.12 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.008,ti*0.03,ti* 0.0005,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,4,50,9,-3,-1,0]),doneAction:2);*/
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: EnvGen.kr(Env.step([1,0],[t.beatDur*0.5,0]),doneAction: 2));

	sig = sig * 0.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0007, t.beatDur*0.0007,t.beatDur*0.0013,t.beatDur*0.004,/*8*/t.beatDur*0.004,t.beatDur*0.12,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.12 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.008,ti*0.03,ti* 0.0005,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;







SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0007, t.beatDur*0.0007,t.beatDur*0.0013,t.beatDur*0.004,/*8*/t.beatDur*0.004,t.beatDur*0.12,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-2 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.12 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.008,ti*0.03,ti* 0.0005,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.008,t.beatDur*0.004,/*8*/t.beatDur*0.011,t.beatDur*0.10,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.2 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.008,ti*0.01,ti* 0.0005,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,-4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.004,/*8*/t.beatDur*0.011,t.beatDur*0.15,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.2 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.008,ti*0.01,ti* 0.001,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,-4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.0028,/*8*/t.beatDur*0.018,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.1 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.01,ti*0.006,ti* 0.001,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,-4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.3 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.01,ti*0.022,ti* 0.001,ti* 0.06, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,-4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//HELL YEAH
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.30,0.9,0.3 ,0.9,0.9  ,0.6                 ,0.1],
		[ti*0.01,ti*0.03,ti* 0.02,ti* 0.04, ti*0.6,ti*0.1,


				ti*0.001],[-0.5,-4,50,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.2 ,0.9  ,0.45                 ,0.1],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.6,ti*0.1,


				ti*0.001],[1.5,-4,9,-3,-1,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.2 ,0.9  ,0.60                 ,0.1],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.08,ti*0.6,


				ti*0.001],[1.5,-4,-9,-3,50,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.9  ,0.60                 ,0.1],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.08,ti*0.6,


				ti*0.001],[1.5,0,-9,-3,50,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//AYERE
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.002,/*8*/t.beatDur*0.016,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.0002 ,ti*0.01,ti*0.6,


				ti*0.001],[1.5,0,-9,-2,-3,50,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//last good E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.0002 ,ti*0.01,ti*0.6,


				ti*0.001],[1.5,0,-9,-2,-3,50,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.003,t.beatDur*0.005,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,40,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.0002 ,ti*0.01,ti*0.6,


				ti*0.001],[-3,0,-9,-2,-3,50,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.004,t.beatDur*0.0027,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.0002 ,ti*0.01,ti*0.6,


				ti*0.001],[-3,0,-9,-2,-3,5,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0017, t.beatDur*0.0026,t.beatDur*0.002,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.10,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.04,ti* 0.01, ti*0.0002 ,ti*0.01,ti*0.6,


				ti*0.001],[-3,0,-9,-2,-3,5,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.002,t.beatDur*0.008,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.70,0.9,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.01,ti*0.03,ti* 0.01, ti*0.032 ,ti*0.01,ti*0.6,


				ti*0.001],[3,0,-9,-2,-3,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.7,0.4 ,0.4,0.9  ,0.90                 ,0.3],
		[ti*0.04, 0.01, ti*0.032 ,ti*0.01,ti*0.6,


				ti*0.001],[0,-9,-2,-3,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.7,0.4 ,0.4,0.9  ,0.90                 ,0.45],
		[ti*0.04, 0.01, ti*0.032 ,ti*0.01,ti*0.6,


				ti*0.001],[0,-9,-2,-3,-6,-5]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.2,0.9  ,0.90                 ,0.6],
		[ ti*0.05, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-3,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.01,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.9  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-3,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.15  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-3,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440),16.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.35,t.beatDur*0.6,t.beatDur*0.3],



			[0,0,0,0,0,-1,-4.8 ,2,0,0]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.60 ,0.80,0.35  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.004],[9,-2,-3,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.35,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.35  ,0.90                 ,0.4],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-3,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


??

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.4],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-3,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//i love it E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.062 ,ti*0.12,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: 1);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.1  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.12,ti*0.5,


				ti*0.001],[9,2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.0002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//last bien E

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0012, t.beatDur*0.0002,t.beatDur*0.003,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0006, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.5,t.beatDur*0.6],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//CLEAN E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0006, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.003,/*8*/t.beatDur*0.005,t.beatDur*0.03,t.beatDur*0.3,t.beatDur*0.01],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.4],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0006, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.006,/*8*/t.beatDur*0.01,t.beatDur*0.03,t.beatDur*0.3,t.beatDur*0.01],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.4],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0006, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.014,/*8*/t.beatDur*0.01,t.beatDur*0.03,t.beatDur*0.3,t.beatDur*0.01],



			[0,0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.05,ti*0.5,


				ti*0.001],[9,-2,-34,-6,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//was good but sub over present
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0006, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.014/*8*/,t.beatDur*0.03,t.beatDur*0.3,t.beatDur*0.01],



			[0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,-2,-34,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0003, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.014/*8*/,t.beatDur*0.03,t.beatDur*0.3,t.beatDur*0.01],



			[0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.22  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-34,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0003, t.beatDur*0.0013,t.beatDur*0.006,t.beatDur*0.014/*8*/,t.beatDur*0.03,t.beatDur*0.12,t.beatDur*0.01],



			[0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.22  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-34,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440), 105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0003, t.beatDur*0.0013,t.beatDur*0.003,t.beatDur*0.014/*8*/,t.beatDur*0.03,t.beatDur*0.18,t.beatDur*0.01],



			[0,0,0,0,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.22  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-34,-6,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0013,t.beatDur*0.003,t.beatDur*0.014,t.beatDur*0.009 /*8*/,t.beatDur*0.03,t.beatDur*0.18,t.beatDur*0.01],



			[0,0,0,-2,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[105.midicps*(432/440),94.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.0023,t.beatDur*0.003,t.beatDur*0.014,t.beatDur*0.009 /*8*/,t.beatDur*0.03,t.beatDur*0.18,t.beatDur*0.01],



			[0,0,0,-2,-1,-4.8 ,2,-4]/*[0,0,0,-2,-1,-4.8 ,2,-4]*/
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.002,t.beatDur*0.003,t.beatDur*0.014,t.beatDur*0.009 /*8*/,t.beatDur*0.03,t.beatDur*0.18,t.beatDur*0.01],



			[5.8,-4,-2,-2,-1,-4.8 ,2,-4]
		)
);

	env =
EnvGen.kr(
		Env([0.90 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.001],[9,0,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.002,t.beatDur*0.01,t.beatDur*0.01,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.18,t.beatDur*0.01],



			[5.8,-4,-2,-2,-1,-4.8 ,2,-4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.3  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.4,ti*0.1,


				ti*0.01],[9,-6,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.18,t.beatDur*0.1],



			[5.8,-4,-2,-2,-1,-4.8 ,2,-4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.042 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-6,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.9 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
//uqnd meme bien E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.18,t.beatDur*0.1],



			[5.8,-4,-2,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.005, ti*0.02 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 28.midicps*(432/440)
				],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.015 /*8*/,t.beatDur*0.04,t.beatDur*0.18,t.beatDur*0.1],



			[5.8,-4,-2,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.0025, ti*0.02 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 40.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.015 /*8*/,t.beatDur*0.04,t.beatDur*0.1,t.beatDur*0.1,t.beatDur*0.01],



			[5.8,-4,-2,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.0025, ti*0.02 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1.4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 40.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.015 /*8*/,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.2,t.beatDur*0.01],



			[5.8,-4,-2,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.0025, ti*0.02 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 2 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),82.midicps*(432/440), 76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 40.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.2,t.beatDur*0.2,t.beatDur*0.01],



			[5.8,-4,-2,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.80,0.4  ,0.90                 ,0.6],
		[ ti*0.0025, ti*0.02 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
//not bad E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 40.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.2,t.beatDur*0.2,t.beatDur*0.01],



			[5.8,-4,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.4  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440), 40.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.2,t.beatDur*0.2,t.beatDur*0.01],



			[5.8,-4,-2,-1,-4.8 ,-2,4]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.4  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.002,t.beatDur*0.005,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[5.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.4  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//i think this one

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.011,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.4  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.1  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.66,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
//E

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),106.midicps*(432/440),76.midicps*(432/440),64.midicps*(432/440), 52.midicps*(432/440),
				21.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.03  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.26,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//F#
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF, ti;

	ti = t.beatDur;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.03  ,0.90                 ,0.6],
		[ ti*0.0015, ti*0.01 ,ti*0.26,ti*0.1,


				ti*0.01],[9,-4,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.3  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.0001 ,t.beatDur*0.26,t.beatDur*0.1,


				t.beatDur*0.01],[9,0,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//important curve b

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.004,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.3  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.0001 ,t.beatDur*0.26,t.beatDur*0.1,


				t.beatDur*0.01],[9,0,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.6],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.3  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.004 ,t.beatDur*0.26,t.beatDur*0.4,


				t.beatDur*0.01],[-5,-8,-18,0,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.021,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0 ,0.60,0.3  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.04 ,t.beatDur*0.26,t.beatDur*0.2,


				t.beatDur*0.4],[-5,-8,-8,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				23.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.011,t.beatDur*0.005 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.4 ,0.90,0.4  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.04 ,t.beatDur*0.26,t.beatDur*0.6,


				t.beatDur*1.4],[-1,-2,-4,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.011,t.beatDur*0.02 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.4 ,0.90,0.4  ,0.90                 ,0],
		[ t.beatDur*0.02, t.beatDur*0.04 ,t.beatDur*0.26,t.beatDur*0.6,


				t.beatDur*1.4],[-1,-2,-4,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.011,t.beatDur*0.02 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.4 ,0.90,0.4  ,0.90                 ,0],
		[ t.beatDur*0.01, t.beatDur*0.03 ,t.beatDur*0.2,t.beatDur*0.6,


				t.beatDur*1.4],[-1,-2,-4,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.011,t.beatDur*0.02 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.90,0.4  ,0.90                 ,0],
		[ t.beatDur*0.03 ,t.beatDur*0.2,t.beatDur*0.6,


				t.beatDur*1.4],[-2,-4,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[131.midicps*(432/440),108.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0005,t.beatDur*0.011,t.beatDur*0.02 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.90,0.2  ,0.90                 ,0],
		[ t.beatDur*0.0166 ,t.beatDur*0.2,t.beatDur*0.6,


				t.beatDur*1.4],[-2,-1,0,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[132.midicps*(432/440),96.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.003,t.beatDur*0.01,t.beatDur*0.02 /*8*/,t.beatDur*0.02,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.90,0.2  ,0.90                 ,0],
		[ t.beatDur*0.0066 ,t.beatDur*0.12,t.beatDur*0.6,


				t.beatDur*1.4],[1,-5,3,1]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),96.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0034,t.beatDur*0.01,t.beatDur*0.02 /*8*/,t.beatDur*0.04,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.90,0.5  ,0.90                 ,0],
		[ t.beatDur*0.002 ,t.beatDur*0.04,t.beatDur*0.6,


				t.beatDur*1.4],2),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//completely flat
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),96.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440), 54.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0034,t.beatDur*0.01,t.beatDur*0.02 /*8*/,t.beatDur*0.04,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-4,-2,-1,-4.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.91,0],
		[ t.beatDur*0.6 , t.beatDur*1.4],2),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),96.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440), 43.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0038,t.beatDur*0.010,t.beatDur*0.04 /*8*/,t.beatDur*0.14,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-2,-2,-1,-2.8 ,0]
		)
);

	env =
EnvGen.kr(
		Env([0.91,0],
		[ t.beatDur*0.6 , t.beatDur*1.4],2),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),96.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440), 43.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0038,t.beatDur*0.010,t.beatDur*0.04 /*8*/,t.beatDur*0.14,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-2,-2,-1,-2.8 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[119.midicps*(432/440),96.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440), 43.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.0038,t.beatDur*0.010,t.beatDur*0.06 /*8*/,t.beatDur*0.08,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-2,-2,-1,-2.2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//F
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[118.midicps*(432/440),95.midicps*(432/440),65.midicps*(432/440),53.midicps*(432/440), 42.midicps*(432/440),
				29.midicps*(432/440)],


			[t.beatDur*0.0038,t.beatDur*0.010,t.beatDur*0.06 /*8*/,t.beatDur*0.08,t.beatDur*0.4,t.beatDur*0.1],



			[-2.8,-2,-2,-1,-2.2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

// E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),64.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.010,t.beatDur*0.06 /*8*/,t.beatDur*0.04,t.beatDur*0.4,t.beatDur*0.1],



			[-5.8,-2,-2,-1,-2.2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

\\last E
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),64.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0020,t.beatDur*0.015,t.beatDur*0.05 /*8*/,t.beatDur*0.08,t.beatDur*0.4,t.beatDur*0.1],



			[-6.8,-4,-2,0,-2.2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),64.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.010,t.beatDur*0.025,t.beatDur*0.04,t.beatDur*0.4,t.beatDur*0.6],



			[-5.8,-2,-2,-1,-2.2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),76.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.010,t.beatDur*0.025,t.beatDur*0.12,t.beatDur*0.4,t.beatDur*0.6],



			[-6.8,-2,-1,-3,0 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

\\last e
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),76.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.010,t.beatDur*0.025,t.beatDur*0.04,t.beatDur*0.25,t.beatDur*0.6],



			[-5.8,-2,-2,-2,-1.7 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps*(432/440),94.midicps*(432/440),76.midicps*(432/440),52.midicps*(432/440), 41.midicps*(432/440),
				28.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.010,t.beatDur*0.025,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-5.8,-2,-2,-2,-2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//lasg G
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				24.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.015,t.beatDur*0.05,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-6.2,-3,-2,-2,-2 ,-9]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//hard style
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),67.midicps*(432/440),55.midicps*(432/440), 31.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.005,t.beatDur*0.025,t.beatDur*0.4,t.beatDur*0.8,t.beatDur*0.6],



			[-6.2,-3,-2,-2,-2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//randomly sane
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),67.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.05,t.beatDur*0.025,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-6.2,-3,-2,-2,-2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




\\lastG

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.015,t.beatDur*0.025,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-6.2,-3,-2,-2,-2 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;







SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.01,t.beatDur*0.02,t.beatDur*0.05,t.beatDur*0.2,t.beatDur*0.6],



			[-6.2,-4,-3,-2,0 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.0044,t.beatDur*0.008,t.beatDur*0.002,t.beatDur*0.02,t.beatDur*0.2,t.beatDur*0.6],



			[-6.2,-4,-6,-3,-2,0 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0022,t.beatDur*0.001,t.beatDur*0.002,t.beatDur*0.02,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-5.5,-2,0,-3,-2,0 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0022,t.beatDur*0.001,t.beatDur*0.002,t.beatDur*0.02,t.beatDur*0.04,t.beatDur*0.2,t.beatDur*0.6],



			[-5.5,-2,0,-3,-2,0 ,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0022,t.beatDur*0.003,t.beatDur*0.004,t.beatDur*0.005,t.beatDur*0.08,t.beatDur*0.2,t.beatDur*0.6],



			[-3.5,-1,-2,0,-2,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.003,t.beatDur*0.004,t.beatDur*0.005,t.beatDur*0.08,t.beatDur*0.2,t.beatDur*0.6],



			[-3.5,-1,-2,0,-2,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0028,t.beatDur*0.003,t.beatDur*0.004,t.beatDur*0.005,t.beatDur*0.08,t.beatDur*0.2,t.beatDur*0.6],



			[-3.5,-1,-2,0,-2,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
//yes
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0018,t.beatDur*0.004,t.beatDur*0.004,t.beatDur*0.02,t.beatDur*0.08,t.beatDur*0.2,t.beatDur*0.6],



			[-1.5,0,2,0,-2,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//no
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0016,t.beatDur*0.004,t.beatDur*0.004,t.beatDur*0.02,t.beatDur*0.08,t.beatDur*0.4,t.beatDur*0.6],



			[-1.5,0,2,0,0,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.0018,t.beatDur*0.004,t.beatDur*0.004,t.beatDur*0.02,t.beatDur*0.05,t.beatDur*0.2,t.beatDur*0.6],



			[-1.5,0,2,0,0,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),68.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				24.midicps*(432/440)],


			[t.beatDur*0.003,t.beatDur*0.004,t.beatDur*0.007,t.beatDur*0.015,t.beatDur*0.00025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[-3.5,0,0,0,0,0,0 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//perfectProggyG
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[120.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),68.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				24.midicps*(432/440)],


			[t.beatDur*0.005,t.beatDur*0.008,t.beatDur*0.007,t.beatDur*0.015,t.beatDur*0.00025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[-3.5,0,0,0,0,0,0 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[108.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),68.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				24.midicps*(432/440)],


			[t.beatDur*0.0003,t.beatDur*0.008,t.beatDur*0.007,t.beatDur*0.015,t.beatDur*0.00025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[-3.5,0,0,0,0,0,0 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[108.midicps*(432/440),97.midicps*(432/440),85.midicps*(432/440),79.midicps*(432/440),68.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				24.midicps*(432/440)],


			[t.beatDur*0.007,t.beatDur*0.008,t.beatDur*0.007,t.beatDur*0.015,t.beatDur*0.00025,t.beatDur*0.0005,t.beatDur*0.3,t.beatDur*0.1],



			[-3,0,0,0,0,0,0 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



//kick G
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[109.midicps*(432/440),79.midicps*(432/440),68.midicps*(432/440),55.midicps*(432/440), 44.midicps*(432/440),
				31.midicps*(432/440)],


			[t.beatDur*0.01065,t.beatDur*0.015,t.beatDur*0.025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[-2,0,0,0,0 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//work on tiny
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[108.midicps*(432/440),79.midicps*(432/440),43.midicps*(432/440),54.midicps*(432/440), 42.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.012,t.beatDur*0.015,t.beatDur*0.025,t.beatDur*0.05,t.beatDur*0.5,t.beatDur*0.05],



			[-4,-2,0,-4,0 /*1*/,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//kick F#

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[108.midicps*(432/440),79.midicps*(432/440),67.midicps*(432/440),54.midicps*(432/440), 43.midicps*(432/440),
				30.midicps*(432/440)],


			[t.beatDur*0.016,t.beatDur*0.015,t.beatDur*0.025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[0,0,0,0,-5 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//kick F

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),78.midicps*(432/440),66.midicps*(432/440),53.midicps*(432/440), 42.midicps*(432/440),
				29.midicps*(432/440)],


			[t.beatDur*0.008,t.beatDur*0.015,t.beatDur*0.025,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[0,0,0,0,-5 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),78.midicps*(432/440),53.midicps*(432/440), 42.midicps*(432/440),
				29.midicps*(432/440)],


			[t.beatDur*0.008,t.beatDur/32,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[0,0,0,-5 /*1*/,1]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.6 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


({EnvGen.ar(
		Env(
			[107.midicps*(432/440),78.midicps*(432/440),42.midicps*(432/440), 53.midicps*(432/440),
				29.midicps*(432/440)],


			[t.beatDur*0.022,t.beatDur/32,t.beatDur*0.05,t.beatDur*0.3,t.beatDur*0.1],



			[0,0,0,-5 /*1*/,1]
		)
);}.plot(duration:0.1))


FFFFF
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440), 35.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/128,t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-1,0,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



below trop haut
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),54.midicps*(432/440), 30.midicps*(432/440),
				35.midicps*(432/440),11.midicps*(432/440)],


			[t.beatDur*0.01,t.beatDur*0.15,t.beatDur*0.55,t.beatDur*0.1,t.beatDur],



			[-10,0,-5 /*1*/,1,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.8 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),78.midicps*(432/440),54.midicps*(432/440), 42.midicps*(432/440),
				35.midicps*(432/440),23.midicps*(432/440)],


			[t.beatDur/128,t.beatDur/128,t.beatDur/8,t.beatDur/8,t.beatDur,t.beatDur],



			[-5,0,0,1,1,0]
		)
);

	env =
EnvGen.ar(
		Env.step([0.91,0],
		[ t.beatDur*0.8 ,0]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),78.midicps*(432/440),42.midicps*(432/440),
				35.midicps*(432/440),23.midicps*(432/440)],
			[t.beatDur/128,t.beatDur/128,t.beatDur/2,t.beatDur/8,t.beatDur],
			[-5,0,1,1,8]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//kick F

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440),
				35.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/128,t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur/2],
			[-1,0,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


//kick C

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[102.midicps*(432/440),61.midicps*(432/440),49.midicps*(432/440),
				30.midicps*(432/440),6.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/64,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-1,0,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 8 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;






-----



SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[107.midicps*(432/440),66.midicps*(432/440),54.midicps*(432/440),
				35.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/64,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-1,0,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;




=====

below is nice but weak
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[106.midicps*(432/440),53.midicps*(432/440),
				34.midicps*(432/440),10.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-1,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.91,  0.91 ,  0.91,0.91,0],
		[ t.beatDur*0.01,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 0.5 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[106.midicps*(432/440),65.midicps*(432/440),
				34.midicps*(432/440),10.midicps*(432/440)],
			[t.beatDur/128,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-1,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.13 ,   0.91 ,  0.4,0.1,0],
		[ t.beatDur*0.01,t.beatDur*0.070 ,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-3.66,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

below not bad


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[106.midicps*(432/440),53.midicps*(432/440),
				34.midicps*(432/440),10.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.13 ,   0.91 ,  0.4,0.1,0],
		[ t.beatDur*0.05,t.beatDur*0.170 ,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-3.66,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[106.midicps*(432/440),53.midicps*(432/440),
				34.midicps*(432/440),10.midicps*(432/440)],
			[t.beatDur/16,t.beatDur/4,t.beatDur/2,t.beatDur/2],
			[-12,-5,0,0]
		)
);

	env =
EnvGen.ar(
		Env([0.6, 0.13 ,   0.71 ,  0.4,0.1,0],
		[ t.beatDur*0.05,t.beatDur*0.170 ,   t.beatDur*0.6155   , t.beatDur*0.0055 , t.beatDur*0.005  ],[-8,-3.66,-1,5.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 4 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


=====

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
