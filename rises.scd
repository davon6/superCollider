
(~riseSet = Pxrand([

		Ppar([

	Prand([

				Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf,/*Prand([*/ ~buf/*,~buf2],inf)*/,\out,~noiseStereo2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos,0.90000.rand),

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-20),\out,~eqNoise,\tS, 0.39550810372374,),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,/*Prand([ */~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}))],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/,\tS, 0.39550810372374, )
		],1),




				Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\type,Prand([\note,\rest],inf),\tS, 0.39550810372374, \out, ~riEq),


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riDisto,\type,Prand([\note,\rest],inf),\tS, 0.39550810372374),



],2);)




(~track = Ppar([ ~base/*, ~kb*/ , ~rises, ],1).play(t,quant:1))
~rises.play(t);
~rises.stop;
(~rises =

//WATCH OUT ROUTING TO ZERO OR ~no1

Ppar([

		Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1.7, \gain ,(-20)),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-16.6), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),

	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp),
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,60,\rH,3600, \out,  ~bus3, \group, ~lfoGrp),
		Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp),
		Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp),






Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


//ONE day to fixx with BG
		Pbind(\instrument, \gateS, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus,\tS, 0.39550810372374),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),



		Pxrand([
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-20), \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-20), \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),
				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		],1)

		],1)

	],inf),



	Pbind(\instrument,\EQHP2, \in, ~slideBus , \out, ~slideEq ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,4, \gain2,(-4)),

	Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,   \dur, inf, \in,~slideEq  , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c9,1, \dur, inf, \in, ~slideBusToLimit, \gain, 35, \group,~limitGrp),

	//debug



Pseq([
		//could be a cymbal



		Ppar([


   //~hit, ~cymbal
				Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([4/1],1)),

		/*Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,/*Prand([ */~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}))*/


	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/,\tS, 0.39550810372374, )
		],1),



		~riseSet,


		Ppar([



				Pbindf(Pxrand([~noise, ~bell],inf), \dur, Pseq([2/1],1)),




	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/,\tS, 0.39550810372374, )
		],1),


~riseSet,


		Ppar([




				Pbindf(Pxrand([~noise, ~bell],inf) ,\dur, Pseq([1/1],1)),

		/*Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,/*Prand([ */~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}))*/


	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/,\tS, 0.39550810372374, )
		],1),



		~riseSet,




//lonesome
	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/,\tS, 0.39550810372374, ),



~riseSet




//////
		/*Pseq([
Pbind(\instrument,\rise,\dur,Pseq([32/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}), \index,Pfunc({50.00.rrand(1)}),
					\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\finish, { ~key.envirPut(~value)},\tS, 0.39550810372374,/*\type,Prand([\note,\rest],inf),*/\out,~riFil2)],2),


	Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~riFil,/*\type,Prand([\note,\rest],inf),*/\tS, 0.39550810372374),*/

		//HERE THE CLASSIC RISE BUT EASY

],inf),



	Pbind(\instrument, \distoS, \dur, inf, \in, ~riTriptoDisto , \out,~riTriptoEq ,\group, ~distoGrp),
		Pbind(\instrument,\EQHP2, \in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
		Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riTriptoRev  , \out,~riTriptoComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riTriptoComp ,\ctrl, ~kbus, \out,~riTriptoLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c10,1,\in, ~riTriptoLimit, \dur, inf,\gain,37,\group,~limitGrp,\out,~riTriptoStereo),
	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),



Pbind(\instrument, \distoS, \dur, inf, \in, ~riDisto , \out,~riFil2 ,\group, ~distoGrp),

	/*Pbind(\instrument, \filter , \in,  ~riFil   ,\dur,inf, \out,~riEq, \busMod, ~bus11, \qf,0.6, \group, ~filterGrp),*/
	Pbind(\instrument, \filter , \in,  ~riFil2   , \dur,inf,\out,~riEq, \busMod, ~bus3, \qf,0.6, \group, ~filterGrp),

	Pbind(\instrument,\EQHP2, \in, ~riEq , \out, ~toGateX ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8)),



Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus8 ,\in, ~toGateX,\out,~riRev,\group, ~gateGrp),



	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riRev  , \out,~riComp,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riComp ,\ctrl, ~kbus, \out,~riLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c10,1,\in, ~riLimit, \dur, inf,\gain,37,\group,~limitGrp,\out,~riStereo),

	Pbind(\instrument,\stereoS, \dur, Pseq([64/1],inf), \in, ~riStereo  , \center,Pfunc({0.20.rrand(-0.2)}),\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0242, \rel ,0.3872
			,\in,~again   ,\ctrl, ~snBus, \out,~eqBus210,\group, ~compGrp2,\tS, 0.39550810372374,),



//Rise  ,riEq,riDisto riRev, riComp,riLimi, ===>random flanger would be awe


	Pbind(\instrument,\EQHP, \in,   ~noiseStereo2 , \out, ~revSide ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,2800, \quant,8, \gain,(-8)),


Pbindf(~rLong,\dur,inf, \in,~revSide , \revtime, 10,\out,~comSide,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiterStoMixer,\c11,1,\in, ~limitSide, \dur, inf,\gain,37,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoSide  ,\spread,1,	\atkT,0.05,\crvA,22,  \decT,0.95,\out,~eqBus210,\tS, 0.39550810372374,\group, ~stereoGrp),





	Pbind(\instrument,\EQHP, \in, ~eqNoise , \out, ~noiseRev ,\frq, 200, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~again,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c9,1,\in, ~limitFuzz3, \dur, inf,\gain,40,\group,~limitGrp,\out,~stereoBus4),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out, ~eqBus210, \group, ~stereoGrp),


	Pbind(\instrument,\flanger,\dur,Pseq([8/1],1 ), \in,~bellFlang, \out,0/*~again*/, \group,~combGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374),


Pbind(\instrument,\EQHP10, \in, ~eqBus210 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,26, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-8),\vol, 1)

	],1)
)