/*(Routine({

~delExtraSeq=Ppar([
/*
Pbind(\instrument, \gate, \in,~gateBus23,\tS,t.beatDur,\dur,Pseq([9999/1],inf), \out,~reverbBus23,\group, ~gateGrp,
		\vlSub,1,\vlSub2,Pkey(\vlSub)),*/

Pseq([

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,Pwrand([~toDelay10,0],[1,8].normalizeSum,inf), \start,Pfunc({~leTout.numFrames/ 256 * 190.rand})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),),



		Pxrand([

		/*Pbind(\instrument,\gateS,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~no3  ,\out, 0,\group, ~gateGrp4,
	\atckC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),*/


Pbind(\instrument,\gateS,\dur,Pxrand([ Pseq([1/8],8)],1), \in,~no41  ,\out, 0,\group, ~gateGrp4,
\type,Pseq([\note,\rest],inf),\tS, 0.39550810372374,),

		Pbind(\instrument, \gateS ,\in,~no41   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1.5/1],1)  ],1) ,    \group,~gateGrp4, \out,0/*~tofinalRythm2*/,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),

		],1)
	],inf)
],1).play(t);


		wait(0.16);

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/vap.aiff",numChannels:10,duration:t.beatDur*64);
}).play(t,quant:1))

~vap.plot

~vap  = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/vap.aiff");



~uuu = 1;
 COME back here

~miniClip= Pseq([


Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~tofinalRythm3*/, \start,Pfunc({~leTout2.numFrames/256* 115})
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1),\rte,Pfunc({~uuu=~uuu+0.2;~uuu;})),




	Pbind(\instrument, \gateS ,\in,~no41   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1.5/1],1)  ],3) ,    \group,~gateGrp4, \out,0/*~tofinalRythm3*/,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),





],inf);






//~part3b.play(t)

here toofor length next start + 3 +6

~part3b=
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start,
	Pseq([ Pfuncn({~one}), Pfuncn({~one}) ,Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two}),
				Pfuncn({~one}) ,Pfuncn({~one}) ,Pfuncn({~one+((~leTout2.numFrames/ 256 )*4)}), Pfuncn({~troi}),

	Pfuncn({~one+(~leTout2.numFrames/ 256 )}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({~one+((~leTout2.numFrames/ 256 )*4)}),Pfuncn({ ~two}),
		Pfuncn({ ~two+((~leTout2.numFrames/ 256 )*4)}),Pfuncn({ ~two+((~leTout2.numFrames/ 256 )*2)}),Pfuncn({ ~two+((~leTout2.numFrames/ 256 )*4)}),
					Pfuncn({~leTout2.numFrames/ 256 * 220})

	].scramble,inf),\type,Pseq([\note,\rest,\rest,\rest,\rest,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note].scramble,inf)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],32));*/







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

/*Ppar([
	Pseq([~kick],8),
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374)],1).play(t)*/

// Ppar([~boost,~hitPart1],1).play(t)


/*
MUST RERECROD RISING MAYBE MAKE IT BETTER,

HAVE RISES MADE OUT OF TANTRA STYLE*/



(~hitPart1 =Pseq([//maybe change to 12

//64



	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),

	Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),

	Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


	Pbind(\instrument, \playBuf10, \buf ,~noise,\out,~toDelay10,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1),\vl,1),


		Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\dA,0,\out,0, \tS,  0.39550810372374,\type,\rest),



	/*Pbind(\instrument, \gateS,\dur, Pseq([4/1],8), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)),*/

	Pbind(\instrument, \gateS,\dur, Pseq([32/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,),






	Pseq([
	/*Pbind(\instrument, \wNoise,\dur, Pseq([14/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS,  0.39550810372374),*/

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],4),\type,Pseq([\note,\rest,\rest,\rest],inf)),


				Pbind(\instrument, \gateS,\dur, Pseq([12/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([12/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
		/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([1/1],1)),*/


				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)




	],1),
//64





		// Pbind(\instrument,\del10T,\in,~toDelay10b,\out,~toCom,\dur,Pseq([64/1],1),\group,~delayGrp),


/*Pbind(\instrument, \comp10P,\ctrl, ~snBus,\thr,0.76 ,\sB, 1.08,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom3, \out,~eqBus10,\tS,t.beatDur,\dur,Pseq([64/1],1),\group,~compGrp5),*/

		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
		/*	Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),*/
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


					Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,600,\valEnd,400,\durF,0.5*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],1),

//32

		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,2*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),*/
			Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,1*t.beatDur,\out,~hitEq, \tS,  0.39550810372374),
			Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),

//32





Ppar([
		/*		Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq, \tS,  0.39550810372374),*/



	Pseq([

		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


					Pbind(\instrument, \gateS,\dur, Pseq([56/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		],1),

				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,0,\f1,0.8 , \f2, 0.4 , \f3,0,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto,\tS, 0.39550810372374,\atk,1,\freq,[659.26,639.29,672.34])],1)



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


	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk,1,\f1, 0.08 , \f2,0.1, \f3,0,  \ic_atk,0,\index,0,\mRatio,1,\out ,~downDisto,\tS, 0.39550810372374,\atk,1 ,\freq,[164,168,322],\moduS,~mod3, \fS,1 ,/*\type,Pseq([\note,\note,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/),


		Pbind(\instrument,\gate3,\tS, 0.39550810372374,\dur,Pseq([1/1],64),\in, ~downSG
,\atkT,1,\atckC,0,\decT,0,\vlDec,1,	\type,Pseq([\note,\rest],inf),\out,~downEq,\group,~dispatchGrp),






/*	Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, 0,\f1, 0.3 , \f2, 0.4 , \f3, 0.1,  \ic_atk,3,\index,1,\mRatio,1,\out , ~downDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~bus11,\fS, 0.01,
				\freq, [659.255/16,639.255/16,619.255/16],\atk2,0),*/


				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),
		/*	],1),*/
//ici
			Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,16*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),



				Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
						Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
		Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


					Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

						Pbind(\instrument, \gateS,\dur, Pseq([24/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			],1),


			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],16),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,Pseq([\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest],inf)),

	Pbind(\instrument,\gate,\tS, 0.39550810372374,\dur,Pseq([1/4],256),\in, ~downSG2,\vlSub,1,\vlSub2,Pkey(\vlSub),
		\type,Pseq([\note,\rest, \note,\rest, \note,\note,\note,\note],inf),\out,~downdel,\group,~dispatchGrp),



],1),


		Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476,),
//293102


		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],15),


				Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,(~leTout.numFrames /256*(190.rand))),


				Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],7),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve=(~leTout.numFrames /256*(190.rand))})),


						Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,347476),



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		],3),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.3,\vl,0.86),


		/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 2/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

		/*],1),*/

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.5,\vl,0.8),

Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/1],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),

Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.7,\vl,0.74),

/*Prand([
		Pbind(\instrument, \playBuf, \out,~limitBus1,\dur,Pseq([ 2/1],1)
			,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~fkAr,\start,Pfunc({~start})),*/



		Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,1.9,\vl,0.67),

		/*],2),*/

Pbind(\instrument, \gateS, \out, ~toCom,\dur,Pseq([ 1/2],1),\in,~tofinalRythm,\tS, 0.39550810372374,\group, ~gateGrp11),
Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/2],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.1,\vl,0.64),


Pbind(\instrument, \playBuf10, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~leTout,\out, 0,\loopy,0,\start,Pfunc({ ~reve}),\rte,2.4,\vl,0.63),




Ppar([

		Pbind(\instrument, \playBuf,\dur  ,Pseq([2/1],32),\buf,~kb2Test,\tS,  0.39550810372374,\start,
		514401 ,\out, ~shiftPlay,\vl,0.01/*,\type,Pseq([\note,\rest,\rest,\rest\rest,\rest,\rest,\rest],inf)*/),
Pseq([
	/*		Pbind(\instrument, \gateS,\dur, Pseq([4/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

Pseq([
					Pbind(\instrument, \gateS,\dur, Pseq([1/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

					Pbind(\instrument, \gateS,\dur, Pseq([15/4],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
				],7),*/

		//Pseq([32/1],1),
				/*	Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),*/

			Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl, ~shiftStereo,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~tofinalRythm,\out, ~toCom,\group,~gateGrp11),

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
					Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),

			Pbind(\instrument, \wNoise,\dur, Pseq([12/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,12*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

			Pbind(\instrument,\playBuf,\loopy,0,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([4/1],1)),


				Pbind(\instrument, \wNoise,\dur, Pseq([11/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,11*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),
				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument, \wNoise,\dur, Pseq([81/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,79*t.beatDur,\tS, 0.39550810372374,\out,~hitEq,\type,\rest),


				Pbind(\instrument, \playBuf, \dur,Pseq([  Pseq([1/1],6) , Pseq([1/4],24) ,Pseq([1/8],16)],1)  , \tS,  0.39550810370174,\buf,~k2,\out, ~ktoPan2,\loopy,0, \start,0),

/*8 6, 2 =16

110   -- 126*/
			],1),



				/*Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),

				Pbind(\instrument,\gate2,\tS, 0.3955081037237,  \dur, Pseq([1/1],1),\in,~shiftGate,\out,  ~shiftEq2,\group,~gateGrp12,\type,\rest),*/

			Pseq([
			Pbind(\instrument, \gateS,\dur, Pseq([120/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
					Pbind(\instrument, \gateS,\dur, Pseq([8/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
				],1)

],1),





		Pbind(\instrument, \gateS,\dur, Pseq([128/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom,\type,\rest),
],1));


//end part3


(~hitPart4 =

		Pseq([
Ppar([
	Pbind(\instrument, \gateS,\dur, Pseq([30/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),



			Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,4*t.beatDur,\dA,0,\out,~hitEq, \tS,  0.39550810372374),],1),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toDelay10, \start,Pfunc({~leTout2.numFrames/256* (220.rand)})
			,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1)),

	//idea finish with an opening for next above

	//above 32

Ppar([
			Pbind(\instrument, \playBuf,\dur  ,Pseq([32/1],1),\buf,~trippy,\tS,  0.39550810372374,\out, ~riTriptoDisto),
Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,8*t.beatDur,\tS, 0.39550810372374,\out,~hitEq),


	Pbind(\instrument, \gateS,\dur, Pseq([1/2],1),\type, \rest \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

	Pbind(\instrument, \gateS,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \gateS,\dur, Pseq([1/2],1),\type, \rest \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),




			Pbind(\instrument, \gateS,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([1/2],1),\type, \rest \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([1/2],1),\type, \rest \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \gateS,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([1/2],1),\type, \rest \tS,  t.beatDur,,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([4.5/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),
			Pbind(\instrument, \gateS,\dur, Pseq([1/2],1), \type, \rest \tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				Pbind(\instrument, \gateS,\dur, Pseq([4/1],1),\tS,  t.beatDur,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


		],1),
],1),
	//32




	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			/*Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),*/
		Pbind(\instrument, \playBuf,\loopy,0,\buf,~hit2,\out,~hit2ToEq,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),
				Pbind(\instrument, \gateS,\dur, Pseq([15/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\tS,  0.39550810372374),
				Pbind(\instrument, \gateS,\dur, Pseq([31/2],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

			Pbind(\instrument, \gateS,\dur, Pseq([16/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)


	],1),

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

				Pbind(\instrument,\rise,\dur,Pseq([64/1],1 ), \vlAtk,1,\f1,0.1 , \f2, 0.4 , \f3,0.1,  \ic_atk,7.2,\index,13,\mRatio,1,\out , ~bigRiToDisto2,\tS, 0.39550810372374,\atk,1,\freq,[659.26,/*639.29,*/672.34]/2)

			],1)

//above is 64/1


],1));

/*~breakPart1.play(t)*/





(
	~breakPart1=		Ppar([


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([61/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


		Pbind(\instrument, \playBuf,\rte,1,\dur, Pseq([6/1],1),\impulse, 0.00001,\loo,0,\buf,~voc,\out, ~vocalBus,\tS,  0.39550810372374,\vl,1)


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
						Pbind(\instrument, \playBuf,\rte,0.5,\dur, Pseq([2/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,2.162,\type,\rest)],1)


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


// ~part3a.play(t)

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

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
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

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toExtraFx, \start,Pfunc({~ouai=~leTout2.numFrames/256* (220.rand);})
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
