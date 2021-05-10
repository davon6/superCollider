(
Ppar([




	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),*/

	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,3200,\rH,1320, \ph,1.4,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

		Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*~bassShap,*/

//FOR BG
/*	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),
	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),


	/*Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1300,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,700,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,700,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),*/
	//

/*	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),*/

	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,/* Prand([ */Pseq([3/1],inf)/* , Pseq([2/1],2)],inf)*/,\group,~lfoGrp ,\frq,Pfunc({20.6.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),

		Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 99999, \group, ~lfoGrp),


		Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),


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


Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),


Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp,\frq,800),

	Pbind(\instrument,  \limiter10toMixer, \c49,1,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 20,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.048, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 ),


	//for day rise , do this one

	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374,
			\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })
	,
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,350,\crv,3.2),


	~kb,~hitX,/*~pedonk,~part3,*/


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
	Pbind(\instrument, \playBuf10NToMixer, /* \c22,1,\name,22,*/\out, ~halfAbso21,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~granuGrp),

	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~halfAbso21),

	Pbind(\instrument, \playBuf10NToMixer, /* \c22,1,\name,22,*/\out, ~halfAbso21,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster2,\group, ~granuGrp),


	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~halfAbso21),


	],inf),












	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],inf),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,~halfAbso22

	,  \group, ~gateGrp6,\tS, 0.39550810372374),






	Pbind(\instrument, \gateS, \dur, Pseq([128/1],inf), \in,Pseq([~halfAbso21,~halfAbso22],inf), \out,~absoFinalGate2, \group,~eqGrp2,\tS, 0.39550810372374),


Pbind(\instrument,\gateSD, \dur,Pseq([256/1],inf),\in,  Pseq([ ~absoFinalGate,~absoFinalGate3,~absoFinalGate2 ].scramble, inf)  ,\out ,0 ,\group, ~gateGrp7,\tS, 0.39550810372374,\out2, ~fusible10),


	],1).play(t)
)
s.record;
/*	s.latency=0.02;*/
s.record
s.meter
s.latency=t.beatDur

~leTout2.play



Pbind(\instrument,\rise,\dur,Pseq([256/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({5.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,0,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\fS,Pfunc({1.00.rand}),
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),



//may be the one
Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start, ~bufSnoopy.numFrames/256 * 240.rand,\buf,~bufSnoopy,\out, 0,\loopy,1).play(t)

~part3.play(t)
//PArt3
(

~part3=
Ppar([
Pseq([


		Pseq([

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,    Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1),\type,\rest  ),

	Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],5),\tS, 0.39550810372374  ),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10,\buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1),\type,\rest   ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second+  ~leTout2.numFrames/ 256 *2
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

			Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256 *3
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

				Pbind(\instrument, \gateS, \in,~toGate102,  \group, ~gateGrp6,\tS, 0.39550810372374,\out,~absoFinalGate3),\dur,Pseq([3.75/1],1) ],1),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),



	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,    Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),
//was here
	Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([5/4],1),\tS, 0.39550810372374  ),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second+  ~leTout2.numFrames/ 256 *2
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

			Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256 *3
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

				Pbind(\instrument, \gateS, \in,~toGate102,  \group, ~gateGrp6,\tS, 0.39550810372374,\out,~absoFinalGate3),\dur,Pseq([3.75/1],1) ],1),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

],2),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],64),\buf,~fkAr,\tS,  0.39550810372374,\start,612277.44552995,\out, ~limitBus1),
],inf),

Pbind(\instrument, \shiftEx, \dur, inf, \in,~limitBus1,\group ,~distoGrp0,\out,  ~eqPerch2),
		/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch2 , \out,~eqPerch2,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP2, \in, ~eqPerch2 , \out, ~revPerch2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf(~quickFix,\instrument, \reverbS,\dur,inf, \in,~revPerch2  , \out,~comPerch2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch2 ,\ctrl, ~kbus, \out,~limitPerch2, \group, ~compGrp),


		Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoPerch ,\spread,1  ,\center, 0, \out,~absoFinalGate3, \group, ~dispatchGrp2 ,\tS, 0.39550810372374),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)

],1))

Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)



~dispatchGrp2=Group.new;
~revGrp=Group.new
(
Ppar([
/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~revBus1, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.25/1],inf)),*/

	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],64),\buf,~fkAr,\tS,  0.39550810372374,\start,612277.44552995,\out, ~revBus1),

	Pbind(\instrument, \shiftEx, \in, ~revBus1,\group, ~revGrp,\dur ,inf),
	 Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0)
],1).play(t))


~leTout2.play


~leTout.play


