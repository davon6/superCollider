
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

s.plotTree
(

/*~dispatchGrp = Group.new;

~shiftGrp =  Group.after(~dispatchGrp);*/

~filterGrp =  Group.new;

~phaserGrp =  Group.after(~filterGrp);

~distoGrp =  Group.after(~phaserGrp);

~gateGrp =  Group.after(~distoGrp);

~ptrGrp = Group.after(~gateGrp);

~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~revGrp = Group.after(~granGrp);

~delayGrp = Group.after(~revGrp);
~eqGrp = Group.after(~delayGrp);
~compGrp = Group.after(~eqGrp);

~limitGrp = Group.after(~compGrp);

~compGrp2 = Group.after(~limitGrp);
~gateGrp2 =  Group.after( ~compGrp2);

~stereoGrp = Group.after(~gateGrp2);

o = {
	Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

	Out.kr(~bus2, SinOsc.kr(LFPulse.kr(Select.kr(0.321875,[1.2875, 0.321875,0.08046875 ])).range(0.321875,0.08046875) ).range(659.255, 2637.02));


	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	)    /* * SinOsc.kr(0.64375).range(
0.01005859375,1.2875)*/




	).range(10.3,2637.02),);

	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(5274.04,82.41),);*/



	Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,1).round(1),
		[    1.2875, 0.08046875/*,0.321875*/	]
	)    *  SinOsc.kr(0.1609375).range((-5.15),2.575)).range(5274.04,82.41),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(0.8,0.2));
	Out.kr(~bus7, SinOsc.ar(0.321875).range(1,0.4));

	Out.kr(~bus8,  Lag.kr(LFNoise0.kr(1.2875).range(0.10,0.0),0.05)
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.06,0.00));


	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));


	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));




}.play



)



(Ppar([Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1)),

/* Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,Pseq([2/1],inf),\crv,50)*/

	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, e,\out,~limitRkick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/2],inf),\crv,50),


	Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, d,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\ptr, \buf, f, \out, ~ptrBus3,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, f,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, d,\out,~comFuzz2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf)),


	Pbind(\instrument,\gran,\dur,Pseq([2/1],inf),\amp, 1,\buf, f,\out,~comFuzz2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf)),

],1).play(t, quant:t.beatDur))



(

Ppar([



	~bassShap,

	/*Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf), \vl,Pseq([0.0000000095262251,0.0000000095262251,0.0000000095262251, 0.01005859375],inf),
		\vl3, Pseq([0,0,0, (-10.4)],inf), \vl2, Pseq([0,0,0, 15],inf),
		\out, ~bus2,  \out2, ~bus11,  \out3, ~bus3),*/

	/*Pbind(\instrument, \lfo, \dur,Pseq([1/ Prand([4,16,1],inf) ], Prand([1,4,16,64],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) ,  \out, ~bus10),*/
	/*Pbind(\instrument, \lfo, \dur,Pseq([Prand([4,16,1,64],inf)/ 1 ], Prand([1,4],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) , \tim,  6.1952, \crv,(-3),  \out, ~bus11),*/

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),




	Pbind(\instrument,\comp, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~stereoHat,\group, ~compGrp),
	Pbind(\instrument,\comp,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~stereoCymb,\group, ~compGrp),

	Pbind(\instrument, \stereo , \in, ~stereoCymb, \dur, inf, \spread, 1 ,\center,(-0.1) , \group, ~stereoGrp),
	Pbind(\instrument, \stereo , \in, ~stereoHat, \spread, 1 ,\dur, inf,\center,(0.1), \group, ~stereoGrp),

	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick,  \out, ~stereoRkick, \gain , 40, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,inf , \in, ~stereoRkick,  \group, ~stereoGrp),



	/*Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \gra,~bus10 , \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,/*~dispatchBus*/~filterSquelch/*~filterBus2*/),

	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~phaseBus),*/

	Pbind(\instrument, \men, \dur, Pseq([16384/1],inf),\out, ~filterSquelch),
	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus2),

	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus),

	Pbind(\instrument,\multi,\dur,Pseq([16384/1],1), \out,~distoBg),

	Pbind(\instrument, \disto, \hpf, 325.64, \dur, inf, \in ,~distoBg, \out,~bgBus , \group, ~distoGrp),

	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\dur,inf, \in,~bgBus  , \out,~eqBg ,\group,~revGrp),

	Pbind(\instrument, \EQ, \dur, inf, \val, 2605.12,\quant,4, \gain,(-16) ,\in, ~eqBg, \out, ~bgCom, \group, ~eqGrp),

Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~bgCom ,\ctrl, ~kbus, \group, ~compGrp,\out,~bgLimit),
Pbind(\instrument, \limiter,\in, ~bgLimit, \dur, inf,\gain,42,\group,~limitGrp,\out,~bgStereo),
Pbind(\instrument,\stereo, \dur, inf, \in, ~bgStereo   ,\out,0, \spread, 1, \group, ~stereoGrp),

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

		\in,~shiftMelo, \out,Prand([~filterBus2, ~filterBus,~filterSquelch],1), \group, ~shiftGrp),


	/*Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterRnd,\which,Prand([0,2],inf),\busMod, ~bus2, \out, ~phaseBus, \group,~filterGrp),*/




Pbind(\instrument, \phaser, \dur,Pseq([4096/1],1),\maxDlT,0.0242, \rate, 0.00502929687 , \in,~phaseBus, \out, ~filterRnd, \group,~phaserGrp),


Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 0.2, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,80,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\in,~filterRnd , \out,~comRnd,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.02,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,20,\in, ~comRnd,\ctrl, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,60,\group,~limitGrp,\out,~comSnaGrpBus),
*/

	Pbind(\instrument, \filter, \dur,inf, \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~distoBus3, \group,~filterGrp),

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus3, \out, ~gateSquelch, \group,~distoGrp),


	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, ~delay, \dur, inf,\out,~revDelay,\group, ~revGrp),

Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,0 ,\group,~delayGrp),




Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~comFuzz  , \out,~limitReverbBus ,\group,~revGrp),

Pbind( \instrument, \limiter,\in,~limitReverbSquelch, \dur,inf, \gain,45,\group,~limitGrp,\out ,~stereoReverbSquelch),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbSquelch, \spread,0,\group, ~stereoGrp),


	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, inf,\gain,45,\group,~limitGrp,\out,~comSnaGrpBus),












	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out, ~gateBus2, \group,~filterGrp),

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~comFuzz2  , \out,~limitReverbBus2 ,\group,~revGrp),

	Pbind( \instrument, \limiter,\in,~limitReverbBus2, \dur,inf, \gain,42,\group,~limitGrp,\out ,~stereoReverbBus2),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbBus2, \spread,1,\group, ~stereoGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0121, \rel ,0.0484,\gain,/*(70.3)*/1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\gain,42,\group,~limitGrp,\out,~comSnaGrpBus),




Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out,~distoBus1, \group,~filterGrp ),

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus1 , \out,~gateBus ,\group, ~distoGrp),




	//GATES  Make good adsr %

	Prand([


		Pbind(\instrument, \gate, \dur, Prand([     Pseq([1/4],1)  ,Pseq([1/1],1)],1)  /* , \vlDec, 0.6,*/
		,\group, ~gateGrp,
			\subsT,inf , \in,~gateSquelch ,\out,Pwrand([~delayBus ,~comSquelch],[1,10],inf)),



Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus,\out, ~comFuzz),

			Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/ Prand([~short,~long],1) ,
		\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\note,\note,\rest,\rest,\note,\rest,\note],64)],[16,1],inf), \group, ~gateGrp, \atkT, 0.02, \decT, 0.55, \subsT, 0.1, \relT, 0.33,
		\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus2,\out,Prand([~micBus2,~micBus3,~comFuzz2],inf) )





		],inf),













	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~comFuzz  , \out,~limitReverbBus ,\group,~revGrp),

	Pbind( \instrument, \limiter,\in,~limitReverbBus, \dur,inf, \gain,48,\group,~limitGrp,\out ,~stereoReverbBus),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbBus, \spread,1,\group, ~stereoGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\gain,48,\group,~limitGrp,\out,~comSnaGrpBus),



	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus ,\ctrl, ~snBus, \group, ~compGrp2,\out,~stereoBus1),

	~toUse,

	/*Ppar([Pseq([~kick],16),~hat, ~snare,~cymbal],inf),*/

	/*Pseq([   Pbindf(~bass, \amp,(-6))],inf),*/
	/*Pseq([  ~bass],inf),*/

	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Pseq([1/1],inf), \in, ~gateShap , \group, ~gateGrp2,
		\type,  Pseq([
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \rest, \rest   ],inf),
		\out,0),

	Pbind(\instrument,\stereo, \dur, inf, \in, ~stereoBus1   ,\out,0/*~comSnaGrpBus*/, \group, ~stereoGrp),


/*	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Pseq([1/16],inf), \in, ~gateShap , \group, ~gateGrp2,


\type,  Pseq([



			\rest,\rest,\rest,\rest,   \note,\note,\note,\note,  \note,\note,\note,\note,   \rest,\rest, \rest,\rest,
			   \note,\note,\note,\note,\rest,\rest, \rest,\rest, \rest,\rest,\rest,\rest,   \rest,\rest, \rest,\rest,


			\rest,\rest,\rest,\rest,   \note,\note,\note,\note,  \note,\note,\note,\note,   \rest,\rest, \rest,\rest,
			 \note,\note,\note,\note, \rest,\rest, \rest,\rest, \rest,\rest,\rest,\rest,   \rest,\rest, \rest,\rest,


			\rest,\rest,\rest,\rest,   \note,\note,\note,\note,  \rest,\rest, \rest,\rest,   \rest,\rest, \rest,\rest,
			\rest,\rest, \rest,\rest, \rest,\rest, \rest,\rest, \rest,\rest,\rest,\rest,   \rest,\rest, \rest,\rest,


			\rest,\rest,\rest,\rest,   \note,\note,\note,\note,  \note,\note,\note,\note,   \rest,\rest, \rest,\rest,
			  \note,\note,\note,\note,  \rest,\rest, \rest,\rest, \rest,\rest,\rest,\rest,   \rest,\rest, \rest,\rest


			],inf),
		\out,0)*/


// vlAtk=0, vlDec=1,vlSub=1, vlRel=0, atkT=0, decT=0, subsT=0, relT=0, atckC=0, decC=0, relC=0,





],1).play(t, quant:t.beatDur)


// Pseq([~bass],inf).play(t,quant:1)
// Ppar([~kick,~bass],inf).play(t)

)
~kick.play|
Ppar([~hat,/* ~snare,*/~cymbal,/*Ppar([~kick,~bass],1)*/],1).play(t)
{SinOsc.ar(432)}.play
s.plotTree

FreqScope.new

// Pseq([~toUse],inf.play(t,quant:1)