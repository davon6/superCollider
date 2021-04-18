

(
Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
	/*	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),*/

	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),


	Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22),

	Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([12/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp),

	Pbind(\instrument,  \limiter10toMixer, \dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 50,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.024, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 )


],1).play(t))












