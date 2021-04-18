

Ppar([~hitX, ~kb,~base],1).play(t)

~hitX.play(t)
(
~hitX=

Ppar([




		Ppar([




	Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374, \fR,Pfunc({1.00.rand}), \moduR,~mod1,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


Pbind(\instrument,\rise,\dur,Pseq([4/1],inf/*16*/), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto2,\tS, 0.39550810372374, \fR,Pfunc({1.00.rand}), \moduR,~mod1,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


Pbind(\instrument,\rise,\dur,Pseq([1/1],inf/*64*/), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto3,\tS, 0.39550810372374,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),





],inf),







Pseq([
		Pseq([
			Pxrand([
				Pseq([
					Ppar([

				Pxrand([ ~bang,Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([4/1],1))],1),
				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur, Pseq([4/1],1),\tS, 0.39550810372374)],1),
				/*Pbind(\instrument, \wNoise,\dur,Pseq([12/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/

					Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([12/1],1),\tS, 0.39550810372374 )
				],1),

Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),
			],1),





	/*	Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/

			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~again,\dur,Pseq([48/1],1),\tS, 0.39550810372374 )


		],1),





		Pseq([


			Ppar([
				Pxrand([Pbindf( ~bang ,\dur, Pseq([1/2],2)  ),Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([2/1],1))],1),
			Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([2/1],1),\tS, 0.39550810372374,\vol,0.7)],1),



/*
	Pbind(\instrument, \wNoise,\dur,Pseq([14/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),

			Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/



			Pbind(\instrument, \gateS, \group,~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([62/1],1),\tS, 0.39550810372374 )
		],1),

		Pseq([


			Ppar([Pxrand([Pbindf( ~bang ,\dur, Pseq([1/1],1))  ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([1/1],1))],1),
				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([1/1],1),\tS, 0.39550810372374)],1),

/*	Pbind(\instrument, \wNoise,\dur,Pseq([15/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),


		Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/
			Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),


Ppar([
			Pxrand([Pbindf(~bang ,\dur, Pseq([8/1],1)) ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([8/1],1))],1),

			Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(80)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([3/1],1),\tS, 0.39550810372374),



Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374),
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,350,\crv,3.2),


		],1),

		],inf),


		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


//ONE day to fixx with BG
		Pbind(\instrument, \gate, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus2,\tS, 0.39550810372374),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),



		Pxrand([
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),
				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		],1)

		],1)

	],inf),


		Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto , \out,~riToEnv ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv,\out,~riToGate , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus20, \which, 0,\qf,0.4)  ,

	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto2 , \out,~riToEnv3 ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv3,\out,~riToGate2 , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus19, \which, 0,\qf,0.4)  ,


	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto3 , \out,~riToEnv2 ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv2,\out,~riToGate3 , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus12, \which, 0,\qf,0.4)  ,





	Pbind(\instrument, \gate2, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],inf), \in,Prand([~riToGate,~riToGate3,~riToGate2],inf)  ,\out,~riToEq , \group,~distoGrp0,\tS, 0.39550810372374,),




	Pbind(\instrument,\EQHP2, \in, ~riToEq , \out, ~riToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev  , \out,~riToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp ,\ctrl, ~kbus, \out,~riToLimit, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c11,1,\in, ~riToLimit, \dur, inf,\gain,24,\group,~limitGrp,\out,~riToStereo),
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~risesGate,\tS, 0.39550810372374,\group, ~stereoGrp),


		Pbind(\instrument,\EQHP, \in, ~eqNoise , \out, ~noiseRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~again,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c15,1,\in, ~limitFuzz3, \dur, inf,\gain,55,\group,~limitGrp,\out,~stereoBus4),
Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out, ~eqBus210, \group, ~stereoGrp),



	Pbind(\instrument,\flanger,\dur,Pseq([8/1],inf ), \in,~bellFlang, \out,~flanToDisto, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374),
	Pbind(\instrument, \distoS, \dur, inf, \in, ~flanToDisto , \out,~flanToEq ,\group, ~distoGrp),
	Pbind(\instrument,\EQHP2, \in, ~flanToEq , \out, ~flanToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~flanToRev  , \out,~flanToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~flanToComp ,\ctrl, ~kbus, \out,~flanToLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c16,1,\in, ~flanToLimit, \dur, inf,\gain,55,\group,~limitGrp,\out,~flanToStereo),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument, \distoS, \dur, inf, \in, ~bigRiToDisto , \out,~bigRiToEnv ,\group, ~distoGrp),
	Pbind(\instrument,\filterS, \in,~bigRiToEnv ,\out,~bigRiToEq, \group,~filterGrp ,\which, 0, \busMod, ~bus17,\qf,0.67,\dur, inf),

	Pbind(\instrument,\EQHP2, \in, ~bigRiToEq , \out, ~bigRiToRev ,\frq, 300, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~bigRiToRev  , \out,~bigRiToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~bigRiToComp ,\ctrl, ~kbus, \out,~bigRiToLimit, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c17,1,\in, ~bigRiToLimit, \dur, inf,\gain,55,\group,~limitGrp,\out,~bigRiToStereo),





Pbind(\instrument,\stereoS, \dur, 9999, \in, ~bigRiToStereo  ,\spread,1,\out,~again2,\tS, 0.39550810372374,\group, ~stereoGrp,\atkT,1,\decT,0),



	/*Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),*/


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0242, \rel ,0.3872
			,\in,~again2   ,\ctrl, ~snBus, \out,~bigRiLastEq,\group, ~compGrp2,\tS, 0.39550810372374),



	Pbind(\instrument,\EQHP10, \in, ~bigRiLastEq ,\out, 0,\frq, 200, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,1, \gain,(-8),\val2,2600.rrand(1900),\quant2,8.rrand(1), \gain2,(-16).rrand(-4),\vol, 1),


Pbind(\instrument, \distoS, \dur, inf, \in, ~riTriptoDisto , \out,~riTriptoEq ,\group, ~distoGrp),
		Pbind(\instrument,\EQHP2, \in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
		Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riTriptoRev  , \out,~riTriptoComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~riTriptoComp ,\ctrl, ~kbus, \out,~riTriptoLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c12,1,\in, ~riTriptoLimit, \dur, inf,\gain,39,\group,~limitGrp,\out,~riTriptoStereo),
	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),











	Pbind(\instrument,\EQHP2, \in, ~slideBus , \out, ~slideEq ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,4, \gain2,(-4), \vol,1),

	Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,15,   \dur, inf, \in,~slideEq  , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c9,1, \dur, inf, \in, ~slideBusToLimit, \gain, 45, \group,~limitGrp),


		Pbind(\instrument,\EQHP96, \in, ~slideBus2 , \out, ~slideEq2 ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,4, \gain2,(-4), \vol,1),

	Pbind(\instrument, \comp, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,15,   \dur, inf, \in,~slideEq2  , \out,~slideBusToLimit2,\ctrl, ~kbus, \group, ~compGrp),


	//BG SLIDE NOT CHECKED FOR VOLUME YET
	Pbind( \instrument, \limiter, \dur, inf, \in, ~slideBusToLimit2, \gain, 45, \out,~again,\group,~limitGrp),


		Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0242, \rel ,0.3872
			,\in,~again   ,\ctrl, ~snBus, \out,~toGate102,\group, ~compGrp2,\tS, 0.39550810372374),
],1);
)