	Pseq([


	Pbind(\instrument,\comp10, \dur, Pxrand([ Pseq([4/1],16) ,/* Pseq([1/2],128) */  Pseq([8/1],8)    ],1) ,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in,Pseq([ ~newCOn,~new10 ],inf),\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

Prand([

Pseq([
	Pbind(\instrument,\comp10, \dur,  Pseq([1/1],1) /*Pseq([1/1],256)*/,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
				,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf)	,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

			Pbind(\instrument,\comp10, \dur,  Pseq([3/1],1) /*Pseq([1/1],256)*/,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf ), \ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374)].scramble, 16),

		Pseq([
	Pbind(\instrument,\comp10, \dur,  Pseq([2/1],1) /*Pseq([1/1],256)*/,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
				,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf)	,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

			Pbind(\instrument,\comp10, \dur,  Pseq([6/1],1) /*Pseq([1/1],256)*/,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf ), \ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374)].scramble, 8),

		],1),

Pxrand([

	Pbind(\instrument,\comp10, \dur,Pseq([64/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
				,\in, ~no3/*Pxrand([ ~no3,~no5],inf) */ ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\comp10, \dur,Pseq([56/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
			,\in, ~no3  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),


				Pbind(\instrument,\comp10, \dur,Pseq([4/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
			,\in, ~no3  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

		Pbind(\instrument,\comp10, \dur,Pseq([2/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
			,\in, ~newCOn  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),

		Pbind(\instrument,\comp10, \dur,Pseq([2/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
				,\in, ~newCOn  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),].scramble,1)
		],1),

		//to chnage for final
	Pbind(\instrument,\comp10, \dur,Pseq([4/1],16),
			/*Pseq([64/1],1)*/\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
			,\in,Prand([~percuCom2 ,~rndBus],1)/*Pseq([~percuCom2, Pxrand([~no3,~newCOn,~new10],inf), ].scramble,inf)*/,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,)


	].scramble,inf),








/*
~lp.stop;
(~lp = Ppar([
	//LP


	Pbind( \instrument, \playBufX, \impulse, 0.075/*Pseq([16/1],1)*/,
		\dur,inf, \tS,  0.39550810372374,\start,( ~buf.numFrames.rrand(100000)- 100000),\buf,~buf,\out, ~filterBus),


	Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~distoBus1, \group,~filterGrp ,\freqFil, 30.rrand(-30)),
Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~distoBus1, \group,~filterGrp ,\freqFil, 30.rrand(-30)),
Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~distoBus1, \group,~filterGrp ,\freqFil, 30.rrand(-30)),


Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~eqBus1 ,\group, ~distoGrp0),

	Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~gateBus,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pxrand([
	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([1/4],64), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type, Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2),
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),


	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([16/1],1), \in, ~gateSeqBus , \group, ~gateGrp2,
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),
],1),

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~gateSeqBus , \out,~comFuzz ,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur,inf,\gain,25,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out, ~no1, \group, ~stereoGrp),],1)/*.play(t, quant:1)*/
)


~bp.stop;
(~bp = Ppar([

//debug

	Pbind(\instrument,\gran,\dur,         Pseq([1/1],inf)
		,
/*	\group,~granuGrp,*/
		/*\type,Pseq([\rest,\note,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf/*Snoopy*/,\out, ~distoBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos,/*Prand([
		Pseq([0.9.rand],16),Pseq([*/0.9.rand/*],16),Pseq([0.9.rand],16),Pseq([0.9.rand],16)],inf)*/),


	Pbind(\instrument, \disto, \dur, inf, \in,~distoBus3, \out, ~filterSquelch, \group,~distoGrp),

	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~eqBus3, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus3 , \out, ~gateSquelch,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),





	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),


Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,15,\group,~limitGrp,\out ,~comSnaGrpBus2),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,~eqBus10),


Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comSquelch ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,15,\group,~limitGrp,\out,~stereoBus3),

	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~no1,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),],1)/*.play(t, quant:1)*/)



~hp.stop
(~hp = Ppar([


 ],1)/*.play(t, quant:1)*/)*/
/*~deNo2.play(t)
Ppar([~base, ~deNo2],1).play(t)
~deNo2.free;
(~deNo2 =

Ppar([

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10),\out,~kbus),

	Ppar([


//replace all with playbuf
		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~bufSnoopy,\out,Prand([~no2Delay,~eqDs2],inf),\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, Pfunc({1.00.rrand(0.2,1)}),\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.900.rand})),



	Pbind(\instrument, \wNoise,\dur,Pseq([32/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],inf),



	Pbind(\instrument, \pingD, \in, ~no2Delay ,\bufnum, ~delay6, \dur, inf,\out,~eqDs2,\group, ~filterGrp,\delayTime,Pfunc({0.3.rrand(0.1)})/*0.04*/,\feedback,  3.00.rrand(0.4)),


	Pbind(\instrument,\EQHP, \in, ~eqDs2 , \out, ~reverbBus32 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus32  , \out,~comFuzz32,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz32 ,\ctrl, ~kbus, \out,~limitFuzz32, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitFuzz32, \dur, inf,\gain,20,\group,~limitGrp,\out,~stereoBus42),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus42   ,\out, 0/*~no2*/, \group, ~stereoGrp),



//GIVE GLITCH ~
//debug glitcvchy
/*	Pbind(\instrument,\gran,\dur,Pseq([16/1],inf),
/*\type, Pseq([\rest, \note,\rest,\note, \note,\note,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus12,\gate, 1,\duration,Pkey(\dur),\impulse,0.002,
 \tS, 0.39550810372374,
		\pos,  Pfunc({0.900.rand })              ),*/

	//NO2

	Pbind( \instrument, \playBuf, \impulse, 0.075/*Pseq([16/1],inf)*/,
	\dur,Pseq([16/1],inf), \tS,  0.39550810372374,\start,Pfunc({ ~bufSnoopy.numFrames.rrand(100000)- 100000}),\buf,~bufSnoopy,\out, ~reverbBus12),



	/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus12 , \out,~reverbBus12 ,\group, ~distoGrp),*/


	Pbindf(~rLong/* Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~reverbBus12  , \out,~comFuzz12 ,\group,~revGrp),




	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1	,\in, ~comFuzz12 ,\ctrl, ~kbus, \out,~limitFuzz12, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in, ~limitFuzz12, \dur, inf,\gain,22,\group,~limitGrp,\out,~stereoBus12),

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf),\center,Pfunc({  (-0.4).rrand((0.4))   }) ,\in, ~stereoBus12   ,\out,0/*~no2*/, \group, ~stereoGrp)

],1)/*.play(t, quant:1)*/)*/