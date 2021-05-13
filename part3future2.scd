

(
Ppar([
/*
Pseq([


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 98
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 21
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 100
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 34
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),


/*	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,1015435.8192815,\out, ~limitBus1),*/


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 98
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],16),\buf,~fkAr,\tS,  0.39550810372374,\start,/*~fkAr.numFrames.rand.postln*/1015435.8192815,\out, ~limitBus1,\type,Pseq([\rest,\rest,\note,\note,
			\rest,\rest,	\rest,\rest,       \rest,\rest, \rest,\rest,\rest,\rest,\rest,\rest
		],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 21
				,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 100
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([
					/*\rest,\rest,\rest,\rest,*/
					\rest,\note,\rest,\rest],inf)),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 90
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),



],inf),
*/

	//fais la goute delayed
	//have above coming a compt goute + NO4 delayed





	Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp,\frq,800),

	Pbind(\instrument,  \limiter10toMixer, \c49,1,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 20,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.048, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 ),






Ppar([

		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],inf),\buf,~pad/*~kb2Test*/,\tS,  0.39550810372374,\start,
/*	~kb2Test.numFrames.rand.postln*/107116.69921875,\out, ~buildUpG,\vl,0.1),

	Pbind(\instrument,\gate,\in,~buildUpG,\out,~limitBus1, \vlSub,1,\vlSub2,Pkey(\vlSub),\tS,  0.39550810372374,\group,~lfoGrp,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf),\dur  ,Pseq([1/1],inf))

	],1)


],1).play(t))

