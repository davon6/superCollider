
Ppar([
	~bassShap,
	/*Pbind(\instrument, \playBuf, \dur, inf,\buf, ~bufKick,\out, ~rollingK,\group,~gou),*/




	Pseq([~bar[3]/*   Pseq([~bassRest],4)*/,

		Pbind(\instrument, \dispatch, \dur, Pseq([4/1],1),\in,~rollingK,\out,0,\group,~dispatchGrp1)
	],inf)

],1).play(t)

(
Ppar([
	~bassShap,

	Pbind(\instrument, \dispatch2 ,\in,~dipatchKB, \out,0 ,\group,~dispatchGrp, \dur, Pseq([16/1],inf)),





Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.2),

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), Pseq([1/64],64),Pseq([1/64],256)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.17),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.22)

	],inf),






Pbind(\instrument, \dispatch , \dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out, Prand([~lpK,~bpK,~hpK],inf)),

Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiter,\dur,inf,\gain, 10, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),












	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK,   \group,~stereoGrp),


	Pseq([
	Pseq([~bar[3],


	Pbind(\instrument, \dispatch, \dur, Pseq([4/1],1),\in,~rollingK,\out,0,\group,~dispatchGrp2)
	],1),


	Pseq([~bar[4],


	Pbind(\instrument, \dispatch, \dur, Pseq([2/1],1),\in,~rollingK,\out,0,\group,~dispatchGrp2)
	],1),


	Pseq([~bar[5],


	Pbind(\instrument, \dispatch, \dur, Pseq([1/1],1),\in,~rollingK,\out,0,\group,~dispatchGrp2)
	],1),


		],inf),




],1).play(t)


)


/*//debug
	  //STARTING HERE
Pbind(\instrument,\gran,\dur,Prand([Pseq([1/4],16),Pseq([16/1],1),Pseq([1/64],256) ],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus1,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.9999999999.rand),

		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~filterBus ,\group, ~distoGrp),*/




/*	Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out, ~gateBus,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\gate, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Prand([Pseq([1/4],64)/*,Pseq([1/1 ],64  ) */],inf), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type,  Pseq([   Pseq([\note], 128) ,Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2), Pseq([\note], 64) ], inf),
		/*\atkT, Pseq([ 0,0.4,0,0 ,0,0,0,0 ],inf),
		\decT,Pseq([ 1,0.59,1,1,  1,1,1,1],inf),
		\atckC, Pseq([0,5,0,0 ,  0,0,0,0],inf),*/

		\vlSub,~vl1= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl2=0.00.rrand(0.2,1).postln,
	\decT,~vl3=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl4=0.2.rrand(0.3,0.1).postln,
	\relT,~vl5=0.12.rrand(0.8,1).postln,
	\atckC,~vl6=6.rrand(0,1).postln,
		\decC,~vl7=(-10).rrand(-2,1).postln,
		\relC,~vl8=(-8).rrand(-2,1) .postln,
		\out,~reverbBus),




	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus  , \out,~comFuzz ,\group,~revGrp),




	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur,inf,\gain,6,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),*/



//s.meter
/*	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~phaseBus),

	Pbind(\instrument, \men, \dur, Pseq([16384/1],inf),\out, ~filterSquelch),
	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus2),

	Pbind(\instrument,\algo,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,162.82/*130*/,\out,~filterBus),




	Pbind(\instrument,\multi,\dur,Pseq([16384/1],1), \out,~distoBg),*/







/*

	Pbind(\instrument, \disto, \hpf, 659.255, \dur, inf, \in ,~distoBg, \out,~bgBus , \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\dur,inf, \mod, ~bus12, \in,~bgBus  , \out,~eqBg ,\group,~revGrp),

	Pbind(\instrument, \EQ2, \dur, inf, \val, 2605.12,\quant,8, \gain,(-20) ,\in, ~eqBg, \out, ~dispatchBg, \group, ~eqGrp),

	Pbind(\instrument,\dispatchS,\dur,Pseq([ ~long2],inf), \type,Pwrand([\note, \rest],[1,4].normalizeSum, inf),\in, ~dispatchBg , \out, Prand([~bgFil,~bgCom],inf), \group, ~dispatchGrp1),

//JEEz keep disapearing

	Pbind(\instrument, \filterS, \dur, inf, \in,~bgFil  ,\which,0, \busMod, ~bus10, \rqLPF, ~bus3,\out, ~bgCom, \group, ~filterGrp2),


Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~bgCom ,\ctrl, ~kbus, \group, ~compGrp,\out,~bgLimit),
Pbind(\instrument, \limiter,\in, ~bgLimit, \dur, inf,\gain,8,\group,~limitGrp,\out,~bgStereo),
Pbind(\instrument,\stereo, \dur, Pseq([1024/1],1), \in, ~bgStereo   ,\out,0, \spread, 10, \group, ~stereoGrp),






Pbind(\instrument, \phaser, \dur,inf,\maxDlT,0.0242, \rate, 0.00502929687 , \in,~phaseBus, \out, ~distoBus2, \group,~phaserGrp),


	Pbind(\instrument, \disto,\hpf,100,\dur,inf, \in , ~distoBus2, \out,~filterRnd, \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rShort],1),\in,~reverbRnd , \out,~comRnd,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.02,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,20,\in, ~comRnd,\ctrl, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,3,\group,~limitGrp,\out,~stereoPhase),

	Pbind(\instrument, \stereo, \dur,Pseq([4/1],inf) , \spread, 1,  \center, Prand([0.8,0.4,0.1,(-0.1),(-0.8),(-0.4)],inf), \in, ~stereoPhase, \out,~stetoSnaCom1 ,\group, ~stereoGrp),





	Pbind(\instrument, \dispatch, \dur, Pseq([1/1],inf), \in, ~filterBus2, \out,~lpSide,\group, ~dispatchGrp),


	Pbind(\instrument, \filter  ,\dur, inf,\in,~lpSide, \busMod, ~bus15 ,\rqLPF,~bus3 , \out, ~gateSide, \group, ~filterGrp),


	Pbind(\instrument, \gate, \dur, Prand([ Pseq([1/4],1), Pseq([1/1],1)],inf),\type,Pwrand([\note, \rest],[1,16].normalizeSum,inf),\in,~gateSide, \atkT, 0.99, \decT, 0,\atckC, 8,\out, ~revSide,\group, ~gateGrp),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revSide  , \out,~comSide,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf ,\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872,\in, ~comSide, \out, ~limitSide,\ctrl, ~kbus, \group, ~compGrp),

	Pbind( \instrument, \limiterS  ,\dur,inf, \in ,~limitSide, \gain, 1, \out, ~stereoSide   , \group, ~limitGrp),

	Pbind(\instrument, \stereoS,\dur,Pseq([4/1],inf), \spread, 1,\in ,~stereoSide, \modPan, ~bus14,  \group, ~stereoGrp),















*/






//debug
/*	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),
		\amp, 1,\buf, ~buf,\out,~distoBus3,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,Pfunc({0.9999999999.rand})),

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus3, \out, ~filterSquelch, \group,~distoGrp),*/



	/*Pbind(\instrument,\EQHP, \in, ~eqBus3 , \out, ~gateSquelch,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, ~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),



Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,12,\group,~limitGrp,\out ,~comSnaGrpBus2),*/

	Pbind(\instrument,\compS, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),







/*Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comDelay ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,13,\group,~limitGrp,\out,~stereoBus3),

	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~no1,\center, Pxrand([0.2,(-0.2),(-0.4),(0.4)],inf), \group, ~stereoGrp),*/


