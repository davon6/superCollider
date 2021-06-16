(

Routine({

Ppar([

		//from firsthit.scd
		Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\val1,150,\crv,5.2),

	/*	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod3,\rL,0 ,\rH,100,\val,

		0.084/**4*/,\ph,4.1),*/


	/*Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.08 , \f2,0, \f3,0,  \ic_atk,0,\index,1,\mRatio,1,\out ,/*~flanToDisto2*/ ~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),*/


/*	Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],inf),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp),*/

		/// til here





	Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,999,\ph,4.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,-0.4,\rH,0.4, \group, ~lfoGrp,\tS, 0.39550810372374),


		Pseq([Pbindf(~kick,\out,~kbus)],inf),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),



	/*Pbind(\instrument,\lfo13,\out, ~bus29,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\rL,4600,\rH,1160,\ph,2.2,\val,(~hzQbeat/16)),*/



	Pbind(\instrument, \lfo13T,  \val, 0.1609375, \ph, 2.9,  \out,~bus32, \dur,Pseq([32/1],inf),\rL,150,\rH,1600,\tS, 0.39550810372374),


Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),

/*~hitX,*/~fx,~kb,

/*	//if below repeat maybe change to Pfunc

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toGate10, \start,

	Pseq([
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)) )],3),
				Pseq([(~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([(~leTout.numFrames/ 256 *( 128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
				Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
					Pseq([(~leTout.numFrames/ 256 * (128.rrand(1)))],3),
						Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
							Pseq([ (~leTout.numFrames/ 256 * (128.rrand(1)))],3),
	],inf)
	,\loopy,0,\tS,0.39550810372374,\dur,  Pseq([

			Pseq([ Pseq([4/1],1) ,Pseq([2/1],1) ],1) ,

Pseq([ Pseq([8/1],1)],1)  ,Pseq([ Pseq([4/1],1)],1)   ,Pseq([Pseq([16/1],1) ,Pseq([8/1],1)],1) ,Pseq([Pseq([32/1],1) ,Pseq([16/1],1)],1)

].scramble,inf)),




	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),Pseq([1/2],1)],inf),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,0

	,  \group, ~gateGrp6,\tS, 0.39550810372374),*/


		/*Pbind(\instrument,\gateS, \dur,Pseq([256/1],inf),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)*/

//have one ris





		Pseq([
				Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~lfoGrp, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest),
		Pseq([
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4 ),
			Pbind(\instrument, \playBuf10, \buf ,~rising,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
				//above can be better
		],1),

		Pseq([
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*2),
	/*		Pbind(\instrument, \playBuf10, \buf ,~ped,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),*/
					Pbind(\instrument, \playBuf10, \buf , ~vap,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1)),
			Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*3 ),
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*2),
		],1),

		Pseq([

			Pbind(\instrument, \playBuf10, \buf,~leTout2,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4*3),
			~part3e,
			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0,\loopy,0,\tS,t.beatDur,\dur,Pseq([128/1],1),\start,0,\type,\rest),
		],1),

		Pseq([
			~part3e,
			Pbind(\instrument, \playBuf10, \buf ,~ped,\out,~toShift ,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,0 /*~ped.numFrames/2*/),
			~part3e,

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toShift,\loopy,0,\tS,t.beatDur,\dur,Pseq([64/1],1),\start,~leTout.numFrames/4),

		],1),
	],1),

			Pbind(\instrument,\envSli,\out, ~bus33,\dur,Pseq([16/1],inf),\tS, 0.39550810372374,\val1,0,\val2,Pfunc({~bobo=~bobo+25}),\crv,Pfunc({~crv=~crv+0.5})),


	Pbind(\instrument,\shift10,\bus,~bus33,\in, ~toShift ,\out,~toExtraFx,\dur,Pseq([16/1],inf),\group, ~granuGrp),


		Pbind(\instrument, \tantra, \in,~toExtraFx, \wT,Pfunc({3.rand}), \dur,Pseq([4/1],inf),\group, ~granuGrp,\out,~toCom/*~toDelay10b*/,\type,Pwrand(
		[\note,\rest],[1,7].normalizeSum,inf)),

	Pwrand([

		Pbind(\instrument,\gateS, \dur, Prand([Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],1),
			\in,  ~toExtraFx  ,\out ,Pwrand([~tofinalRythm,~reverbSquelch],[8,1].normalizeSum,inf), \group, ~gateGrp7,\tS, 0.39550810372374),

		Pseq([
				/*Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),\in,~toExtraFx  ,\out ,~delayBus2 ,\group, ~gateGrp7,\tS, 0.39550810372374),*/
				Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in,~toExtraFx  ,\out ,~delayBus2 ,\group, ~gateGrp7,\tS, 0.39550810372374),

			Pbind(\instrument,\gateS, \dur, Pseq([1/2],1),\tS, 0.39550810372374,\type,\rest)

			],1),

	],[36,1].normalizeSum,  inf),



		Pseq([

	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~lfoGrp, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest),
			~hitPart1,~hitPart2,~hitPart3,~hitPart4


		],1),

		/*Pbind(\instrument,\gateS, \dur,9999,\vlSub, 1, \vlSub2,Pkey(\vlSub),\in,~vocToDispatch,\out,0,\group, ~kbGate,\tS, 0.39550810372374),*/


		Pseq([

	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~lfoGrp, \tS,  0.39550810370174,\dur, Pseq([16/1],1),\type,\rest),
		Pseq([~blank],2),Pbind(\instrument,\gate2, \tS,  0.39550810370174,\dur, Pseq([256/1],1),\type,\rest),		~blank],1),

	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],256), \tS,  0.39550810372374,\buf,~kb2)


		Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~bus25,\rL,0 ,\rH,5000,\val,

			Prand([~hz1beat/4,~hz1beat/8,~hz1beat/16],inf),\ph,4.1),



		Pseq([
			/*Pbind(\instrument,\gate, \tS,  0.39550810370174,\vlSub, 0.5, \vlSub2,Pkey(\vlSub),\in,	~bgGate,\out,~bgDisto,\group, ~granuGrp,\type,  Pseq([\note,\rest  ,\note,\rest,\note,\rest  ,\note,\rest ,\note,\rest  ,\note,\rest ,\note,\rest  ,\note,\rest   ].scramble,16) ,  \dur ,Pseq([4/1],60) ,\vlAtk,0.5,\atkT,0.25,\relT,0.25,\decT,0.5,\atckC,6, \relC,-6,\vlRel,0.5,),*/


			Pbind(\instrument,\gate, \tS,  0.39550810370174,\vlSub, 1, \vlSub2,Pkey(\vlSub),\in,	~bgGate,\out,~bgComp,\group, ~gateGrp12,  \dur ,Pseq([76/1],1) ,\vlAtk,0.2,\atkT,0.01,\relT,0.01,\decT,0.98,\atckC,6, \relC,-6,\vlRel,0.25,),


			Pbind(\instrument,\gate, \tS,  0.39550810370174,\in,	~bgGate,\out,~bgComp,\group, ~gateGrp12,\type, \rest ,  \dur ,Pseq([4/1],1) ,\vlAtk,0.2,\atkT,0.25,\relT,0.25,\decT,0.5,\atckC,6, \relC,-6,\vlRel,0.2),


		Pbind(\instrument,\gate,\vlSub, 1, \vlSub2,Pkey(\vlSub), \tS,  0.39550810370174,\in,	~bgGate,\out,~bgComp,\group, ~gateGrp12,\type, Pseq([         Pseq([\rest ,  \rest,\rest,\rest,\rest,\rest,\note,\rest,\note ],1)  ],inf),  \dur, Pseq([Pseq([256/1],1), Pseq([64/1],1),
				Pseq([32/1],2),Pseq([64/1],2) ],inf)),


				Pbind(\instrument,\gate,\in,	~bgGate,\out,~bgComp,\group, ~gateGrp12,\type,\rest ,  \dur, Pseq([256/1],1), \tS,  0.39550810370174,
				\vlAtk,0,\atkT,0.05,\relT,0.25,\decT,0.70,\atckC,6, \relC,-6,\vlRel,0,\decC,(-9))


		/*	Pbind(\instrument,\gate,\in,	~bgGate,\out,~bgDisto,\group, ~granuGrp,\type,Pseq([\note,\rest  ,\rest,\rest,\rest,\rest,\rest,\rest  ].scramble,2)  ,  \dur, Pseq([16/1],16),
				\vlAtk,0,\atkT,0.05,\relT,0.25,\decT,0.70,\atckC,6, \relC,-6,\vlRel,0,\decC,(-9))*/

		],1),

		Pseq([

			//3*64+16
		Pbind(\instrument,\gateS,\in,~toExtraComp  ,\out,  0 ,\group,~kbGate,\dur, Pseq([208/1],1),\tS,t.beatDur),
		Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~bigRiToStereo ,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),
			//for downshifter
				Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~downStereo ,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),

			// 34*16
		Pbind(\instrument,\gateS,\in,~toExtraComp  ,\out,  0  	,\group,~kbGate, \dur,Pseq([416/1],1),\tS,t.beatDur),

			//for shift 2
			Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~shiftStereo ,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),
			//for shift 3
			Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~shiftStereo2 ,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),

			//for trippy
			Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~riTriptoStereo ,\tS,t.beatDur,\dur,Pseq([32/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),
			Pbind(\instrument,\gateS,\in, ~toExtraComp ,\out, 0,\group,~kbGate,\dur, Pseq([129/1],1),\tS,t.beatDur),
			// 8*16 +1
			//bigrises no2
			Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl,~bigRiToStereo2 ,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~toExtraComp,\out, 0,\group,~kbGate),

		],1)

		/*208+64+64+544+32+129+64=1105

1105-1024*/
	],1).play(t);

	wait(0.142);

	// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/stem2.aiff",numChannels:10,duration:t.beatDur*256);


	s.record;


}).play(t,quant:1))




// Pbind(\instrument,\gate,\vlSub, 1, \vlSub2,Pkey(\vlSub),\in,	~bgGate,\out,~bgDisto,\group, ~granuGrp,\type, Pseq([   Pseq([\note,\rest  ,\note,\rest,\note,\rest  ,\note,\rest ,\note,\rest  ,\note,\rest ,\note,\rest  ,\note,\rest   ].scramble,16) ,         Pseq([\rest ,  \rest,\note,\note ],1) ,Pseq([\note,\rest  ,\note,\rest,\rest,\rest,\rest  ].scramble,2)   ],inf),  \dur ,Pseq([Pseq([4/1],64) ,Pseq([256/1],1), Pseq([64/1],2) ,Pseq([128/1],1),Pseq([16/1],16)   ],inf))



// + +



~bobo=700;
~crv=6;

Ppar([

	~boubou,

	Pbind(\instrument,\envSli,\out, ~bus33,\dur,Pseq([16/1],inf),\tS, 0.39550810372374,\val1,0,\val2,Pfunc({~bobo=~bobo+25}),\crv,Pfunc({~crv=~crv+0.5})),


	Pbind(\instrument,\shift10,\bus,~bus33,\in, ~toShift ,\out,~toExtraFx,\dur,Pseq([16/1],inf),\group, ~granuGrp)

],1).play(t)




1024/16

64*25




8




Pbind(\instrument,\shift10,\bus,~bus33,\in, ~toShift ,\out,~toExtraFx,\dur,Pseq([16/1],inf),\group, ~granuGrp).play




