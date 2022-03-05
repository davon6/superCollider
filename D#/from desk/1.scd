	SynthDef(\lfoSaw, {|out, val, dur, ph =0,gte=(-4)|Out.kr(0,

		Saw.ar(23.midicps,-1,-0.4).lincurve(-1,2,5,-3,gte))}).play;



({Saw.ar(23.midicps*(432/440),-1,-0.4).lincurve(-1,2,5,-3,-4)!2}.play)


({Saw.ar(27.midicps*(432/440),-0.8,-0.4).lincurve(-1,2,5,-3,-4)!2*0.3}.play)


({Saw.ar(23.midicps*(432/440),1,-0.4)!2*0.3}.play)

SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[108.midicps*(432/440),96.midicps*(432/440),67.midicps*(432/440),48.midicps*(432/440),8.midicps*(432/440),0,0],
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

	sig = sig * 1 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;


Pseq([Pbindf(~kick,\out,~kToPan/*~limitKick*/)],inf).play(t);

	~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);

