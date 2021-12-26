
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

	sig = sig * 28 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

