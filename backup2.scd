


Pxrand([


	//GATES

		Pxrand([

		Pbind(\instrument, \gate, \dur, Pseq([1/1],1),
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,
				\bus1,~bus8,\in, ~gateBus,\out, ~reverbBus),



			/*Pbind(\instrument, \gate, \dur,Pseq([4/1],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8),


				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest],8)],inf), \group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,
			\vlDec,0.8,\relC, (-4),
			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2,*/
				\vlSub,~vl11= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl21=0.00.rrand(0.2,1).postln,
	\decT,~vl31=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl41=0.2.rrand(0.3,0.1).postln,
	\relT,~vl51=0.12.rrand(0.8,1).postln,
	\atckC,~vl61=6.rrand(0,1).postln,
		\decC,~vl71=(-10).rrand(-2,1).postln,
		\relC,~vl81=(-8).rrand(-2,1) .postln,

				\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~reverbBus3],[1,1,16].normalizeSum,inf)),*/



		],1),


	Pxrand([
	Pbind(\instrument, \gate, \dur, Pseq([1/4],3),
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,


				\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus),



			Pbind(\instrument, \gate, \dur,Pxrand([ Pseq([1/4],16),Pseq([1/4],64)],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8),


				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest],8)],inf), \group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,

			\vlDec,0.8,\relC, (-4),

			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2*/

				\relSu,Pfunc({0.15.rand}),
				\vlSub,~vl11= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl21=0.00.rrand(0.2,1).postln,
	\decT,~vl31=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl41=0.2.rrand(0.3,0.1).postln,
	\relT,~vl51=0.12.rrand(0.8,1).postln,
	\atckC,~vl61=6.rrand(0,1).postln,
		\decC,~vl71=(-10).rrand(-2,1).postln,
		\relC,~vl81=(-8).rrand(-2,1) .postln

				,\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),
//~reverbBus2),




			Pbind(\instrument, \gate, \dur, Pseq([1/1],1), \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),

		Pbind(\instrument, \gate, \dur,  Pseq([1/2],1)
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,~reverbSquelch),

	],64)
	//Prand([

	,


		Pxrand([

		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),



		Pbind(\instrument, \gate, \dur, Pseq([1/4],1) /* , \vlDec, 0.6,*/
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus/*~reverbBus*/),

		Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,
			/*\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8)],1), */\group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,

			\vlDec,0.8,\relC, (-4),

			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2*/


				\relSu,Pfunc({0.15.rand}),
				\vlSub,~vl11,\vlSub2,Pkey(\vlSub),
				\atkT,~vl21,
	\decT,~vl31,
	\subsT,~vl41,
	\relT,~vl51,
	\atckC,~vl61,
	\decC,~vl71,
	\relC,~vl81


				,\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			//Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf))
			~reverbBus2)



 ],16)


	],inf),