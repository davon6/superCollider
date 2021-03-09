
//percu cutting the 1/2 for progression
//new env shape for percu in env file

// multi valu  freq shifter or single pxrand
//bass eq big mess
//warning delay is now mono
/*Buffer.freeAll*/
//work out \\type
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
~eqGrp2 = Group.after(~compGrp2);


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
,\gain,1,\in, ~comBusHat2 ,\ctrl, ~kbus, \out,0/*~stereoHat*/,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb2 ,\ctrl, ~kbus, \out,0/*~stereoCymb*/,\group, ~compGrp),


	/*Pbind(\instrument, \stereo , \in, ~stereoCymb, \dur, 9999, \spread, 1 ,\center,(-0.1) , \group, ~stereoGrp),
	Pbind(\instrument, \stereo , \in, ~stereoHat, \spread, 1 ,\dur, 9999,\center,(0.1), \group, ~stereoGrp),*/





	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick2,  \out, ~stereoRkick2, \gain , 20, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,9999, \in, ~stereoRkick2,  \group, ~stereoGrp),



	Ppar([

		Prand([

			Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,~revSide2,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-22),\out,~eqNoise2),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~buf,\out,~eqDs2,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand}))],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([32/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],inf),




Pbindf(~rLong,\dur,inf, \in,~revSide2 , \revtime, 15,\out,~comSide2,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide2 ,\ctrl, ~kbus, \out,~limitSide2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitSide2, \dur, Pseq([1024/1],1),\gain,1,\group,~limitGrp,\out,~stereoSide2),

	Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~stereoSide2  ,\spread,1,	\atkT,0.08,\crvA,6,\out,0, \group, ~stereoGrp),





	Pbind(\instrument,\EQHP, \in, ~eqNoise2 , \out, ~noiseRev2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev2  , \out,0 ,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs2 , \out, ~reverbBus32 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus32  , \out,~comFuzz32,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz32 ,\ctrl, ~kbus, \out,~limitFuzz32, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz32, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoBus42),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus42   ,\out,~stetoSnaCom12, \group, ~stereoGrp),




	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],32)  ,   Pseq([1/1],16) , Pseq([4/1],4)  ],inf)  ,//was 4
\type, Pseq([\rest, \note,\rest,\note, \note,\note,\rest,\rest].scramble,inf),
		\amp, 1,\buf, ~buf,\out,Prand([~distoBus12,~distoBus42],inf),\gate, 1,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),

		\pos,Pseq([ Pseq([0.99999.rand],24),  Pseq([0.99999.rand],24) , Pseq([0.99999.rand],24), Pseq([0.99999.rand],24) ,
			Pseq([0.99999.rand],24),  Pseq([0.99999.rand],24) , Pseq([0.99999.rand],24), Pseq([0.99999.rand],24)],inf),




\vlSub, Pseq([ Pseq([1.00.rrand(0.2,1)],24) , Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1) ],24) ,
		Pseq([  1.00.rrand(0.2,1)   ],24) , Pseq([  1.00.rrand(0.2,1) ],34), Pseq([  1.00.rrand(0.2,1) ],24) , Pseq([  1.00.rrand(0.2,1)   ],24)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Pseq([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24)],inf),
	\decT, Pseq([Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24)],inf),
	\subsT, Pseq([Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24)],inf),
	\relT,Pseq([ Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],24)},inf),
	\decC,Pseq([Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24)],inf),
	\relC,Pseq([ Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24)],inf),
	),



	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus12 , \out,~filterBus12 ,\group, ~distoGrp),


Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~filterBus12,\busMod, ~bus4,\rqLPF,~bus6, \out,~eqBus12, \group,~filterGrp ),


	Pbind(\instrument,\EQHP, \in, ~eqBus12 , \out, ~reverbBus12/*~gateBus*/,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\gateS, \vlDec, 1,\vlSub, 1,/* \decC,50,*/\dur,Prand([Pseq([1/4],64)/*,Pseq([1/1 ],64  ) */],inf), \in, ~gateSeqBus , \group, ~gateGrp2,
		\type,  Pseq([   Pseq([\note], 128) ,Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scrambleß,2), Pseq([\note], 64) ], inf),
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




	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus12  , \out,~comFuzz12 ,\group,~revGrp),




	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz12 ,\ctrl, ~kbus, \out,~limitFuzz12, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz12, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoBus12),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus12   ,\out,~stetoSnaCom12, \group, ~stereoGrp),







		Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus42 , \out,~filterBus22 ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2, \group,~filterGrp),

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~reverbBus2/*~gateBus2*/,
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),



	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus22  , \out,~comFuzz22,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz22, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz22, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoBus22),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus22   ,\out,~stetoSnaCom12, \group, ~stereoGrp),


/*		Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),




	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitPerch, \dur, Pseq([1024/1],1),\gain,6,\group,~limitGrp,\out,~stereoPerch),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoPerch ,\spread,1  ,\center,Pxrand([ Pfunc({1.00.rand}),Pfunc({-1.00.rand})],inf), \out,~stetoSnaCom1, \group, ~stereoGrp),*/


~toUse2,



		/*Pbind(\instrument,\gran,\dur,20,
	/*	\group,~granuGrp,*/
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,20,\impulse,0.000000001,\pos,0),*/


	Pbind(\instrument,\comp10, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~stetoSnaCom12 ,\ctrl, ~snBus, \out, ~eqBus102,\group, ~compGrp2),

Pbind(\instrument,\EQHP10, \in, ~eqBus102 ,\frq, 100, \dur,inf, \group, ~eqGrp2),






],1).play(t, quant:1)



)

s.plotTree
s.meter
FreqScope.new

