~b=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,3.67,\duration,0.4
	,\pos,0.64,\out,~distoBus3 ] /*,~granuGrp*/ );



(
Ppar([


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,( -3.5),\out,~kbus),

Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus3, \out, ~filterSquelch, \group,~distoGrp),

	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out,~eqBus3, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus3 , \out, ~gateSquelch,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0, \vol,1),



Pxrand([
		Pbind(\instrument, \gate, \dur,  Pseq([4/1],1) ,\vlSub,Pfunc({0.8.rand}) , \vlSub2,Pkey(\vlSub),
		\group, ~gateGrp,
			\subsT,Pfunc({0.4.rrand(0.2)}) , \in,~gateSquelch ,\out,~reverbSquelch),



		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/1],1),Pseq([1/4],1) ],1)  ,\vlSub,Pfunc({0.8.rand}) , \vlSub2,Pkey(\vlSub)
		,\group, ~gateGrp,
			\subsT,Pfunc({0.4.rrand(0.2)}) , \in,~gateSquelch  ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),


],inf),


	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),


Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,52,\group,~limitGrp,\out ,~comSnaGrpBus2),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comDelay ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,53,\group,~limitGrp,\out,~stereoBus3),

	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~no1,\center, Pxrand([0.2,(-0.2),(-0.4),(0.4)],inf), \group, ~stereoGrp),





],inf).play(t))