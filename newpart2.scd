(
Ppar([


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),


Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),


Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),





Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp),

	Pbind(\instrument,  \limiter10toMixer, \c13,1,\name,13,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 20,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.048, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 ),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~new10*/, \start,

	Pseq([
			Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1) )],3),
	Pseq([(~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout2.numFrames/ 256 * 222.rrand(1))],3),
	].scramble,inf)
	,\loopy,0,\tS,0.39550810372374,\dur,  Pseq([

		Pseq([4/1],1) ,Pseq([2/1],1)  ,

Pseq([8/1],1) ,Pseq([4/1],1)  ,Pseq([16/1],1) ,Pseq([8/1],1) ,Pseq([32/1],1) ,Pseq([16/1],1)

],inf)),


	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374,
			\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })
	,
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,350,\crv,3.2),


		Pbind(\instrument, \distoS, \dur, inf, \in, ~bigRiToDisto , \out,~bigRiToEnv ,\group, ~distoGrp),
	Pbind(\instrument,\filterS, \in,~bigRiToEnv ,\out,~bigRiToEq, \group,~filterGrp ,\which, 0, \busMod, ~bus17,\qf,0.67,\dur, inf),

	Pbind(\instrument,\EQHP2, \in, ~bigRiToEq , \out, ~bigRiToRev ,\frq, 300, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~bigRiToRev  , \out,~bigRiToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~bigRiToComp ,\ctrl, ~kbus, \out,~bigRiToLimit, \group, ~compGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~bigRiToStereo  ,\spread,1,\out,0,\tS, 0.39550810372374,\group, ~stereoGrp,\atkT,1,\decT,0),

	// Pbind(\instrument,	\lim10, \ml,0.2, \in, ~new10, \group, ~limitGrp,\dur,inf)
	],1).play(t)
)
s.record;
/*	s.latency=0.02;*/
s.record
s.meter
s.latency=t.beatDur

~leTout2.play