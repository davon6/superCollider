(
Ppar([




	/*Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),*/

/*	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,3200,\rH,1320, \ph,1.4,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*~bassShap,*/

//FOR BG
/*	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),
	/*Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	/*Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1300,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,700,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,700,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),*/
	//

/*	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),*/

/*	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,/* Prand([ */Pseq([3/1],inf)/* , Pseq([2/1],2)],inf)*/,\group,~lfoGrp ,\frq,Pfunc({20.6.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),*/

		/*Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 99999, \group, ~lfoGrp),*/


		/*Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),*/


	/*	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,0 ,\hS,1200,\modu, 0.001875*2 ,\ph,1.4),*/

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-15), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),






	/*Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareComp),

		Pbind(\instrument,\comp, \dur,inf,\thr,0.92 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.12,\ctrl,~snBus ,   \in, ~snareComp ,\out,~snareLimit,\group,~compGrp),

	/*Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),*/

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\out, ~toKbGate,\group, ~stereoGrp),*/








Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),


/*Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),*/





	//will need setup variables

	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374,
			\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })
	,
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,350,\crv,3.2),


	/*~kb,*/~hitX,/*~pedonk,~part3,*/


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toGate10, \start,

	Pseq([
			Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1) )],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	],inf)
	,\loopy,0,\tS,0.39550810372374,\dur,  Pseq([

			Pseq([ Pseq([4/1],1) ,Pseq([2/1],1) ],1) ,

Pseq([ Pseq([8/1],1)],1)  ,Pseq([ Pseq([4/1],1)],1)   ,Pseq([Pseq([16/1],1) ,Pseq([8/1],1)],1) ,Pseq([Pseq([32/1],1) ,Pseq([16/1],1)],1)

].scramble,inf)),


	Pseq([
	Pbind(\instrument, \playBuf10NToMixer, /* \c22,1,\name,22,*/\out, ~absoFinalGate3,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~granuGrp),

	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~absoFinalGate3),

	Pbind(\instrument, \playBuf10NToMixer, /* \c22,1,\name,22,*/\out, ~absoFinalGate3,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster2,\group, ~granuGrp),


	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~absoFinalGate3),


	],inf),








	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],inf),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,~absoFinalGate2

	,  \group, ~gateGrp6,\tS, 0.39550810372374),






/*	Pbind(\instrument, \gateS, \dur, Pseq([128/1],inf), \in,Pseq([/*~halfAbso21,*/~halfAbso22],inf), \out,~absoFinalGate2, \group,~eqGrp2,\tS, 0.39550810372374),*/


Pbind(\instrument,\gateSD, \dur,Pseq([64/1],inf),\in,  Pseq([ /*~absoFinalGate4,~absoFinalGate5,~absoFinalGate6,~absoFinalGate7,~absoFinalGate8~absoFinalGate,~absoFinalGate3,*/

		~absoFinalGate2



	].scramble, inf)  ,\out , ~toCom,\group, ~recGrp2,\tS, 0.39550810372374,\out2, ~fusible10),



	Pwrand([

		Pbind(\instrument,\gateS, \dur, Prand([Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],1),
			\in,    ,\out ,Pwrand([~toCom,~reverbSquelch],[16,1].normalizeSum,inf), \group, ~gateGrp7,\tS, 0.39550810372374),

		Pseq([
			Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),\in,  ,\out ,~delayBus2 ,\group, ~gateGrp7,\tS, 0.39550810372374),

			Pbind(\instrument,\gateS, \dur, Pseq([2/1],1),\tS, 0.39550810372374,\type,\rest)

			],1)

	],[16,1].normalizeSum,  inf),


	],1).play(t)
)


(
Ppar([

	Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),

	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , 0,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/8,639.255/8,619.255/8]
)],1).play(t)


)


//YES
		Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,1,\f1, 1 , \f2,2, \f3,0,  \ic_atk,-3,\index,5,\mRatio,5,\out ,~flanToDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),


