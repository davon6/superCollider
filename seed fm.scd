// FM Exploration as shown in SRH DMI Class, Berlin

// Ramdom Seed parametrized FM perc. synths. HH ca. 2014 - 21
// 2 operators, 1 carrier.
(
SynthDef( \fmSanSimple, { arg seed = 123, amp=0.2, sustain=1;
	var carrier, op1, op2,out=0;

	RandID.ir(10);         // choose a specific RandID (read help:)
	RandSeed.ir(1, seed);  // the Rand Seed may be set from outside at creation time.

	// 2 operators, with efficient FSinOScand random freqs, phases, amps
	op1 = FSinOsc.kr(ExpRand(10, 800), Rand(-pi, pi),     Rand(-100, 400));
	op2 = FSinOsc.ar(ExpRand(1, 8000), {Rand(-pi, pi)}!2, ExpRand(0.2, 100));

	carrier = SinOsc.ar(
		ExpRand(0.2, 1000) // carrier freq
		+ op1 //  adding op1
		* op2 // scaled by op2
		,
		{ Rand(-pi, pi) }!2,
		amp
	);

	carrier = EnvGen.ar(Env.perc(ExpRand(0.01, 0.2), sustain), doneAction: 2)
	* carrier;
	Out.ar(out, CompanderD.ar(AllpassN.ar(carrier


		,0.2,SinOsc.kr(Lag.kr(MouseY.kr(0.2,5.15)),0,0.01,0.01)


	),0.001, 1, 0.05,0.01,0.8)*60);

}).add;
);

// different, reproducable sound with different seeds.
(instrument: \fmSanSimple, seed: 100.rand.postcln, amp: 0.125).play;
// pick favourite seeds
(instrument: \fmSanSimple, seed: 31.postcln, amp: 0.25).play;
(instrument: \fmSanSimple, seed: 55.postcln, amp: 0.25).play;
(instrument: \fmSanSimple, seed: 52.postcln, amp: 0.25).play;

(
// quick run through the first 100 of them:
Pdef(\fmExplorer,
	Pbind(
		\instrument, \fmSanSimple,
		\seed, Pseq((0 .. 100), 1).trace,
		\amp, 0.25,
		\dur, 0.5,
		\legato, Pbrown(0.1, 1.5, 0.1)
	)
).play;
)


(
// quick run through the first 100 of them:
   Pdef(\fmExplorer,
	Pbind(
		\instrument, \fmSanSimple,
		\seed, Pseq((65 .. 1000), 1).trace,
		\amp, 0.25,
		\dur, 5,
		\legato, Pbrown(0.1, 1.5, 0.1)
	)
).play;
)


(

Pdef(\fmExplorer,
	Pbind(
		\instrument, \fmSanSimple,
		\seed,70,
		\amp, 0.25,
		\dur, 1,
		\legato, Pbrown(0.1, 1.5, 0.1)
	)
).play;
)
