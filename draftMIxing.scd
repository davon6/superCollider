~mixa = Synth(\gate2, [\in,  ~toKbGate,\dur, 9999] ,~eqGrp3);

~mixa = Synth(\gateS, [\in, ~absoFinalGate3/*~no1*//*~comSnaGrpBus2*/,\dur, 9999] ,~limitGrp4);


~mixa = Synth(\gate, [\in, ~distoPercu,\dur, 9999] ,~limitGrp4);

~mixa.stop

~absoFinalGate3
~mixa.set(\in,~comSnaGrpBus2/*~percuCom2*/);

~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)

~kb.stop

(Ppar([

		/*Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1720, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),
],1).play(t))




Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass3,\buf,~bufSnoopy,\out, 0,\loopy,0).play(t)

~pass1=
Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass4,\buf,~bufSnoopy,\out, 0,\loopy,0).play(t)



~pass1 =(~buf.numFrames.rrand(400000)- 400000);~pass2=(~buf.numFrames.rrand(400000)- 400000);~pass3=(~buf.numFrames.rrand(400000)- 400000);~pass4=(~buf.numFrames.rrand(400000)- 400000);
(

Ppar([~base, /*~kb, *//*~hitX*//*~kb,*/      ~fx  ,  ~no4,~sequ,~mainLead ,


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)
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

