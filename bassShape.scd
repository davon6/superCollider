
(s.waitForBoot({

t = TempoClock.new(151.703592/60).permanent_(true);
~bassShapB = Bus.audio(s,2);

	s.sync;

SynthDef(\bass,{
		arg freq=41.2, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0;

		var sig, env;

		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel],
				[atkcrv,relcrv]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);
		sig = BLowPass.ar(sig, lpf);

		sig = sig * amp.dbamp!2;

		sig = sig * env;

		Out.ar(out, sig);
	}).add;


SynthDef(\shap,{|in, out=0|
	var sig, halfBeat, env;

	halfBeat = t.beatDur * 0.5;

		env = EnvGen.kr(Env([0,81.41,81.41],[halfBeat,halfBeat,0],9),doneAction:2);

	sig = LPF.ar(In.ar(in, 2), env);

	Out.ar(out, sig);
}).add;

s.sync;
~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),\lpf,81.41,
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
	\amp, (6),\out,0
);

~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],1));

s.sync;

~bassPr = Ppar([ Pbindf(~bass, \out, ~bassShapB), Pbindf(~bassShap, \in, ~bassShapB)],7).play(t);


});)

//bass wihtout shaping

~bass.play(t)

