SynthDef(\no,{|dur|Out.ar(0,LPF.ar(BrownNoise.ar(EnvGen.kr(Env.step([0.06],[dur]),doneAction: 2)),ExpRand(200,2400)))}).add;



Ppar([
	Ppar([~kick,~bass],inf),
Pbind(\instrument, \no, \dur, Pseq([1/4],inf), \type,
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest
,\rest, \note,\rest,\rest,\rest, \note,\rest,\note,\rest,\rest,\rest,\note,\rest,\note,\rest
].scramble ,inf))


],inf).play(t)


//reverb, limiter , stereo



Ppar([
	Ppar([~kick,~bass],inf),
Pbind(\instrument, \no, \dur, Pseq([1/4],inf), \type,
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,\note,\rest,\rest,\note,\rest,\rest,\rest,\rest


].scramble ,inf))
],inf).play(t)


Ppar([
	Ppar([~kick,~bass],inf),
Pbind(\instrument, \no, \dur, Pseq([1/4],inf), \type,Pseq([
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,\note,\rest,\rest,\note,\rest,\rest,\rest,\rest].scramble,1),
		Pseq([\rest,\rest, \rest,\rest,\rest,\rest,\rest, \rest,\note,\rest,\rest,\note,\rest,\note,\note,\rest].scramble,1)],inf)


	)
],inf).play(t)
