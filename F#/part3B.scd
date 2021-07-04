

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
/*
Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai2=~leTout2.numFrames/256* (220.rand)})),


	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})),*/


/*(
~part3e=Pseq([ Ppar([



Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai2=~leTout2.numFrames/256* (220.rand)})),



Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx,\start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),

		//
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],1),



],1),

Ppar([


Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([5/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})),




Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),
		//


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],1),],1)],1)
)*/




(~part3e=Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),



Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx,\start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),

		//

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),





Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],2))

////////////////////////////////
//backup first hit

/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0).play(t)





Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur)).play(t)



Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2).play(t)
~justHit.play(t)*/


/*//make it right herre

Ppar([


		Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),
Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , 0,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/8,639.255/8,619.255/8])],1).play(t)*/


/*~bus33= Bus.control(s,1);

		~bigRiToFil1= Bus.audio(s,1);
	~bigRiToFil2= Bus.audio(s,1);*/

(
~justHit=
Ppar([

	/*use for reboot fall part5 downshifter

	Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),*/

	Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,150,\crv,5.2),

	Pseq([
	Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([24/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
	],inf),

	Pseq([

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest)
		Pseq([



		Pseq([//maybe change to 12
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),


				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

			Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),






	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],4),



		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],2),



		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),





Ppar([
				Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest],1)),

		Pbind(\instrument, \gateS,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34])],1)



				],1),

		Ppar([
//god

		/*Pseq([/*~part5,*/*/

Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
				\freq, [659.255/8,639.255/8,619.255/8],\atk2,0),



				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),
		/*	],1),*/

			Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

				Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

					Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

			],1),


			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest],inf)),

			Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG2,
		\type,Pseq([\note,\note, \note,\note, \note,\rest,\note,\rest],inf),\out,~downdel,\group,~dispatchGrp),



		],1),


		Prand([
		Pbind(\instrument, \playBufS, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],32),


/*Pbind(\instrument, \playBuf2ToMixer, \out, ~limitBus1,\dur,Pseq([ 2/1],32),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~fusible, ~fusible,~fusible, ~fusible,~tofinalRythm, ~tofinalRythm,~tofinalRythm, ~tofinalRythm,~tofinalRythm, ~tofinalRythm,~tofinalRythm,~tofinalRythm].scramble,inf)
,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start}),\group, ~gateGrp11),*/



Ppar([

		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
			Pfunc({~start}) ,\out, ~shiftPlay,\vl,0.01),

			Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],42),\type,Prand([\rest,\note,\rest],inf), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1),

			/*Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no1b,\out,~toCom)*/

		],1),





Ppar([
Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],32),\buf,~pad,\tS,  0.39550810372374,\start,
			Pfunc({~start}) ,\out, ~shiftPlay2),



			Pbind(\instrument,\shiftExG, \in,~shiftPlay2,\out,  ~shiftDisto2 ,\group, ~filterGrp,\dur, Pseq([32/1],2),
				\triMod,Pseq([0.08046875,0.08046875/4],inf),\tS, 0.3955081037237,\hS,Pseq([400,800],inf)),

Pseq([


	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
	Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Ppar([

					Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([32/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

				],1)

			],1)




		],1),


		Ppar([
Pseq([
			Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),
				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
				Pbind(\instrument, \wNoise,\dur, Pseq([15/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),

				Pbind(\instrument, \wNoise,\dur, Pseq([79/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


				Pbind(\instrument, \playBufS, \dur,Pseq([  Pseq([1/1],8) , Pseq([1/4],24) ,Pseq([1/8],16)],1)  , \tS,  0.39550810370174,\buf,~kb2,\out, ~filKB,\loopy,0),


			],1),



				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),

			Pbind(\instrument, \gateS,\dur, Pseq([120/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)




		],1),


		Pbind(\instrument, \gateS,\dur, Pseq([128/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),




		Pseq([//maybe change to 12
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),
		Pbind(\instrument, \gateS,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),






	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],4),



		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],2),



		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),





Ppar([
				Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest],1)),

		Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34]/2)

			],1)



				],1),




],inf /*carefulll*/),],1),
	,

	// Pbind(\instrument,\stereo, \dur, 9999, \in, ~hitStereo  ,\spread,0.1,\out,~toCom,\tS, 0.39550810372374,\group, ~stereoGrp),



	//hum

	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/**4*/,\ph,4.1),


	Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.08 , \f2,0, \f3,0,  \ic_atk,0,\index,1,\mRatio,1,\out ,/*~flanToDisto2*/ ~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest],inf)),


	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],inf),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp)


],1))

/////////////////////////////////////////////

/*backup part2*/


(
Ppar([




	/*Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pfunc({3.rand}), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),*/

/*	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,3200,\rH,1320, \ph,1.4,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*~bassShap,*/

//FOR BG
/*	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),*/

/*	DOUBlon

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),*/
	/*Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,999,\ph,4.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,-0.4,\rH,0.4, \group, ~lfoGrp,\tS, 0.39550810372374),




	/*Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1300,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,700,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,700,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),*/
	//

/*	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),*/

/*	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,/* Prand([ */Pseq([3/1],inf)/* , Pseq([2/1],2)],inf)*/,\group,~lfoGrp ,\frq,Pfunc({20.6.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),*/

		/*Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 99999, \group, ~lfoGrp),*/


		/*Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),*/


	/*	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,0 ,\hS,1200,\modu, 0.001875*2 ,\ph,1.4),*/

	// Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-5),\out,~kbus),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),

	/*Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
*/

/*	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-15), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),*/

	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),






	/*Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareComp),

		Pbind(\instrument,\comp, \dur,inf,\thr,0.92 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.12,\ctrl,~snBus ,   \in, ~snareComp ,\out,~snareLimit,\group,~compGrp),

	/*Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),*/

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\out, ~toKbGate,\group, ~stereoGrp),*/







	Pbind(\instrument,\lfo13,\out, ~bus29,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\rL,4600,\rH,1160,\ph,2.2,\val,(~hzQbeat/16)),


Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),


/*Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),*/





	//will need setup variables

/*	Pseq([
	Pbind(\instrument,\rise,\dur,Pseq([64/1],4 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\type,Pseq([\rest,\rest\rest,\note],inf),\freq,[659.26,639.29,672.34]),

		Pbind(\instrument,\rise,\dur,Pseq([128/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1),
	],1),

			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,350,\crv,3.2),

	Pbind(\instrument,\envSli,\out, ~bus18,\dur,Pseq([128/1],inf),\tS, 0.39550810372374,\val1,350,\crv,3.2),*/


~kb,~hitX,~pedonk, ~fx,  ~justHit,

	//if below repeat maybe change to Pfunc

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toGate10, \start,

	Pseq([
			Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1) )],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	],inf)
	,\loopy,0,\tS,0.39550810372374,\dur,  Pseq([

			Pseq([ Pseq([4/1],1) ,Pseq([2/1],1) ],1) ,

Pseq([ Pseq([8/1],1)],1)  ,Pseq([ Pseq([4/1],1)],1)   ,Pseq([Pseq([16/1],1) ,Pseq([8/1],1)],1) ,Pseq([Pseq([32/1],1) ,Pseq([16/1],1)],1)

].scramble,inf)),




	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],inf),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,~absoFinalGate2

	,  \group, ~gateGrp6,\tS, 0.39550810372374),






/*	Pbind(\instrument, \gateS, \dur, Pseq([128/1],inf), \in,Pseq([/*~halfAbso21,*/~halfAbso22],inf), \out,~absoFinalGate2, \group,~eqGrp2,\tS, 0.39550810372374),*/


/*Pbind(\instrument,\gateSD, \dur,Pseq([64/1],inf),\in,  Pseq([ /*~absoFinalGate4,~absoFinalGate5,~absoFinalGate6,~absoFinalGate7,~absoFinalGate8~absoFinalGate,~absoFinalGate3,*/

		~absoFinalGate2



	].scramble, inf)  ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374,\out2, ~fusible10),*/
/*~part3d*/

	Pseq([

/*Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)*/



/*
	Pseq([~part3a,~part3a,~part3a,Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)],1)


		//have one ris

		,   	Pseq([ ~part3b , ~part3b/*  ~part3c, */ /*~part3e*/,~part3e,
			Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374),].scramble,1)*/



		~part3a,
		Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374),~part3b,~part3e,
		Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)

	].scramble,inf),


	Pwrand([

		Pbind(\instrument,\gateS, \dur, Prand([Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],1),
			\in,  ~toExtraFx  ,\out ,Pwrand([~tofinalRythm,~reverbSquelch],[16,1].normalizeSum,inf), \group, ~gateGrp7,\tS, 0.39550810372374),

		Pseq([
			Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),\in,~toExtraFx  ,\out ,~delayBus2 ,\group, ~gateGrp7,\tS, 0.39550810372374),

			Pbind(\instrument,\gateS, \dur, Pseq([1/1],1),\tS, 0.39550810372374,\type,\rest)

			],1)

	],[48,1].normalizeSum,  inf),


	],1).play(t)
)

~granuGrp=Group.new;
~revGrp=Group.after(~granuGrp);

Pseq([
Ppar([
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],64), \tS,  0.39550810372374,\buf,~kb2),
	~part5],1),Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810372374,\buf,~kb2)],1).play(t)


(
~part5= Ppar([
/*use for reboot fall

	Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),*/

	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downSG,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/8,639.255/8,619.255/8]),


	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG,
		\type,Pseq([\note,\note, \note,\note, \note,\rest,\note,\rest],inf),\out,~downdel,\group,~granuGrp)


	/*Pbind(\instrument,\pingD, \in, \out,\group,)*/


],1))


~part6=Synth( \pingD, [\in, ~downdel ,\bufnum,~delay2, \feedback,0.63 ,\out,0],~revGrp);





//YES
		Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,1,\f1, 1 , \f2,2, \f3,0,  \ic_atk,-3,\index,5,\mRatio,5,\out ,~flanToDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),


////////////////////////////////////////////////////////////

/*running2 backup*/




f = { |n=14, min=0, max=11| (min..max).scramble.keep(n) };
//~f2 = { |n=6, min=0, max=5| (min..max).scramble.keep(n) };
~rythmsP = f.value(5, 0, 5);


~rythmsP[2]

//sync up hat and cymbal maybe use above

//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd
//free delay (too choped/gated)

//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!
// Percu Dynamic EQ not quiet right
//RISE add more filtering
//comp10 might be overlapping
//plop noise in bass
//bass has too much high, blocks leads
//start noise reverb volume breaks somestimes good sometimes buzzkill
//unsync stereo no4

//chelou low freq noise wander in the project

//where to add the delay/reverb +

//final delay browken


~audio3.play
~hat2.play
~buf.play
~bufSnoopy.play

(//MUST RUN  ( ~buf.numFrames.rrand(320000)- 320000)
~rythm= ~leTout.numFrames/256* 220.rand  ;
~rythmB= ~leTout.numFrames/256* 220.rand;
~main1= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983 ) ;
~main2 =   ( ~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983) ;
~main3= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983)  ;

	~pass1 =(~buf.numFrames.rrand(400000)- 400000);~pass2=(~buf.numFrames.rrand(400000)- 400000);~pass3=(~buf.numFrames.rrand(400000)- 400000);~pass4=(~buf.numFrames.rrand(400000)- 400000);
/*~mster= (~leTout.numFrames/ 256 * 226.rand);
~mster2= (~leTout.numFrames/ 256 * 226.rand);*/
~mster3= (~leTout.numFrames/ 256 * 226.rand);
~mster3=  (~leTout.numFrames/ 256 * 226.rand);
~bssFreq1= 800.rrand(-140);~bssFreq2= 800.rrand(-140);~bssFreq3= 800.rrand(-140);
~r1= 3.rand;~r2= 3.rand;~r3= 3.rand;
~modHz=240.00.rand; ~carHz=140.00.rrand(10.00); ~noiLv=1.00.rrand(0.3); ~crv1=(-12.00).rrand(-4.00); ~crv2=(-12.00).rrand(-4.00); ~rel=0.0968.rrand(0.05); ~rel2=0.0968.rrand(0.05); ~modAmp=5000.00.rrand(1.00); ~modAmp2=5000.00.rrand(1.00);
~rythm1=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm2=[\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble; ~rythm3=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm4=[\rest,\rest,\rest,\note ,\note,\note ,\note, \rest].scramble;
	~rythmL = [\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble;

~start = ~start =~fkAr.numFrames.rrand(215000)-215000;


~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~no4S = ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000);





~ri1vlAtk=4.00.rand;~ri1f1=1.00.rand;~ri1f2=10.00.rrand(1);~ri1f3= 1.00.rand;~ri1ic_atk=10.00.rrand(-5);~ri1index=5.00.rrand(1);~ri1mRatio=3.rrand(1);~ri1fs=1.00.rand;
~ri2vlAtk=4.00.rand;~ri2f1=1.00.rand;~ri2f2=10.00.rrand(1);~ri2f3= 1.00.rand;~ri2ic_atk=10.00.rrand(-5);~ri2index=50.00.rrand(1);~ri2mRatio=3.rrand(1);~ri2fR=1.00.rand;
~ri3vlAtk=4.00.rand;~ri3f1=1.00.rand;~ri3f2=10.00.rrand(1);~ri3f3=1.00.rand;~ri3ic_atk=10.00.rrand(-5);~ri3index=50.00.rrand(1);~ri3mRatio=3.rrand(1);/*~ri3fR=1.00.rand*/




~perc1 = (~buf.numFrames.rrand(1400000)- 1400000);~perc2 = (~buf.numFrames.rrand(1400000)- 1400000);~perc3 = (~buf.numFrames.rrand(1400000)- 1400000);~perc4 = (~buf.numFrames.rrand(1400000)- 1400000);~perc5 = (~buf.numFrames.rrand(1400000)- 1400000);~perc6 = (~buf.numFrames.rrand(1400000)- 1400000);~perc7 = (~buf.numFrames.rrand(1400000)- 1400000);~perc8 = (~buf.numFrames.rrand(1400000)- 1400000);
~pHVal=1.2875.exprand(0.075); ~pHdecT=0.3872.rrand((-0.3872));~pHVal2=1.2875.exprand(0.075);~pHdecT2=0.3872.rrand((-0.3872));
~pHVal3=1.2875.exprand(0.075); ~pHdecT3=0.3872.rrand((-0.3872));~pHVal4=1.2875.exprand(0.075);~pHdecT4=0.3872.rrand((-0.3872));
~pHVal5=1.2875.exprand(0.075); ~pHdecT5=0.3872.rrand((-0.3872));~pHVal6=1.2875.exprand(0.075);~pHdecT6=0.3872.rrand((-0.3872));
~pHVal7=1.2875.exprand(0.075); ~pHdecT7=0.3872.rrand((-0.3872));~pHVal8=1.2875.exprand(0.075);~pHdecT8=0.3872.rrand((-0.3872));
~pSub =0.5.rrand(0.2,1);~pAtkT=0.10.rrand(0.01);~pDecT =  0.3.rrand(0.8,0.3);~pSubT = 0.3.rrand(0.2);~pRelT=0.22.rrand(0.1,1);~pAtkC=6.rrand(1,1);~pDecC=(-4).rrand(-0.1);~pRelC=(-8).rrand(-2,1);
~pvlAtk =0.1.rrand(0.01);
~pSub2 =0.5.rrand(0.2,1);~pAtkT2=0.10.rrand(0.01);~pDecT2 =  0.3.rrand(0.8,0.3);~pSubT2 = 0.3.rrand(0.2);~pRelT2=0.22.rrand(0.1,1);~pAtkC2=6.rrand(1,1);~pDecC2=(-4).rrand(-0.1);~pRelC2=(-8).rrand(-2,1);
~pvlAtk2 =0.1.rrand(0.01);
~pSub3 =0.5.rrand(0.2,1);~pAtkT3=0.10.rrand(0.01);~pDecT3 =  0.3.rrand(0.8,0.3);~pSubT3 = 0.3.rrand(0.2);~pRelT3=0.22.rrand(0.1,1);~pAtkC3=6.rrand(1,1);~pDecC3=(-4).rrand(-0.1);~pRelC3=(-8).rrand(-2,1);
~pvlAtk3 =0.1.rrand(0.01);
~pSub4 =0.5.rrand(0.2,1);~pAtkT4=0.10.rrand(0.01);~pDecT4 =  0.3.rrand(0.8,0.3);~pSubT4 = 0.3.rrand(0.2);~pRelT4=0.22.rrand(0.1,1);~pAtkC4=6.rrand(1,1);~pDecC4=(-4).rrand(-0.1);~pRelC4=(-8).rrand(-2,1);
~pvlAtk4 =0.1.rrand(0.01);
~pSub5 =0.5.rrand(0.2,1);~pAtkT5=0.10.rrand(0.01);~pDecT5 =  0.3.rrand(0.8,0.3);~pSubT5 = 0.3.rrand(0.2);~pRelT5=0.22.rrand(0.1,1);~pAtkC5=6.rrand(1,1);~pDecC5=(-4).rrand(-0.1);~pRelC5=(-8).rrand(-2,1);
~pvlAtk5 =0.1.rrand(0.01);
~pSub6 =0.5.rrand(0.2,1);~pAtkT6=0.10.rrand(0.01);~pDecT6 =  0.3.rrand(0.8,0.3);~pSubT6 = 0.3.rrand(0.2);~pRelT6=0.22.rrand(0.1,1);~pAtkC6=6.rrand(1,1);~pDecC6=(-4).rrand(-0.1);~pRelC6=(-8).rrand(-2,1);
~pvlAtk6 =0.1.rrand(0.01);
~pSub7 =0.5.rrand(0.2,1);~pAtkT7=0.10.rrand(0.01);~pDecT7 =  0.3.rrand(0.8,0.3);~pSubT7 = 0.3.rrand(0.2);~pRelT7=0.22.rrand(0.1,1);~pAtkC7=6.rrand(1,1);~pDecC7=(-4).rrand(-0.1);~pRelC7=(-8).rrand(-2,1);
~pvlAtk7 =0.1.rrand(0.01);
~pSub8 =0.5.rrand(0.2,1);~pAtkT8=0.10.rrand(0.01);~pDecT8 =  0.3.rrand(0.8,0.3);~pSubT8 = 0.3.rrand(0.2);~pRelT8=0.22.rrand(0.1,1);~pAtkC8=6.rrand(1,1);~pDecC8=(-4).rrand(-0.1);~pRelC8=(-8).rrand(-2,1);
~pvlAtk8 =0.1.rrand(0.01);


~ouai=~leTout2.numFrames/256* (220.rand);
~ouai2=~leTout2.numFrames/256* (220.rand);


~bangVar = (~leTout.numFrames/ 256 * 145.rand);
~first=  ~leTout2.numFrames/ 256 * 222.rrand(1);
		 ~second= ~leTout2.numFrames/ 256 * 222.rrand(1);
~noiseFrq = 3000.rrand(180); ~noiseFrq2 = 3000.rrand(180); ~noiseFrq3 = 3000.rrand(180); ~noiseFrq4 = 2500.rrand(180);


~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");
// ~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated-01.wav");
)



(

~lfoGrp  = Group.new;

~ptrGrp0 = Group.after(~lfoGrp);
~recGrp0 = Group.after(~ptrGrp0);


~granuGrp= Group.after(~recGrp0);
~phaserGrp =  Group.after(~granuGrp);
~distoGrp =  Group.after(~phaserGrp);
~dispatchGrp = Group.after(~distoGrp);
~filterGrp  = Group.after(~dispatchGrp);
~distoGrp0 =  Group.after(~filterGrp);
~gateGrp12= Group.after(~distoGrp0);

~eqGrp0 = Group.after(~gateGrp12);
~distoGrp2 =  Group.after(~eqGrp0);

~gateGrp =  Group.after(~distoGrp2);
~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~gateGrp2 =  Group.after( ~granGrp);




~revGrp = Group.after(~gateGrp2);
~eqGrpplus = Group.after(~revGrp);
~delayGrp = Group.after(~eqGrpplus);
~eqGrp = Group.after(~delayGrp);
~dispatchGrp1 = Group.after(~eqGrp);
~filterGrp2  = Group.after(~dispatchGrp1);


~compGrp = Group.after(~filterGrp2);
~delayGrp2 = Group.after(~compGrp);
~combGrp = Group.after(~delayGrp2);
~limitGrp = Group.after(~combGrp);
~gateGrp8= Group.after(~limitGrp);
~gateGrp9= Group.after(~gateGrp8);
~stereoGrp = Group.after(~gateGrp9);
~dispatchGrp2 = Group.after(~stereoGrp);

~gateGrp3 = Group.after(~dispatchGrp2);

~finalDispatchGrp= Group.after(~gateGrp3);

~shifGrp= Group.after(~finalDispatchGrp);
~limitGrp2 = Group.after(~shifGrp);
~gateGrp4 = Group.after(~limitGrp2);
~gateGrp5 = Group.after(~gateGrp4);
~compGrp2 = Group.after(~gateGrp5);
~gateGrp10 = Group.after(~compGrp2);
~gateGrp6 = Group.after(~gateGrp10);
~eqGrp2 = Group.after(~gateGrp6);
~recGrp2= Group.after(~eqGrp2);
~gateGrp7 = Group.after(~recGrp2);
~extraDelay= Group.after(~gateGrp7);
~extraRev= Group.after(~extraDelay);
~compGrp4 = Group.after(~extraRev);
~eqGrp4 = Group.after(~compGrp4);
~limitGrp4 = Group.after(~eqGrp4);
~stereoGrp4 = Group.after(~limitGrp4);
~gateGrp11 = Group.after(~stereoGrp4);
~shiftGrpEx = Group.after(~gateGrp11);
~distoGrpEx = Group.after(~shiftGrpEx);
~eqGrpEx = Group.after(~distoGrpEx);
~revGrpEx = Group.after(~eqGrpEx);
~compGrpEx = Group.after(~revGrpEx);
~limitGrpEx = Group.after(~compGrpEx);
~stereoGrpEx = Group.after(~limitGrpEx);
~compGrp5 = Group.after(~stereoGrpEx);
~eqGrp3=Group.after(~compGrp5);
~dynaEq= Group.after(~eqGrp3);
~stereoGrp5 = Group.after(~dynaEq);
~compGrp6 = Group.after(~stereoGrp5);
~kbGate= Group.after(~compGrp6);
~recGrp3= Group.after(~kbGate);



o = {


	Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));


	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));//DONT DELETE


	Out.kr(~bus14,SinOsc.ar(0.6).range(1.5,0.27));

	//super important for gran modu
	/*Out.kr(~bus18, /* Lag.kr(*/LFNoise0.kr(1.2875).range(0.15,0.0)/*,0.05)*/
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0,4))*/

}.play;

)


~base.play(t,quant:1)
(

~base = Ppar([


/*	Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp0,\dur,inf),

	Pseq([
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/4],16),\pitchRte,Pfunc({6.rrand(0.1)}),\impulse,0.03,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \busMod,~bus18 ),//16

		Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],inf),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub),\pitchRte,Pfunc({8.rrand(0.1)}) ),],inf),*/



//??
/*	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1720, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),




//??
	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),*/



	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus24 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,(-0.8),\rH,(-0.08), \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus25 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,0.8,\rH,0.08, \group, ~lfoGrp,\tS, 0.39550810372374),*/





/*GOOD CONCEPT
	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),*/




	/*Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\modu, 0.001875 ,\ph,1.4),*/



	// Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-5),\out,~kbus),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),

/*	Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~k2,\out, ~kbus,\loopy,0,\start,0),*/

	/*Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),*/


	/*Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),*/


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),


/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 1/4,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~limitHat,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.001, \rel ,0.04840,\gain,3.5,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~limitCymb,\group, ~compGrp),


	Pbind(\instrument ,\EQHP2Dyna, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~delayGrp2, \out,~limitHat    ,\vol,4,\ctrl,~fusible10 ,\valD,3100, \quantD,4),

	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~delayGrp2,\out , ~limitCymb    ,\vol,4),

Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.3872,\ctrl,~snBus ,   \in, ~comFuzz22 ,\out,~toKbGate,\group,~eqGrp2),*/




	/*Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), \out , ~snareComp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.92 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.12,\ctrl,~snBus ,   \in, ~snareComp ,\out,~snareLimit,\group,~compGrp),

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\out, ~toKbGate,\group, ~stereoGrp),*/

//HERE

	Pseq([


	Pbind(\instrument,\gateS, \dur, Pxrand([ /*Pseq([4/1],16), Pseq([8/1],8) */ Pseq([12/1],1)  ],1)
		,\in,Pseq([ /*~newCOn,*//*~new10*/~no1 ],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

Pxrand([

	Pbind(\instrument,\gateS, \dur,Pseq([64/1],1)
				,\in, ~no3,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([56/1],1)
			,\in, ~no3 ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),


				Pbind(\instrument,\gateS, \dur,Pseq([4/1],1),\in, ~no3  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([6/1],1),\in,~no1 /*~new10*//*~newCOn*/  ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in,~no1/*~new10*/ /*~newCOn*/  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374),].scramble,1)
		],1),



		//to chnage for final
		/*Pbind(\instrument,\gateS, \dur,Pseq([4/1],16)
			,\in,Pseq([~percuCom2 ,~vocToDispatch,~percuCom2,~comSnaGrpBus2,/*~rndBus,~rndBus,*/~no2,~no2,~no2,~no2
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)*/


Pbind(\instrument,\gateS, \dur,Pseq([2/1],2)
			,\in,Pseq([/*~percuCom2 ,*/~vocToDispatch,~percuCom2,~comSnaGrpBus2,~tam,
				/*~rndBus,~rndBus,*/~no2/*,~no2,~no2,~no2*/
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)


	].scramble,inf),


	//for record
/*Pbind(\instrument, \gateS, \dur,   Pseq([262/1],inf) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/




	Pseq([

		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,/*~toGate10*/0,\group,~gateGrp5),


//PASSANT DisAABLE FOR RISE INIT
		Pseq([
//maybe no rrepeat wiht this one
		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start,~pass1 ,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([10/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass2,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start,~pass3,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\start,~pass4,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1),


			/*Pseq([
				Pbind(\instrument, \gateS, \dur,   Pseq([32/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),
		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],2),

				Pbind(\instrument, \gateS, \dur,   Pseq([64/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),

				].scramble,1),


		Pbind(\instrument, \gateS, \dur,   Pseq([256/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom)*/

].scramble,inf),


	/*Pwrand([

	//here

Pbind(\instrument,\gateS, \dur, Prand([/* Pseq([4/1],4),Pseq([1/1],4),*/ Pseq([1.5/1],1), Pseq([3/1],1),/*Pseq([1/3],1) ,*/Pseq([1/1],1),
		/*Pseq([4/1],1)*/],1),
		\in, ~toGate10   ,\out ,Pwrand([0/*~eqBus10*/,

	~reverbSquelch],[16,1].normalizeSum,inf)

	,  \group, ~gateGrp6,\tS, 0.39550810372374),

Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),
		\in, ~toGate10 ,\out ,~delayBus2 ,\group, ~gateGrp6,\tS, 0.39550810372374),


			Pbind(\instrument,\gateS, \dur, Pseq([2/1],1),\tS, 0.39550810372374,\type,\rest)

			],1)
	],[16,1].normalizeSum,  inf),*/

],1))

s.scope
Ppar([~base, ~kb],1).play(t,quant:1)
~kb.play(t);
.stop
(~kb =
Ppar([

	Pbind(\instrument,\lfo13T, \out, ~bus31, \val, 0.1609375,  \rL,2370,\rH,4000, \ph, 4.4, \dur, Pseq([16/1],inf), \tS,  0.39550810372374) ,


		Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \wNoise2, \durF,0.1936,\dA,2,\dur,  Pseq([1/2], inf),\atk, 1,\out, ~slideBus,\tS,  0.39550810372374
		,\type,Pseq([Pseq([\rest],16), Pseq([\rest,\note,\rest,\rest,\rest,\note,\rest,\rest],8),Pseq([\rest],64)],inf),\valStart,14000),



	Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.05,\tS,  0.39550810372374),

	Pbind(\instrument,\kick,\dur,Prand([ Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1) ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.003,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte, (-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.04,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.001,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.003,\pos,0.04,\tS,  0.39550810372374)


	],inf),

	Pbind(\instrument, \gate ,\vlSub,1,\vlSub2, Pkey(\vlSub),\dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out,Prand([~lpK,~bpK,~hpK],inf),\tS,  0.39550810372374),


	Pbind(\instrument, \filter, \freqFil,100,\dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp,\qf,0.6 ),

Pbind(\instrument, \filter, \freqFil,100,\dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \freqFil,100,\dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\qf2,0.4,/*\bus7,~bus7, */\out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 30, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),

	Pseq([
	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],1), \out,~dipatchKB, \freq,~bssFreq1, \group,~shifGrp,\tS, 0.39550810372374,\vl,0.8),

		Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],1), \out,~dipatchKB, \freq,~bssFreq2, \group,~shifGrp,\tS, 0.39550810372374,\vl,0.006),

	],inf),


	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,100,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
	],1),


	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),




		Pbind(\instrument, \playBuf,  \tS,  0.39550810372374, \rte, (-4.4),	\buf,~snare,\type,
		Pwrand([Pseq([\note ,\rest,\rest,\rest] ,1),Pseq([\rest ,\note,\rest,\rest] ,1),

			Pseq([\rest ,\rest,\rest,\rest] ,1)

	],[1,1,128].normalizeSum,inf),\dur, Pseq([1/2], inf),\out,~snareEQ),

	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,	\buf,~snare,\type,
		Pwrand([Pseq([\note ,\rest,\rest,\rest],1), Pseq([\rest ,\rest,\rest,\rest],1) ],[2,1,32].normalizeSum,inf)  ,\dA,Pseq([0.25],inf),\dur, Pseq([1/2], inf),\out,~snareEQ),

	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,
		\type,
		Pseq([	Pseq([\rest],8),Pseq([

 Pseq([\rest,\rest,\rest,\rest ],32),

		Pseq([

				Pseq([\rest ,\rest,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
						\rest ,\rest,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest
					],1),

				Pseq([\rest ,\rest,\note,\rest,\rest,\note,\rest,\rest,
						\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,

					],4),
   Pseq([\rest ,\rest,\note,\rest] , 98),//was 96
				Pseq([\rest,\rest,\rest,\rest],24)],1),    Pseq([\rest,\rest,\note,\rest ],128),  ],inf)  ],1)


		//l embrouille
	,\dur, Pseq([1/2], inf) ,\out,~snareEQ,
	\dA,Pseq([  Pseq([1],32), Pseq([0.5],32)],inf)),


//for future
	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([ Pseq([ \rest],64),Pseq([ Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 128 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],256) ],inf),\dur,Pseq([1/4],inf )],1),\stereoL, 0.00555,\out,    ~cymbalEq),



	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~comBusHat,\type, Pseq([Pseq([ \rest],64) , Pseq([ Pseq([ \note],1024),Pseq([\rest],128)],inf)],1))
	,

	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~kb2,\out, ~toKbGate,\loopy,0),


/*Pseq([
	Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),

		Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythmB,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),



],inf),*/


	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,1600,\val2,(-40),\crv,-3.2),


	Pbind(\instrument, \filter10,\freqFil,600 ,\busMod,~bus21 ,\in,~rythmFil,\which,0,\qf,0.75, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),

	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~rythmLimit, \group,~eqGrp,\vol,4,\val,320,\quant,4, \gain,(-16)),

/*	Pbind(\instrument, \limiter10toMixer,\c20,1,\name,30, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,40, \group, ~limitGrp),*/

	Pbind(\instrument,\comp10, \dur,inf,\thr,0.9 ,\sB, 1.08,\sA, 1/2,\atk ,0.001, \rel ,0.3872,\dur,9999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, ~toKbGate,\group, ~compGrp2 ,\tS, 0.39550810372374),




		/*Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


// BG
		Pbind(\instrument, \gate, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus2,\tS, 0.39550810372374),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 8/1],1), \type, \rest),
],inf),*/




		/*Pxrand([


			Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

		],1),


				Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		].scramble,1)
				],1),

		],inf),*/



	/*Pbind(\instrument,\stereo, \dur, 9999, \in, ~slideBusToStereo  ,\spread,0.4,\out,~toKbGate,\tS, 0.39550810372374,\group, ~stereoGrp),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~toStereoRise  ,\spread,0.1,\out,~toKbGate/*~gateRise*/,\tS, 0.39550810372374,\group, ~stereoGrp),*/
Pseq([
	Ppar([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest)
			],1),


		Pseq(~steady=[

			Pseq([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([15/1],1),\type,\rest)
			].scramble,1),

			Pseq([
Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([15/1],1)),
			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810370174,\dur, Pseq([1/1],1))].scramble,1),
			].scramble,2),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,\dur, Pseq([8/1],1)),

						Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810370174,\dur, Pseq([8/1],1))].scramble,1),
					],1),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([16/1],1)),

				Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([2/1],1))].scramble,1),
				],2),

			Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,\dur, Pseq([8/1],1)),

						Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810370174,\dur, Pseq([8/1],1))].scramble,1),
		],1)],1),Pseq( ~steady.reverse,1),
	~jumpy= Pseq([
	/*Pseq([*/



			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([16/1],1)),


			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([16/1],1)),
Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([15/1],1)),


			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([1/1],1))].scramble,1),


			].scramble,1),



		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([3/1],1)),

				Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),

			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([1/1],1))].scramble,1),


			].scramble,1),

	Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),


		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([7/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([7/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810370174),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK],inf), \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1),


			Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([6/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810370174,
		\dur, Pseq([6/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810370174),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK],inf), \group, ~kbGate, \tS,  0.39550810370174,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1)

].scramble,2),
		Pseq(~steady.reverse,1),
		~breakPart1,/*~breakPart2,*/ ~jumpy

		/*Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999)*/










	],1),







	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/


	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~recGrp3,\dur, inf),

],1))

Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus2 ,\dur,999,\ph,0, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),


	//why was it commented out
	Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,1.4, \rL,1500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,Pseq([3/1],inf),\group,~lfoGrp ,\frq,Pfunc({5.15.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2Eq,\group, ~distoGrp0),



	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp,\tS, 0.39550810372374),


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374),


//no limiter
/*	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({(~leTout.numFrames/ 256 * 222.rand)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),*/

	Prand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
\vl,0.162
	),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],inf),


	/*Pbind(\instrument,  \stereoS, \in,~vocToStereo,  \out,~vocToDispatch , \dur,9999, \spread, 0.8.rrand(0.1),\tS,  0.39550810372374,\group,~stereoGrp),*/


//rythm needs to evolve
Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out, ~distoPercu/*~no4ToGate2*/

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),


	/*Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out,~micBus

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),*/



	/*Pbind(\instrument, \gate, \vlSub,1,\vlSub2, Pkey(\vlSub),\dur,Pseq([4/1],inf),\tS, 0.39550810372374,\out,~distoPercu,\in,Prand([~no4ToGate2,~no4ToGate],inf),\group,~phaserGrp),*/

	/*Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({~spread = 1.rand}),\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,~panning = 0.1.rrand(-0.1),\modPan, ~bus24),*/

	/*Pbind(\instrument,\stereoX1, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,1,\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,0.3,\modPan, ~bus25),*/


],1))

(~track = Ppar([ ~base, ~hitX, ],1).play(t,quant:1))


/*BELL EXAMPLE MEASURE

Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,0 /*~bellFlang*/,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)*/

~hitX.play(t)
~hitX.stop;
(~hitX=

Ppar([


		Pbind(\instrument, \lfo13T, \val,0.084,\dur,Pseq([32/1],inf),\rL,0.084,\rH,1.2875 ,\out,  ~bus26, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,4.4),


	//??
	Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),
//



		Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1200,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,600,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,600,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

		Pbind(\instrument, \envSli, \val1,50, \val2, 5600, \dur, Pseq([1/1],inf),\out, ~bus8,\tS, 0.39550810372374),

/*below not working copz \modu instead of \val*/
	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\modu,

		0.001875/**4*/,\ph,1.42),


	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~bus27,\rL,1500 ,\rH,4200,\modu,

		0.001875/**4*/,\ph,1.42),







/*
	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,0 ,\hS,1200,\modu, 0.001875*2 ,\ph,1.4),*/

		Ppar([

			/*Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,~ri1vlAtk ,\f1, ~ri1f1 , \f2, ~ri1f2 , \f3,~ri1f3,  \ic_atk,~ri1ic_atk,\index,~ri1index,\mRatio,~ri1mRatio,\out ,~bellFlang2,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\atk,1, \fS,~ri1fs),*/




		Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.004 , \f2,0.001, \f3,0.00001,  \ic_atk,-3,\index,151,\mRatio,5,\out ,~flanToDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),

		/*Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk, ~ri2vlAtk,\f1, ~ri2f1 , \f2, ~ri2f2 , \f3, ~ri2f3,  \ic_atk,~ri2ic_atk,\index,~ri2index,\mRatio,~ri2mRatio,\out ,Prand([~bellFlang4, ~riToDisto2],inf),\tS, 0.39550810372374, \fR,~ri2fR, \moduR,~mod1,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/
	//~bellFlang4
		Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk,-1 ,\f1, 0.001 , \f2, 0.03 , \f3,0,  \ic_atk,4,\index,9,\mRatio,1,\out ,~bellFlang4,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),

/*Pbind(\instrument,\rise,\dur,Pseq([1/1],inf/*64*/),\vlAtk, ~ri3vlAtk,\f1, ~ri3f1 , \f2, ~ri3f2 , \f3, ~ri3f3,  \ic_atk,~ri3ic_atk,\index,~ri3index,\mRatio,~ri3mRatio,\out ,Prand([~bellFlang3, ~riToDisto3],inf),\tS, 0.39550810372374,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/

		Pbind(\instrument,\rise,\dur,Pseq([1/1],inf), \vlAtk,0 ,\f1, 0.01 , \f2, 0.3 , \f3,0.01,  \ic_atk,4,\index,140,\mRatio,0.1,\out ,~bellFlang3,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })


],inf),


Pseq([
		Pseq([
					Ppar([

				Pxrand([

							/*Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),*/
					/*	Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/



			Pbind(\instrument, \playBufS,\buf,~bell2,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([8/1],1 ),\vl,1 )
						],1),



			/*	Pbind(\instrument,\filterX,  \freqFil,~noiseFrq,\in,~filterNoise,\out, ~noiseToMixA, \group,~filterGrp,\dur, Pseq([8/1],1),\tS, 0.39550810372374)*/],1),





			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([56/1],1),\tS, 0.39550810372374 )


		],1),

		Pseq([
			Pxrand([
				Pseq([
					Ppar([

				Pxrand([

						/*	Pbind(\instrument, \wNoise,\dur, Pseq([3/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
*/

						/*	Pbind(\instrument, \percussion, \dur,Pseq([3/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/
							Pbind(\instrument, \playBufS,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([3/1],1))

							,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],3) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
						],1),

			/*	Pbind(\instrument,\filterX,  \freqFil,~noiseFrq2,\in,~filterNoise,\out, ~noiseToMixB, \group,~filterGrp,\dur, Pseq([4/1],1),\tS, 0.39550810372374)*/],1),

					Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([13/1],1),\tS, 0.39550810372374 )
				],1),

Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),
			],1),

			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([48/1],1),\tS, 0.39550810372374 )

		],1),

		Pseq([


			Ppar([
				Pxrand([

					/*	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),*/
						/*Pbind(\instrument, \percussion, \dur,Pseq([2/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/


Pbind(\instrument, \playBufS,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([2/1],1))

					,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/2],4) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)

				],1),
		/*	Pbind(\instrument,\filterX,  \freqFil,~noiseFrq3,\in,~filterNoise,\out, ~noiseToMixC, \group,~filterGrp,\dur,Pseq([2/1],1),\tS, 0.39550810372374,\vol,0.7)*/],1),


			Pbind(\instrument, \gateS, \group,~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([62/1],1),\tS, 0.39550810372374 )
		],1),




Ppar([

			/*Pseq([
			Pxrand([Pbindf(~bang ,\dur, Pseq([8/1],1)) ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([8/1],1))],1),

		/*	NEVER

			Pbind(\instrument, \trippyRise, \dur,  Pseq([56/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),*/



			],1),

			Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(80)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([8/1],1),\tS, 0.39550810372374),*/





			Pseq([


			Ppar([Pxrand([
					/*Pbindf( ~bang ,\dur, Pseq([1/1],1))  ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([1/1],1))*/
					~hit2,
				/*	Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),*/
						/*Pbind(\instrument, \percussion, \dur,Pseq([1/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),*/


						Pbind(\instrument, \playBufS,\buf,~bell2,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),



						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],1) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
				],1),
			/*	Pbind(\instrument,\filterX,  \freqFil,~noiseFrq4,\in,~filterNoise,\out, ~noiseToMixD, \group,~filterGrp,\dur,Pseq([1/1],1),\tS, 0.39550810372374)*/],1),

/*	Pbind(\instrument, \wNoise,\dur,Pseq([15/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),


		Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/
			Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),








/*Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374, \fR,Pfunc({1.00.rand}), \moduR,~mod1,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk,0.4,\f1, 1 , \f2,1, \f3,0.001,  \ic_atk,4,\index,1,\mRatio,3,\out ,~riToDisto,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })

		],1),

		],inf),




/*	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo3  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate2,\tS, 0.39550810372374,\group, ~stereoGrp),


Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo2  ,\spread,0.2,\out,~riToGate3,\tS, 0.39550810372374,\group, ~stereoGrp),*/





	Pbind(\instrument, \gateS, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],inf), \in,Prand([~riToGate,~riToGate3,~riToGate2],inf)  ,\out,~risesGate , \group,~dispatchGrp2,\tS, 0.39550810372374,),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo2  ,\spread,0,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~noiseToStereo ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus4   ,\out, ~gateRise, \group, ~stereoGrp),


Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),





		Prand([
		Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,
			Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note,

				\note,\note,\rest,\rest,\note,\note,\note,\rest
			],inf),
		\in,  ~gateRise ,\out ,~toGate102,\group, ~gateGrp10,\tS, 0.39550810372374),


		Pbind(\instrument,\gateS, \dur,Pseq([3/1],1),\in, ~gateRise  ,\out ,~toGate102 ,\group, ~gateGrp10,\tS, 0.39550810372374),
				],inf)

],1);
)

~sequ.play(t)
~t = Ppar([~base, ~sequ],1).play(t,quant:1)
.stop
(
~sequ =
Ppar([

	Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 9999, \group, ~lfoGrp),

Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 80000,\tS, 0.39550810372374,\loo,0),


	Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,
	\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loo,0),

	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~eqBus2x,\impulse,0.003,\start, 0,\tS, 0.39550810372374,\loo,1),

/*Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+s.sampleRate*t.beatDur).exprand(~main2)}),\buf,~bufSnoopy/,\out, ~eqBus2x,\loopy,0)],inf),*/

	Pwrand([
		Pbind(\instrument, \gateX2,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in, ~gateBus3,\out,~revBus1,\group, ~gateGrp),

		Pbind(\instrument, \gate,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374,\in, ~gateBusB,\out,~revBus2,\group, ~gateGrp,\vlSub,0.8,\vlSub2,Pkey(\vlSub)),

		Pxrand([
		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,~reverbBus,

		\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
			\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,  ~gateBus,\out,
   ~reverbBus, \tS, 0.39550810372374,\group, ~gateGrp,\atkC,9.00.rrand(2),	\atkT,1, \decT,0),

		Pbind(\instrument, \gate ,\in,  ~gateBus ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~reverbBus,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus),
],1)

	],[2,2,1].normalizeSum,inf),

	/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),*/

	/*Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~sterBus2   ,\out,~no1, \group, ~stereoGrp,\center,0,\tS, 0.39550810372374),
*/

],1)

)

~mainLead.play(t)
Ppar([~base, ~mainLead],1).play(t,quant:1)
~mainLead.stop;
(~mainLead =

Ppar([



	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),



	Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, ~f2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,0.8,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),









	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~filterRnd,\impulse,0.003,\start, 600000,\tS, 0.39550810372374 ,\loo,1),



	Prand([
		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~distoGrp2,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~micBus33),


Pbind(\instrument,\gate,\dur,Pxrand([ /*Pseq([1/4],1),*/Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~micBus33,\group, ~distoGrp2,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),


		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~distoGrp2, \out,Pwrand([~micBus23,~micBus33],[1,1].normalizeSum,inf),\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)),

	].scramble,inf),

	Pxrand([

	Prand([
		Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([1/3],3),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

				Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([3/1],1),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
					\vlSub,Pfunc({1.exprand(0.9)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}))

		],1),

Pseq([

		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~micBus33,\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~reverbBus23,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)),



Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


				Pbind(\instrument, \gate ,\dur, Pseq([  Pseq([2/1 ],1), Pseq([0.75/1 ],1), Pseq([1/1],1)].scramble,1),\in,~main1GToG ,\group,~gateGrp2 ,\out,~reverbBus23,\vlDec,3,\vlSub,3,\vlAtk,0, \vlSub2,Pkey(\vlSub),\tS, 0.39550810372374)


].scramble,1),


	]/*,[2,2,1].normalizeSum*/,inf),


/*	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \center, Pfunc({0.1.rrand(-0.2)}),\in, ~toStereoFlo   ,\out, ~no3, \group, ~stereoGrp,\tS, 0.39550810372374),*/


	/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out,~no3, \group, ~stereoGrp),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~limitRkick2   ,\out,~no3, \group, ~stereoGrp),*/

 ],1)

)


/*~t = Ppar([~passant, ~base],1).play(t,quant:1);
~passant.play(t);
.stop
(~passant=

	Ppar([
	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass1  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass2  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),],1);

	)*/


~fx.play(t)
Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([

//maybe add a limiter
	/*	Pbind(\instrument, \pingD, \in, ~delayBus2 ,\bufnum, ~delayX, \feedback,0.43 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),*/

		/*Pbind(\instrument, \del ,\in, ~delayBus2 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),



	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~delayEq, \out,~delToStereo,\group, ~eqGrp3, \frq, 300,\vol,0.4),*/

	Pbind(\instrument,\stereoS, \dur,Pseq([8/1],inf), \in, ~delToStereo   ,\out,~toCom,\spread,1, \center, Prand([ Pfunc({0.8.rrand(0.4)}),Pfunc({-0.8.rrand(-0.5)})],inf),\group,~stereoGrp4,\tS, 0.39550810372374),


	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus3b   ,\out,~tofinalRythm,\spread,1, \group, ~stereoGrp4),



	/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
	,\in, ~newCOn2  ,\ctrl, ~snBus, \out,~eqBus310,\group,~compGrp5,\tS, 0.39550810372374)*/

],1))
Ppar([~kb,~pedonk],1).play(t)
~pedonk.play(t)
.stop
(~pedonk =Ppar([

	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 80000,\tS, 0.39550810372374 ,\vlSub,  1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,0,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
		~eqBus2x,\impulse,0.003,\start, 600000,\tS, 0.39550810372374,\loo,1),

//rework something harmonieu
	/*Pbind(\instrument,\playBufXG,\dur, Pseq([Pseq([1/8],2), Pseq([1/4],1),Pseq([1/2],1),Pseq([1.25/1],1) ].scramble,inf),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,\loopy,0,\vlDec,Pseq([ Pseq([1],98), Pseq([0.5],32)],inf)    ),*/

Prand([
Pbind(\instrument,\playBufXG,\dur, Pseq([Pseq([1/8],12), Pseq([1/4],1),Pseq([1/2],1)/*,Pseq([1.25/1],1) */].scramble,1),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,\loopy,0,\vlDec,Pseq([ Pseq([1],64), Pseq([0.125],32), Pseq([0.5],32)   /*,Pseq([0.21],32)*/],inf),\type,Prand([ \note,  Pseq([\rest,\note],16) ],inf)  ),


	Pbind(\instrument,\playBufXG,\dur, Pseq([1/4],4),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,\loopy,0,\type,Prand([ \note,  Pseq([\rest,\note],16) ],inf)  )],inf),


Pwrand([
		Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([Pseq([2.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBusB,\tS, 0.39550810372374,\group, ~gateGrp,\out, ~revBus2),

	Prand([

			Prand([
	Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),

				Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
					Pseq([1/4],6)  ,Pseq([1/4],5)],1),\type, Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note],inf),
				\in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),
			],1),

			Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1)

		],5),

	],[2,8].normalizeSum,inf),

	Pwrand([
	Pbind(\instrument,\gateS, \in,~deadS, \out,0, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),
		Pbind(\instrument,\gateS, \in,~no1, \out,  ~part2Fuzz, \group,~dispatchGrp2,\dur,Pseq([7.75/1],1),\tS, 0.39550810372374  ),

	],[1,16].normalizeSum,inf),


	Pseq([

		Prand([
		Pbind(\instrument,\playBufXG, \dur,Pseq([3.75/1],1),\amp, 1,\buf,~lpPrec,\out,~eqBus4,\impulse,0.003,\start,~st2 ,\tS, 0.39550810372374,\vlDec,~pSub ,\vlSub,  ~pSub,\vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT+0.14 ,	\subsT, ~pSubT+0.1 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )


		],1),


				Pbind(\instrument,\gateS, \in,~part2Fuzz, \out,~absoFinalGate, \group,~gateGrp3,\dur, Pseq([56.5/1],1),\tS, 0.39550810372374  ),    // was 60.25 -3.75



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )

		],inf)
],1))


(Pbind(\instrument, \recLoop102,\buf,~leTout,\recording,1, \in,0,\group, ~recGrp3,\dur,inf).play(t, quant:1))

(Pbind(\instrument, \recLoop102,\buf,~leTout2,\recording,1, \in,~absoFinalGate2,\group, ~recGrp3,\dur,inf).play(t, quant:1))


~leTout.free
~leTout.play
~bufBg.play
~buf.play
~bufSnoopy.play
~leTout2.play

s.scope


//backup break

				//from here



		Synth(\EQHP2,[ \in,~bassEq, \out,~kbToPan4,\frq, 20.6,\vol,1,	\val,659.255, \quant,1.1, \gain,(-16),
\val2,1318.51, \quant2,2, \gain2,(-8),\val3,2637.02, \quant3,1, \gain3,(-7),\val5,164.81375, \quant5,1, \gain5,(-14)],~eqGrp0);



		Synth(\filterS, [\in, ~toFilRise, \out, ~toCom   ,\which,2, \qf2,0.4, \busMod,~bus30,/*\freqFil,60*/],~compGrp4);



~brkFil = Synth(\filter,[\freqFil,10, \which,2,\qf2,0.7,\busMod,~bus32,\in,~filKB,\out,~kbToPan5],~filterGrp);


		Synth( \pan2,[ \in,~kbToPan5,\out,0 ],~stereoGrp);

		Synth( \pan2,[ \in,~kbToPan4,\out,~toFilRise ],~stereoGrp);

		~revKick2=Synth(\reverbMad, [\roomsize, 38, \revtime, 14.85, \damping, 0.1, \inputbw, 0.39, \drylevel, -8, \earlylevel, -9, \taillevel, 10 ,\in,~revKck2,\out, ],~revGrp);


~revKick=Synth(\reverbModu, [\mix,0,\room, 0, \damp, 0,\in,~kickRv,\out,~filKick,\mixMod,~mixM,\roomMod,~roomM,\dampMod,~dampM],~revGrp);

~flangSna= Synth( \flanger1,[ \in,~snareFlang, \out,~distoPercBg, \flangefreq,0.01005859375,\fdback,-0.8,\ph,5.6],~phaserGrp);

~fKick= Synth(\filter, [\which,0,\busMod, ~bus29, \in,~filKick,\out,~kbToPan3,\qf,0.7,\freqFil,100],~delayGrp);

~kbPan	=	Synth( \pan2, [\in,~kbToPan3,\out,0],~recGrp3);

(
	~breakPart1=		Ppar([

	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

				Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([64/1],1), \tS,  0.39550810370174/*,\type,Pseq([\rest,\note],inf)*/),

				 ],1),
Pseq([

					Ppar([
			Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),
						Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,Pseq([64/1],1),\ph,1.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),



	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810370174,\buf,~kb2,\out, ~filKB,\loopy,0),



			Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),


						Pbind(\instrument, \kiasmosPad,\scale, Scale.chromatic,\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1], \amp, 0.1,\atk, 4*t.beatDur, \rel, 1.5544,\legato, 2,\dur, Pseq([16/1],5),\tS,  0.39550810370174,\out,~kiasDisto),




/*
	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


						Pbind(\instrument,\playBufXG2, \buf,~pad, \atckC,4, \relC,-8,\decT ,0.85, \atkT,0.05,\relT,0.1,  \vlSub, 0.6,  \vlDec,Pkey(\vlSub), \vlSub2,Pkey(\vlSub),
						\dur,  Pseq([32/1],1), \tS,  0.39550810370174,\start,0/*~pad.numFrames.rrand(180000)-180000*/),

				 ],1),*/


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,\rest,\vl,1.2),

		Ppar([

	Pbind(\instrument,\lfo13, \val,0.0201171875*16,\dur,Pseq([16/1],1)/*Pseq([48/1],1)*/,\ph,4.4, \out,~mixM, \tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.321875,\dur,Pseq([16/1],1),\ph,4.4, \out,~roomM ,\tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.321875,\dur,Pseq([16/1],1),\ph,4.4, \out, ~dampM,\tS, 0.39550810372374,\rL, 0.41,\rH,0.8),

	/*Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],45), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],44),\rest,\rest],1),\vl, 1.3),*/

					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],32), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],44),\rest,\rest],1),\vl, 1.3),

],1)
					],1),

						 ],1),


					Ppar([

//here

				Pbind(\instrument, \envSli, \out,   ~bus30,  \dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,30,\val2,4000,\crv,56),

				  Pbind(\instrument, \shap, \dur,Pseq([1/1],64),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374),

//changed buffer for one night
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test, \vl, 0.038,\dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test2, \atckC,7, \relC,-18,\decT ,0.6, \atkT,0.15,\relT,0.24,  \vlSub, 0.02,\vlDec,Pkey(\vlSub) ,\vlSub2,Pkey(\vlSub), \dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/

				//need bassshap, must hp at the end
/*	Pbind(\instrument, \bass,\type, Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf),\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur/4 , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,~kbToPan4/*~bassEq*/),*/

Ppar([
Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note,\rest,\note,\note,\note], inf)/*Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf)*/,\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur , \rel2, t.beatDur * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,~kbToPan4/*~bassEq*/),



Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],64), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan4,\loopy,0,\start,0,\tS, 0.39550810372374),


Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374,\type,\rest ),
				Pbind(\instrument, \wNoise,\dur, Pseq([24/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest ,\tS, 0.39550810372374),

						/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbindf(~kick,\out,  ~revKck2),

/*					Pbind(\instrument, \wNoise,\dur, Pseq([31/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbind(\instrument, \wNoise,\dur, Pseq([27/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\atk ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),
				],1),

			/*Pseq([*/
				/*Pbind(\instrument,\wNoise,\dur,Pseq([64/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\tS,  0.39550810372374,\type,\rest),*/
Ppar([

						//here// need eq
Pbind(\instrument,\wNoise,\dur,Pseq([60/1],1) ,\dA2,2, \wFil,2,\dec,Pkey(\dur),\tS,  0.39550810372374,\out,~hitEq2/*~hitStereoX*/,   \amp,0.2  ,\amp2,0.2),



	Pseq([
		Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),
							/*Ppar([
								Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbus2),*/

Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],120), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbToPan4)
/*],1)*/
					],1)],1)
/*],1)*/,

	/*		/*	4,8,16to15,3,2	*/	Pseq([

					Pbind(\instrument,\wNoise,\dur,Pseq([16/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),

				Pxrand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],4),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162,\start,Pfunc({(~vocal.numFrames-7000).rand})),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],8),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],4),

				],1),*/




				/*Pbind(\instrument,\gateS, \dur,Pseq([16/1],4),\vlSub, 1/*Pfunc({1.rand})*/, \vlSub2,Pkey(\vlSub),
					/*\decC,Pfunc({(-10).rrand(2)}),*/\in,~vocToDispatch,\out,~toFilRise,\group, ~gateGrp4,\tS, 0.39550810372374,\type,Pseq([\note,\rest],inf)),*/


//not reveiving beloq
				Pbind(\instrument,\stereo, \dur, Pseq([64/1],1), \in, ~hitStereoX  ,\spread,0.1,\out,~toFilRise,\tS, 0.39550810372374,\group, ~stereoGrp),

 ],1), ],1),


],1)],1)

);


//backup

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

],1)],1));

//shiny

SynthDef(\blo, {|freq=432|Out.ar(~eqBus1,LFPulse.ar(freq,mul: EnvGen.kr(Env.perc(releaseTime: 0.3))))}).add;

Pbind(\instrument, \blo, \dur, Pseq([1/4],inf),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note],inf)
/*Pseq([216,216,216,432,216216,108],inf)*/).play(t);


~eq2=Synth(\EQHP, [\frq, 100,\out, ~reverbBus],~eqGrp0);
~eq2.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\in, ~eqBus1 , \out,~reverbBus);
~rev2=Synth( \reverb ,~revRnd[2],~revGrp);
~rev2.set( \in, ~reverbBus , \out, 0,\room, 0.8, \mix,0.5, \damp, 0.7);



~eqGrp0= Group.new;
~revGrp= Group.after(~eqGrp0);



\room, 0.5, \mix,0.3, \damp, 0.2

// another



(~part3b=
Ppar([


	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([1/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~one = ~leTout2.numFrames/ 256 * 240.rand;~two = ~leTout2.numFrames/ 256 * 240.rand;~troi= ~leTout2.numFrames/ 256 * 240.rand;~start = ~start =~fkAr.numFrames.rrand(215000)-215000})),


	Pseq([


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~toExtraFx*/, \start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~one}),Pfuncn({ ~two}),
				Pfuncn({~one}) ,Pfuncn({~one}) ,Pfuncn({~one+(~leTout2.numFrames/ 256 )}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({~one}),Pfuncn({ ~two}),
				Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

			],inf),\type,Pseq([\note,\rest,\rest,\rest,\rest,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note].scramble,inf)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],16)),

],1)],1)	)


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

],1)],1));

////one more




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

////another

(~part3b=
Ppar([


	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([1/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~one = ~leTout2.numFrames/ 256 * 240.rand;~two = ~leTout2.numFrames/ 256 * 240.rand;~troi= ~leTout2.numFrames/ 256 * 240.rand;~start = ~start =~fkAr.numFrames.rrand(215000)-215000})),


	Pseq([


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~one}),Pfuncn({ ~two}),
				Pfuncn({~one}) ,Pfuncn({~one}) ,Pfuncn({~one+(~leTout2.numFrames/ 256 )}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({~one}),Pfuncn({ ~two}),
				Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

			].scramble,inf),\type,Pseq([\note,\rest,\rest,\rest,\rest,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note].scramble,inf)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],16)),

],1)],1)	);


//vlaaaaaa



MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});

Pbindef(\choo,\dur,Pseq([ 1/4],inf))
Pbindef(\choo,\dur,Pseq([ 1/1],inf))
Pbindef(\choo,\dur,Pseq([ 4/1],inf))
Pbindef(\choo,\dur,Pseq([ 16/1],inf))
Pbindef(\choo,\tS,1.8)

MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play
~buf=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src1.aiff")


(
~notes = Array.newClear(128);
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shiftGrp = Group.after(~combGrp);
~shapGrp= Group.after(~shiftGrp);
~limitGrp= Group.after(~shapGrp);
~distoGrp= Group.after(~limitGrp);
~revGrp= Group.after(~distoGrp);

~recGrp= Group.after(~revGrp);



/*v =*/ /*Pbindef(\choo,\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [ Pseq(  ~rog ,1) , Pseq(  ~rog.reverse  ,1)         ],inf),\freq,1,\out,~outFil).play(t);*/
Pbindef(\choo,\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [
	61, 69,  64, 69,       74, 83, 78,83,    88, 97, 92, 97,   102,110, 105, 110],inf),\out,~outFil).play(t);

~v =  Synth(\comb1,[ \in, ~outFil,\out,~toShifter   /*~outDisto*/,\amp,1,\maxDel,0.7744,\decT,-0,\busMod,~seqBus],~combGrp);

	Pbind(\instrument, \sequ,\out, ~seqBus, \value,Pseq([
/*Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20)*/

	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20)

].scramble,inf),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\legato, 2,\group,~shapGrp,\tS, 0.39550810372374,).play(t);



 ~h1 = Synth(\shiftX,[\in,~toShifter,\out ,~outTolimit,\freq,0],~shiftGrp);

~l1 = Synth(\lim,[\in, ~outTolimit,\out,~outDisto],~limitGrp);



h = Synth(\disto3,[\in,  ~outDisto , \out,~bigRiToRev2/*~outTolimit*/,\gain,1],~distoGrp);

~rev44= Synth( \reverb, ~rShor, ~revGrp);
~rev44.set(\in,~bigRiToRev2  ,\mix, 0.8,\room, 1,\damp,1);
~rev44.set(\in,~bigRiToRev2  ,\mix, 0.3,\room, 0.2,\damp,0.1);
/*
// l = Synth(\limiter,[\in, ~outTolimit,\out,0, \gain, 140],~limitGrp);*/




/*MIDIdef.noteOn(\piana,{arg vel, nn;
	[ nn].postln;
	~notes[nn] =  Synth( \fmX, [\freq, nn.midicps,\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,0/*~outFil*/
		,\amp, vel.linexp(1,127,0.12,0.14,\freq, nn.midicps)
	],~synthGrp);
});


MIDIdef.noteOff(\offPiana, {arg vel, nn;nn.postln;
	~notes[nn].set(\gate,0);
	~notes[nn] = nil;
});*/


MIDIdef.cc(\fmCt ,{ |value|var modFreq = value.linlin(0, 127,0, 0.8);

	// ~notes.do{arg synth; synth.set(/*\fmCtrl*/\cRatio, modFreq.round(0.01))};
	// v.set(\cRatio, modFreq.round(0.01).postln);

	Pbindef(\choo,\cRatio, modFreq.round(0.01))
},ccNum: 74 ); //is2


MIDIdef.cc(\rateGate, { |value|var modFreq = value.linlin(61, 67, 40, 20);

	// if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([64/1],inf));},{});
	if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([16/1],inf));},{});
	if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==30,{Pbindef(\choo,  \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==40,{Pbindef(\choo,  \dur,Pseq([1/4],inf));},{});



},ccNum: 114 );




MIDIdef.cc(\raett, { |value|var modFreq = value.linlin(61, 67, -200, 1200);

	~h1.set(\frq,modFreq.round(1).postln );



},ccNum: 112 );



/*MIDIdef.cc(\fmCt2 ,{ |value|var modFreq = value.linlin(61, 67, 0.8, 0);

	v.set(\fmCtrl, modFreq.round(0.01).postln);
	~notes.do{arg synth; synth.set(\fmCtrl, modFreq.round(0.01))};

},ccNum: 114 ); //is 9.*/


MIDIdef.cc(\fmCtrl, { |value|var modFreq = value.linlin(0, 127,0.8, 0.01);

	Pbindef(\choo,\fmCtrl, modFreq.round(0.01));},ccNum: 19 );//is 11




MIDIdef.cc(\rteShit, { |value|var modFreq = value.linlin(0, 127, 1, 0);

	~h1.set(\rte, modFreq.round(0.01).postln);

},ccNum: 75 ); //is 8





MIDIdef.noteOn(\start, {|vel, nn, chan, src|
	[nn].postln;
/*v.set(\gate,1);*/
/* v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,],~synthGrp);*/

		~h1.set(\frq,0);

},noteNum: 36); //button 1


MIDIdef.noteOn(\rcord, {|vel, nn, chan, src|
	[nn].postln;

	// x = Synth(\recLoop,[buf:~buf,\recording,1, \in,0],~recGrp);
	// s.record;


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bg.aiff",numChannels:1)

},noteNum: 43);//is 8



/*MIDIdef.cc(\ml, { |value|var modFreq = value.linlin(0, 127, 0, 0.8);

	~v.set(\multi, modFreq.round(0.01).postln);

},ccNum: 18 ); //is 10*/



MIDIdef.cc(\ml2, { |value|var modFreq = value.linlin(0, 127, 0, 0.8);

	~h1.set(\mult, modFreq.round(0.01).postln);

},ccNum: 18 ); //is 10





/*MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, 0.42, -0.2);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3*/



MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, 0.3872, -0.0968);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3


/*MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, -0.0, -0.5);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3

MIDIdef.cc(\mDelup, { |value|var modFreq = value.linlin(0, 127, 0.0, 1);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 74 );  //is 2*/


MIDIdef.cc(\fr, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\fr, modFreq.round(0.001).postln);
},ccNum:   16); //is 12


MIDIdef.cc(\frCtrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modR, modFreq.round(0.001).postln);
},ccNum:   76); //is 12

MIDIdef.cc(\f1, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f1, modFreq.round(0.001).postln);
},ccNum:   17); //is 13

MIDIdef.cc(\f1Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modS, modFreq.round(0.001).postln);
},ccNum:   77); //is 5


MIDIdef.cc(\f2, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f2, modFreq.round(0.001).postln);
},ccNum:        91 );//is 14

MIDIdef.cc(\f2Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modT, modFreq.round(0.001).postln);
},ccNum:        93 );//is 6


MIDIdef.cc(\f3, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f3, modFreq.round(0.001).postln);
},ccNum: 79);//is 15


MIDIdef.cc(\f3Ctrl, { |value|var modFreq = value.linlin(0,127, 0.075, 20.6);

	~v.set(\modSa, modFreq.round(0.001).postln);
},ccNum: 73);//is 7



MIDIdef.cc(\fx, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\fx, modFreq.round(0.001).postln);
},ccNum:  72 );//is 16


/*MIDIdef.cc(\rise, { |value|var modFreq = value.linlin(0, 127, 0.001, 1);

	v.set(\cRatio, modFreq.round(0.001).postln);

},ccNum: 1 );*/


MIDIdef.cc(\riseShift, { |value|var modFreq = value.linlin(0, 127, 0, 5000);

	~h1.set(\frq, modFreq.round(0.1).postln);

},ccNum: 1 );



/*MIDIdef.cc(\mVo, { |value|var modFreq = value.linlin(0, 127, 0, 1);

v.set(\multi, modFreq.round(0.01).postln);
	/*d.set(\multi, modFreq.round(0.01));*/

},ccNum: 75 ); //is 11*/

)




FreqScope.new
~buf.play
~bufSnoopy.play


(
~filterGrp = Group.new;
~distoGrp= Group.after(~filterGrp);
~recGrp= Group.after(~distoGrp);

// Ppar([~bassShap,Ppar([Pbindf(~kick,\amp, (-5)),Pbindf(~bass,\amp, (-7) ),],inf)],1).play(t);

g = Synth(  \playBufX,[ \impulse, 0.00001,\loo,1,\buf,~buf,\out, ~bgFil]);



k = Synth(\filterU, [\out,0/*~distoBg*/,\in, ~bgFil, \lFrq,22000, \lFrq2,22000,\hFrq,50,\hFrq2,50,\qfH ,0.7, \qfH2, 0.2,\qlL ,0.6 ,\qlL2 ,0.55 ], ~filterGrp);
/*d = Synth(\disto,[\in,~distoBg,\out,0],~distoGrp);*/



/*MIDIdef.cc(\lpF, { |value|var modFreq = value.linlin(0, 127, 500,22000);

	 k.set(\lFrq, "lp: ".postln;modFreq.round(1).post;)},ccNum: 18 );// is 10*/



MIDIdef.cc(\lpF2x, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,24000/*18000*/);

	k.set(\lFrq,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );



/*MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,12000);

	k.set(\lFrq2,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );*/


MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, /*310*/600,24000);

	k.set(\lFrq2,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 18 );




MIDIdef.cc(\hpF, { |value|var modFreq = value.linlin(0, 127, 70, 3200/*18000*/);

k.set(\hFrq, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16


MIDIdef.cc(\hpF2, { |value|var modFreq = value.linlin(0, 127, 70, 2400);

k.set(\hFrq2, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16




MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

	// x = Synth(\recLoop,[buf:~bufSnoopy,\recording,1, \in,0],~recGrp);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/src1F.aiff",numChannels:1)

},noteNum: 43);// is 43



MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.3, 8);

	k.set(\qlL, modFreq.round(0.1));},ccNum: 19 );// is 11

/*MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

	k.set(\qfH, modFreq.round(0.1));},ccNum: 19 );*/
)
~bufSnoopy.play



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\vl,1).play(t)
~kb.stop
//select
(Ppar([

Pbind(\instrument,\playBufXG,\rte,2,\dur,Pseq([1/16],inf)
,\buf,~buf,\out,0,\impulse,0.003,\start,~st/*=(~buf.numFrames.rrand(1400000)- 1400000).postln*/
,\tS, 0.39550810372374 ,\vlSub,  0.5 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk)


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))

~st=1416566.6640023                 //2201750.7150731

(~buf.numFrames.rrand(1400000)- 1400000).postln

//build

(o= {Out.kr(~bus1, LFTri.ar(0.084,4.7).range(1,1.2))}.play)


(o= {Out.kr(~bus1, SinOsc.ar(1.2875,4.7).range(1,1.1))}.play)

(o= {Out.kr(~bus1, SinOsc.ar(0.084,4.7).range(1,3.1))}.play)




(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~recGrp=Group.after(~distoGrp);

Ppar([Pbind(\instrument, \lfo13, \val,3.5,\dur,Pseq([64/1],inf), \out,  ~bus7,\tS, 0.39550810372374,\rL,-30,\rH,5000),

	// \playBufXGMod
	Pbind(\instrument,\playBufXGMod,\rte,0.75,\dur, Pseq([1/16],inf),\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 0.5,\duration,Pkey(\dur),\impulse,0.003,\start,~st, \tS, 0.39550810372374 ,
	\vlSub, 0.38 /*0.01*/, \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 1,	\subsT,0.05 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,0,\decC,-1,\relC,0,\vlAtk , 0 ,  \vlRel,  Pkey(\vlAtk),\loopy,0,\busMod,~bus1,),


	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value,0.82 /*0.64375*/ ,\amp,1,\decT,0.8,\ph,4.4,\out,~gateMelo, \group,~phaserGrp),

	// 0.64375
Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.4, \qf2,0.8,\freqFil,15,/*\busMod,~bus7,*/
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec2,\recording,1, \in,0],~recGrp);

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/LPL.aiff",numChannels:1)

~lpPrec2 =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/LPL.aiff")


~lpPrec2.play



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)
~kb.stop

//again
256222
(~buf.numFrames.rrand(800000)- 800000).postln
//2660344.3627629   561638.15412434
(
~filterGrp= Group.new   ;
~recGrp= Group.after(~filterGrp);

Pbind(\instrument,\playBufXG,\rte,0.5,\dur,Pseq([ /* Pseq([1/1],inf)*/ Pseq([1/1],12) ,Pseq([4/1],1) ],inf)  ,\amp, 1,\buf,~buf ,\out,~eqBus2x,\impulse,0.003,\start,
193909
,\tS, 0.39550810372374 ,/*\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, 1 ,	\subsT, 0 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),*/\loopy,0).play(t);

// 636658.85969102

Synth(\filterG, [\in,~eqBus2x , \which,1,\qf2,0.3],~filterGrp))

// x = Synth(\recLoop,[buf:~lpPrec3,\recording,1, \in,0],~recGrp);

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/BPL.aiff",numChannels:1)

 ~lpPrec3= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/BPL.aiff");


~lpPrec3.play
(~buf.numFrames.rrand(1400000)- 1400000).postln

642438.18770068
//choose here
(Pbind(\instrument,\playBufXG,\dur, Pseq([4.75],1) /*Pseq([1/4],24)*/,\amp, 1,\buf,~lpPrec,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2 = 668438.18770068 /*(~lpPrec.numFrames.rrand(5000)-5000).postln*/ ,\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t))


(
~filterGrp = Group.new;
~delGrp =Group.after(~filterGrp);
~combGrp=Group.after(~delGrp);
~recGrp2=Group.after(~combGrp);)
(
Ppar([

	Pbind(\instrument, \playBuf,\dur,1/16, \rte,Pfunc({4.rrand(0.1)}), \tS,  0.39550810372374,\buf,~snare,\out,~percuStereo,\dA,0.1,
		\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
					\note,\note,\note,\note,\rest,\rest,\rest,\rest,
		],inf)
	)
	,
	Pbind(\instrument, \filterGS,\which,1, \in,~percuStereo ,\out,~part2SRev, \group, ~filterGrp,\qf2,0.08,\dur ,inf),


	Pbind(\instrument,\pingD, \in,~part2SRev,  \bufnum,~delay, \feedback,0.65 ,\group, ~delGrp,\dur, inf,\out,~limitBus1),
	Pbind(\instrument, \comb,\which,1, \in,~limitBus1,\group, ~combGrp,\qf2,0.1,\dur ,inf),

	// Pbind(\instrument,\recLoopS,\buf,~fkAr,\recording,1, \in,0,\group,~recGrp2,\dur,inf),

],1).play(t)
)

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/fkAr.aiff",numChannels:1)

 ~fkAr= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/fkAr.aiff");
~fkAr.play

//idea
(SynthDef(\idea, {Out.ar(0,CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/216/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-0.2)!2)}).play;)


// Pbind(\instrument,\recLoopS,\buf,~kb2Test,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/idea.aiff",numChannels:1)

 ~kb2Test= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/idea.aiff");


~kb2Test.play

(

~extraDelay = Group.new;
~revGrp = Group.after(~extraDelay);
~recGrp2= Group.after(~revGrp);


(
SynthDef(\chord,{

	Out.ar(~delayToLimit,
		BHiPass4.ar((Saw.ar(64.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
		Saw.ar(67.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
			Saw.ar(63.midicps+EnvGen.kr(Env([50,0],[20],-5)))),MouseY.kr(30,12000),0.8)*0.2)
}).play;




Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay).play(t);




~rev2= Synth( \reverbMad,~churcx,    ~revGrp );
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,-4,\revtime, 14.85, \damping, 0.01,\roomsize, 46,\inputbw,0.02)
)
)


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pad.aiff",numChannels:1)

 ~pad= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad.aiff");
~pad.play



a= Synth( \reverbMad,~churcx,    ~extraDelay );
a.set( \in,~delayToLimit  , \out,0 /*~delayBus2*/,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)


Pbind(\instrument,\recLoopS,\buf,~pad,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)
~pad.play

(
c = {
	var sig = In.ar(0, 12);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(0, outbus: 0, addAction: \addAfter);
)

z = s.scope(2, index: 0).style_(2).yZoom_(16);


~mont =0
//sick pad and kiasmo
Pbind(\instrument, \percussion, \dur,Pseq([1/4],512),\carHz, Pfunc({50.12070612224.rrand(150)+(~mont=~mont+40)}),\modHz,Pfunc({34.3179398.rrand(0.1)+(~mont=~mont+40)}),\modAmp,Pfunc({ 0.00875.rrand(0.001)}) ,\amp,1,\rel,Pfunc({0.3872.rand}),\rel2,Pfunc({0.3872.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod,Pfunc({1500.rand})/*901*/,\out,0,\latch,Pfunc({18900.rand}),\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)







Pbind(\instrument, \percussion, \dur,Pseq([1/1],inf),\carHz, Pfunc({1050.12070612224.rrand(150)+(~mont=~mont+400)}),\modHz,Pfunc({9334.3179398.rrand(0.1)+(~mont=~mont+400)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,Pfunc({4.05544.rand}),\rel2,Pfunc({4.0242.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod, 901,\out,0,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)

/*//original
Pbind(\instrument, \percussion, \dur,Pseq([1/4],inf),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,0,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)*/


//new percu dance


(
~stereoGrp=Group.new;
~recGrp2=Group.after(~stereoGrp);
a=Prand([

Pbind(\instrument, \percussion ,\dur,Pseq([1/4],4 ),\carHz, Pfunc({525.12070612224.rrand(0.01)}),\modHz,Pfunc({11899.3343179398.rrand(0.001)}),\modAmp, Pfunc({0.12875.rrand(0.000001)}) ,\amp,3,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({ (-14.4).rrand(-1)}), \crv1b,(-4).rand, \mulMod, 1691,\out,   ~delayToLimit),


	Pbind(\instrument, \playBufS,\dur, Pseq([1/4],1),\buf,~conga,\tS,0.39550810372374,\rte,    Pfunc({1.6.rrand(0.4)}),\start,61600,\out,~delayToEq,\vl,0.72),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-1, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,~toKbGate)
],inf).play(t);



~ste1=Synth(\stereoO,[\in,~delayToLimit],~stereoGrp);
~ste1.set(\spread,1, \level,1, \center,0,\dlt1,0.01,\dlt2,0,\decT,0.0968, \mxDel,0);

~ste2=Synth(\stereoO,[\in,~delayToEq],~stereoGrp);
~ste2.set(\spread,0, \level,1, \center,0.0,\dlt1,0,\dlt2,0,\decT,0.1, \mxDel,1);

~ste3=Synth(\stereoO,[\in,~toKbGate],~stereoGrp);
~ste3.set(\spread,0, \level,1, \center,0.0,\dlt1,0.1,\dlt2,0.2,\decT,1.5544, \mxDel,1)
)
// Pbind(\instrument,\recLoopS,\buf,~funkPerc,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t,quant:1)


~ste2.free


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/funkPerc.aiff",numChannels:2)


 ~funkPerc= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/funkPerc.aiff");
~funkPerc.play

({ReplaceOut.ar(0,In.ar(0)!10)}.play)


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-12, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,0).play(t)


b = Bus.audio(s, 2);

(
c = {
	var sig = In.ar(0, 2);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(a, outbus: b, addAction: \addAfter);
)

z = s.scope(2, index: b.index).style_(2).yZoom_(16);
//or

z = s.scope(2, index: 0).style_(2).yZoom_(16);


(


{SinOsc.ar(110,mul: EnvGen.kr(Env.perc(releaseTime: 0.2,curve: -3)))!2}.play;


{BLowPass4.ar(PinkNoise.ar(0.6),EnvGen.kr(Env([1400,500,120],[0.1,0.4,1],[-30,-4,1]),doneAction: 2),Line.kr(0.6,1,1))!2}.play;


Pbind(\instrument,\recLoopS,\buf,~conga,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


~conga.play
Pbind(\instrument, \playBufS,\dur, Pseq([1/4],inf),\buf,~conga,\tS,0.39550810372374/*\rte,    Pfunc({2.6.rrand(0)})*/,\start,58600).play(t)
~conga.plot


~recGrp2=Group.new;


//voltingo

Synth(\granLive,[\buf,~snare,\out,0,\amp,0.05])


Synth(\recLoop,[\buf,~ambPerc,\recording,1, \in,0],~recGrp2)


({ReplaceOut.ar(0,In.ar(0)!2)}.play)



(~buf.numFrames.rrand(1400000)- 1400000).postln

(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~gateGrp=Group.after(~distoGrp);
~eqGrp0=Group.after(~gateGrp);
~recGrp=Group.after(~eqGrp0);

Ppar([
	Pbind(\instrument, \lfo13, \val,1.55,\dur,Pseq([64/1],inf), \out,  ~bus7,\tS, 0.39550810372374,\rL,30,\rH,5000),

Pbind(\instrument,\playBufXG,\rte,4,\dur,/*Pseq([1/2],inf)*/Pseq([1/16],inf)
		,\amp, 1,\buf,~buf,\out,~gateMelo,\impulse,0.3
	/*	Pseq([ Pseq([ 82],8) /* ,20.6,20.6,10.3*/],inf)*/
		,\start, ~st
		,\tS, 0.39550810372374 ,\vlSub, /*0.3*/ 1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk/*,\gateSub,Pfunc({0.8.exprand(0.001)})*/,\dA,2,\loo,1),



	Pbind(\instrument, \filter, \dur, inf,\in,~gateMelo, \which,2,\out,~gateSeqBus,\group,~distoGrp,\busMod,~bus7,\freqFil,40
		,\qf ,0.4, \qf2,0.8,\freqFil,15
	),

	Pbind(\instrument,\gate,\in,~gateSeqBus , \out,0, \group,~gateGrp,\vlSub ,1,\vlSub2,Pkey(\vlSub),\relSu,Pfunc({0.8.exprand(0.001)}),\tS, 0.39550810372374,\dur,Pseq([1/4],inf))


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)


],1).play(t);
);
/*~eq3=Synth(\EQHP96, [\frq, 100, \out, 0/*~revBus1*/],~eqGrp0);

~eq3.set(\in, ~toEq , /*\out,~gateBus3,*/\val, ~val=0,\quant, ~quant=0, \gain,~gain=0,\val2,~val2=0,\quant2,~quant2=0, \gain2,~gain2=(-0),\val3,~val3=0,\quant3,~quant3=0, \gain3,~gain3= (-0),/*\val4,~val4=0,\shelf,~shelf=0, \gain4,~gain4=0,*/\val4,1200,\shelf,1, \gain4,(-3),\vol,12);*/


// x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);
~eq3.free

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/HPL.aiff",numChannels:1)

~lpPrec =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/HPL.aiff")
~lpPrec.play


Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03
	,\start,Pfunc({~lpPrec.numFrames.rand})).play(t)


//weird
Ppar([
	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([64/1],inf), \out,  ~bus6,\tS, 0.39550810372374,\rL,-0.06,\rH,0.08),

Pbind(\instrument,\playBufXGMod,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03,\busMod,~bus6
		,\start,Pfunc({~lpPrec.numFrames.rand}))],1).play(t)





Pbind(\instrument,\playBufXG,\rte,0.5,\dur,/*Pseq([1/2],inf)*/Pseq([1/16],inf)
		,\amp, 1,\buf,~buf,\out,0,\impulse,164
	/*	Pseq([ Pseq([ 82],8) /* ,20.6,20.6,10.3*/],inf)*/
		,\start, ~st
	,\tS, 0.39550810372374 ,\vlSub, /*0.3*/ 1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk/*,\gateSub,Pfunc({0.8.exprand(0.001)})*/,\dA,2,\loo,1).play(t)

//memo div

SynthDef(\learn,{|out=0,freq=1,n1=64,addF=0|Out.ar(out,Saw.ar((n1).midicps*freq,mul: EnvGen.kr(Env.perc(attackTime:0.01 ,releaseTime: 0.3),timeScale: 1,doneAction: 2))!2)}).add;

~rog=[61, 69,  64, 69,       74, 83, 78,83,    88, 97, 92, 97,   102,110, 105, 110]


Pbind(\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [ Pseq(  ~rog ,1) , Pseq(  ~rog.reverse  ,1)         ],inf),\freq,1).play(t)





Pbind(\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [
61, 69,  64, 69,       74, 83, 78,83,    88, 97, 92, 97,   102,110, 105, 110],inf),\freq,1).play(t)





SynthDef(\learn,{|out=0,freq=1,n1=64,addF=0,dur,tS=1|Out.ar(out,Saw.ar((n1).midicps*freq,mul: EnvGen.kr(Env.perc(attackTime:0.01 ,releaseTime: dur),timeScale: tS,doneAction: 2)))}).add;



//letbku


(~part3b=
Ppar([





		Pseq([


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two}),
				Pfuncn({~one}) ,Pfuncn({~one}) ,Pfuncn({~one+(~leTout2.numFrames/ 256 )}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two}),
				Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

			].scramble,inf),\type,Pfunc({Pseq([\note,\rest,\rest,\rest,\rest,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note].scramble,inf)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],16)),

],1)],1)	);

///////


Routine({

~playBp2=Synth(\playBufXs,[\buf, ~lpPrec3, \impulse, 0.080475,\out,~filterRnd]);
~playBp2.set(\start,2100000,\out,~filterRnd);
//~eq5.free
~eq5=Synth(\EQHP96, [\frq, 100, \out, ~reverbBus23],~eqGrp0);
~eq5.set(\in, ~filterRnd,\out,~gateBus23,\val, 1800,\quant, 1, \gain,(-15),\val2,5200,\quant2,1, \gain2,(-12), \val3,2800,\quant3,1, \gain3,(-6.2),\val4,6000,\shelf,1.2, \gain4,(-11),\val5,2200,\shelf2,1.1, \gain5,(-18));
~rev5=Synth( \reverb ,~revRnd[1],~revGrp); ~rev5.set(\in,~reverbBus23  , \out,~comFuzz23);
~comp5=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp5.set(\thr,0.88 ,\sB, 1.016,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,4,\in, ~comFuzz23, \out,~limitFuzz23);
~mix5= Synth(\limitertoMixer,[\c5,1,\in, ~limitFuzz23, \gain,0.3, \out,~stereoBus23],~limitGrp);
~mix5.set(\gain,42,\out,~stereoBus23);
~stereo5=Synth(\stereoO,[\in, ~stereoBus23,\out,~no3], ~stereoGrp);
~stereo5.set(\spread,0,\center,0,\dlt1,0.35,\dlt2,0.34,\decT,0.0121, \mxDel,1,\out,~no3);

	// ~boost.play(t,quant:1);

	wait(0.180);


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/BPLX2.aiff",numChannels:10,duration:t.beatDur*64);

}).play(t,quant:1)

///////



Routine({


~playBp=Synth(\playBufXs,[\buf, ~lpPrec3, \impulse, 0.080475,\out,~eqBus2x]);
~playBp.set(\start,30000,\out,~eqBus2x);
~eq4=Synth(\EQHP96, [\frq, 100, \out, ~revBus2],~eqGrp0);
~eq4.set(\in, ~eqBus2x,/*\out,~gateBusB,*/\val, 1800,\quant, 1, \gain,(-15),\val2,5200,\quant2,1, \gain2,(-12), \val3,2800,\quant3,1, \gain3,(-6.2),\val4,6000,\shelf,1.2, \gain4,(-11),\val5,2200,\shelf2,1.1, \gain5,(-18));
~rev4=Synth( \reverb ,~revRnd[1],~revGrp); ~rev4.set(\in, ~revBus2 , \out, ~comBus2);
~comp4=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp4.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,4,\in, ~comBus2, \out,~limitBus2);
~mix4= Synth(\limitertoMixer,[\c4,1,\in, ~limitBus2,\gain,2,\out,~sterBus2],~limitGrp);
~mix4.set(\gain,42);
~stereo4= Synth(\stereoO,[  \in, ~sterBus2, \out,0], ~stereoGrp);
//main2
~stereo4.set(\spread,0,\center,0,\dlt1,0.35,\dlt2,0.34,\decT,0.0121, \mxDel,1);

	// ~boost.play(t,quant:1);

	wait(0.160);


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/BPLX.aiff",numChannels:10,duration:t.beatDur*64);

}).play(t,quant:1)


Routine({


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/BPLX2.aiff",numChannels:10,duration:t.beatDur*64);

}).play(t,quant:1)

/////////last


~delExtraSeq=Ppar([
/*
Pbind(\instrument, \gate, \in,~gateBus23,\tS,t.beatDur,\dur,Pseq([9999/1],inf), \out,~reverbBus23,\group, ~gateGrp,
		\vlSub,1,\vlSub2,Pkey(\vlSub)),*/

Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pwrand([~toDelay10b,~toCom3],[1,4].normalizeSum,inf), \start,Pfunc({~leTout.numFrames/ 128 * 96.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),),



		Pxrand([

		/*Pbind(\instrument,\gateS,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~no3  ,\out, 0,\group, ~gateGrp4,
	\atckC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),*/

		Pbind(\instrument, \gateS ,\in,~no41   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1.5/1],1)  ],1) ,    \group,~gateGrp4, \out,~tofinalRythm2,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),

		],1)
	],inf)
],1);



~uuu = 1;
 COME back here

~miniClip= Pseq([


Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~tofinalRythm3, \start,Pfunc({~leTout2.numFrames/256* 115})
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),\rte,Pfunc({~uuu=~uuu+0.2;~uuu;})),




	Pbind(\instrument, \gateS ,\in,~no41   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1.5/1],1)  ],3) ,    \group,~gateGrp4, \out,~tofinalRythm3,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),





],inf);








here toofor length next start + 3 +6

~part3b=
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~one+((~leTout2.numFrames/ 256 )*3)}),Pfuncn({ ~two}),
				Pfuncn({~one}) ,Pfuncn({~one}) ,Pfuncn({~one((~leTout2.numFrames/ 256 )*6)}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two}),
		Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({ ~two+((~leTout2.numFrames/ 256 )*3)}),Pfuncn({ ~two+((~leTout2.numFrames/ 256 )*2)}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

	].scramble,inf),\type,Pseq([\note,\rest,\rest,\rest,\rest,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note].scramble,inf)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3/1],21));







/*//make it right herre

Ppar([


		Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),
Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out ,0 /*~downDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/16,639.255/16,619.255/16])],1).play(t)*/


/*Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
		\freq, [659.255/8,639.255/8,619.255/8]).play(t)*/


//WATCH OUT FOR ABOVe








/*(
~justHit=
Ppar([*/

	/*use for reboot fall part5 downshifter

	Pbind(\instrument,\triModul, \lS, 1100, \hS,  600, \modu,0.08/16,  \out, ~bus11,\ph,4.25 ,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),*/

	//added to part2.scd
	// Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,150,\crv,5.2),

	/*Pseq([
	Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([24/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
	],inf),*/

	/*Pseq([

	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest),*/
	/*	Pseq([*/

(~hitPart1 =Pseq([//maybe change to 12
/*	Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),


				/*Pbind(\instrument, \wNoise,\dur, Pseq([14/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),*/

		Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom, \tS,  0.39550810372374),

			Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

			Pbind(\instrument, \gateS,\dur, Pseq([1/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	Pbind(\instrument, \gateS,\dur, Pseq([15/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom, \tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([16/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),*/

//64

	~part3b,




	Pseq([
	/*Pbind(\instrument, \wNoise,\dur, Pseq([14/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),*/

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],8),\type,Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest],inf)),


				Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([12/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),
		/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),*/


				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)




	],1),
//64

	Ppar([

		Pbind(\instrument,\del10T,\in,~toDelay10b,\out,~toCom,\dur,Pseq([64/1],1),\group,~delayGrp),


Pbind(\instrument, \comp10P,\ctrl, ~snBus,\thr,0.76 ,\sB, 1.08,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom3, \out,~eqBus10,\tS,t.beatDur,\dur,Pseq([64/1],1),\group,~compGrp5),

		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),
		/*	Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),*/
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),

					Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,600,\valEnd,400,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom)

	],1),

//32

		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm2,\out,~toCom)
	],1),

//32

	],1),

Ppar([
		/*		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),*/



	Pseq([

		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),


					Pbind(\instrument, \gateS,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		],1),

				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34])],1)



],1));


			//end part1


	(~hitPart2 =	Pseq([ Ppar([
//part2
		Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],1),\out,~bus16,\rL,4200 ,\rH,1100,\val,0.001875,\ph,1.42),


		/*Pseq([/*~part5,*/*/

Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,
				\freq, [659.255/16,639.255/16],\atk2,0),




/*	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
				\freq, [659.255/16,639.255/16,619.255/16],\atk2,0),*/


				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),
		/*	],1),*/

			Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),



				Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
						Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

						Pbind(\instrument, \gateS,\dur, Pseq([12/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),


			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest],inf)),

	Pbind(\instrument,\gate,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG2,\vlSub,1,\vlSub2,Pkey(\vlSub),
		\type,Pseq([\note,\rest, \note,\rest, \note,\note,\note,\note],inf),\out,~downdel,\group,~dispatchGrp),



],1),


		Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,),
//293102


		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],15),


				Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,(~leTout.numFrames /128*(96.rand))),


				Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],7),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve=(~leTout.numFrames /128*(96.rand))})),


						Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],3),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.3),


		/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		/*],1),*/

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.5),

Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.7),

/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.9),

		/*],2),*/

Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),
Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.1),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.4),




Ppar([

		Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
			514401 ,\out, ~shiftPlay,\vl,0.01),
Pseq([
			Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

Pseq([
					Pbind(\instrument, \gateS,\dur, Pseq([1/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

					Pbind(\instrument, \gateS,\dur, Pseq([15/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				],7),


					Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

						],1),

			/*Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],42),\type,Prand([\rest,\note,\rest],inf), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1),*/

			/*Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no1b,\out,~toCom)*/

		],1),





Ppar([


				Pseq([


				Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([56/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
				],1),


Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~pad,\tS,  0.39550810372374,\start,
			514401 ,\out, ~shiftPlay2),



			Pbind(\instrument,\shiftExG, \in,~shiftPlay2,\out,  ~shiftDisto2 ,\group, ~filterGrp,\dur, Pseq([32/1],2),
				\triMod,Pseq([0.08046875,0.08046875/4],inf),\tS, 0.3955081037237,\hS,Pseq([400,800],inf)),

Pseq([


					Pbind(\instrument,\gate,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\vlSub,1,\vlSub2,Pkey(\vlSub)),
Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
	Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Ppar([

					Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([32/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

				],1)

			],1)




		],1),
],1));
			//end part2



//part3

(~hitPart3 =Pseq([
	Ppar([
//deftune could bice
Pbind(\instrument, \percussion, \dur,Pseq([1/4],500),\carHz, Pfunc({50.12070612224.rrand(150)+(~mont=~mont+80)}),\modHz,Pfunc({34.3179398.rrand(0.1)+(~mont=~mont+80)}),\modAmp,Pfunc({ 0.00875.rrand(0.001)}) ,\amp,1,\rel,Pfunc({0.3872.rand}),\rel2,Pfunc({0.3872.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod,Pfunc({1500.rand}),\out,~buildupDisto,\latch,Pfunc({18900.rand}),\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}), \tS,  0.39550810372374),


Pseq([
					Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),

			Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),
				Pbind(\instrument, \wNoise,\dur, Pseq([15/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument, \wNoise,\dur, Pseq([79/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


				Pbind(\instrument, \playBufS, \dur,Pseq([  Pseq([1/1],8) , Pseq([1/4],24) ,Pseq([1/8],16)],1)  , \tS,  0.39550810370174,\buf,~kb1,\out, ~filKB,\loopy,0, \start,0),

/*8 6, 2 =16

110   -- 126*/
			],1),



				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

			Pseq([
			Pbind(\instrument, \gateS,\dur, Pseq([120/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
				],1)

],1),





		Pbind(\instrument, \gateS,\dur, Pseq([128/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
],1));


//end part3


//part4

(~hitPart4 =
 Ppar([

				/*Pbind(\instrument, \trippyRise, \dur,  Pseq([64/1],1)/*,   \ph, Pfunc({ 6.00.rand})*/,\tS, 0.39550810372374, \out,~trippyGate ),*/
	// Pbind(\instrument, \playBuf,\dur  ,Pseq([64/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~trippyGate),



			/*56/8=7	*/

		Pseq([
Ppar([
		Pbindf(~part3b,\type,\note,\start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~leTout.numFrames/256* (220.rand)}),Pfuncn({ ~two}),
				Pfuncn({~leTout.numFrames/256* (220.rand)}) ,Pfuncn({~leTout.numFrames/256* (220.rand)}) ,Pfuncn({~leTout.numFrames/256* (220.rand)}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfunc({~leTout.numFrames/256* (220.rand)}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two}),
				Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),Pfuncn({~leTout.numFrames/256* (220.rand)}),Pfuncn({ ~two+(~leTout2.numFrames/ 256 )}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

			].scramble,inf)),



			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq, \tS,  0.39550810372374),],1),

Ppar([
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

			/*Ppar([*/
//BROKEN
				/*	Pseq([
			Pbind(\instrument, \gate,\dur,Pseq([8/1],1), \in,~trippyGate, \out,~riTriptoDisto , \group,~granuGrp,\tS,  0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),

				Prand([
					Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

						Pbind(\instrument, \gate,\dur,Pseq([8/1],1), \in,~trippyGate, \out,~riTriptoDisto , \group,~granuGrp,\tS,  0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub))


					],6)

				],1),*/

		Pbind(\instrument, \playBuf,\dur  ,Pseq([5/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,Pfunc({~leTout2.numFrames/256* (220.rand)}),\dur,Pseq([2/1],1)		,\loopy,0,\tS,0.39550810372374),


				Pbind(\instrument, \playBuf,\dur  ,Pseq([11/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,Pfunc({~leTout2.numFrames/256* (220.rand)}),\dur,Pseq([3/1],1)		,\loopy,0,\tS,0.39550810372374),

			Pbind(\instrument, \playBuf,\dur  ,Pseq([8/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),


		],1),

		Pbind(\instrument, \gateS,\dur, Pseq([34/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


/*],1),*/



//above is 64/1



//remove for ~part3b

/*	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([31/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)


	],1),*/

		//above is 64/1


		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq,\tS,  0.39550810372374),

							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),
//below was 6

	Pbind(\instrument, \gateS,\dur, Pseq([5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

//above was 7
							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),

	],2),


//above is 32/1


		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no51,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no51,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no51,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no51,\out,~toCom)
	],1),

//above is 32/1



Ppar([
			Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq,\tS,  0.39550810372374),

			Pbind(\instrument, \gateS,\dur, Pseq([63/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),


				/*Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest],1)),*/



				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34]/2)

			],1)

//above is 64/1


],1),	],1));

//end part4


/*],inf /*carefulll*/),*/   /*],1),*/


	// Pbind(\instrument,\stereo, \dur, 9999, \in, ~hitStereo  ,\spread,0.1,\out,~toCom,\tS, 0.39550810372374,\group, ~stereoGrp),



	//hum

	/*Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/**4*/,\ph,4.1),


	Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.08 , \f2,0, \f3,0,  \ic_atk,0,\index,1,\mRatio,1,\out ,/*~flanToDisto2*/ ~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest],inf)),


	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],inf),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp)*/


/*],1));*/

/*~breakPart1.play(t)*/





(
	~breakPart1=		Ppar([


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([61/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

		Ppar([
			Pbind(\instrument,\lfo13T, \out,~bus9,\val, 0.1609375,  \rL,0,\rH,-0.26, \ph, 0, \dur, Pseq([8/1],1), \tS,  0.39550810372374),
	Pbind(\instrument, \playBufMod,\rte,0.5,\dur, Pseq([6/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,2.162,\modP,~bus9),
		],1)

	],1),


Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

				Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([90/1],1), \tS,  0.39550810370174/*,\type,Pseq([\rest,\note],inf)*/),

				 ],1),


	Pbind(\instrument, \kiasmosPad,\scale, Scale.chromatic,\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1], \amp, 0.1,\atk, 4*t.beatDur, \rel, 1.5544,\legato, 2,\dur, Pseq([16/1],5),\tS,  0.39550810370174,\out,~kiasDisto),

Pseq([

						Ppar([
			Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),
						Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,Pseq([64/1],1),\ph,1.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),



	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810370174,\buf,~kb1,\out, ~filKB,\loopy,0, \start,0),



			Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),







/*
	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


						Pbind(\instrument,\playBufXG2, \buf,~pad, \atckC,4, \relC,-8,\decT ,0.85, \atkT,0.05,\relT,0.1,  \vlSub, 0.6,  \vlDec,Pkey(\vlSub), \vlSub2,Pkey(\vlSub),
						\dur,  Pseq([32/1],1), \tS,  0.39550810370174,\start,0/*~pad.numFrames.rrand(180000)-180000*/),

				 ],1),*/


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,\rest,\vl,1.2),
				Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],24 ), \tS,  0.39550810372374,\buf,~kb1,\out,~filKB2, \start,0),

		Ppar([

	Pbind(\instrument,\lfo13, \val,0.0201171875*8,\dur,Pseq([16/1],1)/*Pseq([48/1],1)*/,\ph,4.4, \out,~mixM, \tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out,~roomM ,\tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out, ~dampM,\tS, 0.39550810372374,\rL, 0.41,\rH,0.8),

	/*Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],45), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],44),\rest,\rest],1),\vl, 1.3),*/
Pseq([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],11), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],13),\rest,\rest,\rest],1),\vl, 1.3),
						Pbind(\instrument, \playBuf,\rte,0.5,\dur, Pseq([3/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,2.162,\type,\rest)],1)


],1)
					],1),

						 ],1),


					Ppar([

//here

				Pbind(\instrument, \envSli, \out,   ~bus30,  \dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,30,\val2,7000,\crv,16),

				  Pbind(\instrument, \shap, \dur,Pseq([1/1],64),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374),

//changed buffer for one night
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test, \vl, 0.038,\dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test2, \atckC,7, \relC,-18,\decT ,0.6, \atkT,0.15,\relT,0.24,  \vlSub, 0.02,\vlDec,Pkey(\vlSub) ,\vlSub2,Pkey(\vlSub), \dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/

				//need bassshap, must hp at the end
/*	Pbind(\instrument, \bass,\type, Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf),\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur/4 , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,~kbToPan4/*~bassEq*/),*/

Ppar([
Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note,\rest,\note,\note,\note], inf)/*Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf)*/,\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur , \rel2, t.beatDur * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,/*~kbToPan4*/~bassEq, \tS,  0.39550810372374),



Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],64), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan4,\loopy,0,\start,0,\tS, 0.39550810372374),


Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374,\type,\rest ),
				Pbind(\instrument, \wNoise,\dur, Pseq([24/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest ,\tS, 0.39550810372374),

						/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbindf(~kick,\out,  ~revKck2),

/*					Pbind(\instrument, \wNoise,\dur, Pseq([31/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbind(\instrument, \wNoise,\dur, Pseq([27/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\atk ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),
				],1),

			/*Pseq([*/
				/*Pbind(\instrument,\wNoise,\dur,Pseq([64/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\tS,  0.39550810372374,\type,\rest),*/
Ppar([

						//here// need eq
Pbind(\instrument,\wNoise,\dur,Pseq([60/1],1) ,\dA2,2, \wFil,2,\dec,Pkey(\dur),\tS,  0.39550810372374,\out,~hitEq2/*~hitStereoX*/,   \amp,0.2  ,\amp2,0.2),



	Pseq([
		Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),
							/*Ppar([
								Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbus2),*/

Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],120), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbToPan4,\amp,(-10))
/*],1)*/
					],1)],1)
/*],1)*/,

	/*		/*	4,8,16to15,3,2	*/	Pseq([

					Pbind(\instrument,\wNoise,\dur,Pseq([16/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),

				Pxrand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],4),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162,\start,Pfunc({(~vocal.numFrames-7000).rand})),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],8),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],4),

				],1),*/




				/*Pbind(\instrument,\gateS, \dur,Pseq([16/1],4),\vlSub, 1/*Pfunc({1.rand})*/, \vlSub2,Pkey(\vlSub),
					/*\decC,Pfunc({(-10).rrand(2)}),*/\in,~vocToDispatch,\out,~toFilRise,\group, ~gateGrp4,\tS, 0.39550810372374,\type,Pseq([\note,\rest],inf)),*/


//not reveiving beloq
				Pbind(\instrument,\stereo, \dur, Pseq([64/1],1), \in, ~hitStereoX  ,\spread,0.1,\out,~toFilRise,\tS, 0.39550810372374,\group, ~stereoGrp),

 ],1), ],1),


],1)],1)

);



(~part3a=
Pseq([Ppar([



	Pbind(\instrument, \gate,\type,\rest,     \dur,  Pseq([1/1],1),\tS,  0.39550810372374
		,\buf, Pfunc({~fra = ~leTout.numFrames/ 256 * 240.rand;~fra2= ~leTout.numFrames/ 256 * 190.rand;~fra3 = ~leTout.numFrames/ 256 * 190.rand;~fra4 = ~leTout.numFrames/ 256 * 190.rand})),


Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toExtraFx, \start,Pfunc({~fra})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toExtraFx, \start, Pfunc({~fra2})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))

	],1),
],2),

	Ppar([

		Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toExtraFx, \start, Pfunc({~fra3})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toExtraFx, \start,Pfunc({~leTout.numFrames/ 256 * 190.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([16/1],1)),

		],1)
	],1)
		],1)
);






// ~part3e.play(t)

(~part3e=Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),



Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx,\start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),

		//

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),





Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],2));




~blank=	Pseq([
	Pbind(\instrument, \blank, \dur,Pseq([255/4],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/4],1),\in,Prand([ 3400,~eqBus10],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([63/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/1],1),\in,Prand([ 3400,~eqBus10,~rollingKS],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([62/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([2/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([60/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([4/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3)],1);

//more







~uuu = 1;
(
Routine({


Pseq([


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start,~leTout2.numFrames/256* (215.rand.postln)
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),\rte,Pfunc({~uuu=~uuu+0.2;~uuu;})),




	Pbind(\instrument, \gateS ,\in,~no51   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1.5/1],1)  ],3) ,    \group,~gateGrp4, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),





],12).play(t);

	wait(0.16);

	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/rising.aiff",numChannels:10,duration:t.beatDur*64);
}).play(t,quant:1))


//////


({ReplaceOut.ar(0,In.ar(0)!2)}.play)

({PlayBuf.ar(1,~kb2Test)!2}.play)

~kb2Test.play


({Decimator.ar(PlayBuf.ar(1,~kb2Test),44800,12)!2}.play)


Routine({
({PingPong.ar(~delay6,LPF.ar(Decimator.ar(PlayBuf.ar(1,~kb2Test), XLine.kr(44800, 1200, 5, 1.0, doneAction: 0), XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0)),MouseX.kr(80,14000))!2,0.4,0.5)*0.03}.play);
	wait(0.16);

	// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/crushed.aiff",numChannels:2,duration:t.beatDur*64);

}).play(t,quant:1)

	~crushed=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/crushed.aiff");
~crushed.play


	Decimator.ar(sig, XLine.kr(44100.0, 37485.0, 0.546, 1.0, 1.0, doneAction: Done.freeSelf), XLine.kr(32, 24, 0.546, 1.0, 1.0, doneAction:     Done.freeSelf), 1.0, 0.0);

Pbind(\instrument,\playBufS,\buf,~crushed,\tS,t.beatDur,\dur,Pseq([64/1],1),\out,0).play(t)

Pbind(\instrument,\comp10P,\sB,99,\sA,2,  \ctrl, ~gateComp,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,\out, 0,\group,~gateGrp5),

Pbind(\instrument,\gateS, \tS,t.beatDur,\dur,Pseq([64/1],1),\in,~gateComp,\group,~gateGrp5),






Routine({
({PingPong.ar(~delay6,LPF.ar(Decimator.ar(

	CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/52.midicps/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-0.2)
	, XLine.kr(44800, 1200, 5, 1.0, doneAction: 0), XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0)),MouseX.kr(80,14000))!2,0.4,0.5)*0.03}.play);
	wait(0.16);

	// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/crushed.aiff",numChannels:2,duration:t.beatDur*64);

}).play(t,quant:1)

({PingPong.ar(~delay6,LPF.ar(PlayBuf.ar(1,~kb2Test),MouseX.kr(80,14000)),0.3,0.5)}.play)



({Decimator.ar(PlayBuf.ar(1,~kb2Test),
	SinOsc.kr(~hz1beat/16,1.4).range(44800,1200)
/*	XLine.kr(44800, 1200, 5, 1.0, doneAction: 0)*/,

	XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0))!2}.play)



({Decimator.ar(PlayBuf.ar(1,~kb2Test,loop: 1),
	SinOsc.kr(~hz1beat/16,1.4).range(44800,1200)
/*	XLine.kr(44800, 1200, 5, 1.0, doneAction: 0)*/,
	SinOsc.kr(~hz1beat/16,0).range(65,25)
/*	XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0)*/)!2}.play)



({Decimator.ar(PlayBuf.ar(1,~kb2Test),
	SinOsc.kr(~hz1beat/16,1.4).range(44800,1200)
/*	XLine.kr(44800, 1200, 5, 1.0, doneAction: 0)*/,

	XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0))!2}.play)


Routine({
({PingPong.ar(~delay6,LPF.ar(Decimator.ar(

	CombN.ar(Saw.ar(52.midicps),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)
,decaytime:-0.2)
	, /*XLine.kr(44800, 1200, 5, 1.0, doneAction: 0)*/
		SinOsc.kr(~hz1beat/16,1.4).range(44800,1200), XLine.kr(64, 24, 0.546, 1.0, 1.0, doneAction:     0)),MouseX.kr(80,14000))!2,0.4,0.5)*0.03}.play);

	wait(0.16);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/crushed.aiff",numChannels:2,duration:t.beatDur*64);

}).play(t,quant:1)




Pbind( \instrument,\playBufXG , \impulse, 0.3,\dur,Pseq([1/8],inf), \tS,  0.39550810372374,\start,/*~bufSnoopy2.numFrames.rand.postln*/3574097,\buf,~buf,\out,/*~gateBou*/~eqRi,\loopy,0,\type,Pseq([\note,\rest,\note,\rest],inf),
			\vlSub,0.7.exprand(0.4,1),\vlSub2,Pkey(\vlSub),\atkT,0.10.exprand(0.01),
	\decT,0.6.exprand(0.8,0.3),
	\subsT,0.2.exprand(0.1),
	\relT,0.22.exprand(0.1,1),
	\atckC,6.exprand(1,1),
	\decC,-4.exprand(-0.1),
	\relC,-8.exprand(-2,1),\vlAtk ,1.00.exprand(0.01),\vlRel,0.1.exprand(0.01)).play(t)




Pseq([

		Pseq([
		Pbind( \instrument,\playBuf , \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start, Pfunc({~as}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~as==1676373 ,{~gateBou;},{~eqPass5;})})
			,\loopy,0),
		Pbind(\instrument,\gateS, \dur,  Pseq([10/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([
		Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],12), \tS,  0.39550810372374,\start,  Pfunc({~tram}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~tram==3659560 ,{~eqPass1;},{~eqPass6;})})
			,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
	].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf, \impulse, 0.3,\dur,Pseq([1.5/1],1), \tS,  0.39550810372374,\start, Pfunc({~gram}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~gram==373706 ,{~eqPass2;},{~eqPass7;})})
			,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6.5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

	Ppar([
			Pseq([
Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],3), \tS,  0.39550810372374,\start,  Pfunc({~pick}),\buf,~bufSnoopy2,\out,
				Pfunc({if(~pick==285965 ,{~eqPass3;},{~eqPass4;})})
				,\loopy,0,\decT,0,\atkT,1,\atckC,8,\type,Pseq([\note,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([7.25/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

		Pseq([
			Pbind(\instrument,\gateS, \dur,  Pseq([15.9/1],1),\tS,t.beatDur,\type,\rest),
			Pbind(\instrument,\gateS, \dur,  Pseq([0.1/1],1),\tS,t.beatDur,\type,\rest,\in,Pfunc({
				if(~bool==True,{
					~as=3890307; ~tram=135844;~gram=2321737; ~pick=65263;
					~bool=False;
				},{
				~as=1676373; ~tram=3659560;~gram=373706; ~pick=285965;
					~bool=True;})
		}))],1)
	],1)


	// ~as=4676373/3890307; ~tram=3659560/135844;~gram=373706/2321737; ~pick=285965/65263

],2),


({	EnvGen.ar(
	Env([ 0.15 ,0.21, 0.18,   0.04  ,  0.4,0,0],
		[ 0.0024,0.0003,  0.0048,   0.08  , 0.07 , 0.1  ],[2.4,1,-12.6,-8,2,-1]),doneAction:2);}.plot(duration:0.3))








~rising  = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/rising.aiff");

~rising.play;

~leTout.play

Ppar([

	Pseq([

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0/*~tofinalRythm3*/ ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~rising,\out,0/*~tofinalRythm3*/ ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0/*~tofinalRythm3*/ ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4 ),
	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~tofinalRythm3*/ ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
	],1),


		Pbind(\instrument, \playBufS, \start,0 ,\dur,  Pseq([1/1],256), \tS,  0.39550810372374,\buf,~kb1,\loopy,0)],1).play(t,quant:1)




///yday



~boubou= Ppar([


	Pseq([
		Pseq([
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0 ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)).play(t),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4 ),
			Pbind(\instrument, \playBuf10, \buf ,~rising,\out,0/*~toShift*/ ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
		],1),

		Pseq([
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*2),
			Pbind(\instrument, \playBuf10, \buf ,~ped,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*3 ),
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*2),
		],1),

		Pseq([

			Pbind(\instrument, \playBuf10, \buf,~leTout2,\out,0 ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*3),
			~part3e,
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([128/1],1),\start,0,\type,\rest),
		],1),

		Pseq([
			~part3e,
			Pbind(\instrument, \playBuf10, \buf ,~ped,\out,0 ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			~part3e,
			Pbind(\instrument, \playBuf10, \buf , ~vap,\out,0 ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
		],1),
	],1),

~boost
	// Pbind(\instrument, \playBufS, \start,0 ,\dur,  Pseq([1/1],1024), \tS,  0.39550810372374,\buf,~kb1,\loopy,0,\vl,1)
],1).play(t,quant:1)





//part4

(~hitPart4 =
 Ppar([

				/*Pbind(\instrument, \trippyRise, \dur,  Pseq([64/1],1)/*,   \ph, Pfunc({ 6.00.rand})*/,\tS, 0.39550810372374, \out,~trippyGate ),*/
	// Pbind(\instrument, \playBuf,\dur  ,Pseq([64/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~trippyGate),



			/*56/8=7	*/

		Pseq([
Ppar([
	Pbind(\instrument, \gateS,\dur, Pseq([34/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),],1),

Ppar([
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

			/*Ppar([*/
//BROKEN
				/*	Pseq([
			Pbind(\instrument, \gate,\dur,Pseq([8/1],1), \in,~trippyGate, \out,~riTriptoDisto , \group,~granuGrp,\tS,  0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),

				Prand([
					Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

						Pbind(\instrument, \gate,\dur,Pseq([8/1],1), \in,~trippyGate, \out,~riTriptoDisto , \group,~granuGrp,\tS,  0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub))


					],6)

				],1),*/

		Pbind(\instrument, \playBuf,\dur  ,Pseq([5/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,Pfunc({~leTout2.numFrames/256* (220.rand)}),\dur,Pseq([2/1],1)		,\loopy,0,\tS,0.39550810372374),


				Pbind(\instrument, \playBuf,\dur  ,Pseq([11/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,Pfunc({~leTout2.numFrames/256* (220.rand)}),\dur,Pseq([3/1],1)		,\loopy,0,\tS,0.39550810372374),

			Pbind(\instrument, \playBuf,\dur  ,Pseq([8/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),


		],1),

		Pbind(\instrument, \gateS,\dur, Pseq([34/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


/*],1),*/



//above is 64/1



//remove for ~part3b

/*	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([31/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)


	],1),*/

		//above is 64/1


		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),

							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),
//below was 6

	Pbind(\instrument, \gateS,\dur, Pseq([5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

//above was 7
							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),

	],2),


//above is 32/1


		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),

//above is 32/1



Ppar([
			Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),

			Pbind(\instrument, \gateS,\dur, Pseq([63/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),


				/*Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest],1)),*/



				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,/*639.29,*/672.34]/2)

			],1)

//above is 64/1


],1),	],1));

//end part4


/*],inf /*carefulll*/),*/   /*],1),*/


	// Pbind(\instrument,\stereo, \dur, 9999, \in, ~hitStereo  ,\spread,0.1,\out,~toCom,\tS, 0.39550810372374,\group, ~stereoGrp),



	//hum

	/*Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/**4*/,\ph,4.1),


	Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.08 , \f2,0, \f3,0,  \ic_atk,0,\index,1,\mRatio,1,\out ,/*~flanToDisto2*/ ~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest],inf)),


	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],inf),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp)*/


/*],1));*/





Ppar([
	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],1),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/2,\ph,0.3),


	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk,1,\f1, 0.08 , \f2,0.1, \f3,0,  \ic_atk,0,\index,0,\mRatio,1,\out ,~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,/*\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/),


		Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],64),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp),


],1)
.play(t)


Routine({

Ppar([
			Pbind(\instrument,\lfo13T, \out,~bus9,\val, 0.1609375,  \rL,0,\rH,-0.26, \ph, 0, \dur, Pseq([8/1],1), \tS,  0.39550810372374),
	Pbind(\instrument, \playBufMod,\rte,0.5,\dur, Pseq([6/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, 0/*~vocalBus*/,\tS,  0.39550810372374,\vl,2.162,\modP,~bus9),
		],1).play(t);

	wait(0.16);

		  s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/voc.aiff",numChannels:1,duration:t.beatDur*6);

}).play(t,quant:1);


//NEW SNARE

({}.play)

Routine({

({LPF.ar( Saw.ar(41.2,2),XLine.kr(1000,5500,0.3)*EnvGen.kr(Env.perc(releaseTime:  0.3,curve: -5),doneAction:2))}.play);


~snare.play;

	wait(0.16);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/snare2.aiff",numChannels:1,duration:t.beatDur*2);}).play



~snare2 =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/snare2.aiff")

~snare2.plot

~snare2.play;

~snare.play


({PlayBuf.ar(1,~snare)*0.4}.play)


//CLAP


Routine({

({BLowPass.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1, 1, -8),doneAction: 2)),
	EnvGen.kr(Env([3520,1318],[0.3872,0],-8),doneAction: 2),0.4)
	}.play);

	// ({Saw.ar(82,EnvGen.kr(Env.perc(releaseTime: 0.05,curve: -9),doneAction: 2))}.play);


		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/clap.aiff",numChannels:1,duration:t.beatDur*0.5);}).play



~clap =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/clap.aiff")

~clap.plot
~clap.play
~snare.play

({PlayBuf.ar(1,~clap)*90}.play)

Routine({
Pbind(\instrument, \playBuf, \buf, ~clap,\vl,180,\tS,t.beatDur,\dur,Pseq([ Pseq([1/128],3)  ,   Pseq([1/2],1)],1),\loopy,0).play;


wait(0.158);
	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/clap2.aiff",numChannels:1,duration:t.beatDur*0.5);


}).play


~clap2 =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/clap2.aiff")

///////



~clap2.play;
~snare.play
~snare3.plot
~snare2.play

Routine({
Pbind(\instrument, \playBuf, \buf, ~clap2,\vl,0.1,\tS,t.beatDur,\dur,Pseq([1/1],1),\loopy,0,\type, Pseq([\note,\rest,\note,\rest ],inf),\out,0).play;


Pbind(\instrument, \playBuf, \buf, ~snare,\vl,1,\tS,t.beatDur,\dur,Pseq([1/1],1),\loopy,0,\type, Pseq([\note,\rest,\note,\rest ],inf),\out,0).play;
	wait(0.158);
		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/snaCla.aiff",numChannels:1,duration:t.beatDur*1);

}).play



~snare3 =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/snaCla.aiff")




({BLowPass.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1, 1, -8),doneAction: 2)),
	EnvGen.kr(Env([3520,1318],[0.3872,0],-8),doneAction: 2),0.4)*EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.38],-4))
	}.play);



({EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.38],-4))}.plot(duration:0.5))

({BLowPass.ar(WhiteNoise.ar(0.4),
	EnvGen.kr(Env([3520,1318],[0.3872,0],-8),doneAction: 2),0.5)*EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.37],-4))
	}.play);

~snare.play

Routine({

({BLowPass.ar(WhiteNoise.ar(0.4),
	EnvGen.kr(Env([3520,1318],[0.3872,0],-8),doneAction: 2),0.5)*EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.37],-4))
	}.play);
/*	wait(0.1);*/

		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/clap.aiff",numChannels:1,duration:t.beatDur*1);}).play



~clap =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/clap.aiff")


	~clap.play


/////



SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.01,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.51 ,   0.2  ,  0.8 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[-1,6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;

//agai

Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\type, Pseq([\rest,\rest,\note,\rest ],inf),\dur, Pseq([1/2], inf) ,\out,0,\dA,Pseq([ /* Pseq([1],32), */Pseq([1],32)],inf)).play(t,quant:2)


~clap2.play

Pbind(\instrument, \playBuf, \buf, ~clap2,\vl,1,\tS,t.beatDur,\dur,Pseq([1/2],4),\loopy,0,\type, Pseq([\rest,\rest,\note,\rest ],inf),\out,0).play(t,quant:2)


~leTout2.play

~clap2.play;
~snare.play
~snare3.play
~snare2.play

Routine({
Pbind(\instrument, \playBuf, \buf, ~clap2,\vl,0.1,\tS,t.beatDur,\dur,Pseq([1/1],1),\loopy,0,\type, Pseq([\note,\rest,\note,\rest ],inf),\out,0).play;


Pbind(\instrument, \playBuf, \buf, ~snare,\vl,1,\tS,t.beatDur,\dur,Pseq([1/1],1),\loopy,0,\type, Pseq([\note,\rest,\note,\rest ],inf),\out,0).play;
	wait(0.154);
		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/snaCla.aiff",numChannels:1,duration:t.beatDur*1);}).play

~clap2.play
~snare3.play
~snare3 =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/snaCla.aiff")



~snare4 =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/snare4.aiff")
~snare4.play
Routine({

({HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(PlayBuf.ar(1,~snare3,),200),200),200),200),200),200),200),200)}.play);

	wait(0.12);
		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/snare4.aiff",numChannels:1,duration:t.beatDur*1);}).play



({(PlayBuf.ar(1,~snare4))}.play)

Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare3,\type, Pseq([\rest,\rest,\note,\rest ],inf),\dur, Pseq([1/2], inf) ,\out,0,\dA,Pseq([  Pseq([1],32), Pseq([0.5],32)],inf)).play(t,quant:2)




SynthDef(\EQ6, {|out=0, in, val, quant, gain,frq=0, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
		BPeakEQ.ar(	BPeakEQ.ar(PlayBuf.ar(1,~snare3,),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* 1)};).play;

///old passant

Pseq([
//maybe no rrepeat wiht this one
		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start, 514019,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([12/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([

		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],2), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([4/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],2), \tS,  0.39550810372374,\start,2286611,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),







			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/2],2), \tS,  0.39550810372374,\start,4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1)



/////




( // this first
var lfo = { |freq, phase, gate|
  var phasor = (Phasor.kr(gate, freq * 2pi / ControlRate.ir, 0, 2pi) + (phase * 2pi)).wrap(0, 2pi);
  SinOsc.kr(0, phasor);
};

var vco = { |freq, amp|
  var slop = 0.01;
  var rate = freq + LFNoise1.ar(LFNoise1.kr(1).range(0.2, 0.3), mul: slop * (freq / 1000));
  var phase = Phasor.ar(DC.ar(0), rate / SampleRate.ir, 0, 1) * 2pi;
  var k = 12000 * (SampleRate.ir/44100) / (freq * log10(freq));
  var sinSig = SinOsc.ar(0, phase);
  var cosSig = SinOsc.ar(0, phase + (pi/2));
  var sqSig = tanh(sinSig * k);
  var sawSig = sqSig * (cosSig + 1) * 0.5;
  [sqSig, sawSig] * amp;
};

SynthDef(\roygbiv, { |out = 0, midinote = 40, gate = 0|
  var note = midinote.lag2(0.03);
  var freq1 = (note + (lfo.(1.75, 0.75, gate) * 0.2)).midicps;
  var freq2 = (note - 12 + (lfo.(0.98, 0, gate) * 0.25)).midicps;
	var sig = vco.(freq1, 0.4)[1] + vco.(freq2, 0.1)[0] * SinOsc.kr(0.33).range(100,0)+ WhiteNoise.ar(0.04);
  var env = Env.adsr(0.001, 3.3, 0.3, 0.17).ar(0, gate);
	var cutoff = 80 * (env * EnvGen.kr(Env([41.2,0],[3,0]))).midiratio;
  sig = DFM1.ar(sig, cutoff, 0.05, 2.1);
  sig = sig * Env.adsr(0.001, 0, 1, 0.18,0.1).ar(0, gate);
  Out.ar(out, sig!2 * 0.22);
}).add;
)


( // then this

x.free; y.free; r.stop;

	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrk.aiff",numChannels:2,duration:t.beatDur*8);
x = Synth(\roygbiv);

y = {
  var dry = BHiPass.ar(In.ar(0, 2), 80);
  var wet = NHHall.ar(LPF.ar(dry, 3000), 1.3, hiFreq: 2600, hiRatio: 0.9);
  ReplaceOut.ar(0, dry + (wet * 0.85));
}.play(addAction: 'addToTail');

r = fork {
  loop {
    x.set(\midinote, 28, \gate, 1);
    exprand(0.2, 2).wait;
    x.set(\gate, 0);
    exprand(0.01, 0.03).wait;
  }
}
)

~bssBrk.play

~bssBrk =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrk.aiff")



~bssBrk.play
({PlayBuf.ar(2,~bssBrk)*0.1}.play)
Routine({
({LPFVS6.ar( PlayBuf.ar(2,~bssBrk),100)*4}.play);

	wait(0.16);
	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrkF.aiff",numChannels:2,duration:t.beatDur*8);

}).play
	~bssBrkF.play
~bssBrkF =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrkF.aiff")
~bssBrk =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrk.aiff")

/////////




SynthDef(\tantra,{|out=0,wT=0,in,dur|Out.ar(out,SelectX.ar(wT,[

	PingPong.ar(~delay3.bufnum,Mix.ar( In.ar(in,10) )!2,0.3)*0.23,
	FreqShift.ar(In.ar(in,10),  LFNoise0.kr(5.15).range(-2041.2,3020.6)),
	FreeVerb.ar( In.ar(in,10), 0.9,0.9,0.7),

])* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2))}).add;




Ppar([
	// Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([256/1],inf)),
Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0/*~tantraG*/,\loopy,0,\tS,t.beatDur,\dur,Pseq([256/1],inf)),

	// Pbind(\instrument, \aGate, \in, 0/*~tantraG*/,  \out,~toFx, \out2,0, \dur,Pseq([4/1],inf)

	Pbind(\instrument, \tantra, \in,0/*~toFx*/, \wT,Pfunc({3.rand}), \dur,Pseq([4/1],inf),\group, ~granuGrp,\out,~toDelay10b,\type,Pwrand(
		[\note,\rest],[1,7].normalizeSum,inf))],1).play(t)



// Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([256/1],inf)).play(t)


gate


		~granuGrp= Group.new;
~delayGrp= Group.after(~granuGrp)

~del10X=Synth(\del10,[\in,~toDelay10b,\decT,1.5544/*0.7772*/,\out,~tofinalRythm],~delayGrp);


\out->tantra       y/n
\out2->normal     y/n

//damn
({PingPong.ar(~delay3.bufnum,Mix.ar(PlayBuf.ar(10,~leTout,startPos:0,loop: 1))!2,0.3)}.play)



({FreqShift.ar( /*PingPong.ar(~delay3.bufnum,*/PlayBuf.ar(10,~leTout,startPos:0,loop: 1)/*!2,0.3)*/,  LFNoise0.kr(5.15).range(-2041.2,3020.6))       }.play)




({FreeVerb.ar( /*PingPong.ar(~delay3.bufnum,*/PlayBuf.ar(10,~leTout,trigger: Impulse.kr(20.6),startPos:LFNoise0.kr(5.15).range(10000,~leTout.numFrames),loop: 1)/*!2,0.3)*/, 0.9,0.9,0.7)       }.play)


GrainBuf.ar(

	ONE WITH GRANU TO SAW and LP going up



({PlayBuf.ar(1,~leTout,startPos:0,loop: 1)}.play)


({Saw.ar(432,EnvGen.kr(Env.perc(releaseTime: 0.3),Impulse.ar(LFNoise0.kr(5.15).range(41.2,20.6)).range(1,0),doneAction: 0))}.play)




Ppar([

	Pbind(\instrument,\ptr, \buf, ~e, \out, ~ptrBus,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~e,\group,~recGrp,\dur,inf),


	Pbind(\instrument,\gran,\dur,Pseq([1/16],inf),\amp, 1,\buf, ~e,\out,~bpK,\ptrBus, ~ptrBus,\group,~granGrp,\duration,0.0968/4,\impulse,80.1,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument, \filter, \freqFil,100,\dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp,\qf2,0.4),

	],1).play(t)



	Routine({



	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374,\group,~lfoGrp).play(t);

		wait(0.16);

		 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/noiseHIt.aiff",numChannels:10,duration:t.beatDur*4);

	}).play(t,quant:1)

	~noise.play

	~noise =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/noiseHIt.aiff")


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\start,~leTout.numFrames.rand,\out,0/*~tantraG*/,\loopy,0,\tS,t.beatDur,\dur,Pseq([2/1],4)).play(t)



	////////


	Routine({

Ppar([

Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([Pseq([1/1], 4),Pseq([1/2], 8),Pseq([1/4], 16),Pseq([1/8], 32),
],1)	,\out,~snareEQ,\type,Pseq([Pseq([\rest],4),Pseq([\note],inf)],inf)),





Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~k2,\dur, Pseq([Pseq([1/1], 4),Pseq([1/2], 8),Pseq([1/4], 16),Pseq([1/8], 32),
],1),	\out,~limitKick)

],1).play(t);

	wait(0.16);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/kickRise.aiff",numChannels:2,duration:t.beatDur*16);


}).play(t,quant:1)

~kRise.plot
~kRise=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kickRise.aiff");



Pseq([
	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\dur, Pseq([256/1], 1),\type,\rest),

Ppar([

Pbind(\instrument, \playBufS,  \tS,  0.39550810372374,\buf,~kRise,\dur, Pseq([16/1], 1),\out,~kSRise),
Pbind(\instrument,\blank, \in,~kSRise,\out,~toKbGate,\dur,Pseq([16/1], 1),\group,~kbGate)

],1)

],1),




.play(t)



Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/1],1)).play(t)


~k2.play
~kick.play

	Pseq([Pbindf(~kick,\out,~limitKick)],inf).play(t)

	Pseq([Pbindf(~kick,\out,0,\dur, Pseq([Pseq([1/1], 4),Pseq([1/2], 8),Pseq([1/4], 16),Pseq([1/8], 32),
],1)	)],inf).play(t)


	//PASSANT


	/*	Pseq([

		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,/*~toGate10*/0,\group,~gateGrp5),


Pseq([
//maybe no rrepeat wiht this one
		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2.5/1],1), \tS,  0.39550810372374,\start, 514019,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([12.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([

		Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\note,\note,],inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
	].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1.5/1],1), \tS,  0.39550810372374,\start,2286611,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),







			Pseq([
		/*Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-3),\type,Pseq([\note,\note,\rest,\note,\note,],inf)),*/


Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0,\decT,0,\atkT,1,\atckC,4,\type,Pseq([\note,\note,\rest],inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1)



].scramble,inf),*/




//passant

/*Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2.5/1],inf), \tS,  0.39550810372374,\start, 514019,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0).play(t)*/

//~pass1 =~pass1 - 20000
//(~bufSnoopy.numFrames.rrand(400000)- 400000).postln;  Pseq([2.5/1],1)
// ~test1=Synth(\playBufX ,[ \impulse,0.31604915 /*5.15/6/*\dur,Pseq([6/1],1),*/*/,\start,(~bufSnoopy.numFrames.rrand(400000)- 400000).postln ,\buf,~bufSnoopy,\out,~filterBou,\loopy,1,\dA,0]);
//~test1.set(\start,514019)
// ~eq24.free
~fil6 =Synth(\filter,[\which,0, \in ,~filterBou, \busMod, ~bus3,\freqFil,4700, \qf,0.7, \out, ~gateBou],~filterGrp); /*~fil6.set(\freqFil,4900,)*/
~eq24=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq24.set(\in, ~gateBou, \out , ~reverbBus4,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,1200,\shelf,1.2, \gain4,(-15.4),\frq, 170,\val5,600,\shelf2,1.45,\gain5,(-14));


// 1194540
// ~eq25.free
/*~pass2= ~pass2-40000*/

/*Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],inf), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\note,\note,],inf)).play(t)*/

//(~bufSnoopy.numFrames.rrand(400000)- 400000).postln;
// ~test2=Synth(\playBufX ,[ \impulse, 5.15/3/*\dur,Pseq([3/1],1),*/,\start,(~bufSnoopy.numFrames.rrand(400000)- 400000).postln,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,1])
// ~test2.set(\start,4060549);
~fil7 =Synth(\filter,[\which,0, \in ,~filterPass1, \busMod, ~bus3,\freqFil,2100, \qf,0.7, \out, ~eqPass1],~filterGrp); /*  ~fil7.set(\freqFil,1700,)*/
// ~fil7.set(\freqFil,2100)

~rev25=Synth(\reverb,~quickFi,~revGrp);~rev25.set(\in,~revPass1, \out,~compPass1);
~comp25=Synth(\comp,[\ctrl, ~kbus],~compGrp);
~comp25.set(\thr,0.8 ,\sB, 1.016,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,2,\in, ~compPass1, \out,~limitPass1);
~mix25= Synth(\limitertoMixer,[\c58,1,\in, ~limitPass1, \gain,24, \out,~stereoPass1],~limitGrp);
~mix25.set(\gain,16);
~stereo25=Synth(\stereo,[\dur, 9999, \in, ~stereoPass1  ,\spread,0.2 ,\out,0], ~stereoGrp);


// ~eq26.free            ~pass3 = ~pass3-30000

/*
Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1.5/1],inf), \tS,  0.39550810372374,\start,2286611,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0).play(t)*/

//(~buf.numFrames.rrand(400000)- 400000).postln
//~test3=Synth(\playBufX ,[ \impulse, 5.15/*\dur,Pseq([1/1],1),*/,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,1])
// ~test3.set(\start,2286611);
~fil8 =Synth(\filter,[\which,0, \in ,~filterPass2, \busMod, ~bus3,\freqFil,1600, \qf,0.7, \out, ~eqPass2],~filterGrp);
// ~fil8.set(\freqFil,1600)
~eq26=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq26.set(\in, ~eqPass2,\out, ~revPass2,\val, 368,\quant, 1.6, \gain,(-14),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,1200,\shelf,1.3, \gain4,(-10),\frq, 230);
~rev26=Synth(\reverb,~quickFi,~revGrp);~rev26.set(\in,~revPass2, \out,~compPass2);
~comp26=Synth(\comp,[\ctrl, ~kbus],~compGrp);
~comp26.set(\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~compPass2, \out,~limitPass2);
~mix26= Synth(\limitertoMixer,[\c26,1,\in, ~limitPass2, \gain,30, \out,~stereoPass2],~limitGrp);
 ~mix26.set(\gain,17,\out,~stereoPass2);
~stereo26=Synth(\stereo,[\dur, 9999, \in, ~stereoPass2  ,\spread,0.2 ,\center,0.3,\out,0], ~stereoGrp);


/*Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],inf), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0,\decT,0,\atkT,1,\atckC,4,\type,Pseq([\note,\note,\rest],inf)).play(t,quant:2)*/

// ~eq27.free
// (~buf.numFrames.rrand(400000)- 400000).postln
// ~test4=Synth(\playBufX ,[ \impulse, 2.575/*\dur,Pseq([2/1],1),*/,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,1])
//~test4.set(\start,4302193)
~fil9 =Synth(\filter,[\which,0, \in ,~filterPass3, \busMod, ~bus3,\freqFil,2800, \qf,0.7, \out, ~eqPass3],~filterGrp);/*~fil9.set(\freqFil,2800)*/
~eq27=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq27.set(\in, ~eqPass3,\out, ~revPass3,\val, 3850,\quant, 1.8, \gain,(-15),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,1200,\shelf,1.46, \gain4,(-22),\frq, 120,\val5,650,\shelf2,1.6,\gain5,(-17));
~rev27=Synth(\reverb,~quickFi,~revGrp);~rev27.set(\in,~revPass3, \out,~compPass3);
~comp27=Synth(\comp,[\ctrl, ~kbus],~compGrp);
~comp27.set(\thr,0.38 ,\sB, 1.026,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,10,\in, ~compPass3, \out,~limitPass3);
~mix27= Synth(\limitertoMixer,[\c56,1,\in, ~limitPass3, \gain,35, \out,~stereoPass3],~limitGrp);
~mix27.set(\gain,37.6,\out,~stereoPass3, \c56,1);
~stereo27=Synth(\stereo,[ \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,0], ~stereoGrp);

/////



	/*~passant=*/Pseq([

		Pseq([
		Pbind( \instrument,\playBuf , \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start, 514019,\buf,~bufSnoopy,\out, ~gateBou,\loopy,0),
		Pbind(\instrument,\gateS, \dur,  Pseq([10/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([
		Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],12), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy,\out, ~eqPass1,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
	].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf, \impulse, 0.3,\dur,Pseq([1.5/1],1), \tS,  0.39550810372374,\start,2286611,\buf,~bufSnoopy,\out, ~eqPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6.5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],3), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~eqPass3,\loopy,0,\decT,0,\atkT,1,\atckC,4,\type,Pseq([\note,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([7.25/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),



],inf).play(t)

	///nexttt



Ppar([


Pseq([


		Pbind(\instrument, \lfo13T, \val,~hz1beat/64,\dur,Pseq([16/1],1),\rL,0,\rH,3350, \ph,3.1,\out, ~bus33 , \group, ~lfoGrp,\tS, 0.39550810372374),

Pbind(\instrument, \lfo13T, \val,~hz1beat/64,\dur,Pseq([48/1],1),\rL,0,\rH,3350, \ph,3.1,\out, ~bus33 , \group, ~lfoGrp,\tS, 0.39550810372374),


	],1),

		Pseq([

		Pbind( \instrument,\playBufXG , \impulse, 0.3,\dur,Pseq([1/8],16), \tS,  0.39550810372374,\start,~bufSnoopy2.numFrames.rand.postln,\buf,~bufSnoopy2,\out,~gateBou,\loopy,0,\type,Pseq([\note,\rest,\note,\rest],inf),
			\vlSub,0.7.exprand(0.4,1),\vlSub2,Pkey(\vlSub),\atkT,0.10.exprand(0.01),
	\decT,0.6.exprand(0.8,0.3),
	\subsT,0.2.exprand(0.1),
	\relT,0.22.exprand(0.1,1),
	\atckC,6.exprand(1,1),
	\decC,-4.exprand(-0.1),
			\relC,-8.exprand(-2,1),\vlAtk ,1.00.exprand(0.01),\vlRel,0.1.exprand(0.01)),


	Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),

	].scramble,8),


	Pbind(\instrument, \shift1,\in, ~gateBou ,\bus,  ~bus33, \dur, Pseq([64/1],1),\group,~filterGrp)



],1).play(t)





///rise1
	// Pbind(\instrumentm,\wNoise,\dur,Pseq([64/1],1),\tS,t.beatDur,

SynthDef(\noisy,{Out.ar(~bellFlang4, WhiteNoise.ar(0.5))}).add;

Routine({
Ppar([
	Pbind(\instrument,\lfo13, \val ,~hz1beat/128,\ph,5.6,\rL,100,\rH,9520,\dur,Pseq([64/1],1),\out,~bus19),
	Pbind(\instrument,\noisy,\dur,Pseq([64/1],1))
],1).play(t,quant:1);

	wait(0.16);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/rise1.aiff",numChannels:1,duration:t.beatDur*128);

}).play(t,quant:1)

~rise1=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/rise1.aiff");
~rise1.play

 ~flangBon=Synth( \flanger1,[ \in,~bellFlang4, \out,~riToDisto2],~phaserGrp);
 ~flangBon.set(\flangefreq,~hz1beat/64,\ph,4.3,\fdback,-0.8,\out,~riToDisto2);
~distBon= Synth(\disto,[\in, ~riToDisto2 , \out,~riToEnv3], ~distoGrp);

~filBon=Synth( \filter, [\in,~riToEnv3,\out,0, \busMod,~bus19, \which, 0,\qf,0.5, \freqFil, 1500],~filterGrp);

// Pseq([~kick],128).play(t)

~eqBon =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eqBon.set(\in, ~riToEq , \out, ~riToRev, \val4,0,\shelf,0, \gain4,(-0), \val5,0,\shelf2,0, \gain5,0/*\val,3000, \quant,1, \gain,(-8),\val2,5000,\quant2,6, \gain2,(-8)*/);

Pbind(\instrument, \playBuf,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([64/1],1),\loopy,0,\start,1430016).play(t)
	~rise1.numFrames


	//rising 2



~uuu = 1;
(
Routine({


Pseq([


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start,~leTout2.numFrames/256* (215.rand.postln)
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),\rte,Pfunc({~uuu=~uuu+0.2;~uuu;})),



Prand([
	Pbind(\instrument, \gateS ,\in,~no51   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],10), Pseq([1.5/1],1)  ],1) ,    \group,~gateGrp4, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),


					Pbind(\instrument, \gateS , \dur,Pseq([1/8],20),  \in,~no51 ,\type,Pseq([\note,\rest],inf),\tS, 0.39550810372374,  \group,~gateGrp4,)
				],1)


],12).play(t);

	wait(0.16);

	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/rising.aiff",numChannels:10,duration:t.beatDur*33);
}).play(t,quant:1))



	///slidy


	Ppar([

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c, Pseq([  0],3),
	Pseq([  0],8),

	Pseq([  ~toSlide],5),~toDelay10c, Pseq([  0],2),
		Pseq([  0],8),
	Pseq([  ~toSlide],6),~toDelay10c, Pseq([  0],1),
		Pseq([  0],8),
	Pseq([  ~toSlide],7),~toDelay10c,
	Pseq([  0],8),


],inf)


	, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],128),

	\type,Pseq([\note,\note,\note,\note,\note,      \rest,\rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,             \rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,       \rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,\note,
	Pseq([\rest],8),
],inf)),

	Pbind(\instrument, \envSli, \out,~bus34,\val1,700,\val2,11000, \tS, t.beatDur,\dur,Pseq([2/1],32),\crv,3,
		\fc1,0.77,\fc2,0.23
	)


],1).play(t)

~slidy=Synth(\filter10, [\freqFil,100, \busMod,~bus34,\qf,0.5,\in,~toSlide,\out,0],~filterGrp)


//break new backup

	(
	~breakPart1=		Ppar([


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([61/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


	/*	Pbind(\instrument, \playBuf,\rte,1,\dur, Pseq([6/1],1),\impulse, 0.00001,\loo,0,\buf,~voc,\out, ~vocalBus,\tS,  0.39550810372374,\vl,1)*/


	],1),


Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

				Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([90/1],1), \tS,  0.39550810370174/*,\type,Pseq([\rest,\note],inf)*/),

				 ],1),


	Pbind(\instrument, \kiasmosPad,\scale, Scale.chromatic,\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1], \amp, 0.1,\atk, 4, \rel, 1.5544,\legato, 2,\dur, Pseq([16/1],5),\tS,  0.39550810370174,\out,~kiasDisto),

	//from here
Pseq([

						Ppar([
			Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),
						Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,Pseq([64/1],1),\ph,1.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),



	Pbind(\instrument, \playBufS, \dur,  Pseq([8/1],1), \tS,  0.39550810370174,\buf,~kb1,\out, ~filKB,\loopy,0, \start,0),



			Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),







/*
	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


						Pbind(\instrument,\playBufXG2, \buf,~pad, \atckC,4, \relC,-8,\decT ,0.85, \atkT,0.05,\relT,0.1,  \vlSub, 0.6,  \vlDec,Pkey(\vlSub), \vlSub2,Pkey(\vlSub),
						\dur,  Pseq([32/1],1), \tS,  0.39550810370174,\start,0/*~pad.numFrames.rrand(180000)-180000*/),

				 ],1),*/


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,\rest,\vl,1.2),
				Pbind(\instrument, \playBufS, \dur,  Pseq([24/1],1 ), \tS,  0.39550810372374,\buf,~kb1,\out,~filKB2, \start,0),

		Ppar([

	Pbind(\instrument,\lfo13, \val,0.0201171875*8,\dur,Pseq([16/1],1)/*Pseq([48/1],1)*/,\ph,4.4, \out,~mixM, \tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out,~roomM ,\tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out, ~dampM,\tS, 0.39550810372374,\rL, 0.41,\rH,0.8),

	/*Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],45), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],44),\rest,\rest],1),\vl, 1.3),*/
Pseq([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],12), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],13),\rest,\rest,\rest],1),\vl, 1.3),
						Pbind(\instrument, \playBuf,\rte,0.5,\dur, Pseq([2/1],1),\impulse, 0.00001,\loo,0,\buf,~k2/*~vocal*/,\out, /*~vocalBus*/0,\tS,  0.39550810372374,\vl,2.162,\type,\rest)],1)


],1)
					],1),

						 ],1),


					Ppar([

//here

				Pbind(\instrument, \envSli, \out,   ~bus30,  \dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,30,\val2,7000,\crv,16),

				  Pbind(\instrument, \shap, \dur,Pseq([1/1],64),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374),

//changed buffer for one night
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test, \vl, 0.038,\dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/
/*Pbind(\instrument,\playBufS/*\playBufXG*/, \buf,~kb2Test2, \atckC,7, \relC,-18,\decT ,0.6, \atkT,0.15,\relT,0.24,  \vlSub, 0.02,\vlDec,Pkey(\vlSub) ,\vlSub2,Pkey(\vlSub), \dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),*/

				//need bassshap, must hp at the end
/*	Pbind(\instrument, \bass,\type, Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf),\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur/4 , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,~kbToPan4/*~bassEq*/),*/


Ppar([
Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note,\rest,\note,\note,\note], inf)/*Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf)*/,\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur , \rel2, t.beatDur * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-20),\out,/*~kbToPan4*/~bassEq, \tS,  0.39550810372374),


Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],64), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan4,\loopy,0,\start,0,\tS, 0.39550810372374),


Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,8*t.beatDur,\out,~hitEq, \tS, 0.39550810372374,\type,\rest ),
				Pbind(\instrument, \wNoise,\dur, Pseq([24/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,24*t.beatDur,\out,~hitEq,\type,\rest ,\tS, 0.39550810372374),

						/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbindf(~kick,\out,  ~revKck2),

/*					Pbind(\instrument, \wNoise,\dur, Pseq([31/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbind(\instrument, \wNoise,\dur, Pseq([27/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,27*t.beatDur,\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\atk ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1100,\valEnd,500,\durF,4*t.beatDur,\out,~hitEq, \tS, 0.39550810372374),
				],1),

			/*Pseq([*/
				/*Pbind(\instrument,\wNoise,\dur,Pseq([64/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\tS,  0.39550810372374,\type,\rest),*/
Ppar([

						//here// need eq
Pbind(\instrument,\wNoise,\dur,Pseq([60/1],1) ,\dA2,0, \wFil,2,\dec,Pkey(\dur),\tS,  0.39550810372374,\out,~hitEq2/*~hitStereoX*/,   \amp,0.2  ,\amp2,0.2),



	Pseq([
		Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,0, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),
							/*Ppar([
								Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbus2),*/

Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],120), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbToPan4,\amp,(-10))
/*],1)*/
					],1)],1)
/*],1)*/,

	/*		/*	4,8,16to15,3,2	*/	Pseq([

					Pbind(\instrument,\wNoise,\dur,Pseq([16/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),

				Pxrand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],4),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162,\start,Pfunc({(~vocal.numFrames-7000).rand})),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],8),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],4),

				],1),*/




				/*Pbind(\instrument,\gateS, \dur,Pseq([16/1],4),\vlSub, 1/*Pfunc({1.rand})*/, \vlSub2,Pkey(\vlSub),
					/*\decC,Pfunc({(-10).rrand(2)}),*/\in,~vocToDispatch,\out,~toFilRise,\group, ~gateGrp4,\tS, 0.39550810372374,\type,Pseq([\note,\rest],inf)),*/


//not reveiving beloq
				Pbind(\instrument,\stereo, \dur, Pseq([64/1],1), \in, ~hitStereoX  ,\spread,0.1,\out,~toFilRise,\tS, 0.39550810372374,\group, ~stereoGrp),

 ],1), ],1),


],1)],1)

);


	////

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/ 192 * 160.rand,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],16)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/ 192 * 160.rand,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],8)),



	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/ 192 * 160.rand,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],4)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/ 192 * 160.rand,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],2)),
],1).play(t,quant:1)




Prand([

Pseq([

Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	\type,Pseq([\note,\rest],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/8],7),	\type,Pseq([\rest,\note],inf)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,1),

Pseq([

Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/16],1),	\type,Pseq([\note,\rest],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],15),	\type,Pseq([\rest,\note],inf)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,1)],8).play(t,quant:1)



	//64



	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),

	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),

	Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toDelay10,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1),\vl,1),


		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),

		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	//32

	/*Pbind(\instrument, \gateS,\dur, Pseq([4/1],8), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)),*/

	Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),
	Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),

	Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),
	Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),



	Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),




~glou=~leTout2.numFrames/256* (220.rand)

 \start,Pfunc({1.exprand(~leTout2.numFrames-860032)})

Pseq([


	Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1)),

Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],8)),


],inf).play(t)




Routine({


Pseq([

/*MouseY.kr(*/


Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],8)),

	Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/4],4)),



		Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10Mod, \buf ,~leTout2,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1)),

],inf).play(t);

	wait(0.16);

		// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/elec.aiff",numChannels:10,duration:t.beatDur*64);
}).play(t,quant:1)



~charmin.play

Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1),\start,Pfunc({~charmin.numFrames.rand})).play(t,quant:1)

Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,0/*~toExtraFx*/
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([64/1],1)).play(t,quant:1)

~charmin=  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/elec.aiff");


////compresisobn


	~kickfader = Synth(\fader, [in: ~toExtraComp, out: 0], ~kickgroup1, \addToTail);
	~padfader = Synth(\fader, [in: ~toCom2, out: 0], ~padgroup1, \addToTail);
	~fakeSidechain = Synth(\fakeSidechain, [
		out: ~toCom2, sideBus: ~toExtraComp,
		relax: 0.1
	], ~padfader, \addBefore);


~kickfader2 = Synth(\fader, [in: ~extraComp    , out: 0], ~kickgroup2, \addToTail);
	~padfader2 = Synth(\fader, [in: ~toExtraComp          , out: 0], ~padgroup2, \addToTail);
	~fakeSidechain2 = Synth(\fakeSidechain, [
		out: ~toExtraComp      , sideBus: ~extraComp,
		relax: 0.1
	], ~padfader2, \addBefore);



	//


	~compUlti= Synth(\comp10,[\ctrl, ~snBus,],~compGrp5);
~compUlti.set(\thr,0.76 ,\sB, 1.06,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom, \out,~eqBus10);
// ~compUlti.set(\out,0)

/*~compUlti.set(\out,~eqBus10)*/

~mixingUlti = Synth(\EQHP10D, [\in, ~eqBus10, \frq, 100,\vol, 2.2,\out2,~fusible2,\out,~toExtraComp /*\val,4000,\quant,1.98,\gain,(-6.8)*/], ~eqGrp3);
 ~mixingUlti.set(\vol, 1.31,/*\gain,(-6.9),\quant,1.98*/);//1.82

				// ~mixingUlti.free



~compExtra= Synth(\comp10,[\ctrl, ~snBus,],~dynaEq2);
~compExtra.set(\thr,0.85 ,\sB, 1.04,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in,~extraComp , \out,~extraEq);
~mixingExtra=Synth(\EQHP10, [\in, ~extraEq, \frq, 100,\vol, 2.2,\out,0], ~compGrp7);
 ~mixingExtra.set(\vol, 1.75,/*\gain,(-6.9),\quant,1.98*/\out,0);//1.82


	/////paddd

	10.do({{FreeVerb.ar(SinOsc.ar(
	Saw.kr(Rand(0.01,2000)).range(0,100)+
	Rand(0.01,2000),phase: Rand(0.001,6),mul: Rand(0.001,0.5)),Rand(0.05,0.9), Rand(0.05,0.9),Rand(0.05,0.9) )!2}.play})



~pad3=Buffer.read( s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad3.aiff");

// ~pad4=Buffer.read( s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad4.aiff");
~pad5=Buffer.read( s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad5.aiff");

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pad5.aiff",numChannels:2,/*duration:t.beatDur*64*/);


Routine({
({PlayBuf.ar(2,~pad5,VarSaw.kr(0.084/16,0).range(0.3,4),loop: 1)*0.1}.play);

	wait(0.16);


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pad6.aiff",numChannels:2,duration:t.beatDur*64);

}).play

~pad6=Buffer.read( s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad4.aiff");

({PlayBuf.ar(2,~pad6)}.play);

13.do({{FreeVerb.ar(SinOsc.ar(
/*	Saw.kr(Rand(0.01,2000)).range(0,100)+*/
	Rand(0.01,2000),phase: Rand(0.001,6),mul: Rand(0.001,0.5)),Rand(0.05,0.9), Rand(0.05,0.9),Rand(0.05,0.9) )!2}.play})



Pbind(\instrument, \playBufS, \dur, Pseq([64/1],inf),\buf, ~pad6, \tS, t.beatDur).play(t)


Pbind(\instrument, \playBufS, \dur, Pseq([30/1],inf),\buf, ~pad6, \tS, t.beatDur,\out,~toNoiseEq).play(t)





	Pbind(\instrument, \playBufS, \buf,~funkPerc2,\start, ~funkPerc2.numFrames.rand/64*(64.rand.postln),\tS,t.beatDur,\dur,Pseq([2/1],1)).play(t,quant:1)




	~funkPerc.play;

	Pseq([~kick],inf).play(t)



~hity=16;


Pbind(\instrument, \wNoise,\dur, Pseq([
	// Prand([8,4,1,1/2],1)

	Pfunc({~hity=~hity/2})
	/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300).postln}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374).play(t)





(~hitPart1 =Pseq([//maybe change to 12

//64



	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),



	Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toDelay10,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1),\vl,1),




		Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	//32



	Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),






Ppar([

	Pseq([
	/*Pbind(\instrument, \wNoise,\dur, Pseq([14/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),*/

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,Pseq([\note,\rest],inf)),


				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		/*Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),*/
		/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),*/


				Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)




	],1),
//64
/*Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom2, \start,~leTout.numFrames/ 192 * (160.rand),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],8)),
				Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom2, \start,~leTout.numFrames/ 192 * (160.rand),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],8)),
				Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom2, \start,~leTout.numFrames/ 192 * (160.rand),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],4)),
				Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom2, \start,~leTout.numFrames/ 192 * (160.rand),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],8)),
				],1),*/
	],1),




Ppar([
		//chnaged last ngiht
		Pbind(\instrument, \playBufXG,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([64/1],1),\loopy,0,\start,1430016,\out,~downEq2,\atckC,14,\atkT,0.13,\decT,0.87)

		// Pbind(\instrument,\del10T,\in,~toDelay10b,\out,~toCom,\dur,Pseq([64/1],1),\group,~delayGrp),


/*Pbind(\instrument, \comp10P,\ctrl, ~snBus,\thr,0.76 ,\sB, 1.08,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom3, \out,~eqBus10,\tS,t.beatDur,\dur,Pseq([64/1],1),\group,~compGrp5),*/

		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
		/*	Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),*/
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,600,\valEnd,400,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)*/

	/*],1),

//32

		Pseq([*/
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),

		Pbind(\instrument, \gateS,\dur, Pseq([30/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
		/*	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)*/
	],1),
],1),
//32





Ppar([
		/*		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),*/



	Pseq([

		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


					Pbind(\instrument, \gateS,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

		],1),

		/*Pseq([
		/*Pbind(\instrument, \wNoise,\dur, Pseq([48/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),*/


	Pbind(\instrument, \playBufXG,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([64/1],1),\loopy,0,\start,1430016,\out,~downEq2,\atckC,14,\atkT,0.13,\decT,0.87)],1)*/
	],1)


],1));
//////////


	if(~gugu==67 && ~gigi==67,{"vrai".post},{"nope".post})

~hity=8;
~count=0;
~prout=16

Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	Pfuncn({
			if(~count==4,{
				~count=1;

				if(	~hity==0.5 ,{ ~prout=64;~hity=32;~hity=~hity/2},{~prout=16;	~hity=8;~hity=~hity/2});

			},{~count=~count+1;~hity=~hity/2;	})
		})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({ (~prout-~hity).postln  })

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],16).play(t,quant:1)

	///



	Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,inf).play(t,quant:1)


Ppar([
Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1),

	Pseq([
	Pbind(\instrument, \rien, \dur, Pseq([15.9/1],1)),
		Pbind(\instrument, \rien, \dur, Pseq([0.1/1],1),\no,Pfunc({(~bioo=190.rand)}))],1)




],inf).play(t,quant:1)



~hity=16;

~hito=4;

~hito2=4



Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	// Prand([8,4,1,1/2],1)

	Pfuncn({~hity=~hity/2})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300).postln}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({/* ~hity.postln  ;*/ (16-~hity).postln   /*~hito2/2;      ~hito=~hito+~hito2*/})

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300).postln}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],4).play(t,quant:1)


~hity=32;

Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	// Prand([8,4,1,1/2],1)

	Pfuncn({~hity=~hity/2})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({/* ~hity.postln  ;*/ (64-~hity).postln   /*~hito2/2;      ~hito=~hito+~hito2*/})

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],4).play(t,quant:1)

64 - 256 - 64 - 256

~hity=64;


Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	// Prand([8,4,1,1/2],1)

	Pfuncn({~hity=~hity/2})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({/* ~hity.postln  ;*/ (256-~hity).postln   /*~hito2/2;      ~hito=~hito+~hito2*/})

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],4).play(t,quant:1)















	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out, ~toSlide2],4),


],inf)

Ppar([
	// Pseq([~kick],16),

	Pbind(\instrument, \wNoise,\dur, Pseq([
64
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300).postln}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374)

],1).play(t)





~gigi=61
~gugu=67

if(~gugu==67 && ~gigi==67,{"vrai".post},{"nope".post})

~hity=8;
~count=0;
~prout=16

Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	Pfuncn({
			if(~count==4,{
				~count=1;

				if(	~hity==0.5 ,{ ~prout=64;~hity=32;~hity=~hity/2},{~prout=16;	~hity=8;~hity=~hity/2});

			},{~count=~count+1;~hity=~hity/2;	})
		})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({ (~prout-~hity).postln  })

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],16).play(t,quant:1)



if (Pseq([16/1],1)==16,{True;},{False;})

80/4

~hity=32;

Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	// Prand([8,4,1,1/2],1)

	Pfuncn({~hity=~hity/2})
	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({/* ~hity.postln  ;*/ (64-~hity).postln   /*~hito2/2;      ~hito=~hito+~hito2*/})

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),


],4).play(t,quant:1)



	Pfuncn({
			if(~hity==0.5 && ~count==4,{

				~hity=8;~hity=~hity/2;



			},{~count=~count+1;~hity=~hity/2;	})



	~hity=8;
~count=0;
~prout=16
Ppar([

	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],inf),\type,Pseq([\rest,\rest,\note,\rest],inf),\wFil,0,\valStart,1400.rrand(300).postln,\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\dec ,Pkey(\dur),\amp,(-5)),
Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	Pfuncn({
			if(~count==4,{
				~count=1;

				if(	~hity==0.5 ,{ ~prout=64;~hity=32;~hity=~hity/2},{~prout=16;	~hity=8;~hity=~hity/2});

			},{~count=~count+1;~hity=~hity/2;	})
		})
	],1),\dec ,Pkey(\dur),\amp,(-5),\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({ (~prout-~hity).postln  })

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374,\type,\rest),

],16)],1).play(t,quant:1)




~hity=8;
~count=0;
~prout=16
Ppar([

	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],inf),\type,Pseq([\rest,\rest,\note,\rest],inf),\wFil,0,\valStart,1400.rrand(300).postln,\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374,\dec ,Pkey(\dur),\amp,(-5)),
Pseq([
Pbind(\instrument, \wNoise,\dur, Pseq([
	Pfuncn({
			if(~count==4,{
				~count=1;

				if(	~hity==0.5 ,{ ~prout=64;~hity=32;~hity=~hity/2},{~prout=16;	~hity=8;~hity=~hity/2});

			},{~count=~count+1;~hity=~hity/2;	})
		})
	],1),\dec ,Pkey(\dur),\amp,(-5),\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),



	Pbind(\instrument, \wNoise,\dur, Pseq([

		Pfuncn({ (~prout-~hity).postln  })

	],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,Pfunc({1400.rrand(300)}),\valEnd,Pkey(\valStart),\durF,Pkey(\dur)*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374,\type,\rest),

],16)],1).play(t,quant:1)




~bew1= Prand([

	Pseq([

		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],7),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,1),

	Pseq([

		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/16],1),	\type,Pseq([\note,\rest],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],15),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,1)],1);


~bew2=Prand([



		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],15),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



	Pseq([


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/16],1),	\type,Pseq([\note,\rest],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],31),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



		Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu =~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],16),	\type,Pseq([\note,\rest,],inf)),


],1),


	Pseq([


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu =~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],32),	\type,Pseq([\note,\rest,],inf)),

		],1),
],1);













// ~part3a.play(t)

~part3a=

Pseq([	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
	\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],4),),


Pseq([
	~bew1,~bew2
].scramble,1),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
	\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),)],4);


 ~part3a.play(t)


Pseq([

		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~blu= ~leTout.numFrames/ 192 * (160.rand.postln),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/4],1),	/*\type,Pseq([\note,\rest],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/4],3),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~ra= ~leTout.numFrames/ 192 * (160.rand.postln),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	/*\type,Pseq([\note,\rest],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~ra}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],7),	/*\type,Pseq([\rest,\note],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~ra}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



	Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~blu,
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/4],1),	/*\type,Pseq([\note,\rest],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/4],3),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



		Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~ru=~ra+(~leTout.numFrames/192)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	/*\type,Pseq([\note,\rest],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~ru}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],7),	/*\type,Pseq([\rest,\note],inf)*/),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~ru}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,9 ).play(t)




~lpPrec.play


Ppar([
	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
	99999),
	Pseq([~kick],inf)


],1).play(t)



Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/16],16),),

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/1],1),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 76,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([2/1],1),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 76,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([4/1],1),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 70,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([8/1],1),),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 62,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([16/1],1),)
].scramble,inf).play(t,quant:1)



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 77,\loopy,0,\tS,0.39550810372374,\dur,
	999,).play(t)




Prand([
Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/

Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/16],16),),

Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/1],1),),

	Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([2/1],1),),

	Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([4/1],1),),

	Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([8/1],1),),

		Pbind(\instrument, \playBuf, \buf ,~lpPrec,\out,0, \start,~lpPrec.numFrames.rand,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([16/1],1),)
].scramble,inf).play(t)



	~bra1= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);


~bra2= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 177}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),*/

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);

~bra3= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);


~bra4=Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
				Pseq([1/16],16),\type,Pseq([\note,\note,\rest,\rest].scramble,inf),\rte,Pfunc({4.rrand(0.1)})),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);




Pseq([~bra1 ,~bra2, ~bra3, ~bra4].scramble,4).play(t,quant:1)


	////

~part3b=Ppar([
Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toCom, \start,Pfunc({~leTout.numFrames/192* (~bioo)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1),

	Pseq([
	Pbind(\instrument, \rien, \dur, Pseq([15.9/1],1)),
		Pbind(\instrument, \rien, \dur, Pseq([0.1/1],1),\no,Pfunc({(~bioo=190.rand)}))],1)




],4);





	SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps,64.midicps,114,26,0,0],
			[0.005,0.018,0.152,0,0.4],
			[-8.4,-3,-2]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.050 , 0.087,   0.02 ,  0.356,0.2,0],
			[ 0.00602 , 0.004,   0.05  , 0.041 , 0.06  ],[-0.96,0.5,-12,3.12,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * amp.dbamp  ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);
}).add;


({EnvGen.ar(
		Env([ 0.050 , 0.087,   0.02 ,  0.356,0.2,0],
			[ 0.00602 , 0.004,   0.05  , 0.041 , 0.06  ],[-0.96,0.5,-12,3.12,-6]),doneAction:2)}.plot(duration:0.5))


SynthDef(\kick, {
	arg amp=0.2,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
			[117.midicps,64.midicps,114,26,0,0],
			[0.005,0.018,0.152,0,0.4],
			[-8.4,-3,-2]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.050 , 0.087,   0.02 ,  0.356,0.2,0],
			[ 0.00602 , 0.004,   0.05  , 0.041 , 0.06  ],[-0.96,0.5,-12,3.12,-6]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * amp.dbamp  ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);
}).play;



	///draft



~bra1= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);


~bra2= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 177}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),*/

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\rest,\rest,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1).play(t);
;

~bra3= Pseq([
Prand([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1).play(t);
44

~bra4=Pseq([
Prand([
		/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),*/



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
				Pseq([1/16],16),\type,Pseq([\note,\note,\rest,\rest].scramble,inf),\rte,Pfunc({2.rrand(0.1)})),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1).play(t)





/////////firsthiy




(~hitPart1 =Pseq([//maybe change to 12

//64



	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),



	Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toDelay10,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1),\vl,1),




		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	//32



	Pbind(\instrument, \rien,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),






Ppar([

	Pseq([

		Pbind(\instrument, \rien, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,Pseq([\note,\rest],inf)),


				Pbind(\instrument, \rien,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \rien,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \rien,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \rien,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



				Pbind(\instrument, \rien,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)




	],1),

	],1),


Ppar([


		//chnaged last ngiht

		Pseq([

			Pbind(\instrument, \rien,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
		Pbind(\instrument, \playBufXG,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([48/1],1),\loopy,0,\start,1230016,\out,~downEq2,\atckC,14,\atkT,0.05,\decT,0.95),

		],1),

		Pseq([

Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \rien,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \rien,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),

				Pbind(\instrument, \rien,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \rien,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



//32


		Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),

		Pbind(\instrument, \rien,\dur, Pseq([30/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



//32











		Pbind(\instrument, \rien,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


			// Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toCom,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],1),\vl,1,\start,~noise.numFrames/2),


					Pbind(\instrument, \rien,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \rien,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),




	],1)
	],1)

],1));


			//end part1


	(~hitPart2 =	Pseq([ Ppar([
//part2
		Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],1),\out,~bus16,\rL,4200 ,\rH,1100,\val,0.001875,\ph,1.42),


		/*Pseq([/*~part5,*/*/



/*Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,
				\freq, [659.255/16,639.255/16],\atk2,0),*/

	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],1),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/2,\ph,0.3),


	Pbind(\instrument,\rien,\dur,Pseq([64/1],1), \vlAtk,1,\f1, 0.08 , \f2,0.1, \f3,0,  \ic_atk,0,\index,0,\mRatio,1,\out ,~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,/*\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/),


		Pbind(\instrument,\rien,\tS, 0.39550810372374,\dur,Pseq([1/1],64),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp),






/*	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
				\freq, [659.255/16,639.255/16,619.255/16],\atk2,0),*/


				Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1500,\valEnd,1300,\durF,8*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),
		/*	],1),*/
//ici
			Pseq([
				Pbind(\instrument, \rien,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,16*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \rien,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),



				Pbind(\instrument, \rien,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \rien,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
						Pbind(\instrument, \rien,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
		Pbind(\instrument, \rien,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \rien,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


					Pbind(\instrument, \rien,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

						Pbind(\instrument, \rien,\dur, Pseq([24/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),


			/*Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest],inf)),*/

/*	Pbind(\instrument,\gate,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG2,\vlSub,1,\vlSub2,Pkey(\vlSub),
		\type,Pseq([\note,\rest, \note,\rest, \note,\note,\note,\note],inf),\out,~downdel,\group,~dispatchGrp),*/



],1),


		Ppar([
	Pbind(\instrument, \rien, \out,~limitBus1,\dur,Pseq([ 2/1],15)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,),
//293102


		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 30/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],1),


				Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,(~leTout.numFrames /192*(160.rand))),


				Prand([
		Pbind(\instrument, \rien, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],7),

Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve=(~leTout.numFrames /192*(160.rand))})),


						Prand([
		Pbind(\instrument, \rien, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],3),

Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.3,\vl,0.8),


		/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		/*],1),*/

Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.5,\vl,0.74),

Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.7,\vl,0.68),

/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),


Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.9,\vl,0.63),

		/*],2),*/

Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),
Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.1,\vl,0.58),


Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.4,\vl,0.47),




Ppar([

		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,),

		Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
		514401 ,\out, ~shiftPlay,\vl,0.01,\type,Pseq([\rest,\rest,\note,\rest,\rest,\rest,\note,\rest],inf)),




	/*Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),*/

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c, Pseq([  0],3),
	Pseq([  0],8),

	Pseq([  ~toSlide],4), 	Pseq([  ~toCom],1) ,         ~toDelay10c, Pseq([  0],2),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),     Pseq([  ~toCom],2) ,                     ~toDelay10c, Pseq([  0],1),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),    	Pseq([  ~toCom],3)     ,                ~toDelay10c,
	Pseq([  0],8),


],inf)


	, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],128),

	\type,Pseq([\note,\note,\note,\note,\note,      \rest,\rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,             \rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,       \rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,\note,
	Pseq([\rest],8),
],inf)),




						],1),



/*Pseq([
	/*		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

Pseq([
					Pbind(\instrument, \gateS,\dur, Pseq([1/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

					Pbind(\instrument, \gateS,\dur, Pseq([15/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				],7),*/

		//Pseq([32/1],1),


		/*	Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl, ~shiftStereo,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~tofinalRythm,\out, ~toCom,\group,~gateGrp11),*/




			/*Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],42),\type,Prand([\rest,\note,\rest],inf), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1),*/

			/*Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~no1b,\out,~toCom)*/

		],1),*/





Ppar([


	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c, Pseq([  0],3),
	Pseq([  0],8),

	Pseq([  ~toSlide],4), 	Pseq([  ~toCom],1) ,         ~toDelay10c, Pseq([  0],2),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),     Pseq([  ~toCom],2) ,                     ~toDelay10c, Pseq([  0],1),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),    	Pseq([  ~toCom],3)     ,                ~toDelay10c,
	Pseq([  0],8),


],inf)


	, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],64),

	\type,Pseq([\note,\note,\note,\note,\note,      \rest,\rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,             \rest,\rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,       \rest,
	Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,\note,
	Pseq([\rest],8),
],inf)),

		Pseq([
				Pbind(\instrument,\rise,\dur,Pseq([8/1],1 ),\tS, 0.39550810372374,\type,\rest),
		Pbind(\instrument,\rise,\dur,Pseq([8/1],1 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34])],1),

				Pseq([


				Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([56/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
				],1),


Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~pad,\tS,  0.39550810372374,\start,
			514401 ,\out, ~shiftPlay2),



			Pbind(\instrument,\shiftExG, \in,~shiftPlay2,\out,  ~shiftDisto2 ,\group, ~filterGrp,\dur, Pseq([32/1],2),
				\triMod,Pseq([0.08046875,0.08046875/4],inf),\tS, 0.3955081037237,\hS,Pseq([400,800],inf)),



	Pbind(\instrument, \rien,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	//below 64
Pseq([


					Pbind(\instrument,\gate,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\vlSub,1,\vlSub2,Pkey(\vlSub)),
		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),

	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
				Ppar([

					Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([32/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
			// Pbind(\instrument, \wNoise,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest)

				],1)

			],1)




		],1),
],1));
			//end part2



//part3

(~hitPart3 =Pseq([
	Ppar([
//deftune could bice
Pbind(\instrument, \percussion, \dur,Pseq([1/4],500),\carHz, Pfunc({50.12070612224.rrand(150)+(~mont=~mont+80)}),\modHz,Pfunc({34.3179398.rrand(0.1)+(~mont=~mont+80)}),\modAmp,Pfunc({ 0.00875.rrand(0.001)}) ,\amp,1,\rel,Pfunc({0.3872.rand}),\rel2,Pfunc({0.3872.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod,Pfunc({1500.rand}),\out,~buildupDisto,\latch,Pfunc({18900.rand}),\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}), \tS,  0.39550810372374),


Pseq([
					Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),

			Pbind(\instrument, \rien,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,12*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

				Pbind(\instrument,\rien,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

			Pbind(\instrument,\rien,\loopy,0,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([4/1],1)),


			//107 below
				Pbind(\instrument, \rien,\dur, Pseq([11/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,11*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\rien,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument, \rien,\dur, Pseq([81/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,79*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


				Pbind(\instrument, \playBuf, \dur,Pseq([  Pseq([1/1],6) , Pseq([1/4],24) ,Pseq([1/8],16)],1)  , \tS,  0.39550810370174,\buf,~k2,\out, ~ktoPan2,\loopy,0, \start,0),

/*6 6, 2 =16

110   -- 126*/
			],1),



				/*Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),*/

			Pseq([
			Pbind(\instrument, \rien,\dur, Pseq([120/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
				],1)

],1),





		Pbind(\instrument, \rien,\dur, Pseq([128/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
],1));


(~hitPart4 =

Ppar([
	Pbind(\instrument, \playBufS, \dur, Pseq([64/1],1),\buf, ~pad6, \tS, t.beatDur,\out,~toNoiseEq),
		Pseq([
Ppar([



	Pbind(\instrument, \rien,\dur, Pseq([30/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



			Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),],1),

	Pbind(\instrument, \rien, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

	//idea finish with an opening for next above

	//above 32

Ppar([
			Pbind(\instrument, \rien,\dur  ,Pseq([32/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),
Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


	Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),




			Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \rien,\dur, Pseq([1/2],1), \type, \rest, \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \rien,\dur, Pseq([4.5/1],1),\tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		],1),
],1),
	//32




	Pseq([
	Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \rien,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \rien,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),

				Pbind(\instrument, \rien,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		/*	Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),*/

		Pbind(\instrument, \playBuf,\loopy,0,\buf,~hit2,\out,~hit2ToEq,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),
				Pbind(\instrument, \rien,\dur, Pseq([30/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \rien,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)


	],1),

		//above is 64/1



		Pseq([

Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),

							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),
//below was 6

	Pbind(\instrument, \rien,\dur, Pseq([5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \rien,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \rien,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

//above was 7
							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),

	],2),


//above is 32/1


		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \rien,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \rien,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \rien,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \rien,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
			Pbind(\instrument, \rien,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),

//above is 32/1



Ppar([
			Pseq([
				Pbind(\instrument, \rien,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),

			Pbind(\instrument, \rien,\dur, Pseq([63/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),

				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,/*639.29,*/672.34]/2,\atk2,0.3)

			],1)

//above is 64/1


],1)],1));

/*~breakPart1.play(t)*/





(
	~breakPart1=		Ppar([


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([61/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


Pbind(\instrument, \playBuf,\rte,1,\dur, Pseq([6/1],1),\impulse, 0.00001,\loo,0,\buf,~voc,\out, ~vocalBus,\tS,  0.39550810372374,\vl,1),
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([61/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),
	],1),


Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([32/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

				Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([90/1],1), \tS,  0.39550810370174/*,\type,Pseq([\rest,\note],inf)*/),

				 ],1),


	Pbind(\instrument, \kiasmosPad,\scale, Scale.chromatic,\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1], \amp, 0.1,\atk, 4, \rel, 1.5544,\legato, 2,\dur, Pseq([16/1],5),\tS,  0.39550810370174,\out,~kiasDisto),

	Pseq([

		Pbind(\instrument,  \stereoX1,\type,\rest ,  \center, 0.1  ,\dur,Pseq([60/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),

				Pbind(\instrument,  \stereo, \in,~bgStereo2,  \out, ~toExtraComp,/* \modPan,~bus10 ,*/   \center, 0.1  ,\dur,Pseq([42/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),

	],1),

	Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([128/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),

	//from here
Pseq([

			/*			Ppar([
			Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),
						Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,Pseq([64/1],1),\ph,1.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),



	Pbind(\instrument, \playBufS, \dur,  Pseq([8/1],1), \tS,  0.39550810370174,\buf,~kb1,\out, ~filKB,\loopy,0, \start,0),



			Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),









	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,\rest,\vl,1.2),
				Pbind(\instrument, \playBufS, \dur,  Pseq([24/1],1 ), \tS,  0.39550810372374,\buf,~kb1,\out,~filKB2, \start,0),

		Ppar([

	Pbind(\instrument,\lfo13, \val,0.0201171875*8,\dur,Pseq([16/1],1)/*Pseq([48/1],1)*/,\ph,4.4, \out,~mixM, \tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out,~roomM ,\tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.1609375,\dur,Pseq([16/1],1),\ph,4.4, \out, ~dampM,\tS, 0.39550810372374,\rL, 0.41,\rH,0.8),


Pseq([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],12), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],13),\rest,\rest,\rest],1),\vl, 1.3),
						Pbind(\instrument, \playBuf,\rte,0.5,\dur, Pseq([2/1],1),\impulse, 0.00001,\loo,0,\buf,~k2/*~vocal*/,\out, /*~vocalBus*/0,\tS,  0.39550810372374,\vl,2.162,\type,\rest)],1)


],1)
					],1),

						 ],1),
*/

					Ppar([

//here

				Pbind(\instrument, \envSli, \out,   ~bus30,  \dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,30,\val2,7000,\crv,16),

			// Pbind(\instrument, \shap, \dur,Pseq([1/1],64),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374),


			//from here glitch

Ppar([
Pbind(\instrument, \bass,\type, Pseq([\note, \note, \note, \note,\note,\note,\note,\note], inf)/* Pseq([\rest, \note, \note, \note,\rest,\note,\note,\note], inf)*/,\dur,Pseq([1/4],254 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), /*\bus, ~bassShapB*/,\atk, 0,\rel, t.beatDur/4 , \rel2, t.beatDur * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-1),\out,/*~kbToPan4*/~bassEq, \tS,  0.39550810372374),


Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],64), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan4,\loopy,0,\start,0,\tS, 0.39550810372374),


Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,8*t.beatDur,\out,~hitEq, \tS, 0.39550810372374,\type,\rest ),
				Pbind(\instrument, \wNoise,\dur, Pseq([24/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,24*t.beatDur,\out,~hitEq,\type,\rest ,\tS, 0.39550810372374),

						/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbindf(~kick,\out,  ~revKck2),

/*					Pbind(\instrument, \wNoise,\dur, Pseq([31/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbind(\instrument, \wNoise,\dur, Pseq([27/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,27*t.beatDur,\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\atk ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1100,\valEnd,500,\durF,4*t.beatDur,\out,~hitEq, \tS, 0.39550810372374),
				],1),


Ppar([

						//here// need eq
					/*Pbind(\instrument,\wNoise,\dur,Pseq([60/1],1) ,\dA2,0, \wFil,2,\dec,Pkey(\dur),\tS,  0.39550810372374,\out,~hitEq2/*~hitStereoX*/,   \amp,0.2  ,\amp2,0.2),*/



	Pseq([
		Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,0, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),


Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],120), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbToPan4,\amp,(-10))

					],1)],1),



//not reveiving beloq
				Pbind(\instrument,\stereo, \dur, Pseq([64/1],1), \in, ~hitStereoX  ,\spread,0.1,\out,~toFilRise,\tS, 0.39550810372374,\group, ~stereoGrp),

 ],1), ],1),


],1)],1)

);



	/////


	~bra1= Pseq([
Prand([
	/*	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),*/



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


].scramble,12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);




	////////



	~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);

~bra1= Pseq([
Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],16),),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],2),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest],inf)),



],2),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1).play(t);



~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);


~bra2= Pseq([
Pseq([



		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],24),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],4)),*/

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 177}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),),*/




	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],16),\type,Pseq([\note],inf)),
Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
				Pseq([1/2],2),\type,Pseq([\note,\rest,],inf)),


],2),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1).play(t,quant:1);



~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);


~bra3= Pseq([
Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


],3),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1).play(t,quant:1);


~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);


~bra4=Pseq([
Prand([



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
				Pseq([1/16],16),\type,Pseq([\note,\note,\rest,\rest].scramble,inf),\rte,Pfunc({2.rrand(0.1)})),



],12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1).play(t,quant:1);

~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);




Pseq([~bra1 ,~bra2, ~bra3, ~bra4].scramble,inf).play(t,quant:1);



Ppar([
	Pseq([~kick],16),
	Pbind(\instrument,\rien,\dur,Pseq([16/1],1))],1).play(t)




~blank=	Pseq([
	Pbind(\instrument, \blank, \dur,Pseq([255/4],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/4],1),\in,Prand([ 3400,~eqBus10],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([63/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/1],1),\in,Prand([ 3400,~eqBus10,~rollingKS],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([62/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([2/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3),

	Pbind(\instrument, \blank, \dur,Pseq([60/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([4/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3)],1);



Pbind(\instrument, \blank, \dur,Pseq([1/1],1),\in,Prand([ 3400,~eqBus10,~rollingKS],inf),\group,~recGrp3).play(t)


	//github


~bra1= Pseq([
Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],16),),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],2),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest],inf)),



],2),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1);


~bra2=Pseq([
Pseq([



		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\note,\rest],inf)),

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],2)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* 177}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),),*/




	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],24),\type,Pseq([\rest,\note].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


],2),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 61}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);

~bra3= Pseq([
Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


],3),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);


~bra4=Pseq([
Prand([



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
				Pseq([1/16],16),\type,Pseq([\note,\note,\rest,\rest].scramble,inf),\rte,Pfunc({2.rrand(0.1)})),



],12),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 44}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

	],1);


	//finally




Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (191.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest,\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (191.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],8),\type,Pseq([\note,\rest,\note,\rest,\rest,\rest,\rest,\rest],inf)),


Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (191.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],4),\type,Pseq([\note,\rest,],inf)),




],1).play(t,quant:1)

Pseq([
Pbind(\instrument, \playBuf10,\buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([256/1],1)),

Pbind(\instrument, \playBuf10,\buf ,~leTout,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([192/1],1)),

	Pbind(\instrument, \playBuf10,\buf ,~ped,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([256/1],1))],1).play(t,quant:1);


Pseq([~bra1 ,~bra2, ~bra3, ~bra4].scramble,inf).play(t,quant:1);











Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (191.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],64),\type,Pseq([\note,\rest,\note,\rest,\rest,\rest,\rest,\rest,

		\note,\note,\rest,\rest,	\note,\note,\rest,\rest],inf)).play(t,quant:1)





Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~leTout.numFrames/192* (191.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],16),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,

		\note,\note,\rest,\rest,	\note,\note,\rest,\rest],inf)).play(t,quant:1)





	Pseq([
				Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~lfoGrp, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest),
		Pseq([



				Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,~toExtraFx,\type,Pseq([\note,\rest].scramble,inf)
					,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],16),\start,Pfunc({~charmin.numFrames/64*(64.rand)})),


				/*Pseq([
					Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,~toExtraFx
					,\loopy,0,\tS,0.39550810372374,\dur,Pseq([6/1],1),\start,Pfunc({~charmin.numFrames/64*(64.rand)})),

					Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,~toExtraFx,\type,\rest
					,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),\start,Pfunc({~charmin.numFrames/64*(64.rand)}))
				].scramble,8),*/



				Pseq([~bra1 ,~bra2, ~bra3, ~bra4].scramble,1),

			~part3a,
				// Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),\








				// Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),*/

			// Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/3 ),

				//below was removed for above
					Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~rising,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([32/1],1)),


					Pbind(\instrument, \playBuf, \buf ,~pad2,\out,~slideBus2 ,\loopy,0,\tS,t.beatDur,\dur,Pseq([16/1],2),\type,Pseq([\note,\rest,\rest],inf)),

			/*Pbind(\instrument, \gateS,\in,~toGateRise,\group,~dispatchGrp2,\dur,	Pseq([16/1],2),	\tS,t.beatDur, \out,Pseq([~tofinalRythm,~toShift],inf))*/
				],1)



				//above can be better , need to audio prrocess
		],1),

		Pseq([
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/3),
	/*		Pbind(\instrument, \playBuf10, \buf ,~ped,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),*/
				// Pbind(\instrument, \playBuf10, \buf , ~vap,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
				// Pbind(\instrument, \playBuf10, \buf ,~ped,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,0 /*~ped.numFrames/2*/),
/*~part3a,*/

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,0),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/3*3,\type,\rest ),
			/*	Above is removed replace by new -- randon ele with delay
				123-4   1234-5    12345-6*/


				Pbind(\instrument, \playBuf10, \type,\rest,\buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([32/1],1),\start,~leTout.numFrames/4*2),


			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([32/1],1),\start,~leTout.numFrames/4*2.5),
		],1),





		Pseq([

			Pbind(\instrument, \playBuf10, \buf,~ped,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,0),
			~part3e,
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([128/1],1),\start,0,\type,\rest),
		],1),

		Pseq([
			~part3e,
				// Pbind(\instrument, \playBuf10, \buf ,~charmin,\out,~toExtraFx,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4),
			~part3e,
				~part3a

		],1),
	],1),


\roomsize, 38, \revtime, 14.85, \damping, 0.1, \inputbw, 0.39, \drylevel, -8, \earlylevel, -9, \taillevel, 10
Routine({
	SynthDef(\rev, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,damp,room,mix
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2, mod|

	var a ,input;

		input =GrainBuf.ar(1,100,0.04,75);

		a = Resonz.ar(input, 1294.5373184   *   [8,16,32],0.01	).sum * 10;

    Out.ar(    out, GVerb.ar( a, 88, 30 , 0.1, 0.39, spread, -8.dbamp, -9.dbamp,
            10.dbamp, 88,0.3) + input)
}).play;

		wait(0.2);


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/revHit2.aiff",numChannels:1,duration:t.beatDur*64);

}).play


	~revHity.play





~recGrp3=Group.new;
~mixa = Synth(\gateS, [\in,~toShift/*~hiCom*//*~extraComp*//*~toGate102*//*~finGran*//*~no3*//*~toKbGate*//*~toFilRise*//*~toCom*//*~toExtraFx*//*~absoFinalGate*//*~tofinalRythm*/,\dur, 9999] ,~recGrp3);



Pseq([~bra1 ,~bra2, ~bra3, ~bra4],2).play(t)


Pseq([~bra3,~bra1 ,~bra4,~bra2],1).play(t)


~leTout.play



~bra3.play(t)


 Pseq([
Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\rest,\rest],inf)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),
	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\rest,\rest],inf)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),
	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\note,\rest],inf)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),
	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),




],1),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1).play(t,quant:1)




~bra3= Pseq([
Pseq([
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 88}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),



Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 88}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 88}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 88}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),

/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,~leTout.numFrames/192* 71,\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/4],4)),*/


],3),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 88}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1).play(t,quant:1)





Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([32/1],1),\start,~leTout2.numFrames/4).play(t)


	//



	Ppar([

Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\modu,

		0.001875/**4*/,\ph,1.42),



Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,0,\f1, 0.004 , \f2,0.001, \f3,0.00001,  \ic_atk,-1,\index,151,\mRatio,5,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),


],1).play(t)







Ppar([

Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\modu,

		0.001875/**4*/,\ph,1.42),



Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,0,\f1, 1 , \f2,0.4, \f3,0,  \ic_atk,-1,\index,3,\mRatio,1,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,0 ),


],1).play(t)




Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-3,\index,1,\mRatio,5,\out ,0,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ,\freq,300).play(t)



//
Ppar([

Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\val,

		0.001875/**4*/,\ph,1.42),



	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-1,\index,0.3,\mRatio,50,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,0 ,\freq,[300,340,280]).play(t)


],1).play(t)



	Pbind(\instrument,\rise,\dur,Pseq([128/1],inf), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-1,\index,0.3,\mRatio,50,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\dec,1,\moduS,~mod2, \fS,0 ,\freq,[300,340,280]).play(t)






SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur ,out =0 ,tS=1 ,moduR,moduS,fS=0, fR=0,atk2=0.05 ,dec2   =0.932;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],//middle was 10
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,0,dur*0.018]/*[dur*0.01,dur*0.97,0,dur*0.02]*/,[16,0,0-16]),timeScale: tS,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))

			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod + (In.kr(moduS,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS )))))* env * amp;
	/*car = Pan2.ar(car, pan);*/
	Out.ar(out, car);
}).add;


Ppar([

Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\val,

		0.001875/**4*/,\ph,1.42),



	Pbind(\instrument,\rise,\dur,Pseq([128/1],inf), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-1,\index,0.3,\mRatio,50,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,0.0001 ,\freq,[300,340,280]/2),


],1).play(t)


Routine({

	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-1,\index,0.3,\mRatio,50,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,0 ,\freq,[300,340,280]).play(t);

	wait(0.16);

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/risy.aiff",numChannels:1,duration:t.beatDur*64);

}).play(t)


~risy = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/risy.aiff");


~riPow =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/riPow.aiff");

~riPow.play

~eqGrp0=Group.new
Pbind(\instrument, \playBuf, \buf,~riPow,\tS,t.beatDur,\dur, Pseq([64/1],1),\out,~riPowEq).play(t)


~riPEq=Synth(\EQHP96, [\frq, 100,\out, 0,\in,~riPowEq],~eqGrp0);
~riPEq.set(\vol,0.14);


Pbind(\instrument, \playBuf, \buf,~risy,\tS,t.beatDur,\dur, Pseq([16/1],1)).play(t)

Pbind(\instrument, \playBuf, \buf,~risy,\tS,t.beatDur,\dur, Pseq([16/1],1)).play(t)

Routine({

{PlayBuf.ar(1,~risy)}.play;
	wait(t.beatDur/2);

{PlayBuf.ar(1,~risy,1.2)}.play;
	wait(t.beatDur/2);
	{PlayBuf.ar(1,~risy,1.4)}.play;
	wait(t.beatDur/2);

{PlayBuf.ar(1,~risy,1.6)}.play;

}).play



{GrainBuf.ar(1,dur: 5,sndbuf: 75)}.play;


Routine({

{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy)}.play;
	wait(t.beatDur);

{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.2)}.play;
	wait(t.beatDur);
{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.4)}.play;
	wait(t.beatDur);

{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.6)}.play;
		wait(t.beatDur/2);
	{GrainBuf.ar(1,1,dur: t.beatDur*5,sndbuf: ~risy,rate: 1.8)}.play;
		wait(t.beatDur/2);
		{GrainBuf.ar(1,1,dur: t.beatDur*5,sndbuf: ~risy,rate: 1.8)}.play;

}).play





~rik=0.02;

(
Routine({


{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy)}.play;

	wait(0.16);
	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/riPow.aiff",numChannels:1,duration:t.beatDur*64);


	wait(t.beatDur-0.16);


	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.02)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.04)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.06)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.08)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.1)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.12)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.14)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.16)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.18)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.2)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.22)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.24)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.26)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.28)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.30)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.32)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.34)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.36)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.38)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.4)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.42)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.44)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.46)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.48)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.50)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.52)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.54)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.56)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.58)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.6)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.62)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.64)}.play;

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.66)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.68)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.70)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.72)}.play;
	wait(t.beatDur);

	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.74)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.76)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.78)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.8)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.82)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.84)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.86)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.88)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.9)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.92)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.94)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.96)}.play;
wait(t.beatDur);


	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 1.98)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.02)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.04)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.06)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate:2.08)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.1)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.12)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.14)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.16)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.18)}.play;
	wait(t.beatDur);
	{GrainBuf.ar(1,1,dur: t.beatDur*10,sndbuf: ~risy,rate: 2.2)}.play;




}).play

)


	///newww


	SynthDef(\fmX, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=0,  amp=1.5, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 ,factorx=0, factorx2 =0,factorxx=0, factorxx2 =0  , rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50,gate=1,pan=0, modu,modu2, multi=0, multi2=0,modux=0,moduxx=0,fmCtrl=1,secBus;

	var car, mod, mod2, iEnv, sig, filRte,env;

	env = EnvGen.kr(Env([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*dur*/ 9999 ),      0.0000000001],
			[4, 4,(-4)]
		),timeScale: t.beatDur);

	//second level of modulation
	mod2 = SinOsc.ar(/*freq*/66.midicps/10+ (In.kr(moduxx,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorxx ))+(In.kr(~seqBus,1)* factorxx2), mul:freq/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		mod = SinOsc.ar( MouseX.kr( 66.midicps/*freq*/ * mRatio + mod2 )

			 * SinOsc.kr(sineRate,phRise).range([sineRangeLow])+ (In.kr(modux,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorx )), mul:

		 MouseY.kr(0,  freq * mRatio *iEnv)
		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar(freq+

			(In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+
		/*(In.kr(secBus,1)* factor2)+*/

		SelectX.ar(fmCtrl  ,[In.ar(~phaseBus,1),mod])  /* +( freq * cRatio )*//*+ freq*//*76.midicps*/ /*0.00502929687*/ );

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig    * amp     *env);
}).add;


Pbind(\instrument,\lfoStep, \val, Pfunc({ 72.rrand(83).midicps  }), \dur,Pseq([1/4],inf),\out,~bus2).play(t)


Pbind(\instrument,\fmX,\dur,Pseq([100/4],inf),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf) ).play(t)


	Synth(\fmX, [\secBus,~bus2,\factor2,1],)



	////next


	SynthDef(\fmX, {
	arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=0,  amp=1, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 ,factorx=0, factorx2 =0,factorxx=0, factorxx2 =0  , rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50,gate=1,pan=0, modu,modu2, multi=0, multi2=0,modux=0,moduxx=0,fmCtrl=1,secBus,crv=(-3),
				vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0;

	var car, mod, mod2, iEnv, sig, filRte,env;

		env =
		// EnvGen.kr(Env([1,0],[dur,0],crv),timeScale: t.beatDur,doneAction: 2);



		EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT-(dur*gateSub),dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (dur  ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
		mod2 = SinOsc.ar(MouseX.kr(78.midicps*(432/440)/10), mul:MouseY.kr(78.midicps*(432/440)/10 * iEnv));

	//first level of modulation

			mod = SinOsc.ar( MouseX.kr(78.midicps*(432/440)+mod2), mul:MouseY.kr(78.midicps*(432/440)* iEnv));

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar(freq+mod);

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig    * amp     *env);
}).add;


Pbind(\instrument,\lfoStep, \val, Pfunc({ 72.rrand(83).midicps  }), \dur,Pseq([1/4],inf),\out,~bus2).play(t)


Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf),\crv,Pfunc({-6.rrand(-1)}) ).play(t)

	//here
Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf),
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.2.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)




		Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 99.midicps,120.midicps,  78.midicps, 133.midicps, 130.midicps,  137.midicps,128.midicps],inf),
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)


	Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq,  54.midicps,
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)


	Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 75.midicps,96.midicps,  54.midicps, 109.midicps, 106.midicps,  113.midicps,104.midicps],inf),
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.2.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)

	//til here

	Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 87.midicps*(432/440),108.midicps*(432/440),  66.midicps*(432/440), 121.midicps*(432/440), 118.midicps*(432/440),  125.midicps*(432/440),116.midicps*(432/440),99.midicps*(432/440),120.midicps*(432/440),  78.midicps*(432/440), 133.midicps*(432/440), 130.midicps*(432/440),  137.midicps*(432/440),128.midicps*(432/440), 75.midicps*(432/440),96.midicps*(432/440),  54.midicps*(432/440), 109.midicps*(432/440), 106.midicps*(432/440),  113.midicps*(432/440),104.midicps*(432/440)],inf),
		\vlSub,Pfunc({0.9.exprand(0.16,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.2.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)





	Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([99.midicps*(432/440),120.midicps*(432/440),  78.midicps*(432/440), 133.midicps*(432/440), 130.midicps*(432/440)/*,  137.midicps*(432/440)*/,128.midicps*(432/440)],inf),
		\vlSub,Pfunc({0.9.exprand(0.16,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.12.exprand(0.01)}),
	\decT,Pfunc({0.2.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)







	Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf),\gateSub,Pfunc({0.5.exprand(0.01)})
	).play(t,quant:1)




	Pseq([
		Pbind(\instrument,\fmX,\dur,Pseq([1/1],1),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf)),

		Pbind(\instrument,\fmX,\dur,Pseq([1/4],28),\freq, Prand([ 87.midicps,108.midicps,  66.midicps, 121.midicps, 118.midicps,  125.midicps,116.midicps],inf),
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk))],inf).play(t,quant:1)




		Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Prand([ 99.midicps,120.midicps,  78.midicps, 133.midicps, 130.midicps,  137.midicps,128.midicps],inf),
		\vlSub,Pfunc({0.9.exprand(0.02,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.2.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.8)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1)



	Synth(\fmX, [\secBus,~bus2,\factor2,1],)


	Pseq([

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],8),\type,Pseq([\rest,\note,\rest,\rest],inf)),

Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],16),\type,Pseq([\rest,\note,\rest,\note],inf)),


	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],2)),
	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],2),\type,\rest),

],inf).play(t);


Pseq([~kick],inf).play(t)


	Pseq([

	// Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/16],16),\type,Pseq([\note,\rest,\note,\rest],inf)),

Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],2),\type,Pseq([\note,\rest],inf)),
Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],16),\type,Pseq([\note,\rest],inf)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/1],1),\type,Pseq([\note,\rest],inf)),
	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],2)),
	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],2),\type,\rest),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],4),\type,Pseq([\rest,\note,\rest,\rest],inf)),
Pxrand([

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/4],8),\type,Pseq([\note,\rest,\note,\rest],inf)),

Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],16),\type,Pseq([\note,\rest,\note,\rest],inf)),


			Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],4),\type,Pseq([\note ,\note,\rest,\rest],inf)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],4),\type,Pseq([\rest,\note,\rest,\rest],inf)),

].scramble,4),],inf).play(t,quant:1)


	Routine({

	Pseq([


	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/2],1)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],7), \type,Pseq([\note,\rest,\note,\rest,\rest,\rest,\rest],inf)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/4],1)),


	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],5), \type,Pseq([\rest,\rest,\rest,\note,\rest],inf)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/4],3), \type,Pseq([\note,\rest,\note],inf)),

	Pbind(\instrument, \playBuf, \buf, ~snare, \dur, Pseq([1/8],8), \type,Pseq([\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest],inf))



	],1).play(t);

		wait(0.16);

			s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/snareComp.aiff",numChannels:1,duration:t.beatDur*4);

	}).play


	~snComp = Buffer.read(s, "/Users/davidmignot/Music/SuperCollider Recordings/F#/1/snareComp.aiff");

	Pseq([
Pbind(\instrument, \playBuf, \buf, ~snComp, \dur, Pseq([4/1],1),\amp,0.14),


		Pbind(\instrument, \playBuf, \buf, ~snComp, \dur, Pseq([1/4],48),\start,Pfunc({~snComp.numFrames/4*(3.rand)}),\loo,0,\amp,0.14)],8).play(t,quant:1);

	Pseq([~kick],inf).play(t,quant:1)




	Pbind(\instrument, \playBuf, \buf, ~b4, \dur, Pseq([1/4],inf),\amp,1,\type,Pseq([\rest,\note,\note,\note],inf), \decT,	Pseq([0,0.7,0.8,0.9],inf),\start,4100)




		Pbind( \instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/4],inf),
\type,Pseq([\rest,\note,\note,\note],inf),\buf,~b4  ,\out,0 ,\loopy,0, \decT,
				Pseq([0,0.7,0.8,0.9],inf),\start,0).play(t)



	SynthDef(\playBufS ,{|out = 0,start, trig, dur, amp=10,buf, loo=0,impulse=0.001,rte=1,tS=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:impulse,startPos: start,loop:loo,doneAction: dA)

	/*	* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT-(dur*gateSub),dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: tS, doneAction:2)*/  /* * amp*/

	);}).add


Ppar([
Pbind(\instrument, \playBufS, \buf,~kass,\dur, Pseq([2/1],1) ,\start,0),

	~kick],1).play(t)


Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374).play(t)




Ppar([

Pbind(\instrument, \playBufS,  \tS,  0.39550810372374,\buf,~kRise,\dur, Pseq([16/1], 1),\out, ~filKBX),



	Pbind(\instrument,\blank, \in,~toKbGate,\out,0,\dur,Pseq([1/4], 1),\group,~recGrp3).play(t,quant:1)


	Pseq([
				Pbind(\instrument,\blank, \in,~toKbGate,\out,0,\dur,Pseq([1/4], 1),\group,~recGrp3),
Pbind(\instrument, \playBufS, \buf,~kass,\dur, Pseq([3/4],1) ,\start,0),

		Ppar([
Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0/*~hitEq*/, \tS,  0.39550810372374)


],1).play(t,quant:1)







			// Pbind(\instrument,\blank, \in,~t,\out,~toKbGate,\dur,Pseq([16/1], 1),\group,~recGrp3)



],1)


Ppar([
	//watch doublon
	Pseq([Pbindf(~kick,\out,~kbus)],inf),

Ppar([

			Pseq([Pbindf(~kick,\out,~limitKick)],inf),


				Pbind(\instrument, \playBuf, \buf, ~b4, \dur, Pseq([1/4],inf),\amp,1,\type,Pseq([\rest,\note,\note,\note],inf), \decT,	Pseq([0,0.8,0.86,0.92 ],inf),\start,0,\out,~bassFi)
			//Pseq([0,0.58,0.66,0.84 ],inf)
],1),


		Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\dA1,2,\out,~bassShapB, \crv, (-6),\tS, 0.39550810372374),
	// Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate ,\dur, 9999)

],1).play(t,quant:1);

	Pbind(\instrument,\blank, \in,3400,\out,~limitBass,\dur,Pseq([9/4], 5),\group,~recGrp3).play(t,quant:1)
Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate ,\dur, Pseq([1/1],1)).play(t,quant:1)
Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate ,\dur, Pseq([64/1],1)).play(t,quant:1)




	Pseq([

		// Pseq([~kick],16),

		Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/1],2),\type,Pseq([\note,\rest],inf)),

	Prand([

		Prand([

Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/4],8),\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)),

Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/4],8),\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)),
Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/4],8),\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)),
		Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/4],8),\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf))],1),



		Pseq([

				Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/1],1),\type,Pseq([\note,\note,/*\note,\note,\rest,\rest,*/\rest,\rest].scramble,inf)),

				Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/2],2),\type,Pseq([\note,/*\note,*//*\note,\note,\rest,\rest,\rest,*/\rest].scramble,inf))
			].scramble,1)
	/*	Prand([

Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/1],2),\type,Pseq([\note,\note,/*\note,\note,\rest,\rest,*/\rest,\rest].scramble,inf)),

				Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/2],4),\type,Pseq([\note,/*\note,*//*\note,\note,\rest,\rest,\rest,*/\rest].scramble,inf))

/*Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/8],2),\type,Pseq([\note,\note/*,\note,\note,\rest,\rest*/,\rest,\rest].scramble,inf)),*/
/*Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/8],2),\type,Pseq([\note,\note/*,\note,\note,\rest,\rest*/,\rest,\rest].scramble,inf)),
		Pbind(\instrument, \kick,\amp,(-10),\dur, Pseq([1/8],2),\type,Pseq([\note,\note,/*\note,\note,\rest,\rest,*/\rest,\rest].scramble,inf))*/],1)*/


		],7)


	],4).play(t)



			~perc=Buffer.read(s,	"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/funkPerc.aiff")

	Pbind(\instrument,\playBuf,	\buf,~perc,\dur, Pseq([1.5/1],8),\start,~perc.numFrames/16*(14.rand)).play(t,quant:1)

	{SinOsc.kr((-14).midicps,4.6).range(10,20000)}.plot(duration:0.3)

	({BLowPass4.ar( PlayBuf.ar(1,~perc,Line.kr(6,0.1,t.beatDur),~perc.numFrames/16*(14.rand)),
		SinOsc.kr((-14).midicps,4.6).range(10,20000))
	}.play)

	