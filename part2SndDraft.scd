
(
Ppar([


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),



	Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,40,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),



Pbind( \instrument, \playBuf, \impulse, 2.575,
		\dur,Pseq([1/1],inf), \tS,  0.39550810372374,\start, ~bufSnoopy.numFrames/256 * 240.rand,\buf,~bufSnoopy,\out, ~part2Slide,\loopy,0,\type, Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),


		Pbind(\instrument,\filter, \in,~part2Slide,\out,0  , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus20, \which, 0,\qf,0.6)




],1).play(t))