~mixa = Synth(\gate2, [\in, ~no1,\dur, 9999] ,~limitGrp4);

~mixa = Synth(\gate10, [\in, ~stereoPerch,\dur, 9999] ,~limitGrp4);


~mixa = Synth(\gate, [\in, ~delayToEq,\dur, 9999] ,~limitGrp4);

~mixa.stop


~mixa.set(\in,~percuStereo);




(

Ppar([~base, ~sequ ,
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)
]).play(t)


)


~delay.free


Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)