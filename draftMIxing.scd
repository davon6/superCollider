~mixa = Synth(\gate2, [\in,  ,\dur, 9999] ,~eqGrp3);

~mixa = Synth(\gateS, [\in,/*~no1*//*~toKbGate*//*~toFilRise*/~toCom/*~toExtraFx*//*~absoFinalGate2*//*~toGate102*//*~comSnaGrpBus2*/,\dur, 9999] ,~recGrp3);


~mixa = Synth(\gate, [\in, ~distoPercu,\dur, 9999] ,~limitGrp4);

~mixa.free
~leTout.play
~absoFinalGate3
~mixa.set(\in,~no3/*~tofinalRythm*//*~absoFinalGate7*//*~percuCom2*/);

// ~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)


~kb=Pbind(\instrument, \playBufS, \start,0 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb1,\loopy,0).play(t,quant:1)
~kb.stop

~justHit.play(t)
~breakPart1.play(t)
~kb1.plot
~boost.play(t,quant:1)
Ppar([~boost,~breakPart1],1).play(t)
Ppar([~boost,~kb/*,~justHit*/],1).play(t)
(~boost=Ppar([

		Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus2 ,\dur,Pseq([64/1],inf),\ph,0, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),

	//pasrt3d
	Pbind(\instrument, \lfo13,\val,(~hzQbeat/16),\out,~bus24 ,\dur,999,\ph,0, \rL,4000,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),
/*	Pbind(\instrument, \lfo13T,  \val, 0.1609375, \ph, 2.9,  \out,~bus32, \dur,Pseq([32/1],1),\rL,650,\rH,4600,\tS, 0.39550810372374),*/


	Pbind(\instrument, \lfo13T,  \val, 0.1609375, \ph, 2.9,  \out,~bus32, \dur,Pseq([32/1],inf),\rL,150,\rH,1600,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,1500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),

	//maybe glitchy
	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,-0.4,\rH,0.4, \group, ~lfoGrp,\tS, 0.39550810372374),*/
//


	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1720, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

		/*Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,1.4, \rL,500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	// Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-5.2),\out,~kbus),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
		/*Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),
],1)/*.play(t)*/)*/
	/*Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~k2,\out, ~kbus,\loopy,0,\start,0),*/



	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),

],1))


Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass3,\buf,~bufSnoopy,\out, 0,\loopy,0).play(t)

~pass1=
Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass4,\buf,~bufSnoopy,\out, 0,\loopy,0).play(t)


(

Ppar([~base,  ~no4,~sequ,~mainLead,/*~boost*/


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


~kb2.play
~snare.play


//killer env

Ppar([

	Pseq([


				Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([56/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
				],inf),
/*	Pseq([



		~part3a,
		~part3e,


	].scramble,inf),*/

Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],inf),\buf,~pad,\tS,  0.39550810372374,\start,
			Pfunc({~start}) ,\out, ~shiftPlay2),

		Pbind(\instrument,\shiftExG, \in,~shiftPlay2,\out,  ~shiftDisto2 ,\group, ~filterGrp,\dur, Pseq([32/1],inf),
				\triMod,Pseq([0.08046875,0.08046875/4],inf),\tS, 0.3955081037237,\hS,Pseq([400,800],inf)),



	Pseq([


					Pbind(\instrument,\gate,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\vlSub,1,\vlSub2,Pkey(\vlSub)),

Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),

	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),

	Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),
				Ppar([

					Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([32/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),

Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom)

				],1)

			],inf)

],1).play(t,quant:1)



//killer env

Ppar([



	// Pseq([~part3a,~part3e,].scramble,inf),


			Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,(~fkAr.numFrames.rrand(80000)-80000).postln),
//293102


		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~toExtraFx,\tS, 0.39550810372374,\group, ~gateGrp11),

		],inf),





],1).play(t)


// Synth(\gateS, [\in,~toExtraFx,\dur, 9999] ,~recGrp3);



//killer env

Ppar([


/*
	Pseq([~part3a,~part3e,].scramble,inf),*/



Ppar([

		Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
			Pfunc({~start}) ,\out, ~shiftPlay,\vl,0.01),
Pseq([
			Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),

Pseq([
					Pbind(\instrument, \gateS,\dur, Pseq([1/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),

					Pbind(\instrument, \gateS,\dur, Pseq([15/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),
				],7),


					Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~toExtraFx,\out,~toCom),

						],1),

			/*Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],42),\type,Prand([\rest,\note,\rest],inf), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1),*/

			/*Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no1b,\out,~toCom)*/

		],inf),





],1).play(t)