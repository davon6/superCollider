~recGrp2=Group.new;
Pbindf(~kick,\out,~toRecord).play(t);
x = Synth(\recLoop,[buf:~k2,\recording,1, \in,~toRecord],~recGrp2);

~k2.play

//percu cutting the 1/2 for progression
//new env shape for percu in env file

// multi valu  freq shifter or single pxrand
//bass eq big mess
//warning delay is now mono
/*Buffer.freeAll*/
//panning big debate , is there any ?
//\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0) pour les petit hits
//PANNING Not working on
//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!
s.plotTree
~bufSnoopy.play
(
~snoopy = "snoopy".postln;0.99999.rand.postln;
)

Synth(\playBuf2,  [  \buf,~bufBg , \out, ~bgFil22    ]);

/*Synth(\filterU ,[\in,~filterBus2 ,\busMod, ~bus3 , \busMod2,~bus4,\out,   ~eqBus2] ,~filterGrp)*/

Synth(\filterU ,[\in,~filterBus2 ,\busMod, ~bus3 , \busMod2,~bus5,\out,   ~eqBus2] ,~filterGrp)
// ~buf.play



(

~lfoGrp  = Group.new;
~granuGrp= Group.after(~lfoGrp);
~distoGrp =  Group.after(~granuGrp);
~dispatchGrp = Group.after(~distoGrp);
~filterGrp  = Group.after(~dispatchGrp);


~eqGrp0 = Group.after(~filterGrp);
~phaserGrp =  Group.after(~eqGrp0);
~gateGrp =  Group.after(~phaserGrp);
~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~gateGrp2 =  Group.after( ~granGrp);



~revGrp = Group.after(~gateGrp2);

~delayGrp = Group.after(~revGrp);
~eqGrp = Group.after(~delayGrp);
~dispatchGrp1 = Group.after(~eqGrp);
~filterGrp2  = Group.after(~dispatchGrp1);


~compGrp = Group.after(~filterGrp2);
~limitGrp = Group.after(~compGrp);
~stereoGrp = Group.after(~limitGrp);
~dispatchGrp2 = Group.after(~stereoGrp);
~compGrp2 = Group.after(~dispatchGrp2);
~eqGrp2 = Group.after(~compGrp2);
~finalDispatchGrp= Group.after(~eqGrp2);
~limitGrp2 = Group.after(~finalDispatchGrp);


o = {
	/*Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

*/

	Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));
	/*Out.kr(~bus3, Line.kr(0.2,0.2,9999));*/

	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));//DONT DELETE

	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));

	Out.kr(~bus14, SinOsc.kr(0.321875).range(-1,1));


	Out.kr(~bus3, SinOsc.kr(0.3 ).range((-140),1500));

}.play



)



(Ppar([/*Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~k,\out,~limitRkick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/2],inf),\crv,50),
*/

	Pbind(\instrument,\ptr, \buf, ~f, \out, ~ptrBus2,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, ~f,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e, \out, ~ptrBus3,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, ~e,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8),




	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8),


],1).play(t, quant:1))



(
Ppar([

	// Ppar([	Ppar([~kick, ~bass],16),~cymbal,~hat, ~snare],inf),

	/*Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),*/
Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),


	~bassShap,



/*	Pbind(\instrument, \lfo3, \dur, Pwrand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],  [1,4].normalizeSum,inf)   , \out,~bus2, \group, ~lfoGrp),*/


	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.8),\rH,0.8, \group, ~lfoGrp),


	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,0/*~dipatchKB*/,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,0/*~dipatchKB*/,\group, ~compGrp),




	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick,  \out, ~stereoRkick, \gain , 20, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,9999, \in, ~stereoRkick,  \group, ~stereoGrp),



Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.2),

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), Pseq([1/64],64),Pseq([1/64],256)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.17),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.22)

	],inf),






Pbind(\instrument, \dispatch , \dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out, Prand([~lpK,~bpK,~hpK],inf)),

Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiter,\dur,inf,\gain, 10, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),




	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),

/*

Pxrand([
	Pseq([
	Pseq([  Prand([ ~perc[2]   ,  ~bar[3]],1),


			Pbind(\instrument, \dispatchS10, \dur, Pseq([4/1],1),\in,Prand([ 0, ~rollingK],inf),\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2)
	],1),


	Pseq([ Pwrand([ ~perc[3]   ,~bar[4] ],[4,1],1),


	Pbind(\instrument, \dispatchS10, \dur, Pseq([2/1],1),\in,Prand([ 0, ~rollingK],inf),\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2)
	],1),


		Pseq([   Prand([ ~perc[4]   , ~bar[5]  ],1),


	Pbind(\instrument, \dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2)
	],1),

		   Prand([ ~perc[5]   , ~bar[6]



			//here add otherwise ~bar[1],~bar[2] and whats bar[0] for ?



	],[4,1],1),


		].scramble,4),




	Pseq([
	Pseq([ ~bar[2],~perc[1] ,


			Pbind(\instrument, \dispatchS10, \dur, Pseq([8/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


	Pseq([ ~perc[0],


	Pbind(\instrument,\dispatchS10, \dur, Pseq([12/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


	Prand([	Pseq([   Prand([ ~perc[4]   , ~bar[5]  ],1),


	Pbind(\instrument,\dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


		Pseq([~kbassRest, Pseq([ ~bassRest], 15),],1)

		],1)
		,

		    ~perc[5]


				].scramble,4),

		],inf),






Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),



		Pbind(\instrument, \gateS, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),



		Pxrand([
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-13), \finish, { ~key.envirPut(~value) },\out, 0,\type,Prand([\note, \rest],inf)),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-13), \finish, { ~key.envirPut(~value) },\out, 0,\type,Prand([\note, \rest],inf)),
				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		],1)

		],1)

	],inf),



	Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,   \dur, inf, \in, ~slideBus , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),
	Pbind(\instrument, \limiterS, \dur, inf, \in, ~slideBusToLimit, \gain, 20, \group,~limitGrp),
*/
	//debug


Pseq([

		Pxrand([

		Ppar([

	Prand([

				Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,~revSide,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-22),\out,~eqNoise),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~buf,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand}))],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([32/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
		],1),






		Pxrand([











				Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\type,Prand([\note,\rest],inf),\tS, 0.39550810372374),


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1).postln}),\out , 0,\type,Prand([\note,\rest],inf),\tS, 0.39550810372374),



Pseq([
Pbind(\instrument,\rise,\dur,Pseq([8/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}), \index,Pfunc({50.00.rrand(1)}),
					\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\finish, { ~key.envirPut(~value)},\tS, 0.39550810372374,\type,Prand([\note,\rest],inf))],2)



		],1)

		],12),


	Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1).postln}),\out , 0,\type,Prand([\note,\rest],inf),\tS, 0.39550810372374),

		//HERE THE CLASSIC RISE BUT EASY

].scramble,inf),




//Rise riDisto ,riEq, riRev, riComp,riLimi, ===>random flanger would be awe

Pbindf(~rLong,\dur,inf, \in,~revSide , \revtime, 12,\out,~comSide,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitSide, \dur, inf,\gain,40.8,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereoS, \dur, Pseq([32/1],inf), \in, ~stereoSide  ,\spread,1,	\atkT,0.05,\crvA,22,  \decT,0.95,\out,~no1,\tS, 0.39550810372374,\group, ~stereoGrp),





	Pbind(\instrument,\EQHP, \in, ~eqNoise , \out, ~noiseRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~no1,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz3, \dur, inf,\gain,49,\group,~limitGrp,\out,~stereoBus4),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out,~no1, \group, ~stereoGrp),






//debug
	  //STARTING HERE


		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~filterBus ,\group, ~distoGrp),


Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~eqBus1, \group,~filterGrp ),


	Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out, ~gateBus,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\gate, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Prand([Pseq([1/4],64)/*,Pseq([1/1 ],64  ) */],inf), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type,  Pseq([   Pseq([\note], 128) ,Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2), Pseq([\note], 64) ], inf),
		/*\atkT, Pseq([ 0,0.4,0,0 ,0,0,0,0 ],inf),
		\decT,Pseq([ 1,0.59,1,1,  1,1,1,1],inf),
		\atckC, Pseq([0,5,0,0 ,  0,0,0,0],inf),*/

		 \tS, 0.39550810372374,

		\vlSub,~vl1= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl2=0.00.rrand(0.2,1).postln,
	\decT,~vl3=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl4=0.2.rrand(0.3,0.1).postln,
	\relT,~vl5=0.12.rrand(0.8,1).postln,
	\atckC,~vl6=6.rrand(0,1).postln,
		\decC,~vl7=(-4).rrand(-2,1).postln,
		\relC,~vl8=(-8).rrand(-2,1) .postln,
		\out,~reverbBus),




	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus  , \out,~comFuzz ,\group,~revGrp),




	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur,inf,\gain,46,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),


//debug


	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus3, \out, ~filterSquelch, \group,~distoGrp),

	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~eqBus3, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus3 , \out, ~gateSquelch,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),





	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),


Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,52,\group,~limitGrp,\out ,~comSnaGrpBus2),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),


Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comDelay ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,53,\group,~limitGrp,\out,~stereoBus3),

	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~no1,\center, Pxrand([0.2,(-0.2),(-0.4),(0.4)],inf), \group, ~stereoGrp),






//debug


		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~filterBus2 ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,inf, \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, /*~toRecord*/~gateBus2,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),








	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, inf,\gain,46,\group,~limitGrp,\out,~stereoBus2),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus2   ,\out,~no1, \group, ~stereoGrp),




Pxrand([


	//GATES



		Pbind(\instrument, \gate, \dur, Pseq([1/1],1),
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,\tS, 0.39550810372374,
				\bus1,~bus8,\in, ~gateBus,\out, ~reverbBus),








	Pwrand([
			Pxrand([

	Pbind(\instrument, \gate, \dur, Pseq([1/4],3),
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,
 \tS, 0.39550810372374,

				\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus),



				Pbind(\instrument, \gate, \dur,/*Pxrand([*/ Pseq([1/4],16)/*,Pseq([1/4],64)],1)*/,
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),

			Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
					/*\relSu,Pfunc({0.06.exprand(0.04)}),
				\vlSub,~vl11= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl21=0.00.rrand(0.2,1).postln,
	\decT,~vl31=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl41=0.2.rrand(0.3,0.1).postln,
	\relT,~vl51=0.12.rrand(0.8,1).postln,
	\atckC,~vl61=6.rrand(0,1).postln,
		\decC,~vl71=(-4).rrand(-2,1).postln,
		\relC,~vl81=(-8).rrand(-2,1) .postln
,\bus1,~bus8,*/


	\vlSub,Pfunc({0.8.exprand(0.0,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),



					\in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),







			Pbind(\instrument, \gate, \dur, Pseq([1/1],1), \in,~filterRnd, \tS, 0.39550810372374, \out, ~reverbRnd, \group, ~gateGrp),

		Pbind(\instrument, \gate, \dur,  Pseq([1/1],1) ,\tS, 0.39550810372374,
		\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,~reverbSquelch),

		],1)
			,

			Pbind(\instrument, \gate, \dur,Pseq([4/1],1),
		 \group, ~gateGrp,
				/*\relSu,Pfunc({0.06.exprand(0.04)}),*/
				/*\vlSub,~vl11,\vlSub2,Pkey(\vlSub),
				\atkT,~vl21,
	\decT,~vl31,
	\subsT,~vl41,
	\relT,~vl51,
	\atckC,~vl61,
		\decC,~vl71,
		\relC,~vl81

				,\bus1,~bus8,*/

				\vlSub,Pfunc({0.8.exprand(0.0,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),




				\in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),

		],[4,1],64)
	//Prand([

	,


		Pxrand([

		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),



		Pbind(\instrument, \gate, \dur, Pseq([1/4],1)        /* , \vlDec, 0.6,*/
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch  ,\tS, 0.39550810372374,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
			/*	\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,\bus1,~bus8*/


					\vlSub,Pfunc({0.8.exprand(0.0,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1) })


					,\in, ~gateBus,\out, ~gateSeqBus/*~reverbBus*/),

		Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],16)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\relSu,Pfunc({0.15.rand}),\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,\in, ~gateBus2, \tS, 0.39550810372374,\out,

			~reverbBus2)



 ],16)
],inf),






//debug

	Ppar([



		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~buf,\out,~eqDs2,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand})),



	Pbind(\instrument, \wNoise,\dur,Pseq([32/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],inf),





	Pbind(\instrument,\EQHP, \in, ~eqDs2 , \out, ~reverbBus32 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus32  , \out,~comFuzz32,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz32 ,\ctrl, ~kbus, \out,~limitFuzz32, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz32, \dur, inf,\gain,49,\group,~limitGrp,\out,~stereoBus42),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus42   ,\out,~no2, \group, ~stereoGrp),




//GIVE GLITCH ~
//debug glitcvchy
	Pbind(\instrument,\gran,\dur,Pseq([16/1],inf),
/*\type, Pseq([\rest, \note,\rest,\note, \note,\note,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus12,\gate, 1,\duration,Pkey(\dur),\impulse,0.002,

		\pos,  Pfunc({0.99999.rand.postln })              ),



	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus12 , \out,~reverbBus12 ,\group, ~distoGrp),


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus12  , \out,~comFuzz12 ,\group,~revGrp),




	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1	,\in, ~comFuzz12 ,\ctrl, ~kbus, \out,~limitFuzz12, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in, ~limitFuzz12, \dur, inf,\gain,46,\group,~limitGrp,\out,~stereoBus12),

	Pbind(\instrument,\stereoS, \dur, Pseq([1/1],inf),\center,Pfunc({  (-0.4).rrand((0.4))   }) ,\in, ~stereoBus12   ,\out,~no2, \group, ~stereoGrp)
,




	Prand([
//Pxrand
		Pbind(\instrument, \gate, \dur, Pseq([4/1],1),\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,\in, ~gateBus2, \tS, 0.39550810372374,\out,

		Pwrand([/*~micBus23,*/~micBus33,~reverbBus23],[1,4].normalizeSum,inf)),


	Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\relSu,Pfunc({0.15.rand}),\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,\in, ~gateBus2 ,\tS, 0.39550810372374,\out,

			~reverbBus23),



	Pbind(\instrument, \gate, \dur,Pxrand([ Pseq([1/4],16),Pseq([1/4],64)],1),


			\type, Pxrand([ /*Pseq([\note],256) , */Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),

				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
				\relSu,Pfunc({0.12.exprand(0.04)}),
				\vlSub,~vl11,\vlSub2,Pkey(\vlSub),
				\atkT,~vl21,
	\decT,~vl31,
	\subsT,~vl41,
	\relT,~vl51,
	\atckC,~vl61,
		\decC,~vl71,
		\relC,~vl81 ,\tS, 0.39550810372374

				,\bus1,~bus8,\in, ~gateBus2,\out,
			Pwrand([~micBus23,/*~micBus33,*/~reverbBus23],[1,1].normalizeSum,inf)   ),

	],inf),


	/*Pbind(\instrument,\recLoop,\buf,~bufSnoopy,\recording,1,\group, ~compGrp,\in,~reverbBus23, \dur, inf),*/
	// ~bufSnoopy.play

 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz23,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz23 ,\ctrl, ~kbus, \out,~limitFuzz23, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitFuzz23, \dur, inf,\gain,46,\group,~limitGrp,\out,~stereoBus23),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out,~no3, \group, ~stereoGrp),



Pxrand([



	//debug

	Pwrand([

	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],24)  ,   Pseq([1/1],24) , Pseq([1/16],24)  ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~distoPerch,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,Pkey(\dur),

		\pos,Prand([ Pseq([0.99999.rand],24),  Pseq([0.99999.rand],24) , Pseq([0.99999.rand],24), Pseq([0.99999.rand],24) ,
			Pseq([0.99999.rand],24),  Pseq([0.99999.rand],24) , Pseq([0.99999.rand],24), Pseq([0.99999.rand],24)],inf),



\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],24) , Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1) ],24) ,
		Pseq([  1.00.rrand(0.2,1)   ],24) , Pseq([  1.00.rrand(0.2,1) ],24), Pseq([  1.00.rrand(0.2,1) ],24) , Pseq([  1.00.rrand(0.2,1)   ],24)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Prand([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],24)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24)],inf),
	),


	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],12)  ,   Pseq([1/1],12) , Pseq([1/16],12)  ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~distoPerch,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,Pkey(\dur),

		\pos,Prand([ Pseq([0.99999.rand],12),  Pseq([0.99999.rand],12) , Pseq([0.99999.rand],12), Pseq([0.99999.rand],12) ,
			Pseq([0.99999.rand],12),  Pseq([0.99999.rand],12) , Pseq([0.99999.rand],12), Pseq([0.99999.rand],12)],inf),



\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],12) , Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1) ],12) ,
		Pseq([  1.00.rrand(0.2,1)   ],12) , Pseq([  1.00.rrand(0.2,1) ],12), Pseq([  1.00.rrand(0.2,1) ],12) , Pseq([  1.00.rrand(0.2,1)   ],12)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],12)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12)],inf),
	),

	],[1,1],10),





















//DEBUG one more SNOOPY

	///THE IDEA
//// 1010 0000   or  0000 0000  \in, Pseq([ Prand([1010 0000 ].scramble,64 ),  0


Pxrand([
Pbind(\instrument,\gran,\dur,	Pseq([1/1],24)
		,
	\group,~granuGrp,
		/*\type,Pseq([\rest,\rest,\rest,\note, \note,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~bufSnoopy,\out,~reverbBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,
			Prand([Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),
		Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24)

		],inf)),




	Pbind(\instrument,\gran,\dur,         Pseq([1/4],24)
		,
	\group,~granuGrp,
		/*\type,Pseq([\rest,\note,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~bufSnoopy,\out,~reverbBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,Prand([
				Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),
				Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24),Pseq([0.99999.rand],24)


		],inf)),
	],10),



	],inf),



		////

			Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),

	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitPerch, \dur, inf,\gain,42,\group,~limitGrp,\out,~stereoPerch),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoPerch ,\spread,1  ,\center,Pxrand([ Pfunc({1.00.rand}),Pfunc({-1.00.rand})],inf), \out,~stetoSnaCom12/*~no1*/, \group, ~stereoGrp),

		//////






	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~reverbBus4  , \out,~comFuzz4 ,\group,~revGrp),




	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1	,\in, ~comFuzz4 ,\ctrl, ~kbus, \out,~limitFuzz4, \group, ~compGrp),


	Pbind(\instrument, \limiterS,\in, ~limitFuzz4, \dur,inf,\gain,10,\group,~limitGrp,\out,~stereoBus14),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14   ,\out,~stetoSnaCom12, \group, ~stereoGrp),


//// 1010 0000   or  0000 0000 , MAYBE 0100 0000
	//   \in, Pseq([ Prand([1010 0000 ].scramble,64 ),  0 = ~stetoSnaCom1




	/*Pbind(\instrument,\comp10, \dur,inf,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom1,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2),*/



//main dispatch

Pbind(\instrument, \dispatchS ,\dur,Pwrand([
		Pseq([16/1],1),
		Pseq([4/1],4), Pseq([1/1],16)/*,Pseq([1/4],64),*/

	],[1,4,4],           inf),

	\in ,Pwrand([ ~no1, ~no2,~no3],[1,1,1],inf),\out,~stetoSnaCom1  ,\group,~dispatchGrp2),




	Pseq([
	Pbind(\instrument,\comp10, \dur,Pseq([1/1],256),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in,Pxrand([ Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,256 )   ,

				Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,256 ) ],inf)

			,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,),


		Pbind(\instrument,\comp10, \dur,Pseq([256/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
			,\in, ~stetoSnaCom1  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374,)],inf),


Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\out, ~eqBus102,\frq, 100, \dur,inf,\group, ~eqGrp2),





	Pbind(\instrument, \gateS, \dur, Pseq([Pseq([1/1],64),    Pseq([192/1],1)],inf) , \type,Pseq([Pseq([
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,\note,\rest,\rest,\note,\rest,\rest,\rest,\rest].scramble,1),
		Pseq([\rest,\rest, \rest,\rest,\rest,\rest,\rest, \rest,\note,\rest,\rest,\note,\rest,\note,\note,\rest].scramble,1)],2)  , \note ],inf)       ,
	\atkT, 0.2.rrand(0.08), \decT, 0.8.rrand(0.6),\relT, 0.2.rrand(0),\atkT, 4.rrand(1), \vlSub , 0.8.rrand(0.4), \vlSub2, Pkey(\vlSub),\relC, (-5).rrand(-1),
	\in, ~eqBus102,\group, ~finalDispatchGrp, \out, ~toLimitlast),




	Pbind(\instrument, \limiter10,\in, ~toLimitlast, \dur,inf,\gain,60,\group,~limitGrp2),




	Pbind(\instrument, \filterS, \dur, inf,\in,~bgFil22, \busMod,~bus2, \qf, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/2,\atk ,0.01, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2,\group,~compGrp ),

	Pbind(\instrument,  \stereoS2, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([12/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~eqGrp2),

	Pbind(\instrument,  \limiterS, \dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 15,\group,~limitGrp2   ),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.01, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,~bgStereo2,\group,~finalDispatchGrp ),



],1).play(t, quant:1)



)

s.plotTree
s.meter
FreqScope.new

