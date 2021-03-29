
~revGrp = Group.new;

SynthDef(\blo, {|out=0|Out.ar(out, LFPulse.ar(216, mul: EnvGen.kr(Env.perc(releaseTime: 0.3),doneAction: 2)))}).add;



Ppar([
	Pbind(\instrument, \blo, \out,~delayBus/*~revDelay*/,\dur, Pseq([4/1],inf)),

	Pbind(\instrument, \pingDSX, \in, ~delayBus ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,0,\group, ~revGrp,

		\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1))

],1).play(t)




s.plotTree


~delayBus


delayTime, feedback,



~delay.free


\pingDSX