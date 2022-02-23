({EnvGen.kr(Env([1,0,1],[t.beatDur/4,0,0],[-5,0,0],0,3),Impulse.kr(9.65))}.plot(duration:t.beatDur))


SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5)| Out.kr(out,


	({EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: 1,doneAction: 2)}.plot(duration:t.beatDur))



)}).add;


t.beatDur


~hz1beat*8

~hz1beat*8




Prand([
/*	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,1800,\out,~busC8,\imp,0),*/
	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,400,\out,~busC8,\imp,/*Pfunc({*/9.65/*.rand})*/)],inf).play


({SinOsc.ar(100+ In.kr(~busC8))}.play)


({SinOsc.ar(100+

	EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: 1,doneAction: 2)


)}.play)



({SinOsc.ar(100+

	EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: t.beatDur,doneAction: 2)


)}.play)


	({EnvGen.kr(Env([400,0,400],[0.05,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: t.beatDur,doneAction: 2)}.plot(duration:t.beatDur))
