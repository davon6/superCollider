
//maybe eq kick a littl to free bass
//stereo percu weird
//percu cutting the 1/2 for progression
//new env shape for percu in env file
//slider aka minirise
//delayfo random melor
// multi valu  freq shifter or single pxrand
//STEREO IS BROKEN FOR PERCUSSIONS
//ALSO LONG SNARE GLTICH WITH BASS
//bus rq for all filter bg
//warning delay is now mono
/*Buffer.freeAll*/
s.plotTree
(

/*~dispatchGrp = Group.new;

~shiftGrp =  Group.after(~dispatchGrp);*/

~lfoGrp  = Group.new;
~filterGrp  = Group.after(~lfoGrp);

~phaserGrp =  Group.after(~filterGrp);

~distoGrp =  Group.after(~phaserGrp);

~gateGrp =  Group.after(~distoGrp);

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
	Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

	/*Out.kr(~bus2, SinOsc.kr(LFPulse.kr(Select.kr(0.321875,[1.2875, 0.321875,0.08046875 ])).range(0.321875,0.08046875) ).range(659.255, 2637.02));*/

	Out.kr(~bus3, Line.kr(0.2,0.2,inf));


	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	)    /* * SinOsc.kr(0.64375).range(
0.01005859375,1.2875)*/




	).range(82.4,2637.02),);

	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(5274.04,82.41),);*/



	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,1).round(1),
		[    ~hz1beat, ~hzHbeat,5.15/*,0.321875*/	]
	)    *  SinOsc.kr(~hzHbeat*2).range((~hz1beat.neg),~hz1beat)).range(~hz8Oct,~hz1Oct),);*/




	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));
	/*Out.kr(~bus7, SinOsc.ar(~hzQbeat).range(1,0.4));*/

	/*Out.kr(~bus8,  /*Lag.kr(*/LFNoise0.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.08,0.00));*/

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));



	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));





}.play



)



(Ppar([Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, d,\group,~recGrp,\dur,Pseq([1024/1],1)),

/* Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,Pseq([2/1],inf),\crv,50)*/

	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, d,\out,~limitRkick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/2],inf),\crv,50),


	Pbind(\instrument,\ptr, \buf, f, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, f,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus3,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8),





	/*Pbind(\instrument,\gran,\dur,Prand([Pseq([1024/1],1),/*,Pseq([4/1],1)  ,*//*Pseq([1/2],2),*//*Pseq([1/4],16)*/ /*, Pseq([2/1],2) */],inf),\amp, 1,\buf, e,\out,~reverbBus2,\atk, 0,/*\rel, Pseq([1/4],inf)*/\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0

		/*,\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\rest,\note,\rest,\rest,\note,\rest,\note],8)],[16,1].normalizeSum,inf)
*/
		,\minPtrDelay, 1000,\group,~granGrp,
		\duration,Pkey(\dur)
		,\impulse,Prand([ Pseq([1/4],16), Pseq([1/1],4)],inf)),*/


	/*Pbind(\instrument,"TriggerBufferGranular", \dur, 9999,\bufnum,f.bufnum, \duration, t.beatDur,\out,~reverbBus2
		,\group,~granGrp,), //e.bufnum   f.bufnum
	Pbind(\instrument,"TriggerBufferGranular", \dur, 99999, \duration, t.beatDur*4,\bufnum,e.bufnum,\out,~reverbBus2,\group,~granGrp)*/

],1).play(t, quant:1))




(
Ppar([


	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),



	/*Pbind(\instrument, \lfo2, \dur,Pseq([1/1],inf), \val, Prand([0,1],inf), \out, ~bus5, \group, ~lfoGrp),*/

	~bassShap,

	/*Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf), \vl,Pseq([0.0000000095262251,0.0000000095262251,0.0000000095262251, 0.01005859375],inf),
		\vl3, Pseq([0,0,0, (-10.4)],inf), \vl2, Pseq([0,0,0, 15],inf),
		\out, ~bus2,  \out2, ~bus11,  \out3, ~bus3),*/

	/*Pbind(\instrument, \lfo, \dur,Pseq([1/ Prand([4,16,1],inf) ], Prand([1,4,16,64],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) ,  \out, ~bus10),*/
	/*Pbind(\instrument, \lfo, \dur,Pseq([Prand([4,16,1,64],inf)/ 1 ], Prand([1,4],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) , \tim,  6.1952, \crv,(-3),  \out, ~bus11),*/

	Pbind(\instrument, \lfo3, \dur, Prand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],inf), \out,~bus2, \group, ~lfoGrp),

	Pbind(\instrument, \lfoSaw, \dur ,Pseq([~long1],inf),\val,Prand([~hz1beat*8,~hz1beat],inf), \out, ~bus10, \group, ~lfoGrp),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),




	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,0/*~stereoHat*/,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,0/*~stereoCymb*/,\group, ~compGrp),


	/*Pbind(\instrument, \stereo , \in, ~stereoCymb, \dur, 9999, \spread, 1 ,\center,(-0.1) , \group, ~stereoGrp),
	Pbind(\instrument, \stereo , \in, ~stereoHat, \spread, 1 ,\dur, 9999,\center,(0.1), \group, ~stereoGrp),*/



	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick,  \out, ~stereoRkick, \gain , 40, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,9999, \in, ~stereoRkick,  \group, ~stereoGrp),

	/*Pseq([4/1],inf)*/

	Ppar([

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-12),\out,0/*~noiseStereo1*/),

	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],1),

	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~phaseBus),

	Pbind(\instrument, \men, \dur, Pseq([16384/1],inf),\out, ~filterSquelch),
	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus2),

	Pbind(\instrument,\algo,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,162.82/*130*/,\out,~filterBus),

	Pbind(\instrument,\multi,\dur,Pseq([16384/1],1), \out,~distoBg),

	Pbind(\instrument, \disto, \hpf, 325.64, \dur, inf, \in ,~distoBg, \out,~bgBus , \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\dur,inf, \in,~bgBus  , \out,~eqBg ,\group,~revGrp),

	Pbind(\instrument, \EQ, \dur, inf, \val, 2605.12,\quant,8, \gain,(-20) ,\in, ~eqBg, \out, ~dispatchBg, \group, ~eqGrp),

	Pbind(\instrument,\dispatch,\dur,Pseq([ ~long2],inf), \in, ~dispatchBg , \out, Prand([~bgFil,~bgCom,99],inf), \group, ~dispatchGrp1),

	Pbind(\instrument, \filter, \dur, inf, \in,~bgFil  ,\which,0, \busMod, ~bus10, \rqLPF, ~bus3,\out, ~bgCom, \group, ~filterGrp2),


Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~bgCom ,\ctrl, ~kbus, \group, ~compGrp,\out,~bgLimit),
Pbind(\instrument, \limiter,\in, ~bgLimit, \dur, inf,\gain,0.17,\group,~limitGrp,\out,~bgStereo),
Pbind(\instrument,\stereo, \dur, inf, \in, ~bgStereo   ,\out,0, \spread, 10, \group, ~stereoGrp),

/*Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \gra,~bus11 , \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,0),*/


	/*Pbind(\instrument, \playBuf , \dur, Pseq([1/16],1), \trig, 30,\start ,Prand([0, 3500, 7700, 22000],inf),\out, ~playBufBs)*/

	/*Pseq([
	Pbind(\instrument,\dispatch,\dur,

	Pwrand([ Pseq([1/4],Pxrand([1,4,16],1)), Pseq([4/4],Pxrand([1,4],1)), Pseq([16/4],1), Pseq([64/4],1)],[64,16,4,1],1)


	,\in,~dispatchBus, \out,Prand([99,~filterBus2, ~filterBus,/*~shiftMelo,*/~filterSquelch,~phaseBus],1),\group,~dispatchGrp),

	],Prand([1,4,16,64],inf)),
*/

	/*Pseq([
	Pbind(\instrument,\dispatch,\dur,

	Pwrand([ Pseq([1/1],1), Pseq([4/1],1), Pseq([16/1],1), Pseq([64/1],1)],[16,16,4,1],1)


	,\in,~dispatchBus, \out,Prand([99,~filterBus2, ~filterBus,~filterSquelch,~phaseBus],1),\group,~dispatchGrp),

	],Prand([1,4,16,64],inf)),*/



	/*~shiftMelo,*/



/*

	Pbind(\instrument, \shift, \dur, Pseq([1/3],inf),
		\freq2, [329.63 ,326.63 ], \vlPE, 2.575, \dA, 2, \factor2,1, \type,Pseq([\note,\rest,\rest,\note],inf),
		\boo, ~bus13, \dA3, 2,

		\in,~shiftMelo, \out,Prand([~filterBus2, ~filterBus,~filterSquelch],1), \group, ~shiftGrp),*/


	/*Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterRnd,\which,Prand([0,2],inf),\busMod, ~bus2, \out, ~phaseBus, \group,~filterGrp),*/




Pbind(\instrument, \phaser, \dur,inf,\maxDlT,0.0242, \rate, 0.00502929687 , \in,~phaseBus, \out, ~distoBus2, \group,~phaserGrp),


	Pbind(\instrument, \disto,\dur,inf, \in , ~distoBus2, \out,~filterRnd, \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rShort],1),\in,~reverbRnd , \out,~comRnd,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.02,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,20,\in, ~comRnd,\ctrl, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,7,\group,~limitGrp,\out,~stereoPhase),

	Pbind(\instrument, \stereo, \dur,Pseq([4/1],inf) , \spread, 1,  \center, Prand([0.8,0.4,0.1,(-0.1),(-0.8),(-0.4)],inf), \in, ~stereoPhase, \out,~stetoSnaCom1 ,\group, ~stereoGrp),



	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~distoBus3, \group,~filterGrp),

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus3, \out, ~gateSquelch, \group,~distoGrp),


	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, ~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,27,\group,~limitGrp,\out ,~comSnaGrpBus2),

	Pbind(\instrument,\compS, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),


Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbSquelch  , \out,~comDelay ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,27,\group,~limitGrp,\out,~stereoBus3),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus3   ,\out,~stetoSnaCom1, \group, ~stereoGrp),










	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~gateBus2, \group,~filterGrp),




	/*Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Pseq([1/1],inf), \in, ~gateSeqBus2 , \group, ~gateGrp2,
		\type,  Pseq([Pseq([
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest  ],4), Pseq([\note], 64) ], inf),
		\atkT, Pseq([ 0,0.4,0,0 ,0,0,0,0 ],inf),
		\decT,Pseq([ 1,0.59,1,1,  1,1,1,1],inf),
		\atckC, Pseq([0,5,0,0 ,  0,0,0,0],inf),
		\out,~reverbBus2),*/


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),



	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,/*(70.3)*/1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\gain,30,\group,~limitGrp,\out,~stereoBus2),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus2   ,\out,~stetoSnaCom1, \group, ~stereoGrp),







	//GATES

	//Prand([

		Pxrand([

		Pbind(\instrument, \gate, \dur, ~short1, \in,~filterRnd, \out, ~reverbRnd, \group, ~gateGrp),


		Pbind(\instrument, \gate, \dur, Prand([     Pseq([1/4],1)  ,Pseq([1/1],1)],1)  /* , \vlDec, 0.6,*/
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,Pwrand([~reverbSquelch,  ~delayBus ],[10,1].normalizeSum,inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus,\out, ~gateSeqBus/*~reverbBus*/),

		Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note],8)],1), \group, ~gateGrp,
		\atkT, 0.01, \decT, 0.89, /*\subsT, 0.1,*/ \relT, 0.1,

			\vlDec,0.8,\relC, (-4),

			\atckC, Pseq([22,0,0,0],inf),
			 \vlSub,0.2,\bus1,~bus8,\in, ~gateBus2,\out,
			/*Prand([/*~micBus3,*/~micBus2/*,~reverbBus2*//*,~micBus3,*/],inf)*/
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf))
			//~reverbBus2)
			//Prand([~micBus3,~reverbBus2],1))
		/*Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],16),\impulse,Pseq([1/4],16)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],4),\impulse,Pseq([1/1],4)),
		*/
		/*Pbind(\instrument,\gran,\dur,Pseq([4/1],4),\amp, 1,\buf, e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([4/1],4),\impulse,Pseq([4/1],4)),*/



	],inf),


 //],inf),


	/*Pseq([~kick],inf),*/





Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~distoBus1, \group,~filterGrp ),

	/*Pbind(\instrument, \shift, \dur, inf , \in, ~shiftMelo,\out,~distoBus1, \group, ~shiftGrp),*/

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~gateBus ,\group, ~distoGrp),



	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Prand([Pseq([1/4],64)/*,Pseq([1/1 ],64  ) */],inf), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type,  Pseq([   Pseq([\note], 128) ,Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ],2), Pseq([\note], 64) ], inf),
		\atkT, Pseq([ 0,0.4,0,0 ,0,0,0,0 ],inf),
		\decT,Pseq([ 1,0.59,1,1,  1,1,1,1],inf),
		\atckC, Pseq([0,5,0,0 ,  0,0,0,0],inf),
		\out,~reverbBus),




	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus  , \out,~comFuzz ,\group,~revGrp),




	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\gain,15,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~stetoSnaCom1, \group, ~stereoGrp),


	Pbind(\instrument,\comp10, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom1 ,\ctrl, ~snBus, \group, ~compGrp2),

	~toUse,



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

