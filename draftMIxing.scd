~mixa = Synth(\gate2, [\in,  ~perchLimiToG,\dur, 9999] ,~limitGrp4);

~mixa = Synth(\gateS, [\in, ~absoFinalGate,\dur, 9999] ,~limitGrp4);


~mixa = Synth(\gate, [\in, ~distoPercu,\dur, 9999] ,~limitGrp4);

~mixa.stop


~mixa.set(\in,~perchLimiToG8);




(

Ppar([~base, /*~kb, */ /*~hitX,*//*~kb,*/ /* ~passant, ~fx,     *//*~no4*//*~sequ*/~percheur/*~mainLead*/,

	/*Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.7744,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,0, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\da1,0,\out,0),*/
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)
]).play(t)


)


~delay.free


Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)





Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,0, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\da1,0,\out,0).play(t)

Pbindf(~snare ,\dur, Pseq([1/2], 128))
Pbindf(~snare ,\da1,0,\type, Pseq([\rest ,\rest,\note,\rest], 32),\out,0).play(t)
Pbindf(~snare ,\da1,0,\rel2, 0.7744,\dur, Pseq([1/2], 128)).play(t)

Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.7744,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,0, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\da1,0,\out,0),
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)

