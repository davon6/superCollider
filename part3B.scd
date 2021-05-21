

/*Pseq([
Ppar([
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],64), \tS,  0.39550810372374,\buf,~kb2),
	~part3a],1),],1).play(t)*/

(~part3a=Ppar([



	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~fra = ~leTout2.numFrames/ 256 * 240.rand;~fra2= ~leTout2.numFrames/ 256 * 240.rand;~fra3 = ~leTout2.numFrames/ 256 * 240.rand;~fra4 = ~leTout2.numFrames/ 256 * 240.rand})),


Pseq([
Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~fra})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~fra2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

],1)],1));


/*~fkAr.play

Pseq([
Ppar([
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],64), \tS,  0.39550810372374,\buf,~kb2),
	~part3b],1),Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810372374,\buf,~kb2)],1).play(t)*/

(~part3b=
Ppar([


	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~one = ~leTout2.numFrames/ 256 * 240.rand;~two = ~leTout2.numFrames/ 256 * 240.rand;~troi= ~leTout2.numFrames/ 256 * 240.rand;~start = ~start =~fkAr.numFrames.rrand(215000)-215000})),

Pseq([
	Ppar([

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~one})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),


Pseq([

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~two}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~troi})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start, Pfunc({~leTout2.numFrames/ 256 * 220})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),
		//PART2
		Ppar([

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~one})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],8) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~one+(~leTout2.numFrames/256)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),


Pseq([

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~two+(~leTout2.numFrames/256) }),\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\rest,\rest,\rest,\note],inf)),

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~troi})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],3) ,\type,Pseq([\rest,\note,\rest,\rest],inf)),



			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start, Pfunc({~leTout2.numFrames/ 256 * 220})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1) ,\type,Pseq([\note,\rest,\rest,\rest],inf))//to the end
	],1),


	],1),

/*
	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,
			Pfunc({~start}) ,\out, ~limitBus1),


	Ppar([

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start, Pfunc({~one})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4) ,\type,Pseq([\note,\rest,\note,\rest],inf)),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],8),\buf,~fkAr,\tS,  0.39550810372374,\start,Pfunc({~start}),\out, ~limitBus1,\type,Pseq([\rest,\rest,\note,\rest,
			\rest,\rest,	\rest,\rest,       \rest,\rest, \rest,\rest,\rest,\rest,\rest,\rest
		],inf)),


Pseq([

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~two})
				,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],4) /*,\type,Pseq([\rest,\rest,\rest,\note],inf)*/,\type,Pseq([\rest,\rest,\rest,\note],inf)),



				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({ ~troi + ~leTout2.numFrames/ 256})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2) ,\type,Pseq([
					/*\rest,\rest,\rest,\rest,*/
					\rest,\note,\rest,\rest],inf)),

	],1),


	],1)*/

],1)],1));





/*Pseq([
Ppar([
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],64), \tS,  0.39550810372374,\buf,~kb2),
	~part3c],1),Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810372374,\buf,~kb2)],1).play(t)*/

//maybe peu partially merge with  ~part3d
/*(
~part3c=Ppar([


	//fais la goute delayed
	//have above coming a compt goute + NO4 delayed



Pseq([
	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toExtraFx, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([10.65/1],1),  \group, ~stereoGrp/*,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/,\spread, 0.8,\tS,  0.39550810372374),

		Pbind(\instrument,\gateS, \in,~percGate, \out,  ~toExtraFx, \group,~dispatchGrp2,
			\tS,  0.39550810372374,\dur,Pseq([10.65/1],1),)

	],3),




Ppar([

		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],32),\buf,~pad/*~kb2Test*/,\tS,  0.39550810372374,\start,
/*	~kb2Test.numFrames.rand.postln*/107116.69921875,\out, ~shiftPlay,\vl,0.2),



	Pbind(\instrument,\gate,\in,~buildUpG,\out,~shiftRev, \vlSub,1,\vlSub2,Pkey(\vlSub),\tS,  0.39550810372374,\group,~gateGrp,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf),\dur  ,Pseq([1/1],64))

	],1)


],1));*/



/*Pseq([
Ppar([
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],64), \tS,  0.39550810372374,\buf,~kb2),
	~part3d],1),Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810372374,\buf,~kb2)],1).play(t)*/


/*(~part3d=Ppar([




	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~mster= ~leTout.numFrames/ 256 * 226.rand;~mster2= ~leTout.numFrames/ 256 * 226.rand})),


	Pseq([
	Pbind(\instrument, \playBuf10NToMixer, \out, ~toExtraFx,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,Pfunc({~mster}),\group, ~granuGrp),

	/*Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~absoFinalGate3),*/

	Pbind(\instrument, \gateS, \dur, Pseq([16/1],1),\tS, 0.39550810372374,\in,~finGran,\out,~toExtraFx,\group, ~granuGrp),

	Pbind(\instrument, \playBuf10NToMixer, \out, ~toExtraFx,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,Pfunc({~mster2}),\group, ~granuGrp),


/*	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2,\out,~absoFinalGate3),*/

		Pbind(\instrument, \gateS, \dur, Pseq([16/1],1),\tS, 0.39550810372374,\in,~finGran,\out,~toExtraFx,\group, ~granuGrp),



],1)],1));*/
/*~part5.play(t)

// ~dispatchGrp =Group.new

(
~part5= Ppar([
/*use for reboot fall

	Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),*/

	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/8,639.255/8,619.255/8]),


	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG2,
		\type,Pseq([\note,\note, \note,\note, \note,\rest,\note,\rest],inf),\out,~downdel,\group,~dispatchGrp)


	/*Pbind(\instrument,\pingD, \in, \out,\group,)*/


],inf));*/

(
~part3e=Pseq([ Ppar([




	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})),



Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],3),],1),

Ppar([




	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})),



Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],1),],1)],1));

