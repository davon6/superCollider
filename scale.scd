
(
s.options.memSize= 8192*20;
s.reboot;
)

(
SynthDef(\kiasmosPad, {arg freq = 440, out = 0, amp = 1, atk= 0.01, rel= 0.01, dur = 1;
    var carriers, modulators, mix, verb, filter, env, filterEnv;
    freq = freq + [0, Rand(1,4)];
    carriers = [SinOsc, Saw, Pulse].collect(_.ar(freq));
    modulators = carriers.collect {|c| SinOsc.kr(rrand(0.0322,1.0)*0.0647)};
    mix = Mix(carriers * modulators) * 0.15;
    verb = FreeVerb.ar(mix)/*+sig*/;

	filterEnv = EnvGen.kr(Env([3600, 220], dur, \exp), doneAction: Done.freeSelf);
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, dur - atk - rel, rel], [4,-4]));

	filter = LPF.ar(verb, filterEnv);
	Out.ar(out, filter * env * amp);
}).add;
)

(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.ionian,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)

(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.major,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)

(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.minor,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)
(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.dorian,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)
(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.chromatic,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)


(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.todi,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)
(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.hijaz,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play)