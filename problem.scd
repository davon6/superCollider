

~bu = Bus.audio(s,2);

~grp = Group.new;

SynthDef(\blo, {|out,dur|Out.ar(out,LFPulse.ar(mul: EnvGen.kr(Env([0,0.1,0.1,0],[0,0.1,0,0]),doneAction: 2))!2)}).add;

SynthDef(\blo, {|out,dur|Out.ar(out,LFPulse.ar(mul: 0.1)!2)}).add;

SynthDef(\bli, {|out,dur|Out.ar(out,LFPulse.ar(mul: EnvGen.kr(Env([0,0.1,0.1,0],[0,0.1,0,0]),doneAction: 2))!2)}).add;


Ppar([
Pbind(\instrument,\blo,\out, ~bu, \dur ,99999),

	Pseq([ Pbind(\instrument,\bli,\out, 0, \dur ,Pseq([1/1],12)),
		Pbind(\instrument,\dispatch2, \dur , Pseq([4/1 ],1) /*Pseq([4/1],1)*/,\in,~bu,\out,0, \group ,~grp)

	],inf)
],1).play(t)

240/ 151.703592


({EnvGen.kr(Env([0,1,1,0],[0,1,0,0]),doneAction:2)}.plot(duration:2))





Pbind(\instrument,\blo,\out, 0/*~bu*/, \dur ,Pseq([1/1],4)).play()