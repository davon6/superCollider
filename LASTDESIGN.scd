







(Ppar([


		Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),


Pbind(\instrument,\playBufXG,\dur,Pseq([ /*Pseq([1/6],3) , */ /*Pseq([1/5],10)*/ Pseq([1/4],9)  ,   Pseq([1/2],2), Pseq([1.25/1], 1 )  ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,0,\impulse,0.003,\start, Pseq( [  Pseq([(~buf.numFrames.rrand(140000)-14000)],6),
	Pseq( [(~buf.numFrames.rrand(140000)-14000)],6),Pseq( [(~buf.numFrames.rrand(140000)-14000)],6)],inf),

/*\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf),*/

	\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0)],1).play(t))






Pbind( \instrument, \playBufX, \impulse, 1.2875,
	\dur,9999, \tS,  0.39550810372374,\start, ( ~leTout.numFrames.rrand(320000)- 320000).postln,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, 0,\loopy,1).play(t)

~main1=2187338.9056896;
~main2= 2743281.259411
~main3= 3337490.9911084/*3650339.94395;*/

(Ppar([


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),


Pbind(\instrument,\playBufXG,\dur,Pseq([ /*Pseq([1/6],3) , */ /*Pseq([1/5],10)*/


		Pwrand([  Pseq([1/4],9),  Pseq([Pseq([1/4],5), Pseq([1/8],8)].scramble,1)],[4,1].normalizeSum,1),

		Pseq([1/2],2), Pseq([1.25/1], 1 )

	].scramble,inf)

	,\amp, 1,\buf,~bufSnoopy,\out,0,\impulse,0.003,\start,
	Pseq( [  Pseq([~main1],6),
	Pseq( [~main2],6),Pseq( [~main3],6)].scramble,inf),

/*\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf),*/

	\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0)],1).play(t))



(Ppar([


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),


	Pbind(\instrument,\playBufXG10,\dur,Pseq([ /*Pseq([1/6],3) , */ /*Pseq([1/5],10)*/ Pseq([1/4],9)  ,   Pseq([1/2],2), Pseq([1.25/1], 1 )  ].scramble,inf)  ,\amp, 1,\buf,~leTout2,\out,0,\impulse,0.003,\start, Pseq( [  Pseq([(~leTout2.numFrames/256*240.rand)],6),
	Pseq( [(~leTout2.numFrames/256*240.rand)],6),Pseq( [(~leTout2.numFrames/256*240.rand)],6)],inf),

/*\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf),*/

	\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0)],1).play(t))

~pedonk.play(t)

(~pedonk =Ppar([



Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),






	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),


	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,~part2G,\impulse,0.003,\start, 100000,\tS, 0.39550810372374 ,\vlSub,  1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,0,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

	Pbind(\instrument,\playBufXG,\dur,Pseq([3/1],inf)
		/*Pseq([ /*Pwrand([  Pseq([1/4],9),  Pseq([Pseq([1/4],5), Pseq([1/8],8)].scramble,1)],[4,1].normalizeSum,1),*//*Pseq([1/2],2), Pseq([1.25/1], 1 )*/  ].scramble,inf)*/ ,\amp, 1,\buf,~bufSnoopy,\out,~part2G2,\impulse,0.003,\start,~main2,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

	/*Pbind(\instrument,\playBufXG,\dur,Prand([
		/*Pseq([1/32],16),*/
		/* Pwrand([  *//*Pseq([1/4],9),*/ /* Pseq([Pseq([1/4],7), Pseq([1/8],4)].scramble,1)],[4,1].normalizeSum,1),*/Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf) ,\amp, 1,\buf,~lpPrec/*~bufSnoopy*/,\out,~part2G3,\impulse,0.003,\start,784344.24425935/*~main1*/,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),*/


		Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~part2G3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,461638.18770068, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


		/*Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,~part2G,\group,~filterGrp ),*/


Pwrand([
		Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([Pseq([2.5/1],1)  ,Pseq([1.25/1],1)],1), \in, ~part2G2,\tS, 0.39550810372374,\group, ~gateGrp,\out,~eqBus2x),

	Pwrand([

			Prand([
	Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~part2G,\tS, 0.39550810372374,\group, ~gateGrp,\out,~eqPerch),

				Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
					Pseq([1/4],6)  ,Pseq([1/4],5)],1),\type, Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note],inf),
				\in,~part2G,\tS, 0.39550810372374,\group, ~gateGrp,\out,~eqPerch),


			],1),


			Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~part2G3 ,\tS, 0.39550810372374,\group, ~gateGrp,\out,~toEq)],

		[1.75,2].normalizeSum,5),

	],[2,8].normalizeSum,inf),
		/*Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~reverbBus,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2,~s1x,\quant2,~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~gateGrp2),*/



	Pbind(\instrument,\EQHP, \in, ~toEq , \out,~revBus2,
		\val,~s2,\quant,~q2, \gain,~g2,
		\val2,~s2x,\quant2, ~q2x, \gain2,~g2x
		,\frq, 100, \dur,inf, \group, ~gateGrp2),




	Pbind(\instrument,\EQHP, \in, ~eqBus2x , \out,~revBus1,
		\val, ~s3,\quant, ~q3, \gain,~g3,
		\val2,~s3x,\quant2,~q3x, \gain2,~g3x
		,\frq, 100, \dur,inf, \group, ~gateGrp2),



	/*Pbindf(  ~revL[~r1] ,\dur,inf, \in, ~reverbBus , \out, ~comFuzz ,\group,~revGrp),*/

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comFuzz ,\ctrl, ~kbus, \out,~part2Limit, \group, ~compGrp),*/


	/*Pbind(\instrument, \limiterStoMixer,\c2,1,\name, 2,\in, , \dur,inf,\gain,54,\group,~limitGrp,\out,~stereoBus1),*/

	/*Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~part2Fuzz2, \group, ~stereoGrp,\tS, 0.39550810372374),*/


	Pbindf(  ~revL[~r2] ,\dur,inf, \in, ~revBus1 , \out, ~comBus5 ,\group,~revGrp),

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus1 ,\ctrl, ~kbus, \out,~part2Limit2, \group, ~compGrp),*/

	Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~sterBus5   ,\out,~part2Fuzz2, \group, ~stereoGrp,\center,0),


	Pbindf(  ~revL[~r3] ,\dur,inf, \in, ~revBus2 , \out, ~comBus3 ,\group,~revGrp),

/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus2 ,\ctrl, ~kbus, \out,~part2Limit3, \group, ~compGrp),*/

		Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~sterBus6   ,\out,~part2Fuzz2, \group, ~stereoGrp,\center,0,\tS, 0.39550810372374),



	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~gateGrp2),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,0, \rL,(-0.18),\rH,0.18, \group, ~lfoGrp,\tS, 0.39550810372374),


Pbind(\instrument,  \stereoX, \in,~stereoPerch2,  \out, ~part2Fuzz2, \modPan,~bus10 ,   \center, 0  ,\dur,Pseq([16/1],inf),\tS, 0.39550810372374 ,\group, ~dispatchGrp2 ),

	/*Pseq([




	Pbind(\instrument,\gateS, \in,~part2Fuzz2, \out, ~part2Fuzz ,\group,~dispatchGrp2,\dur,Pseq([12.25/1],1),\tS, 0.39550810372374   ),

	],inf),*/


	Pwrand([
	Pbind(\instrument,\gateS, \in,~deadS, \out,0, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),


		/*Pwrand([*/

		Pbind(\instrument,\gateS, \in,~part2Fuzz, \out,~part2Fuzz2, \group,~dispatchGrp2,\dur,/*Prand([Pseq([16/1],1), */Pseq([7.75/1],1)/*],1)*/,\tS, 0.39550810372374  ),

	],[1,16].normalizeSum,inf),


	Pseq([

		Pbind(\instrument,\playBufXG,/*\rte,Prand([1,(-1)],inf),*/ \dur,Pseq([3.75/1],1)

			/*Pseq([/* Pwrand([ */ Pseq([1/4],5),/*,  Pseq([Pseq([1/4],5), Pseq([1/8],8)].scramble,1)],[4,1].normalizeSum,1),*/Pseq([1/2],4), Pseq([1.25/1], 1 )  ].scramble,inf)*/ ,\amp, 1,\buf,~lpPrec/*~bufSnoopy*/,\out,~eqBus4,\impulse,0.003,\start,581638.18770068 ,\tS, 0.39550810372374
			,\vlDec,~pSub ,\vlSub,  ~pSub,\vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT+0.14 ,	\subsT, ~pSubT+0.1 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0)	,

				Pbind(\instrument,\gateS, \in,~part2Fuzz2, \out,~toCom, \group,~gateGrp3,\dur, Pseq([60.25/1],1),\tS, 0.39550810372374  ),

		],inf),





	Pbind(\instrument,\EQHP, \in, ~eqBus4 , \out,~revBus4,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2,~s1x,\quant2,~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbindf(  ~revL[~r3] ,\dur,inf, \in, ~revBus4 , \out, ~comBus4 ,\group,~revGrp),

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.92 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus4 ,\ctrl, ~kbus, \out,~part2Limit4, \group, ~compGrp),*/

		Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~sterBus4   ,\out,~toCom, \group, ~stereoGrp,\center,0,\tS, 0.39550810372374),


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.94 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
		,\in, ~toCom  ,\ctrl, ~snBus, \out,~absoFinalGate ,\group, ~compGrp2,\tS, 0.39550810372374),


],1))


~bufSnoopy.play