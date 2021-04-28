(
~taZar = Ppar([



		/*Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),*/









	Pbind(\instrument, \lfo13,\val,(~hzQbeat/128),\out,~bus24 ,\dur,Pseq([256/1],inf),\ph,4.7, \rL,100,\rH,1200, \group, ~lfoGrp,\tS, 0.39550810372374),


Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start,~perc1,\buf,~buf,\out, ~phaseBus,\loopy,1),
		Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999, \value, ~pHVal,\amp,1,\decT,~pHdecT,\out,~eqPerch, \group,~phaserGrp,\tS, 0.39550810372374 ),
	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch9, \group, ~compGrp),




	Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start,~perc2,\buf,~buf,\out, ~phaseBus2,\loopy,1),
	Pbind(\instrument, \phaser,\in,~phaseBus2,\dur ,9999,\value,~pHVal2,\amp,1,\decT,~pHdecT2,\out,~eqPerch2, \group,~phaserGrp,\tS, 0.39550810372374 ),
	Pbind(\instrument,\EQHP, \in, ~eqPerch2 , \out, ~revPerch2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch2  , \out,~comPerch2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comPerch2 ,\ctrl, ~kbus, \out,~limitPerch10, \group, ~compGrp),


	Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start,~perc3,\buf,~buf,\out, ~phaseBus3,\loopy,1),
	Pbind(\instrument, \phaser,\in,~phaseBus3,\dur ,9999,\value, ~pHVal3,\amp,1,\decT,~pHdecT3,\out,~eqPerch3, \group,~phaserGrp,\tS, 0.39550810372374 ,),
	Pbind(\instrument,\EQHP, \in, ~eqPerch3 , \out, ~revPerch3,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch3  , \out,~comPerch3 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1 ,\in, ~comPerch3 ,\ctrl, ~kbus, \out,~limitPerch11, \group, ~compGrp),



	Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start,~perc4,\buf,~buf,\out, ~phaseBus4,\loopy,1),
	Pbind(\instrument, \phaser,\in,~phaseBus4,\dur ,9999,\value, ~pHVal4,\amp,1,\decT,~pHdecT4,\out,~eqPerch4, \group,~phaserGrp,\tS, 0.39550810372374 ,),
	Pbind(\instrument,\EQHP, \in, ~eqPerch4 , \out, ~revPerch4 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch4  , \out,~comPerch4 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1	,\in, ~comPerch4 ,\ctrl, ~kbus, \out,~limitPerch12, \group, ~compGrp),


	Pbind(\instrument, \gate2, \in, Pseq([~perchLimiToG9,~perchLimiToG10,~perchLimiToG11,~perchLimiToG12].scramble,inf), \out,~part2ToG ,\group,~gateGrp8,\tS,  0.39550810372374, \dur ,Pseq([64/1],inf)/*Pseq([Pseq([1/5],10),Pseq([2/1],1)],inf), \type, Pseq([\note, \rest,\note,\note, ].scramble,inf)*/,\vlSub ,1,\vlSub2,Pkey(\vlSub)

	),





	Pseq([
		Pbind(\instrument, \gate2, \in, ~part2ToG, \out,~part2ToStereo ,\group,~gateGrp9, \type, Pseq([\note, \rest,\note,\note, ].scramble,inf),\tS,  0.39550810372374, \dur , Pseq([1/5],10),\vlSub ,1,\vlSub2,Pkey(\vlSub)),

		Pbind(\instrument, \gate2, \in, ~part2ToG, \out,~part2ToStereo ,\group,~gateGrp9,\tS,  0.39550810372374, \dur , Pseq([2/1],1),\vlSub ,1,\vlSub2,Pkey(\vlSub))],inf),


	//COULD MAYBE PANMOD
	Pbind(\instrument,\stereoS, \dur,9999, \in,  ~part2ToStereo  ,\out,~part2ToComp2,\center, 0,\spread,1, \group, ~stereoGrp),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
		,\in, ~part2ToComp2  ,\ctrl, ~snBus, \out,0,\group, ~compGrp2,\tS, 0.39550810372374),
],1))


~part2ToPhas;


/*
	Pbind(\instrument,\filter, \in,~part2ToFilter,\out,~part2ToEq  , \group,~distoGrp0  ,\dur, inf,\tS, 0.39550810372374,\busMod,~bus24, \which, 2,\qf2,0.7),

	Pbind(\instrument,\EQHP, \in, ~part2ToEq , \out, ~part2ToRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~part2ToRev  , \out,~part2ToComp ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~part2ToComp ,\ctrl, ~kbus, \out,~part2ToLimit, \group, ~compGrp),

		*/
