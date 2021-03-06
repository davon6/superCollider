
//percu cutting the 1/2 for progression
//new env shape for percu in env file

// multi valu  freq shifter or single pxrand
//bass eq big mess
//warning delay is now mono
/*Buffer.freeAll*/

//\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0) pour les petit hits
s.plotTree
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
~compGrp2 = Group.after(~stereoGrp);


o = {
	/*Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

*/
	Out.kr(~bus3, Line.kr(0.2,0.2,9999));

	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));

	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));

	Out.kr(~bus14, SinOsc.kr(0.321875).range(-1,1));

}.play



)



(Ppar([Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~k,\out,~limitRkick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/2],inf),\crv,50),


	Pbind(\instrument,\ptr, \buf, f, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, f,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus3,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8),


],1).play(t, quant:1))
~bass.play(t)


(
Ppar([

	// Ppar([	Ppar([~kick, ~bass],16),~cymbal,~hat, ~snare],inf),

	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),

	/*Pbind(\instrument, \lfo2, \dur,Pseq([1/1],inf), \val, Prand([0,1],inf), \out, ~bus5, \group, ~lfoGrp),*/

	~bassShap,


	/*Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf), \vl,Pseq([0.0000000095262251,0.0000000095262251,0.0000000095262251, 0.01005859375],inf),
		\vl3, Pseq([0,0,0, (-10.4)],inf), \vl2, Pseq([0,0,0, 15],inf),
		\out, ~bus2,  \out2, ~bus11,  \out3, ~bus3),*/

	/*Pbind(\instrument, \lfo, \dur,Pseq([1/ Prand([4,16,1],inf) ], Prand([1,4,16,64],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) ,  \out, ~bus10),*/
	/*Pbind(\instrument, \lfo, \dur,Pseq([Prand([4,16,1,64],inf)/ 1 ], Prand([1,4],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) , \tim,  6.1952, \crv,(-3),  \out, ~bus11),*/

	Pbind(\instrument, \lfo3, \dur, Pwrand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],  [1,4].normalizeSum,inf)   , \out,~bus2, \group, ~lfoGrp),

	Pbind(\instrument, \lfoSaw, \dur ,Pseq([4/1],inf),\val,Prand([~hz1beat*8,~hz1beat],inf), \out, ~bus10, \group, ~lfoGrp),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),




	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,0/*~stereoHat*/,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,0/*~stereoCymb*/,\group, ~compGrp),


	/*Pbind(\instrument, \stereo , \in, ~stereoCymb, \dur, 9999, \spread, 1 ,\center,(-0.1) , \group, ~stereoGrp),
	Pbind(\instrument, \stereo , \in, ~stereoHat, \spread, 1 ,\dur, 9999,\center,(0.1), \group, ~stereoGrp),*/



	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick,  \out, ~stereoRkick, \gain , 20, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,9999, \in, ~stereoRkick,  \group, ~stereoGrp),


	Ppar([

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-20),\out,~noiseRev),
		Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  , \out,0 ,\group,~revGrp),

	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],1),


//WEIRD, TO FIX
	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],4)  ,   Pseq([1/1],4)   ],inf)  ,
\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest],inf),
		\amp, 1,\buf, ~buf,\out,~distoPerch,\gate, 1,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),

		\pos,Pseq([ Pseq([0.99999.rand],4),  Pseq([0.99999.rand],4) , Pseq([0.99999.rand],4), Pseq([0.99999.rand],4) ,
			Pseq([0.99999.rand],4),  Pseq([0.99999.rand],4) , Pseq([0.99999.rand],4), Pseq([0.99999.rand],4)],inf),



		\vlSub, Pfunc({Pseq([  1.00.rrand(0.2,1)   ],4)},inf),\vlSub2,Pkey(\vlSub),
				\atkT,Pfunc({Pseq([0.00.rrand(1.00,1) ],4)},inf),
	/*\decT, Pfunc({Pseq([0.04.rrand(0.4,0.3)],4)},inf),
	\subsT, Pfunc({Pseq([0.02.rrand(0.3,0.1)],4)},inf),
	\relT,Pfunc({Pseq([0.12.rrand(0.8,1)],4)},inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],4)},inf),
		\decC,Pfunc({Pseq([(-10).rrand(-2,1)],4)},inf),
		\relC,Pfunc({Pseq([(-8).rrand(-2,1) ],4)},inf),*/
	),





		Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),




	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitPerch, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoPerch),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoPerch ,\spread,1  ,\center,Pxrand([ Pfunc({1.00.rand}),Pfunc({-1.00.rand})],inf), \out,~stetoSnaCom1, \group, ~stereoGrp),



~toUse,



	  //STARTING HERE
Pbind(\instrument,\gran,\dur,Prand([Pseq([1/4],16),Pseq([16/1],1)],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus1,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.9999999999.rand),

		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~filterBus ,\group, ~distoGrp),


Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~eqBus1, \group,~filterGrp ),


//WATCH OUT VOLUME
Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out, ~gateBus ,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Prand([Pseq([1/4],64)/*,Pseq([1/1 ],64  ) */],inf), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type,  Pseq([   Pseq([\note], 128) ,Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ],2), Pseq([\note], 64) ], inf),
		/*\atkT, Pseq([ 0,0.4,0,0 ,0,0,0,0 ],inf),
		\decT,Pseq([ 1,0.59,1,1,  1,1,1,1],inf),
		\atckC, Pseq([0,5,0,0 ,  0,0,0,0],inf),*/

		\vlSub,~vl1= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl2=0.00.rrand(0.2,1).postln,
	\decT,~vl3=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl4=0.2.rrand(0.3,0.1).postln,
	\relT,~vl5=0.12.rrand(0.8,1).postln,
	\atckC,~vl6=6.rrand(0,1).postln,
		\decC,~vl7=(-10).rrand(-2,1).postln,
		\relC,~vl8=(-8).rrand(-2,1) .postln,
		\out,~reverbBus),




	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus  , \out,~comFuzz ,\group,~revGrp),




	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~stetoSnaCom1, \group, ~stereoGrp),



//s.meter
/*	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~phaseBus),

	Pbind(\instrument, \men, \dur, Pseq([16384/1],inf),\out, ~filterSquelch),
	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus2),

	Pbind(\instrument,\algo,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,162.82/*130*/,\out,~filterBus),




	Pbind(\instrument,\multi,\dur,Pseq([16384/1],1), \out,~distoBg),*/







/*

	Pbind(\instrument, \disto, \hpf, 659.255, \dur, inf, \in ,~distoBg, \out,~bgBus , \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\dur,inf, \mod, ~bus12, \in,~bgBus  , \out,~eqBg ,\group,~revGrp),

	Pbind(\instrument, \EQ2, \dur, inf, \val, 2605.12,\quant,8, \gain,(-20) ,\in, ~eqBg, \out, ~dispatchBg, \group, ~eqGrp),

	Pbind(\instrument,\dispatchS,\dur,Pseq([ ~long2],inf), \type,Pwrand([\note, \rest],[1,4].normalizeSum, inf),\in, ~dispatchBg , \out, Prand([~bgFil,~bgCom],inf), \group, ~dispatchGrp1),

//JEEz keep disapearing

	Pbind(\instrument, \filterS, \dur, inf, \in,~bgFil  ,\which,0, \busMod, ~bus10, \rqLPF, ~bus3,\out, ~bgCom, \group, ~filterGrp2),


Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~bgCom ,\ctrl, ~kbus, \group, ~compGrp,\out,~bgLimit),
Pbind(\instrument, \limiter,\in, ~bgLimit, \dur, inf,\gain,8,\group,~limitGrp,\out,~bgStereo),
Pbind(\instrument,\stereo, \dur, Pseq([1024/1],1), \in, ~bgStereo   ,\out,0, \spread, 10, \group, ~stereoGrp),






Pbind(\instrument, \phaser, \dur,inf,\maxDlT,0.0242, \rate, 0.00502929687 , \in,~phaseBus, \out, ~distoBus2, \group,~phaserGrp),


	Pbind(\instrument, \disto,\hpf,100,\dur,inf, \in , ~distoBus2, \out,~filterRnd, \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rShort],1),\in,~reverbRnd , \out,~comRnd,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.02,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,20,\in, ~comRnd,\ctrl, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,3,\group,~limitGrp,\out,~stereoPhase),

	Pbind(\instrument, \stereo, \dur,Pseq([4/1],inf) , \spread, 1,  \center, Prand([0.8,0.4,0.1,(-0.1),(-0.8),(-0.4)],inf), \in, ~stereoPhase, \out,~stetoSnaCom1 ,\group, ~stereoGrp),





	Pbind(\instrument, \dispatch, \dur, Pseq([1/1],inf), \in, ~filterBus2, \out,~lpSide,\group, ~dispatchGrp),


	Pbind(\instrument, \filter  ,\dur, inf,\in,~lpSide, \busMod, ~bus15 ,\rqLPF,~bus3 , \out, ~gateSide, \group, ~filterGrp),






	Pbind(\instrument, \gate, \dur, Prand([ Pseq([1/4],1), Pseq([1/1],1)],inf),\type,Pwrand([\note, \rest],[1,16].normalizeSum,inf),\in,~gateSide, \atkT, 0.99, \decT, 0,\atckC, 8,\out, ~revSide,\group, ~gateGrp),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revSide  , \out,~comSide,\group,~revGrp),



	Pbind(\instrument,\compS, \dur,inf ,\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872,\in, ~comSide, \out, ~limitSide,\ctrl, ~kbus, \group, ~compGrp),




	Pbind( \instrument, \limiterS  ,\dur,inf, \in ,~limitSide, \gain, 1, \out, ~stereoSide   , \group, ~limitGrp),

	Pbind(\instrument, \stereoS,\dur,Pseq([4/1],inf), \spread, 1,\in ,~stereoSide, \modPan, ~bus14,  \group, ~stereoGrp),





	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~distoBus3, \group,~filterGrp),

	Pbind(\instrument, \disto, \hpf,100,\dur, inf, \in, ~distoBus3, \out, ~gateSquelch, \group,~distoGrp),


	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, ~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,10,\group,~limitGrp,\out ,~comSnaGrpBus2),

	Pbind(\instrument,\compS, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),


Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comDelay ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,11,\group,~limitGrp,\center, Pseq([0.2,(-0.2),(-0.4),(0.4)],inf),\out,~stereoBus3),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus3   ,\out,~stetoSnaCom1, \group, ~stereoGrp),


*/


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],64),Pseq([4/1],1)],inf),
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),

		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~filterBus2 ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~gateBus2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),



	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),

	Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,/*(70.3)*/1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz3, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoBus4),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out,~stetoSnaCom1, \group, ~stereoGrp),





	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,/*(70.3)*/1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoBus2),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus2   ,\out,~stetoSnaCom1, \group, ~stereoGrp),




Pxrand([


	//GATES

		Pxrand([

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
	\relC,~vl8,
				\bus1,~bus8,\in, ~gateBus,\out, ~reverbBus),



			/*Pbind(\instrument, \gate, \dur,Pseq([4/1],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8),


				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest],8)],inf), \group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,
			\vlDec,0.8,\relC, (-4),
			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2,*/
				\vlSub,~vl11= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl21=0.00.rrand(0.2,1).postln,
	\decT,~vl31=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl41=0.2.rrand(0.3,0.1).postln,
	\relT,~vl51=0.12.rrand(0.8,1).postln,
	\atckC,~vl61=6.rrand(0,1).postln,
		\decC,~vl71=(-10).rrand(-2,1).postln,
		\relC,~vl81=(-8).rrand(-2,1) .postln,

				\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~reverbBus3],[1,1,16].normalizeSum,inf)),*/



		],1),


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


				\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus),



			Pbind(\instrument, \gate, \dur,Pxrand([ Pseq([1/4],16),Pseq([1/4],64)],1),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8),


				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest],8)],inf), \group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,

			\vlDec,0.8,\relC, (-4),

			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2*/
				\vlSub,~vl11= 0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub),
				\atkT,~vl21=0.00.rrand(0.2,1).postln,
	\decT,~vl31=0.4.rrand(0.6,0.3).postln,
	\subsT,~vl41=0.2.rrand(0.3,0.1).postln,
	\relT,~vl51=0.12.rrand(0.8,1).postln,
	\atckC,~vl61=6.rrand(0,1).postln,
		\decC,~vl71=(-10).rrand(-2,1).postln,
		\relC,~vl81=(-8).rrand(-2,1) .postln

				,\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),





			Pbind(\instrument, \gate, \dur, Pseq([1/1],1), \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),

		Pbind(\instrument, \gate, \dur,  Pseq([1/2],1)
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),

	],64)
	//Prand([

	,


		Pxrand([

		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),


		Pbind(\instrument, \gate, \dur, Prand([     Pseq([1/4],1)  ,Pseq([1/1],1)],1)  /* , \vlDec, 0.6,*/
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	/*\vlSub,0.2,\subsT,inf ,*/
				\vlSub,~vl1,\vlSub2,Pkey(\vlSub),
				\atkT,~vl2,
	\decT,~vl3,
	\subsT,~vl4,
	\relT,~vl5,
	\atckC,~vl6,
	\decC,~vl7,
	\relC,~vl8,\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus/*~reverbBus*/),

		Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,
			/*\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8)],1), */\group, ~gateGrp,
		/*\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,

			\vlDec,0.8,\relC, (-4),

			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2*/
				\vlSub,~vl11,\vlSub2,Pkey(\vlSub),
				\atkT,~vl21,
	\decT,~vl31,
	\subsT,~vl41,
	\relT,~vl51,
	\atckC,~vl61,
	\decC,~vl71,
	\relC,~vl81


				,\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf))



 ],16)
],inf),




	Pbind(\instrument,\comp10, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom1 ,\ctrl, ~snBus, \group, ~compGrp2),





	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Pseq([1/1],inf), \in, ~gateShap , \group, ~gateGrp2,
		\type, Pseq([   Pseq([
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest   ],2), Pseq([\note], 32) ], inf),
		\out,0)



],1).play(t, quant:1)



)

s.plotTree
s.meter
FreqScope.new

