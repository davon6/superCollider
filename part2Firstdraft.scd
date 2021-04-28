

(
Ppar([


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),



Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\modu, 0.001875 ,\ph,1.4),

	Pbind(\instrument, \lfo13,\val,0.005029296875
 ,\out,~bus26 ,\dur,Pseq([256/1],inf),\ph,1.4, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),



		Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

	Pbind(\instrument, \percussion,\type,Pseq([ Pseq([ \rest  ],256) ,  Pseq(~rythmL, 768)],inf),\dur,Pseq([1/4],inf ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, ~cymbalEq),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], inf),\type,Pseq([ Pseq([ \rest  ],256) , Pseq([ \note  ],768) ],inf), \atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -16.7),( -16.5),( -16.2),( -16.2),( -15.9),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~hatEq),




	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~eqGrp, \out , ~comBusHat,\vol,4),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~eqGrp,\out , ~comBusCymb,\vol,4),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 1/4,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~limitHat,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.001, \rel ,0.04840,\gain,3.5,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~limitCymb,\group, ~compGrp),






~taZar,
	//maybe change below to buf ~buf to get coreeltion with part2
/*Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start,/*~zigoui2*/,\buf,~bufSnoopy,\out, ~part2ToPhas,\loopy,1),

	Pbind(\instrument, \phaser,\in,~part2ToPhas,\dur ,9999,\value, 0.0804,\amp,1,\decT,(-0.2),\out,~part2ToG, \group,~phaserGrp,\tS, 0.39550810372374 ,),

	Pseq([
	Pbind(\instrument, \gate, \in, ~part2ToG, \out,~part2ToFilter ,\group,~filterGrp, \type, Pseq([\note, \rest,\note,\note, ].scramble,inf),\tS,  0.39550810372374, \dur , Pseq([1/5],10)),

		Pbind(\instrument, \gate, \in, ~part2ToG, \out,~part2ToFilter ,\group,~filterGrp,\tS,  0.39550810372374, \dur , Pseq([2/1],1))],inf),


	Pbind(\instrument,\filter, \in,~part2ToFilter,\out,~part2ToEq  , \group,~distoGrp0  ,\dur, inf,\tS, 0.39550810372374,\busMod,~bus24, \which, 2,\qf2,0.7),



	Pbind(\instrument,\EQHP, \in, ~part2ToEq , \out, ~part2ToRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~part2ToRev  , \out,~part2ToComp ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~part2ToComp ,\ctrl, ~kbus, \out,~part2ToLimit, \group, ~compGrp),

		Pbind(\instrument,\stereoS, \dur,9999, \in,  ~part2ToStereo  ,\out,~part2ToComp2,\center, 0,\spread,1, \group, ~stereoGrp),*/


		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,40,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

Pbind(\instrument, \lfo13, \val,0.321875,\dur,Pseq([4/1],inf),\rL,440,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),


/*Pbind( \instrument, \playBuf, \impulse, 2.575,
		\dur,Pseq([1/1],inf), \tS,  0.39550810372374,\start,/*~zigoui*/, \buf,~bufSnoopy,\out, ~part2Slide,\loopy,0,\type, Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),*/


		/*	DRAFT OF DREAM

	Pbind(\instrument,\filter, \in,~part2Slide,\out,~part2SEq  , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus20, \which, 0,\qf,0.6),
		Pbind(\instrument,\EQHP, \in, ~part2SEq , \out, ~part2SRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~part2SRev  , \out,~part2SComp ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~part2SComp ,\ctrl, ~kbus, \out,~part2SLimit, \group, ~compGrp),

	Pbind(\instrument,\stereoS, \dur,9999, \in, ~part2SStereo   ,\out,~part2ToComp2,\spread,0.5,\center, Prand([Pfunc({0.4.rrand(0.2)}),Pfunc({(-0.4).rrand(-0.2)})],inf), \group, ~stereoGrp),
*/



/*	DRAFT OF DREAM

	Pbind( \instrument, \playBuf, \impulse, 0.3,
		\dur,Pseq([4/1],inf), \tS,  0.39550810372374,\start,/*~zigoui3*/, \buf,~bufSnoopy,\out, ~part2Slide2,\loopy,0,\type, Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),

	Pbind(\instrument,\filter, \in,~part2Slide2,\out,~part2SEq2  , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus19, \which, 0,\qf,0.62),
		Pbind(\instrument,\EQHP, \in, ~part2SEq2 , \out, ~part2SRev2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~part2SRev2  , \out,~part2SComp2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~part2SComp2 ,\ctrl, ~kbus, \out,~part2SLimit2, \group, ~compGrp),

	Pbind(\instrument,\stereoS, \dur,9999, \in, ~part2SStereo2   ,\out,~part2ToComp2,\spread,0.5,\center, Prand([Pfunc({0.4.rrand(0.2)}),Pfunc({(-0.4).rrand(-0.2)})],inf), \group, ~stereoGrp),*/








	/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
		,\in, ~part2ToComp2  ,\ctrl, ~snBus, \out,0,\group, ~compGrp2,\tS, 0.39550810372374),*/



	/*Pbind(\instrument,\rise,\dur,Pseq([256/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({5.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~part2RiDisto,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\fS,Pfunc({1.00.rand}),
	\key,/*Pseq([\dec,*/\atk /*], inf)*/,\value,1, \finish, { ~key.envirPut(~value) }),*/

	Pbind(\instrument,\rise,\dur,Pseq([256/1],inf) /*\vlAtk, Pfunc({4.00.rand}),*/,\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}), \f3,0 ,\ic_atk,Pfunc({10.00.rrand(-5)}),  \index,Pfunc({115.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~part2RiDisto,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), *//*\moduS,~mod2*//*,\fS,Pfunc({1.00.rand}),*/
		\key,/*Pseq([\dec,*/\atk /*], inf)*/,\value,1, \finish, { ~key.envirPut(~value) }),


	Pbind(\instrument,\distoS,\in,~part2RiDisto,\out,~part2RiFilter,\group,~phaserGrp,\dur,inf),
		Pbind(\instrument,\filterS, \in,~part2RiFilter,\out, ~part2RiEq , \group,~filterGrp,\dur, inf,\busMod,~bus26, \which, 0,\qf,0.6),
Pbind(\instrument,\EQHP2, \in, ~part2RiEq , \out,~part2RiRev  ,\frq, 100, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-28).rrand(-8)),
	Pbindf(~rLong, \instrument, \reverbS, \dur,inf, \in,~part2RiRev  , \out,~part2RiComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~part2RiComp ,\ctrl, ~kbus, \out,~part2RiLimit, \group, ~compGrp),

	/*Pbind( \instrument, \limiterStoMixer,\c40,1,\in,~part2RiLimit, \dur, inf,\gain,43,\group,~limitGrp,\out,~part2RiStereo),*/
	Pbind(\instrument,\stereoS, \dur, Pseq([256/1],inf), \in, ~part2RiStereo  ,\spread,0,\out,~part2RiComp2,\tS, 0.39550810372374,\group, ~stereoGrp),




	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.04,\sA, 1/4,\atk ,0.0968, \rel ,0.3872
		,\in, ~part2RiComp2  ,\ctrl, ~snBus, \out,0,\group, ~compGrp2,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),


Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),


Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10, \frq,1200, \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp,\val,15000.rrand(7000),\quant,4.rrand(1), \gain,(-5).rand((-20)) ),

	Pbind(\instrument,  \limiter10toMixer, \c13,1,\name,13,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 20,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.048, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 )

],1).play(t)
)

~part2RiDisto
~part2RiFilter
~part2RiEq
~part2RiRev
~part2RiComp
~part2RiLimit
~part2RiStereo

~part2RiComp2
//maybe part2 big rise is not downshifter friendly
//slide needs changin reverb or ephemere one
//no snare compression yet
~part2ToComp2
