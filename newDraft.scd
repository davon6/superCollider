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
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1;
	var car, mod2, env, iEnv, mod;
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
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);



	//mod = SinOsc.ar(freq2 * mRatio+ mod2, mul:/* freq2 **/ iEnv/*MouseX.kr(0,iEnv)*/);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);



	car = Saw.ar(freq/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi)) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 46.midicps, \rel, 1, \index, 20, \iScale, 0.10, \mRatio, 2.0]);
(
t = (Synth( \fm, [
	\dur, 100,
	\stretch, 3.5,
	\mRatio, 1,
	\cRatio, 1,//intersting less thab 10 ,1
	\index, 1,//40

	]))

)



(
SynthDef(\fm, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 3, cAtk = 4, cRel = (-4), pan = 0, freq3, index2=1, index3=1;
	var car, mod2, env, iEnv, mod;
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
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);



	//mod = SinOsc.ar(freq2 * mRatio+ mod2, mul:/* freq2 **/ iEnv/*MouseX.kr(0,iEnv)*/);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);



	car = Saw.ar(freq/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi)) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 46.midicps, \rel, 1, \index, 20, \iScale, 0.10, \mRatio, 2.0]);
(
t = (Synth( \fm, [
	\freq, Pseq([220], inf),
	\freq2, 100/*Pseq([100], inf)*/,
	\freq3, Pseq([30], inf),
	\dur, 100,
	\stretch, 3.5,
	\mRatio, 1,
	\cRatio, 1,//intersting less thab 10 ,1
	\index, 1,//40
	\iScale, 5,
	\amp, 0.2,
	\atk, 0.01,
	\rel, 3000,
	\cAtk, 4,
	\cRel, (80),
	\pan, 0,]))

)

t.free
(
Pbind(
	\instrument, \fm,
	\freq, Pseq([220], inf),
	\freq2, Pseq([100], inf),
	\freq3, Pseq([30], inf),
	\dur, 100,
	\stretch, 3.5,
	\mRatio, 1,
	\cRatio, 1,//intersting less thab 10 ,1
	\index, 1,//40
	\iScale, 5,
	\amp, 0.2,
	\atk, 0.01,
	\rel, 30,
	\cAtk, 4,
	\cRel, (80),
	\pan, 0,
).play;
)


(
SynthDef(\fm, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 3, cAtk = 4, cRel = (-4), pan = 0;
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

	mod = Saw.ar(freq2 * mRatio* LFTri.ar(20).range(0,100), mul: MouseX.kr(0,iEnv));
	car = SinOsc.ar(freq/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi)) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm, [\freq, 46.midicps, \rel, 1, \index, 20, \iScale, 0.10, \mRatio, 2.0]);

1048pi
(
Pbind(
	\instrument, \fm,
	\freq, Pseq([4pi], inf),
	\freq2, Pseq([100], inf),
	\dur, 100,
	\stretch, 3.5,
	\mRatio, 1,
	\cRatio, 1,//intersting less thab 10 ,1
	\index, 40,
	\iScale, 5,
	\amp, 0.2,
	\atk, 0.01,
	\rel, 30,
	\cAtk, 4,
	\cRel, (80),
	\pan, 0,
).play;
)
