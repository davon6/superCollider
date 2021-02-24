//interval space of sidebands = frequency of modulator

//number of audible sidebands = index of modulation = amplitude of modulator

//modulator frequency + carrier frequency = ratio (e.g. 2:1 = 500hz:250hz), then we get harmonic content

//as integers increase for carrier ratio, we get more harmonic sidebands centered on the overtone series, and intervalic spacing stays the same

//non-integers (e.g. 2.1, 2.3, 2.5) for carrier ratio produce inharmonic content that sounds like a bell

//integers used for the modulator ratio, the carrier stays put but the spacing of the sidebands increases, so we get different combinations of specific overtones

//non-integers for modulator ratio produce inharmonic content

//index = modAmp/modHz, loosely corresponds to number of audible sideband pairs in the spectrum



(
SynthDef(\fm, {
	arg freq = 500, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 3, cAtk = 4, cRel = (-4), pan = 0;
	var car, mod, env, iEnv;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod = SinOsc.ar(freq * mRatio, mul: MouseX.kr(0,500)/*iEnv*/);
	car = SinOsc.ar(freq+ LFNoise0.kr(10.3).range(-40,1200) * cRatio, mod.wrap(0, 4pi)) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 46.midicps, \rel, 1, \index, 20, \iScale, 0.10, \mRatio, 2.0]);


(
Pbind(
	\instrument, \fm,
	\freq, Pseq([73.42], inf),
	\dur, 1/8,
	\stretch, 3.5,
	\mRatio, 1,
	\cRatio, 1,
	\index, 1,
	\iScale, 5,
	\amp, 0.2,
	\atk, 0.01,
	\rel, 3,
	\cAtk, 4,
	\cRel, (-4),
	\pan, 0,
).play;
)