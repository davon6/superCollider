

~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)

~kb.stop

(~part3a=Ppar([


	Pfunc({~fra = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~fra2 = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~fra3= ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~fra4 = ~leTout2.numFrames/ 256 * 240.rand}),

Pseq([
Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start,~fra
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~fra2
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start,~fra3
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~fra4
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate6, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),


],inf)],1).play(t))



//must run first
~troi= ~leTout2.numFrames/ 256 * 240.rand


(~part3b=
Ppar([
	Pfunc({~one = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~two = ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~troi= ~leTout2.numFrames/ 256 * 240.rand}),
	Pfunc({~start = ~start =~fkAr.numFrames.rrand(215000)-215000}),


Pseq([
	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start,~one
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, ~two,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, ~troi
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, Pfunc({~leTout2.numFrames/ 256 * 220})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),


	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,
		~start  ,\out, ~limitBus1),


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, ~one
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],16),\buf,~fkAr,\tS,  0.39550810372374,\start,~start,\out, ~limitBus1,\type,Pseq([\rest,\rest,\note,\note,
			\rest,\rest,	\rest,\rest,       \rest,\rest, \rest,\rest,\rest,\rest,\rest,\rest
		],inf)),


Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, ~two
				,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, ~troi + ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([
					/*\rest,\rest,\rest,\rest,*/
					\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate7, \start, Pfunc({~leTout2.numFrames/ 256 * 220.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1)

],inf)],1).play(t))




~part3c.play(t)
(
~part3c=Ppar([


	//fais la goute delayed
	//have above coming a compt goute + NO4 delayed


Pbind(\instrument, \lfo13,\val,(~hzQbeat/16),\out,~bus24 ,\dur,999,\ph,0, \rL,4000,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,-0.4,\rH,0.4, \group, ~lfoGrp,\tS, 0.39550810372374),




	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~absoFinalGate8, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp/*,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/,\spread, 0.8,\tS,  0.39550810372374),







Ppar([

		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],inf),\buf,~pad/*~kb2Test*/,\tS,  0.39550810372374,\start,
/*	~kb2Test.numFrames.rand.postln*/107116.69921875,\out, ~buildUpG,\vl,0.1),

	Pbind(\instrument,\gate,\in,~buildUpG,\out,~shiftLimit, \vlSub,1,\vlSub2,Pkey(\vlSub),\tS,  0.39550810372374,\group,~lfoGrp,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf),\dur  ,Pseq([1/1],inf))

	],1)


],1))