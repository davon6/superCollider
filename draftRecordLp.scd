
(
Ppar([
Pbind(\instrument,\playBufXG,\dur,


		Pwrand([ Pseq([1/4],5),Pseq([1/2],4), Pseq([1.25/1], 1 ) , Pseq([3/1], 1 )    ],[4,4,4,1].normalizeSum,inf)


 ,\amp, 1,\buf,~bufSnoopy,\out,~gateMelo,\impulse,0.003,\start, ~main1,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



		Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0,\group,~filterGrp ),

],1).play(t))





MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);

},noteNum: 43);// is 43


	~filterGrp = Group.new





~percheur.play(t)

(~percheur = //percheur



Ppar([



		Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),






	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0).play(t)



	/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc1, \tS, 0.39550810372374 ,
\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk)),*/

	Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */Pseq([4.75],1)
	],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~buf,\out,~gateMelo/*~phaseBus*/,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~main1 /*~perc1*/, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),







/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc2, \tS, 0.39550810372374 ,
\vlSub,  ~pSub2 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT2,/*\decT, ~pDecT2 ,*/	\subsT, ~pSubT2 , \relT,~pRelT2,\atckC,~pAtkC2,\decC,~pDecC2,\relC,~pRelC2,\vlAtk , ~pvlAtk2 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc2, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub*3.4 , \vlSub2,Pkey(\vlSub), \atkT,0/*~pAtkT/16*/,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc3, \tS, 0.39550810372374 ,
\vlSub,  ~pSub3 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT3,/*\decT, ~pDecT3 ,*/	\subsT, ~pSubT3 , \relT,~pRelT3,\atckC,~pAtkC3,\decC,~pDecC3,\relC,~pRelC3,\vlAtk , ~pvlAtk3 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc3, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus4,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc4, \tS, 0.39550810372374 ,
\vlSub,  ~pSub4 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT4,/*\decT, ~pDecT4 ,*/	\subsT, ~pSubT4 , \relT,~pRelT4,\atckC,~pAtkC4,\decC,~pDecC4,\relC,~pRelC4,\vlAtk , ~pvlAtk4 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus4,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc4, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus5,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc5, \tS, 0.39550810372374 ,
\vlSub,  ~pSub5 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT5,/*\decT, ~pDecT5 ,*/	\subsT, ~pSubT5 , \relT,~pRelT5,\atckC,~pAtkC5,\decC,~pDecC5,\relC,~pRelC5,\vlAtk , ~pvlAtk5,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus5,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc5, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus6,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc6, \tS, 0.39550810372374 ,
\vlSub,  ~pSub6 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT6,/*\decT, ~pDecT6 ,*/	\subsT, ~pSubT6 , \relT,~pRelT6,\atckC,~pAtkC6,\decC,~pDecC6,\relC,~pRelC6,\vlAtk , ~pvlAtk6 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus6,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc6, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus7,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc7, \tS, 0.39550810372374 ,
\vlSub,  ~pSub7 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT7,/*\decT, ~pDecT7 ,*/	\subsT, ~pSubT7 , \relT,~pRelT7,\atckC,~pAtkC7,\decC,~pDecC7,\relC,~pRelC7,\vlAtk , ~pvlAtk7 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus7,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc7, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus8,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc8, \tS, 0.39550810372374 ,
\vlSub,  ~pSub8 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT8,/*\decT, ~pDecT8 ,*/	\subsT, ~pSubT8 , \relT,~pRelT8,\atckC,~pAtkC8,\decC,~pDecC8,\relC,~pRelC8,\vlAtk , ~pvlAtk8 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus8,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc8, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999/*Pseq([24/1],inf)*/,\value, ~pHVal,\amp,1,\decT,~pHdecT,\out,~gateMelo, \group,~phaserGrp,\tS, 0.39550810372374 ,),


	/*Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value,~pHVal2,\amp,1,\decT,~pHdecT2,\out,~gateMelo, \group,~phaserGrp,\tS, 0.39550810372374 ,),*/


	Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.5, \qf2,0.2
	),



			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \phaser,\in,~phaseBus2,\dur ,9999,\value,~pHVal2,\amp,1,\decT,~pHdecT2,\out,~eqPerch2, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch2 , \out,~eqPerch2,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch2 , \out, ~revPerch2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch2  , \out,~comPerch2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch2 ,\ctrl, ~kbus, \out,~limitPerch2, \group, ~compGrp),


	Pbind(\instrument, \phaser,\in,~phaseBus3,\dur ,9999,\value, ~pHVal3,\amp,1,\decT,~pHdecT3,\out,~eqPerch3, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch3 , \out,~eqPerch3,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch3 , \out, ~revPerch3,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch3  , \out,~comPerch3 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch3 ,\ctrl, ~kbus, \out,~limitPerch3, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus4,\dur ,9999,\value, ~pHVal4,\amp,1,\decT,~pHdecT4,\out,~eqPerch4, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch4 , \out,~eqPerch4,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch4 , \out, ~revPerch4 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch4  , \out,~comPerch4 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch4 ,\ctrl, ~kbus, \out,~limitPerch4, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus5,\dur ,9999,\value, ~pHVal5,\amp,1,\decT,~pHdecT5,\out,~eqPerch5, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch5 , \out,~eqPerch5,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch5 , \out, ~revPerch5 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch5  , \out,~comPerch5 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch5 ,\ctrl, ~kbus, \out,~limitPerch5, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus6,\dur ,9999,\value, ~pHVal6,\amp,1,\decT,~pHdecT6,\out,~eqPerch6, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch6 , \out,~eqPerch6,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch6 , \out, ~revPerch6 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch6  , \out,~comPerch6 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch6 ,\ctrl, ~kbus, \out,~limitPerch6, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus7,\dur ,9999,\value, ~pHVal7,\amp,1,\decT,~pHdecT7,\out,~eqPerch7, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch7 , \out,~eqPerch7,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch7 , \out, ~revPerch7 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch7  , \out,~comPerch7 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch7 ,\ctrl, ~kbus, \out,~limitPerch7, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus8,\dur ,9999,\value, ~pHVal8,\amp,1,\decT,~pHdecT8,\out,~eqPerch8, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch8 , \out,~eqPerch8,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch8 , \out, ~revPerch8 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch8  , \out,~comPerch8 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch8 ,\ctrl, ~kbus, \out,~limitPerch8, \group, ~compGrp),

	/*	Pbind(\instrument, \limiterStoMixer,\c3,1,\name, 3,\in, ~limitPerch, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/
/*	Pbind(\instrument, \limiterStoMixer,\c31,1,\in, ~limitPerch2, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c32,\in, ~limitPerch3, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c33,\in, ~limitPerch4, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c34,\in, ~limitPerch5, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c35,\in, ~limitPerch6, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c36,\name, 3,\in, ~limitPerch7, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c37,\name, 3,\in, ~limitPerch8, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/


	/*Pbind(\instrument,\gate2, \dur,Pseq([Pseq ([Pseq([1/4],24) ],8),Pseq([Pseq([1/4],12)],8)].scramble,inf),\in,
		~perchLimiToG/*Pseq([~perchLimiToG,~perchLimiToG2,~perchLimiToG3,~perchLimiToG4,~perchLimiToG5,~perchLimiToG6,~perchLimiToG7,~perchLimiToG8].scramble,inf)*/,	\out,~stereoPerch, \group,~stereoGrp,\tS, 0.39550810372374),*/


	/*Pbind(\instrument,\gate2, \dur,Pseq([16/1],inf),\in,
		~perchLimiToG/*Pseq([~perchLimiToG,~perchLimiToG2,~perchLimiToG3,~perchLimiToG4,~perchLimiToG5,~perchLimiToG6,~perchLimiToG7,~perchLimiToG8].scramble,inf)*/,	\out,~stereoPerch, \group,~stereoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoPerch ,\spread,0.6  ,\center,/* Pfunc({0.80.rrand(-0.80)})*/, \out,0, \group, ~dispatchGrp2 ,\tS, 0.39550810372374)*/

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument,  \stereoX, \in,~stereoPerch,  \out, 0, \modPan,~bus10 ,   \center, 0  ,\dur,Pseq([16/1],inf),\tS, 0.39550810372374 ,\group, ~dispatchGrp2 ),


],1) )
~lpPrec.play

x = Synth(\recLoop,[buf:~lpPrec2,\recording,1, \in,0],~recGrp);