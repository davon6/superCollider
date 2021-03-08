
Ppar([

	/*Pseq([Pbindf(~kick,\out,~kbus)],inf),*/
Pbind(\instrument,\gran,\dur,Pseq([16/1],1),\group,~granuGrp,\amp, 1,\buf, ~buf,\out,~gateMelo,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),


Pbindf(~rLong,\dur,inf, \in,~gateMelo , \revtime, 15,\out,0,\taillevel,0,\group,~revGrp),

	/*Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitSide, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~stereoSide  ,	\atkT,0.05,\crvA,8,\out,0, \group, ~stereoGrp),*/

	/*Ppar([~kick,~bass],inf)*/

],1).play(t)




















Ppar([

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,~revSide,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),


Pbindf(~rLong,\dur,inf, \in,~revSide , \revtime, 15,\out,~comSide,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitSide, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~stereoSide  ,	\atkT,0.05,\crvA,8,\out,0, \group, ~stereoGrp),

	/*Ppar([~kick,~bass],inf)*/

],1).play(t)


s.plotTree






(
Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),

	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),



	Pbind(\instrument, \lfo3, \dur, Pwrand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],  [1,4].normalizeSum,inf)   , \out,~bus2, \group, ~lfoGrp),









	Pbind(\instrument,\comp10, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom1 ,\ctrl, ~snBus, \out, ~eqBus10,\group, ~compGrp2),

Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\frq, 100, \dur,inf, \group, ~eqGrp2),



],inf).play(t)

)






(
Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),

	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),

	/*Pbind(\instrument, \lfo2, \dur,Pseq([1/1],inf), \val, Prand([0,1],inf), \out, ~bus5, \group, ~lfoGrp),*/




	/*Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf), \vl,Pseq([0.0000000095262251,0.0000000095262251,0.0000000095262251, 0.01005859375],inf),
		\vl3, Pseq([0,0,0, (-10.4)],inf), \vl2, Pseq([0,0,0, 15],inf),
		\out, ~bus2,  \out2, ~bus11,  \out3, ~bus3),*/

	/*Pbind(\instrument, \lfo, \dur,Pseq([1/ Prand([4,16,1],inf) ], Prand([1,4,16,64],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) ,  \out, ~bus10),*/
	/*Pbind(\instrument, \lfo, \dur,Pseq([Prand([4,16,1,64],inf)/ 1 ], Prand([1,4],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) , \tim,  6.1952, \crv,(-3),  \out, ~bus11),*/

	Pbind(\instrument, \lfo3, \dur, Pwrand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],  [1,4].normalizeSum,inf)   , \out,~bus2, \group, ~lfoGrp),



Pbind(\instrument,\gran,\dur,Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf),
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.056947019444704),

		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~filterBus2 ,\group, ~distoGrp),

ß
	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~gateBus2,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	Prand([
		Pbind(\instrument, \gate, \dur,Pxrand([ Pseq([1/4],16),Pseq([1/4],64)],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8),

				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest],8)],inf), \group, ~gateGrp,
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
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),

		Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\relSu,Pfunc({0.15.rand}),\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,\in, ~gateBus2,\out,

			~reverbBus2)

	],inf),









	Pbindf(Prand([~quickFix,~rLong, ~rShort]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoBus2),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus2   ,\out,~stetoSnaCom1, \group, ~stereoGrp),

	Pbind(\instrument,\comp10, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom1 ,\ctrl, ~snBus, \out, ~eqBus10,\group, ~compGrp2),

Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\frq, 100, \dur,inf, \group, ~eqGrp2),



],inf).play(t)

)






(
Pbind(\instrument,\gran,\dur,Pseq([4/1],1),\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
	\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand.postln})).play(t)
)


Pbind(\instrument,\gran,\dur,Pseq([4/1],1),\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
	\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.9})).play(t)



Pbind(\instrument,\gran,\dur,Pseq([4/1],inf),
\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),

\vlSub, 0,\vlSub2,Pkey(\vlSub),
	\decC,Pseq([Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32)],inf),

	\pos,Pseq([ Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),  ],inf)).play(t)





Pbind(\instrument,\gran,\dur,Pseq([4/1],1),\amp, 1,\buf, ~buf,\out,~reverbBus3,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand}))

Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz3, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoBus4),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out,~stetoSnaCom1, \group, ~stereoGrp),
