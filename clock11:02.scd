SynthDef(\clock, {
	var setTime, tempo, time, sig, rateMax;


	setTime = \setTime.tr(0);
	tempo = \tempo.kr(1);
	rateMax = 1.05 * tempo;

	time = Phasor.ar(
		setTime,
		SampleDur.ir * tempo,
		0,
		inf,
		setTime
	).poll;

	time = Slew.ar(
		time,
		up:rateMax, dn:rateMax
	);

	sig = SinOsc.ar(0, time.mod(2pi));
	//sig = IEnvGen.ar(Env.adsr, time * 3)

	Out.ar(\out.kr, sig);
}).add;

Pdef(\lfoSync, Pmono(
	\clock,
	\out, ~someBus,
	\dur, 1,
	\tempo, 1,
	\setTime, Ptime() * Pfunc({ ~tempo })
));











desync = 0.4 * Trig.ar(Dust.ar(0.1), 10).lag(4);
lfo = SinOsc.ar(0, (time + desync).mod(2pi))