

(~hitPart1 =Pseq([//maybe change to 12

//64



	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),



	Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toDelay10,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1),\vl,0.8),




		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	//32



	Pbind(\instrument, \rien,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),




	Pbind(\instrument, \rien,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),


//32







			Pbind(\instrument, \rien,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
		Pbind(\instrument, \playBufXG,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([16/1],1),\loopy,0,\start,1230016,\out,~downEq2,\atckC,14,\atkT,0.12,\decT,0.88),


			Pbind(\instrument, \rien,\dur, Pseq([16/1],1)),



		Pbind(\instrument, \playBufXG,\buf, ~rise1, \tS, t.beatDur, \dur ,Pseq([16/1],1),\loopy,0,\start,180000,\out,~downEq2),

		Pbind(\instrument, \rien,\dur, Pseq([16/1],1)),


],1));


			//end part1


	(~hitPart2 =	Pseq([ /*Ppar([


	Pbind(\instrument,\rien,\dur, Pseq([64/1],1)),*/
	Pbind(\instrument, \playBuf,\dur, Pseq([64/1],1),\buf, ~revHity,\tS, 0.39550810372374,\out,~revHitEq,\loopy,0),

/*
],1),*/

Ppar([

	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1000,\valEnd,900,\durF,0.5*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toDelay10, \start,Pfunc({~leTout.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),
	],1),

	Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 1/2],24)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,\type,\rest),

//16


	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toDelay10, \start,Pfunc({~leTout.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),


	Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 1/2],24)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,\type,\rest),

Pbind(\instrument, \rien, \dur,Pseq([2/1],1)),
//293102

		Ppar([
	/*	Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 1/1],28)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,\rte,Pfunc({~boba=~boba+0.083333333333333})),*/


Pseq([
		Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,(~leTout.numFrames /192*(160.rand))),




		Pbind(\instrument, \rien, \dur,Pseq([14/1],1)),

		Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve=(~leTout.numFrames /192*75)})),


					/*	Prand([*/
		Pbind(\instrument, \rien, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		/*],3),*/

		Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.3,\vl,0.8),



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.5,\vl,0.74),

Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.7,\vl,0.68),



		Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.9,\vl,0.63),

		/*],2),*/

Pbind(\instrument, \rien, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),
Pbind(\instrument, \rien, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.1,\vl,0.58),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, ~hiCom,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.4,\vl,0.47),

	],1),
],1),
//



Ppar([

		Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,400,\valEnd,600,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,),

		Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
		514401 ,\out, ~shiftPlay,\vl,0.01,\type,Pseq([\rest,\rest,\note,\rest,\rest,\rest,\note,\rest],inf)),





	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c,Pseq([  0],2),
		// Pseq([  0],8),

	Pseq([  ~toSlide],4), 	Pseq([  ~toExtraComp2],1) ,         ~toDelay10c, Pseq([  0],1),
		// Pseq([  0],8),
	Pseq([  ~toSlide],4),     Pseq([  ~toExtraComp2],2) ,                     ~toDelay10c, /*Pseq([  0],1),*/
		// Pseq([  0],8),
	Pseq([  ~toSlide],4),    	Pseq([  ~toExtraComp2],3)     ,                ~toDelay10c,
		// Pseq([  0],8),


],inf)


	, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],128),

	\type,Pseq([\note,\note,\note,\note,\note,      \rest,\rest,/*\rest,*/
		// Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,             \rest,/*\rest,*/
		// Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,       \rest,
		// Pseq([\rest],8),
	\note,\note,\note,\note,\note,\note,\note,\note,
		// Pseq([\rest],8),
],inf)),



/*	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c, Pseq([  0],3),
	Pseq([  0],8),

	Pseq([  ~toSlide],4), 	Pseq([  ~toExtraComp2],1) ,         ~toDelay10c, Pseq([  0],2),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),     Pseq([  ~toExtraComp2],2) ,                     ~toDelay10c, Pseq([  0],1),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),    	Pseq([  ~toExtraComp2],3)     ,                ~toDelay10c,
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
],inf)),*/




						],1),






Ppar([


	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pseq([
	Pseq([  ~toSlide],4),~toDelay10c, Pseq([  0],3),
	Pseq([  0],8),

	Pseq([  ~toSlide],4), 	Pseq([  ~toExtraComp2],1) ,         ~toDelay10c, Pseq([  0],2),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),     Pseq([  ~toExtraComp2],2) ,                     ~toDelay10c, Pseq([  0],1),
		Pseq([  0],8),
	Pseq([  ~toSlide],4),    	Pseq([  ~toExtraComp2],3)     ,                ~toDelay10c,
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

	Pbind(\instrument,\rise,\dur,Pseq([7.5/1],1 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34]/3,  \atk2, 0.2 ,\dec2,0.8  )


			/*Pbind(\instrument, \playBuf,\dur  ,Pseq([4/1],1),\buf,~pad,\tS,  0.39550810372374,\start,
				514401 ,\out, ~shiftEq2),*/



		],1),


				Pseq([


				Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([56/1],1),\val, 0.0484),
		Pbind(\instrument,\lfoStep,\out,~bus28,\tS, 0.39550810372374,\dur,Pseq([8/1],1), \val,0.0968),
				],1),


Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~pad,\tS,  0.39550810372374,\start,
			514401 ,\out, ~shiftPlay2),



			Pbind(\instrument,\shiftExG, \in,~shiftPlay2,\out,  ~shiftDisto2 ,\group, ~filterGrp,\dur, Pseq([32/1],2),
				\triMod,Pseq([0.08046875,0.08046875/4],inf),\tS, 0.3955081037237,\hS,Pseq([400,800],inf)),



	// Pbind(\instrument, \rien,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),










//below 64
Pseq([


					Pbind(\instrument,\gate,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\vlSub,1,\vlSub2,Pkey(\vlSub)),
		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),

	Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([8/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),
		Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),


					Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([32/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12),




			],1)

	],1)
],1));
			//end part2



//part3

(~hitPart3 =Pseq([
	Ppar([
//deftune could bice
Pbind(\instrument, \percussion, \dur,Pseq([1/4],500),\carHz, Pfunc({50.12070612224.rrand(150)+(~mont=~mont+80)}),\modHz,Pfunc({34.3179398.rrand(0.1)+(~mont=~mont+80)}),\modAmp,Pfunc({ 0.00875.rrand(0.001)}) ,\amp,1,\rel,Pfunc({0.3872.rand}),\rel2,Pfunc({0.3872.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod,Pfunc({1500.rand}),\out,~buildupDisto,\latch,Pfunc({18900.rand}),\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}), \tS,  0.39550810372374),


Pseq([
					Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),

			/*Pbind(\instrument, \rien,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,12*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),*/

			/*	Pbind(\instrument,\rien,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),*/

			Pbind(\instrument,\playBuf,\loopy,0,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([4/1],1)),


			//107 below
			/*	Pbind(\instrument, \rien,\dur, Pseq([11/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,11*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\rien,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),*/


			Pbind(\instrument, \rien,\dur, Pseq([44/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,79*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


				Pbind(\instrument, \rien,\dur, Pseq([40/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,79*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


				Pbind(\instrument, \playBuf, \dur,Pseq([  Pseq([1/1],6) , Pseq([1/4],32) ,Pseq([1/8],16)],1)  , \tS,  0.39550810370174,\buf,~k2,\out, ~ktoPan2,\loopy,0, \start,0),

/*6 6, 2 =14

110   -- 126*/
			],1),



				/*Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),*/

		/*	Pseq([
			Pbind(\instrument, \rien,\dur, Pseq([120/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					Pbind(\instrument, \rien,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
				],1)*/

],1),





		Pbind(\instrument, \rien,\dur, Pseq([128/1],1)),
],1));


(~hitPart4 =
Pseq([


Ppar([
	Pbind(\instrument, \playBufXG2, \dur, Pseq([64/1],1),\buf, ~pad6, \tS, t.beatDur,\out,~toNoiseEq,\atckC,6,\atkT,0.04,\decT,0.96),
		Pseq([






		Pbind(\instrument, \rien,\dur, Pseq([30/1],1)),



			Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\atk ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),

	Pbind(\instrument, \rien, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

	//idea finish with an opening for next above




		Pbind(\instrument, \rien,\dur, Pseq([30/1],1)),




	Pbind(\instrument, \rien,\dur, Pseq([64/1],1)),

	/*],1),*/
		//above is 128/1



		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),

							Pbind(\instrument, \abc, \dur, Pseq([1/4],4),\freq,Pfunc({1200.rand}),\type,Pseq([\rest,\rest,\rest,\note,\note,\note].scramble,inf),\out,~abcEq, \tS,  0.39550810372374),
//below was 6

	Pbind(\instrument, \rien,\dur, Pseq([5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq,\tS,  0.39550810372374),
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
Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,/*639.29,*/672.34]/2,\atk2,0.3)
	],1)

			],1)

//above is 64/1


],1)],1));




~bew1= Prand([

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


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/1],1))].scramble,1)],1);


~bew2=Prand([



		Pseq([

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/8],1),	\type,Pseq([\note,\rest],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],15),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



	Pseq([


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
				\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/16],1),	\type,Pseq([\note,\rest],inf)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,0, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],31),	\type,Pseq([\rest,\note],inf)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1))],1),



		Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu =~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([1/8],16),	\type,Pseq([\note,\rest,],inf)),


],1),


	Pseq([


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu =~leTout.numFrames/ 192 * (160.rand)}),\loopy,0,\tS,0.39550810372374,\dur,
			Pseq([2/1],1)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu}),\loopy,0,\tS,0.39550810372374,\dur,
		Pseq([1/16],32),	\type,Pseq([\note,\rest,],inf)),

		],1),
],1);













// ~part3a.play(t)

~part3a=

Pseq([	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
	\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],4),),


Pseq([
	~bew1,~bew2
].scramble,1),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~blu= ~leTout.numFrames/ 192 * (160.rand)}),
	\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),)],4);




// ~part3e.play(t)

(~part3e=Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),



Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2),\type,\rest),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),

	//

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),





Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],2));


(~part3eb=Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),

//here

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\start,Pfunc({~ouai+ (~leTout2.numFrames/256)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),

	//

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),





Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8)),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~ouai})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],2)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/2],8))


],2));




~blank=	Pseq([
	Pbind(\instrument, \rien, \dur,Pseq([255/4],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/4],1),\in,Prand([ 3400,~eqBus10],inf),\group,~recGrp3),

	Pbind(\instrument, \rien, \dur,Pseq([63/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([1/1],1),\in,Prand([ 3400,~eqBus10,~rollingKS],inf),\group,~recGrp3),

	Pbind(\instrument, \rien, \dur,Pseq([62/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([2/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3),

	Pbind(\instrument, \rien, \dur,Pseq([60/1],1),\type,\rest),

	Pbind(\instrument, \blank, \dur,Pseq([4/1],1),\in,Prand([ ~eqBus10,~rollingKS,~toCom2],inf),\group,~recGrp3)],1);





//77





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


~bra1b= Pseq([
Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],16),\type,\rest),


		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\rest],inf)),


			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2)),

		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],1),\type,\rest),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],2),\type,\rest),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\note,\note,\rest,\rest],inf)),



],2),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 77}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1);



~bra2=  Pseq([
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

	],1);


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






 ~bra3b= Pseq([
Pseq([


		/*Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([8/1],1),\type,Pseq([\rest],inf)),*/



		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\rest,\rest],inf)),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/4],4),\type,Pseq([\rest,\rest],inf)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/1],1)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/2],2),\type,Pseq([\rest,\rest],inf)),




		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([1/8],8),\type,Pseq([\rest,\rest],inf)),
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






],1),
		Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift, \start,Pfunc({~leTout.numFrames/192* 182}),\loopy,0,\tS,0.39550810372374,\dur,
	Pseq([4/1],1),),

],1)

