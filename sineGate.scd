


{SinOsc.kr(MouseY.kr(0.3,20.6)).range(0,MouseX.kr(0,1) )*0.2!2}.scope;









~sequ.play(t)
~t = Ppar([~base,/* ~kb,*/~sequ],1).play(t,quant:1)


.stop

(
~sequ =
Ppar([


//For init

/*Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+100000).exprand("1".postln;~main1.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+100000).exprand("2".postln;~main2.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+100000).exprand("3".postln;~main3.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),*/


	Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+300000).rrand(~main1)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+300000).rrand(~main2)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+300000).rrand(~main3)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),




		Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~gateBus,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pxrand([



		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out, ~reverbBus/*~filterBus*/,

		\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
			\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,  ~gateBus,\out,
			Pwrand([~filterBus,~reverbSquelch ],[16,1].normalizeSum,inf),\group, ~gateGrp,
\atkC,9.00.rrand(2),	\atkT,1, \decT,0),




		Pbind(\instrument, \gate ,\in,  ~gateBus ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out, ~reverbBus/*~filterBus*/,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus/*~filterBus*/),


		Pbind(\instrument, \gate, \dur, Prand([ Pseq([1/4],4),Pseq([1/1],1) ],1) ,\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~delayBus)

	],inf),





	/*Pxrand([
	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([1/4],64), \in,~filterBus/*~gateBus*/ /*~gateSeqBus*/ , \group, ~gateGrp2,
		\type, Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2),
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),


	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([16/1],1), \in,~filterBus /*~gateSeqBus*/ , \group, ~gateGrp2,
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),
],inf),*/

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~reverbBus , \out, ~comFuzz ,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur,inf,\gain,30,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,0/*~no1*/, \group, ~stereoGrp),],1)


)