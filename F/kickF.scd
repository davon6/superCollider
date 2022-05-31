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
				[105.midicps*(432/440),53.midicps*(432/440),
				41.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur*0.695],
			[-3,0,0,0]
		)
);

	env =

EnvGen.ar(
		Env([ 1 ,   0.03075 ,  1,1,0],
		[ t.beatDur*0.06 ,   t.beatDur*0.0655   , t.beatDur*0.255 , t.beatDur*0.1  ],[-1.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 14 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;



------
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[105.midicps*(432/440),53.midicps*(432/440),
				41.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur*0.695],
			[-3,0,0,0]
		)
);

	env =

EnvGen.ar(
		Env([ 1 ,   0.03075 ,  1.15,1.15,0],
		[ t.beatDur*0.06 ,   t.beatDur*0.0655   , t.beatDur*0.255 , t.beatDur*0.1  ],[-1.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

//perfect
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[105.midicps*(432/440),53.midicps*(432/440),
				41.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur*0.695],
			[-3,0,0,0]
		)
);

	env =

EnvGen.ar(
		Env([ 2 ,   0.0615 ,  2.3,2.3,0],
		[ t.beatDur*0.085 ,   t.beatDur*0.1255   , t.beatDur*0.255 , t.beatDur*0.1  ],[-1.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

-------try less ----
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[105.midicps*(432/440),53.midicps*(432/440),
				41.midicps*(432/440),11.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/8,t.beatDur/2,t.beatDur*0.695],
			[0,0,0,0]
		)
);

	env =

EnvGen.ar(
		Env([ 2 ,   0.0615 ,  2.3,2.3,0],
		[ t.beatDur*0.085 ,   t.beatDur*0.1255   , t.beatDur*0.255 , t.beatDur*0.1  ],[-1.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 24 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


({EnvGen.ar(
		Env([ 2 ,   0.0615 ,  2.3,2.3,0],
		[ t.beatDur*0.185 ,   t.beatDur*0.1255   , t.beatDur*0.255 , t.beatDur*0.1  ],[-1.66,-4.6,-1.2,8]),doneAction:2)}.plot(duration:t.beatDur))


////last one below


({Saw.ar(23.midicps*(432/440),1,-0.4)!2*0.3}.play)

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[107.midicps*(432/440),55.midicps*(432/440),
				43.midicps*(432/440),13.midicps*(432/440)],
			[t.beatDur/64,t.beatDur/8,t.beatDur/4,t.beatDur*0.695],
			[0,0,0,0]
		)
);

	env =

EnvGen.ar(
		Env([ 2 ,   0.0615 ,  2.3,2.3,0],
			[ 0.016 ,   0.01  , t.beatDur*0.255 , t.beatDur*0.4  ],[1.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 24 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
({EnvGen.ar(
		Env([ 0.9 ,   0.315 ,  1,1,0],
			[ 0.016 ,   0.06  , t.beatDur*0.255 , t.beatDur*0.6  ],[-3.66,-4.6,-1.2,8]),doneAction:2)}.plot(duration:t.beatDur))




// too much 100z

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[118.midicps*(432/440),94.midicps*(432/440),77.midicps*(432/440),58.midicps*(432/440),54.midicps*(432/440),6.midicps*(432/440),6.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.005,t.beatDur*0.695,0],
			[0,0,-2,-2,-2.4]
		)
);

	env =

EnvGen.ar(
		Env([ 0.9 ,   0.315 ,  1,1,0],
			[ 0.016 ,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-3.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 24 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;
not bad
SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[118.midicps*(432/440),94.midicps*(432/440),77.midicps*(432/440),58.midicps*(432/440),54.midicps*(432/440),6.midicps*(432/440),6.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.005,t.beatDur*0.695,0],
			[0,0,-2,-2,-2.4]
		)
);

	env =

EnvGen.ar(
		Env([ 0.8 ,   0.215 ,  1,1,0],
			[ 0.016 ,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-6.66,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

------------

Pseq([Pbindf(~kick,\out,~kToPan/*~limitKick*/)],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);


was

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[106.midicps*(432/440),94.midicps*(432/440),65.midicps*(432/440),46.midicps*(432/440),6.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.7,0],
			[0,0,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.8 , 0.155,   0.155 ,  1,1,0],
			[ 0.016 , 0.001,   0.06  , t.beatDur*0.255 , t.beatDur*0.3  ],[-6.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 6 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


Pseq([Pbindf(~kick,\out,~kToPan/*~limitKick*/)],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);


({EnvGen.ar(
		Env(
				[106.midicps*(432/440),94.midicps*(432/440),65.midicps*(432/440),46.midicps*(432/440),6.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.7,0],
			[0,0,-2,-2.4]
		)
)}.plot(duration:0.3))



({EnvGen.ar(
		Env(
				[118.midicps*(432/440),94.midicps*(432/440),77.midicps*(432/440),58.midicps*(432/440),54.midicps*(432/440),6.midicps*(432/440),6.midicps*(432/440),0,0],
			[0.001,0.0025,t.beatDur/64,t.beatDur*0.005,t.beatDur*0.695,0],
			[0,0,-2,-2,-2.4]
		)
)}.plot(duration:0.2))