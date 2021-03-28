
~revGrp = Group.new;

SynthDef(\blo, {|out=0|Out.ar(out, LFPulse.ar(216, mul: EnvGen.kr(Env.perc(releaseTime: 0.3),doneAction: 2)))}).add;



Ppar([
	Pbind(\instrument, \blo, \out,~delayBus/*~revDelay*/,\dur, Pseq([4/1],inf)),

Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \dur, inf/*Pseq([4/1],inf)*/,\out,0,\group, ~revGrp,\delayTime,0.04,\feedback,1)

],1).play(t)
~delayBus


delayTime, feedback,



~delay.free


\pingDSX