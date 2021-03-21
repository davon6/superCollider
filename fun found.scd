(
SynthDef(\subh2,{
	arg freq = 440, div = 4;
	var osc, sub, env;
	osc = Saw.ar(freq);
	p = PulseDivider.ar(osc, div);
	a = 0.5 * freq/(div * s.sampleRate);
	sub = LeakDC.ar(Phasor.ar(p, 1, 0, inf, 0) * a);
	env = EnvGen.ar(Env.perc(0.001,8), doneAction:2);
	Out.ar(0, Splay.ar(osc + sub * env));
}).add;
)

(
Pbind(
	\instrument, \subh2,
	\degree, Pseq([0,5,9,[0,12]], inf),
	\dur, 2,
	\div, Pseq([[2,4,8],[3,6,9],[4,8,16]],inf),
	\strum,0.2
).play;
)


VOsc