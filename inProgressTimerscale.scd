///bpm
t = TempoClock.new(151.703592/60).permanent_(true);

//to pass the infinite signal
~bu = Bus.audio(s,2);


~grp = Group.new;

(
SynthDef(\dispatch2,{|in, out, dur|Out.ar(out, In.ar(in,2)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

SynthDef(\blo, {|out,dur|Out.ar(out,LFPulse.ar(mul: 0.1)!2)}).add;

SynthDef(\bli, {|out,dur|Out.ar(out,LFPulse.ar(mul: EnvGen.kr(Env([0,0.1,0.1,0],[0,0.1,0,0]),doneAction: 2))!2)}).add;
)



SynthDef(\dispatch2, {
	|in, out, sustainTime|
	Out.ar(
		out,
		In.ar(in,2)
		* EnvGen.kr(Env([0,1,1,0],[0,1,0,0]), timeScale: sustainTime, doneAction:2)
	)
}).add;

Pbind(
	\instrument, \dispatch2,
	\dur, Pseq([4/1], 1),
	\sustainTime, { ~sustain.value / t },
	\in, ~bu,
	\out, 0,
	\group, ~grp
)





(
Ppar([
Pbind(\instrument,\blo,\out, ~bu, \dur ,99999),

	Pseq([ Pbind(\instrument,\bli,\out, 0, \dur ,Pseq([1/1],12)),
		Pbind(
	\instrument, \dispatch2,
	\dur, Pseq([4/1], 1),
	\sustainTime, { ~sustain.value / t },
	\in, ~bu,
	\out, 0,
	\group, ~grp
)

	],inf)
],1).play(t)
)

(
Ppar([
Pbind(\instrument,\blo,\out, ~bu, \dur ,99999),

	Pseq([ Pbind(\instrument,\bli,\out, 0, \dur ,Pseq([1/1],12)),
		Pbind(\instrument,\dispatch2, \dur , Pseq([4/1 ],1) ,\in,~bu,\out,0, \group ,~grp)

	],inf)
],1).play(t)
)