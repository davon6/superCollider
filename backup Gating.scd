
//GATES

Pxrand([


	Pbind(\instrument, \gate, \dur, Pseq([1/4],3),\group, ~gateGrp,\vlSub,Pfunc({0.8.exprand(0.1,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.4,0.1)}),\relT,Pfunc({0.12.exprand(0.8,1)}),\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),\relC,Pfunc({-8.exprand(-2,1)}),\in, ~gateBus,\out, ~gateSeqBus),



				Pbind(\instrument, \gate, \dur, Pseq([1/4],16),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
			\relSu,Pfunc({0.10.exprand(0.04)}),
			\vlSub,Pfunc({0.8.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.4,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-4.exprand(-2,1) }),\in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),

			Pbind(\instrument, \gate, \dur, Pseq([1/1],1), \in,~filterRnd, \tS, 0.39550810372374, \out, ~reverbRnd, \group, ~gateGrp),


			Pbind(\instrument, \gate, \dur, Pseq([1/1],1),
		\group, ~gateGrp,\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,\tS, 0.39550810372374,
				\bus1,~bus8,\in, ~gateBus,\out, ~reverbBus),


		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),



	Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/1],1),Pseq([1/4],1) ],1)  ,\vlSub,Pfunc({0.8.rand}) , \vlSub2,Pkey(\vlSub)
		,\group, ~gateGrp,
			\subsT,Pfunc({0.4.rrand(0.2)}) , \in,~gateSquelch  ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[4,1].normalizeSum,inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,\vlSub,Pfunc({0.8.exprand(0.1,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.4,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-6.exprand(-2,1) }),\in, ~gateBus,\out, ~gateSeqBus),



		Pbind(\instrument, \gate, \dur, Pwrand([~short,Pseq([1/4 ],16)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\relSu,Pfunc({0.15.rand}),

			\vlSub,Pfunc({0.8.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.4,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-4.exprand(-2,1) }),


			\in, ~gateBus2, \tS, 0.39550810372374,\out,

			~reverbBus2)




],inf),





//NO3

Pxrand([
//Pxrand
		Pbind(\instrument, \gate, \dur, Pseq([4/1],1),/*\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,*/\in, ~gateBus2, \tS, 0.39550810372374,
			\vlSub,Pfunc({0.8.exprand(0.1,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.1.exprand(0.2,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-4.exprand(-2,1) }),

			\out,Pwrand([/*~micBus23,*/~micBus33,~reverbBus23],[1,4].normalizeSum,inf)),





	Pbind(\instrument, \gate, \dur,Pseq([1/4],16),


			\type, Pxrand([ /*Pseq([\note],256) , */Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),

				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
				\relSu,Pfunc({0.10.exprand(0.04)}),
			\vlSub,Pfunc({0.8.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.4,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-4.exprand(-2,1) })
			,\in, ~gateBus2,\out,
			Pwrand([~micBus23,/*~micBus33,*/~reverbBus23],[1,1].normalizeSum,inf)),
	//new

			Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1),Pseq([4/1],1)    ],1),\group, ~gateGrp,/*\relSu,Pfunc({0.12.exprand(0.04)}),*/
\in, ~gateBus2,

			\vlSub,Pfunc({0.8.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.5.exprand(0.7,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.4,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({4.exprand(0,1)}),
	\decC,Pfunc({-4.exprand(-2,1)}),
		\relC,Pfunc({-4.exprand(-2,1) }),\out,  ~reverbBus23),


Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.10.exprand(0.04)}),
\in, ~gateBus2,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,Pwrand([~micBus23,~micBus33,~reverbBus23],[1,1].normalizeSum,inf)),





	],inf),





//NO@@@


Pxrand([


	Pbind(\instrument, \gate, \dur, Pseq([3/4],1),\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub)
	,\in, ~gateBus,\out, ~gateSeqBus,\tS, 0.39550810372374),



				Pbind(\instrument, \gate, \dur, Pseq([16/4],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,


		\vlSub,1,\vlSub2,Pkey(\vlSub), \in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),

			Pbind(\instrument, \gate, \dur, Pseq([1/1],1), \in,~filterRnd, \tS, 0.39550810372374, \out, ~reverbRnd, \group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub), ),


			Pbind(\instrument, \gate, \dur, Pseq([1/1],1),
		\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub), \in, ~gateBus,\out, ~reverbBus,\tS, 0.39550810372374),


		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \vlSub,1,\vlSub2,Pkey(\vlSub), \group, ~gateGrp,\tS, 0.39550810372374),



	Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/1],1),Pseq([1/4],1) ],1) , \vlSub,1,\vlSub2,Pkey(\vlSub),
		\group, ~gateGrp, \in,~gateSquelch  ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[4,1].normalizeSum,inf),\tS, 0.39550810372374),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub), \in, ~gateBus,\out, ~gateSeqBus,\tS, 0.39550810372374),



		Pbind(\instrument, \gate, \dur, Pwrand([~short,Pseq([16/4 ],1)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub), \in, ~gateBus2, \tS, 0.39550810372374,\out, ~reverbBus2)




],inf),



\\NO##@@


Pxrand([
//Pxrand
		Pbind(\instrument, \gate, \dur, Pseq([4/1],1),\vlSub,1,\vlSub2,Pkey(\vlSub),\in, ~gateBus2, \tS, 0.39550810372374,


			\out,Pwrand([/*~micBus23,*/~micBus33,~reverbBus23],[1,4].normalizeSum,inf)),





	Pbind(\instrument, \gate, \dur,Pseq([16/4],1),\tS, 0.39550810372374,


			\type, Pxrand([ /*Pseq([\note],256) , */Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),

				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
				\vlSub,1,\vlSub2,Pkey(\vlSub)
			,\in, ~gateBus2,\out,
			Pwrand([~micBus23,/*~micBus33,*/~reverbBus23],[1,1].normalizeSum,inf)),
	//new

			Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([16/4],1), Pseq([1/1],1),Pseq([4/1],1)    ],1),\group, ~gateGrp,/*\relSu,Pfunc({0.12.exprand(0.04)}),*/\tS, 0.39550810372374,
\in, ~gateBus2,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,  ~reverbBus23),


Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([16/4],1), Pseq([1/1],1)  ],1),\group, ~gateGrp,
\in, ~gateBus2,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,Pwrand([~micBus23,~micBus33,~reverbBus23],[1,1].normalizeSum,inf)),





	],inf),