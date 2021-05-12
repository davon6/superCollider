

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

Ppar([

		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],inf),\buf,~pad/*~kb2Test*/,\tS,  0.39550810372374,\start,
/*	~kb2Test.numFrames.rand.postln*/107116.69921875,\out, ~buildUpG,\vl,0.1),

	Pbind(\instrument,\gate,\in,~buildUpG,\out,~limitBus1, \vlSub,1,\vlSub2,Pkey(\vlSub),\tS,  0.39550810372374,\group,~lfoGrp,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf),\dur  ,Pseq([1/1],inf))

	],1)


],1).play(t))