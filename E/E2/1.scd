
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

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;

Pseq([Pbindf(~kick,\out,~kToPan/*~limitKick*/)],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);


SynthDef(\rise,






	Out.ar(0, car);).play




{ LeakDC.ar(Shaper.ar(~tfBuf, SinOsc.ar(Saw.ar(MouseY.kr(0.3,30),-1,0.2).range(100,500))))}.play



({Pan2.ar(Saw.ar(32.midicps*(432/440),mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7).round(2**(-8)))}.play)


({Pan2.ar(Saw.ar(0.3,mul: 1,add: -0.4).lincurve(-1,1,-1,1,7).round(2**(-8)))}.play) 