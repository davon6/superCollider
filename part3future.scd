

(Pseq([


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 41
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 114
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 75
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 112
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),


	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,1015435.8192815,\out, ~limitBus1),


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 41
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],16),\buf,~fkAr,\tS,  0.39550810372374,\start,/*~fkAr.numFrames.rand.postln*/1015435.8192815,\out, ~limitBus1,\type,Pseq([\rest,\rest,\note,\note,
			\rest,\rest,	\rest,\rest,       \rest,\rest, \rest,\rest,\rest,\rest,\rest,\rest
		],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 114
				,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 75
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([
					/*\rest,\rest,\rest,\rest,*/
					\rest,\note,\rest,\rest],inf)),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 45
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1)



		/*
	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],1),\buf,~fkAr,\tS,  0.39550810372374,\start,~fkAr.numFrames.rand.postln,\out, ~limitBus1),*/


/*	~kb*/


],1).play(t))