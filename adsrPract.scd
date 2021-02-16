Pinde


Pfun






(SynthDef(\bla,{

	|atk=0.02, dec=0.04, sub=0.05, rel=1.4|
	Out.ar(0,LFPulse.ar(216, mul: EnvGen.kr(Env([0,1,0.8,0.8,0],[atk,dec,sub,rel],[6,-4,-8,-9]),doneAction:2))!2)}).add;)


Synth(\bla)

Pbind(\instrument, \bla, \dur, Pseq([1/16],16)).play


(SynthDef(\bla2,{

	|atk=0.001, dec=0.04, sub=0.02, rel=4.4|
	/*Out.ar(0,LFPulse.ar(216, mul: EnvGen.kr(Env([0,1,0.8,0.8,0],[0.001,0.04,0.02,4.4],[6,-14,-8,-29]),doneAction:2))!2)*/
Out.ar(0,LFPulse.ar(216, mul: EnvGen.kr(Env([0,1,0.8,0.8,0],[atk,dec,sub,rel],[6,-14,-8,-29]),doneAction:2))!2)
}).add;)


Synth(\bla2)

Pbind(\instrument, \bla2, \dur, Pseq([1/1],16),\type,Pseq([\note,\rest],inf),\atk, 0.001, \dec, 0.04, \sub, 0.02,\rel, 4.4).play


atk, 0.001   0.01  0
dec   0.04    0.04
sub    0    0.8
rel    1.4 , 4.4,    0


Pseq([1/4],1)



//MONSTER ENV FOR PERCUSSIONS

({LFPulse.ar(216, mul: EnvGen.kr(Env([0,1,0.4,0.8,0],[0.02,0.02,0.05,1.4],[6,-4,-8,-9]),doneAction:2))!2}.play)