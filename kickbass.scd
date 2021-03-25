(
s.waitForBoot({

t = TempoClock.new(150/60).permanent_(true);


SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[1700,1319,165,26,0,0],
				[0.001,0.028,0.1,0,0.4],
				\exp
			)
		);

		env = EnvGen.ar(
		Env.perc(0.0121, 0.40),doneAction:2);


		sig =
		BPeakEQ.ar(
			SinOsc.ar(envF, mul: env)
			,659.255,6, (-32));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;


	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus, dur,cho=0;

		var sig, env, lvlBa;

		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel-cho],
				[atkcrv,relcrv]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);


		sig =   BPeakEQ.ar(
			BPeakEQ.ar(

			LPF.ar(LPF.ar(LPF.ar(LPF.ar(sig, lpf - In.ar(bus, 1)),lpf - In.ar(bus, 1)),lpf - In.ar(bus, 1)),lpf - In.ar(bus, 1)).round(2**(-16));

			,659.255,12, (4))
			,164.81375,12, (12));

	//sig = LPF.ar(LPF.ar LPF.ar(LPF.ar(sig, lpf - In.ar(bus, 1)).round(2**(-16)

		sig = sig * amp.dbamp;

		sig = sig * env;

		Out.ar(out, Pan2.ar(sig));
	}).add;


s.sync;

~bass = Pbindef(\bass,
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),

		\cho, Pseq([0,0.004,0.008,0],inf),
		\dur, Pseq([1/4],4),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.82,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, (-8),\out,0/*~again*//*~dipatchKB*///-10   -17
	);


~kick =	Pbindef(\ki, \instrument, \kick,\dur, Pseq([1/1],1),\amp,(-4),\out,0);
	s.sync;

	Ppar([~kick, ~bass],inf).play(t)

	});

)

FreqScopeView.new
