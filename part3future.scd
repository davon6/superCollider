

(Pseq([

	Pfunc({~one = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~two = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~troi= ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~start = ~start =~fkAr.numFrames.rrand(215000)-215000}),


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start,~one
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~two,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~troi
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, Pfunc({~leTout2.numFrames/ 256 * 220})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),


	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,
		~start  ,\out, ~limitBus1),


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~one
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],16),\buf,~fkAr,\tS,  0.39550810372374,\start,~start,\out, ~limitBus1,\type,Pseq([\rest,\rest,\note,\note,
			\rest,\rest,	\rest,\rest,       \rest,\rest, \rest,\rest,\rest,\rest,\rest,\rest
		],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~two
				,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~troi + ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([
					/*\rest,\rest,\rest,\rest,*/
					\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, Pfunc({~leTout2.numFrames/ 256 * 220.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1)



		/*
	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],1),\buf,~fkAr,\tS,  0.39550810372374,\start,~fkAr.numFrames.rand.postln,\out, ~limitBus1),*/


/*	~kb*/


],inf).play(t))