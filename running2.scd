~eqGrp=Group.new;
~recGrp2=Group.after(~eqGrp);

Ppar([~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),
	// Pbind(\instrument,\recLoop,\buf,~k2,\recording,1, \in,0,\group,~recGrp2,\dur,inf)
],1).play(t) ;


/*Pbindf(~kick,\out,~toRecord).play(t);*/
// x = Synth(\recLoop,[buf:~k2,\recording,1, \in,0/*~toRecord*/],~recGrp2);

~k2.play
Ppar([Pbindef(\bass, \out,700),Pbindef(\ki, \out,700)],1).play(t)
Ppar([Pbindef(\bass, \out,0),Pbindef(\ki, \out,0)],1).play(t)
//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd
//free delay (too choped/gated)
//share variable in between mainlead and seque (same sound)
//panning big debate , is there any ?
//PANNING Not working on
//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!
// Percu Dynamic EQ not quiet right
//RISE add more filtering
//comp10 might be overlapping
//set no4 src in base for untight fx
//1/2 hit  hits too much//too stabby
//plop noise in bass
//BG SLIDE NOT CHECKED FOR VOLUME YET
//COMB MODU MUST GO THROUGH BUSSES OR DRIFTING INEVITABLE
//~NO2 gating not really working
//bass has too much high, blocks leads

s.plotTree
/* KB AND BASE have unrecordeds    ~bufSnoopy       and     ~bufBg{!=~no4, ~kb, ~rises}   */

Synth(\playBuf2,  [  \buf,/*~bufBg*/ , \out, ~bgFil22    ]);
~hat2.play
~buf.play
~bufSnoopy.play
(Ppar([
	Pbind( \instrument, \playBufX, \impulse,0.075 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,0,\buf,~bufSnoopy,\out, 0,\loo,1),

	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1.7, \gain ,(-20)),

	~bassShap, Ppar([~hat2,~kick, ~bass],inf),
	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1/*\val, 659.255, \quant,1, \gain ,(-20)*/),

],1).play(t))

//2292109.7011254

(//MUST RUN  ( ~buf.numFrames.rrand(320000)- 320000)
~rythm=( ~leTout.numFrames.rrand(320000)- 320000);
~main1= (~bufSnoopy.numFrames.rrand(1400000)- 1400000)   /*1200000*/;
~main2 =   ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)   /*0*/;
~main3= (~bufSnoopy.numFrames.rrand(1400000)- 1400000) /*3500000*/;
~s1=3400.00.rrand(1300,0.001);~q1=16.rrand(5,1);~g1=(-8).rrand((-2),1);~s1x =  3400.00.rrand(1300,0.001);~q1x= 16.rrand(5,1);~g1x=(-8).rrand((-2),1);
	~s2= 3400.00.rrand(1300,0.001);	~q2= 16.rrand(5,1);~g2=(-8).rrand((-2),1);~s2x= 3400.00.rrand(1300,0.001);~q2x=16.rrand(5,1);~g2x=(-8).rrand((-2),1);
	~s3=3400.00.rrand(1300,0.001);~q3=16.rrand(5,1);~g3=(-8).rrand((-2),1);~s3x= 3400.00.rrand(1300,0.001);~q3x= 16.rrand(5,1);~g3x=(-8).rrand((-2),1);
	~pass1 =(~audio2.numFrames.rrand(400000)- 400000);~pass2=(~audio2.numFrames.rrand(400000)- 400000);~pass3=(~audio2.numFrames.rrand(400000)- 400000);~pass4=(~audio2.numFrames.rrand(400000)- 400000);
~mster=(~leTout.numFrames/ 256 * 226.rand);
~bssFreq1= 120.rand;~bssFreq2= 120.rand;~bssFreq3= 120.rand;
)

(

~lfoGrp  = Group.new;

~ptrGrp0 = Group.after(~lfoGrp);
~recGrp0 = Group.after(~ptrGrp0);


~granuGrp= Group.after(~recGrp0);
~phaserGrp =  Group.after(~granuGrp);
~distoGrp =  Group.after(~phaserGrp);
~dispatchGrp = Group.after(~distoGrp);
~filterGrp  = Group.after(~dispatchGrp);
~distoGrp0 =  Group.after(~filterGrp);

~eqGrp0 = Group.after(~distoGrp0);
~distoGrp2 =  Group.after(~eqGrp0);

~gateGrp =  Group.after(~distoGrp2);
~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~gateGrp2 =  Group.after( ~granGrp);




~revGrp = Group.after(~gateGrp2);
~eqGrpplus = Group.after(~revGrp);
~delayGrp = Group.after(~eqGrpplus);
~eqGrp = Group.after(~delayGrp);
~dispatchGrp1 = Group.after(~eqGrp);
~filterGrp2  = Group.after(~dispatchGrp1);


~compGrp = Group.after(~filterGrp2);
~delayGrp2 = Group.after(~compGrp);
~combGrp = Group.after(~delayGrp2);
~limitGrp = Group.after(~combGrp);
~stereoGrp = Group.after(~limitGrp);
~dispatchGrp2 = Group.after(~stereoGrp);

~gateGrp3 = Group.after(~dispatchGrp2);

~finalDispatchGrp= Group.after(~gateGrp3);

~shifGrp= Group.after(~finalDispatchGrp);
~limitGrp2 = Group.after(~shifGrp);
~gateGrp4 = Group.after(~limitGrp2);
~gateGrp5 = Group.after(~gateGrp4);
~compGrp2 = Group.after(~gateGrp5);
~gateGrp6 = Group.after(~compGrp2);
~eqGrp2 = Group.after(~gateGrp6);
~recGrp2= Group.after(~eqGrp2);

~extraDelay= Group.after(~recGrp2);
~extraRev= Group.after(~extraDelay);
~compGrp4 = Group.after(~extraRev);
~limitGrp4 = Group.after(~compGrp4);
~stereoGrp4 = Group.after(~limitGrp4);
~compGrp5 = Group.after(~stereoGrp4);
~eqGrp3=Group.after(~compGrp5);



o = {
	/*Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

*/
	/*Out.kr(~bus17, Osc.kr(~bc.bufnum,0.3 ).range(-900,900));*/


	Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));
	/*Out.kr(~bus3, Line.kr(0.2,0.2,9999));*/

	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));//DONT DELETE

	/*Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));*/

	/*Out.kr(~bus14, SinOsc.kr(0.321875).range(-1,1));//NOT USED*/


	Out.kr(~bus14, SinOsc.kr( LFTri.kr( 0.08046875).range(0.321875,1.2875)).range(1,0.25));//changed from 0.45

	/*Out.kr(~bus3, SinOsc.kr(0.3 ).range((-140),1500));*/


	Out.kr(~bus18,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(-0.2,4))

}.play;

)



~bufSnoopy.play
~eqGrp = Group.new;
(Ppar([
	Pbind( \instrument, \playBufX, \amp,0.03,\impulse,0.075 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,0,\buf,~bufSnoopy,\out, 0,\loo,1,\amp,0.1),



	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	~bassShap, Ppar([~hat2,~kick, ~bass],inf)],1).play(t))




~base.play(t,quant:1)
(

~base = Ppar([

	/*Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn,~filterBou /*~micBus*/, \buf, ~k,\group,~recGrp0,\dur,inf),


Pxrand([

		Pbind(\instrument,\gran,\dur,Pseq([1/1],64),\amp, 1,\buf, ~k,\out,~filterBus2/*~limitRkick*/,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),

		Pbind(\instrument,\gran,\dur,Pseq([4/1],16),\amp, 1,\buf, ~k,\out,~filterBus2/*~limitRkick*/,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([4/1],16),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),],inf),*/


	/*Pbind(\instrument,\ptr, \buf, ~f, \out, ~ptrBus2,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, ~f,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e, \out, ~ptrBus3,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, ~e,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,0.003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,0.003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),*/

	Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp0,\dur,inf),


	Pxrand([

		Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k,\out,~percuFil,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/4],16),\pitchRte,Pfunc({6.rrand(0.1)}),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \busMod,~bus18 ),

		Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, ~k,\out,~percuFil,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],4),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub),\pitchRte,Pfunc({8.rrand(0.1)}) ),],inf),

	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),*/

	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,3200,\rH,520, \out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

		Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],1),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*~bassShap,*/

//FOR BG
	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.45),\rH,0.45, \group, ~lfoGrp,\tS, 0.39550810372374),
	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([32/1],inf),\rL,40,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,40,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([8/1],inf),\rL,40,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),


	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,/* Prand([ */Pseq([4/1],inf)/* , Pseq([2/1],2)],inf)*/,\group,~lfoGrp ,\frq,Pfunc({20.6.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),

		Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 99999, \group, ~lfoGrp),


		Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),


	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\modu, 0.001875 ,\ph,1.4),

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

	/*Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~k2,\out, ~kbus,\loopy,0,\start,0,\tS, 0.39550810372374),*/

	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
	/*	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),*/

	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 1/4,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~hatEq,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.001, \rel ,0.04840,\gain,3.5,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~cymbalEq,\group, ~compGrp),


	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~compGrp2, \out , ~comFuzz22,\vol,4),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~compGrp2,\out , ~comFuzz22,\vol,4),


	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareLimit),

	Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\group, ~stereoGrp),


	/*Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1/*\val, 659.255, \quant,1, \gain ,(-20)*/),
*/

	//BG

	Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),

	//no2

	Pbind( \instrument, \playBuf, \impulse, 0.025,
		\dur,9999, \tS,  0.39550810372374,\start,Pfunc({( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toGateX2,\loopy,1),


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2ToRev,\group, ~gateGrp),


	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in, ~no2ToRev , \out, ~no2ToCom,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 1,\in,~no2ToCom  ,\ctrl, ~kbus, \out,~no2ToLimit, \group, ~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c10,1,\name,10,\in, ~no2ToLimit, \dur, inf,\gain,40,\group,~limitGrp,\out,~no2ToStereo),

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),/*.play(t, quant:1)*/



//main dispatch
	Pxrand([
	Pbind(\instrument,\gateS, \dur,Pseq([1/1],64),\in,Pxrand([
			/*Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,64 )   ,
Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,64 ),*/

			Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,64 )   ,
Pseq([ ~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,64 ),

//mybe caqn be redo using better concept than 1/1 x9


/*	Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ,
				~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1
		].scramble,32 )
,*/

//try no things
			/*Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ,
				~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1
		].scramble,32 ) */],inf),\out,~new10/*~eqBus102*/,\group, ~gateGrp3,\tS, 0.39550810372374,),


		/*tight to try again

		Pbind(\instrument,\gateS, \dur,Pseq([1/4],256),\in,Pxrand([

			Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,256 )   ,
Pseq([ ~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,256 ),

],inf),\out,~new10/*~eqBus102*/,\group, ~gateGrp3,\tS, 0.39550810372374,),*/

/*Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in, ~no1  , \out, ~new10 /*~eqBus102*/,\group, ~gateGrp3,\tS, 0.39550810372374,)*/

	],inf),




/*	NOT SURE YET

	Pxrand([
		Pbind(\instrument, \gateS, \dur,Pseq([1/4],64) , \type,/*Pseq([*/
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,/*\note,\rest,\rest,\note,\rest,\rest,\rest,\rest*/].scramble,inf)

		/*Pseq([\rest,\rest, \rest,\rest,\rest,\rest,\rest, \rest,\note,\rest,\rest,\note,\rest,\note,\note,\rest].scramble,1) ],inf)        */,
	\atkT,0.1, \decT, 0.8.rrand(0.6),\subsT, 0.2,\relT, 0.2.rrand(0),\atkT, 4.rrand(1), \vlSub , 1, \vlSub2, Pkey(\vlSub),\relC, (-5).rrand(-1),\tS, 0.39550810372374,
	\in, ~eqBus102,\group, ~finalDispatchGrp, \out, ~toLimitlast),



	Pbind(\instrument, \gateS, \dur,   Pseq([192/4],1) , \tS, 0.39550810372374,
	\in, ~eqBus102,\group, ~finalDispatchGrp, \out, ~toLimitlast),
	],inf),

	Pbind(\instrument, \limiter10,\in, ~toLimitlast, \out,~new10,\dur,inf,\gain,220,\group,~limitGrp2),*/


//HERE

	Pseq([


	Pbind(\instrument,\gateS, \dur, Pxrand([ /*Pseq([4/1],16), Pseq([8/1],8) */ Pseq([4/1],3)  ],1)
		,\in,Pseq([ /*~newCOn,*/~new10 ],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

Pxrand([

	Pbind(\instrument,\gateS, \dur,Pseq([64/1],1)
				,\in, ~no3,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([56/1],1)
			,\in, ~no3 ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),


				Pbind(\instrument,\gateS, \dur,Pseq([4/1],1),\in, ~no3  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in, ~new10/*~newCOn*/  ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in,~new10 /*~newCOn*/  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374),].scramble,1)
		],1),

		//to chnage for final
		Pbind(\instrument,\gateS, \dur,Pseq([4/1],16)
			,\in,Pseq([~percuCom2 ,~vocToDispatch,~percuCom2,~comSnaGrpBus2,~rndBus,~rndBus, ~no2,~no2/*,~no2,~no2*/
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)





	].scramble,inf),


	//for record
	/*Pbind(\instrument, \gateS, \dur,   Pseq([262/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/

/*
//FOR SELECT LOOP
		Pbind(\instrument, \playBuf10N,  \out, 0,\dur,Pseq([ 16/1],1),\in,~fusible
		,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand).postln).play(t)*/


	Pseq([

		Pseq([
				Pbind(\instrument, \gateS, \dur,   Pseq([32/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),
		Pseq([
Pbind(\instrument, \playBuf10NToMixer,  \c8,1,\name,8,\out, ~toCom,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~gateGrp5)
		],2),

				/*Pbind(\instrument, \gateS, \dur,   Pseq([64/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/
			].scramble,1),


		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,~toCom,\group,~gateGrp5),


//PASSANT DisAABLE FOR RISE INIT
		Pseq([

		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start,~pass1 ,\buf,/*Prand([*/~audio2/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([2/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass2,\buf,/*Prand([*/~audio2/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start,~pass3,\buf,/*Prand([*/~audio2/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\start,~pass4,\buf,/*Prand([*/~audio2/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1),



			//for sample select

	/*		Pseq([

		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,/*Prand([*/~buf/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([2/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
				].scramble,2).play(t)

				,Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,/*Prand([*/~buf/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2).play(t)

				, Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,/*Prand([*/~buf/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2).play(t)

				, Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\start,(~buf.numFrames.rrand(400000)- 400000).postln,\buf,/*Prand([*/~buf/*,~buf2],inf)*/,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2).play(t)

				,].scramble,1),

*/




			/*Pseq([
				Pbind(\instrument, \gateS, \dur,   Pseq([32/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),
		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],2),

				Pbind(\instrument, \gateS, \dur,   Pseq([64/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),

				].scramble,1),


		Pbind(\instrument, \gateS, \dur,   Pseq([256/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom)*/

].scramble,inf),





	Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~toCom  ,\ctrl, ~snBus, \out,/*~eqBus10*/~toGate10 ,\group, ~compGrp2,\tS, 0.39550810372374),

	Prand([

	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],1),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,Pwrand([~eqBus10,

		~delayBus2,~reverbSquelch],[16,1,1].normalizeSum,inf)

	,  \group, ~gateGrp6,\tS, 0.39550810372374),


		Pbind(\instrument,\gateS, \dur,Pseq([1/8],8),\type,Pseq([\note, \rest],inf),
		\in,  Pxrand([~toGate10,~toGate102], inf)  ,\out ,Pwrand([~eqBus10,

		~delayBus2],[4,1].normalizeSum,inf),  \group, ~gateGrp6,\tS, 0.39550810372374),
	],inf),



Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,1, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-16),\vol, 1.16),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.0968,\ctrl,~eqBus10 ,   \in, ~comFuzz22 ,\group,~eqGrp2),







 //for BG
	Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp),

	Pbind(\instrument,  \limiter10toMixer, \c13,1,\name,13,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 27,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.024, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 )


],1)/*.play(t, quant:1)*/)
s.scope
Ppar([~base, ~kb],1).play(t,quant:1)
~kb.stop;
(~kb =
Ppar([




Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),

	Pbind(\instrument,\gran,\dur,Prand([/*Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4), */ Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), /*Pseq([1/64],64),Pseq([1/64],256) */  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,0.003,\pos,0.03),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,0.003,\pos,0.03),


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,0.003,\pos,0.03)

	],inf),

	Pbind(\instrument, \gate ,\vlSub,1,\vlSub2, Pkey(\vlSub),\dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out, Prand([~lpK,~bpK,~hpK],inf),\tS,  0.39550810372374),


Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 20, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),

Pxrand([
	Pseq([

	Pseq([

			/*	Pseq([~kick],4),*/

Prand([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),
Pseq([
				Ppar([ ~perc[6]   ,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
						\dur,Pseq([1/4],16), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest],inf))],1),Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374)],1),
				],1),


				Ppar([ ~perc[0]   ,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/4],16), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest],inf))],1),


				Prand([

				Ppar([


					Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],4), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,~bssFreq1, \group,~shifGrp,\tS, 0.39550810372374,)],1)


	],1),	],1),


	Pseq([/*Ppar([ */~perc[3] ,/* Pwrand([ ~perc[3]   ,~bar[4] ],[4,1],1),*/ /*Pbind( \instrument, \playBufS, \impulse,0.6 ,
	\dur,Pseq([1/2],28), \tS,  0.39550810372374,\start,~rythm,\buf,~bufBg,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
			],1),*/



				/*Pbindef( \kiki,\dur, Pseq([2/1],1)),*/
				/*Pbindf(~kick, \dur, Pseq([2/1],1)),*/
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([2/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),

	/*Ppar([
				  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/4],8), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest],inf))

],1)*/
	],1),


/*		Ppar([	*/Pseq([

				Prand([

					Ppar([~perc[4],


				Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/4],60), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,/*\type, Pseq([\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest],inf)*/
						\type,Prand([Pseq([\rest],4), Pseq([\rest,\rest,\note,\rest],1)],inf))],1),

			   Ppar([ ~bar[5],Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7),\da1,0)  ],1)],1),

	Prand([
	Pbind(\instrument, \dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2),
					Pseq([Pbind(\instrument,\gran,\dur,Pseq([1/2],2),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.0003,/*\pos,0.17,*/\type, Pseq([\rest,\note],inf), \tS,  0.39550810372374,)

		],1),

	],1),
		/*,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
				\dur,Pseq([1/4],64), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest],inf))*/ /*],1),*/


		   Prand([
					Pseq([~perc[6] ,Pbind(\instrument,\gran,\dur,Pseq([1/1],1),\amp, 1,\buf, ~k2,\out,~toPan3,\duration,Pkey(\dur),\impulse,0.0003,/*\pos,0.17,*/ \tS,  0.39550810372374),~perc[2]],1),

					Ppar([ ~perc[5]
					,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
				\dur,Pseq([1/4],64), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest/*\rest,\rest,\rest,\rest*/],inf)) ],1) ,/* ~bar[6]*/




			Pseq([	/*Ppar([*/~perc[3]/*, Pbind( \instrument, \playBufS, \impulse,0.6 ,
	\dur,Pseq([1/2],24), \tS,  0.39550810372374,\start,~rythm,\buf,~bufBg,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
		*/
				,
				Pxrand([
					Ppar([

						Pbind( \instrument, \playBuf10, \impulse,0.6 ,
							\dur,Pseq([1/4],8), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\rest,\note,\rest],inf)),
						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],4), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,~bssFreq2, \group,~shifGrp,\tS, 0.39550810372374,)
					],1),

					Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],4), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
				],1),

],1)

			],1) ],1)


		].scramble,4),




	Pseq([
			Pseq([ Pseq([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374), Pseq([ ~bassRest], 3)],1)  ,~perc[1] ,

Prand([
			Pbind(\instrument, \dispatchS10, \dur, Pseq([8/1],1),\in,~rollingK,\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
						,Pseq([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374), Pseq([~bassRest],5),Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),~bassRest],1),
					~perc[1]
	],1)


	],1),


	Pseq([ ~perc[0]      ,


	Pbind(\instrument,\dispatchS10, \dur, Pseq([12/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


/*	Prand([*/	Pseq([   Prand([ ~perc[4]   /*, ~bar[5] */ ],1),


	Pbind(\instrument,\dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


			Pxrand([ ~perc[5], Pseq([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374), Pseq([ ~bassRest], 7) ,   Ppar([
				/*	Ppar([Pbindf(~kick, \out,~eqBass),	Pbindf(~bass,\out,~eqBass),
Pbindf(~hat2, \out,~eqBass)],4),*/

						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],4), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,~bssFreq3, \group,~shifGrp,\tS, 0.39550810372374,)],1), Pseq([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374), Pseq([ ~bassRest], 3)   ],1)],1)

		],1)
		,

			//GROS BUG HERE

			Pseq([ ~perc[4],Ppar([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374), Pxrand([Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),	~bassMel[~scale]],1)],1)


			],1)


				].scramble,4),

],inf),

Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),


	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\group, ~limitGrp,\group, ~stereoGrp),


	//INCORPORAE SLIGHT MOVEMENT

	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/4],inf),\tS, 0.39550810372374,\val1,(-540),\val2,800,\crv,3.2),






	Pbind(\instrument, \filter10,\freqFil,600 ,\busMod,~bus21 ,\in,~rythmFil,\which,0,\qf,0.85, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),

	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~rythmLimit, \group,~eqGrp,\vol,10,\val,120,\quant,4, \gain,(-12)),

	Pbind(\instrument, \limiter10toMixer,\c20,1,\name,20, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,35, \group, ~limitGrp),

	Pbind(\instrument,\comp10, \dur,inf,\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.001, \rel ,0.3872,\dur,99999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, 0,\group, ~compGrp2 ,\tS, 0.39550810372374),


],1))

Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([


	Pbind( \instrument, \playBuf, \impulse, 20.6,
	\dur,9999, \tS,  0.39550810372374,\start,Pfunc({( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)}),\buf,~bufSnoopy,\out, ~delayBus,\loopy,1),



	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum,~delay, \feedback,0.38 ,\dur, inf,\out,~delayToEq,\group,~revGrp),

	Pbind(\instrument,\EQHP2, \in, ~delayToEq , \out, ~revDelay ,\frq, 100, \dur,inf, \group, ~eqGrpplus, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c18,1,\name, 18,\in,~limitDelay, \dur,inf, \gain,43,\group,~limitGrp,\out ,~stereoBus3),


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374),



	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({(~leTout.numFrames/ 256 * 222.rand)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),

	Prand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
\vl,0.2
	),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.2),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.2)
],inf),



	Pbind(\instrument,\disto,\in,~vocalBus,\out,~vocToEq,\group,~phaserGrp,\dur,inf),
	Pbind(\instrument,\EQHP96,\in,~vocToEq,\out,~vocToRev,\group,~distoGrp,\dur,inf),

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~vocToRev , \out, ~vocToFil ,\group,~dispatchGrp),


	Pbind(\instrument, \filterS, \dur, inf,\in,~vocToFil, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~vocToComp ,\group,~filterGrp,\freqFil,1620 ),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~vocToComp ,\ctrl, ~kbus, \out, ~vocToLimit, \group,~compGrp ),
	Pbind(\instrument,\limiterS,\in,~vocToLimit,\out, ~vocToStereo,\group,~limitGrp,\dur,inf,\gain, 34),

	Pbind(\instrument,  \stereoS, \in,~vocToStereo,  \out,~vocToDispatch , \dur,9999, \spread, 0.8.rrand(0.1),\tS,  0.39550810372374,\group,~stereoGrp),







Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
/*	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),*/
],inf),
	\modHz,240.00.rand , \carHz,140.00.rrand(10.00), \noiLv,1.00.rrand(0.3),

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\rel,0.0968.rrand(0.05),\rel2, 0.0968.rrand(0.05),\dur, Pseq([1/4], inf),\amp,(-16.5), \crv1,(-12.00).rrand(-4.00),\crv2,(-12.00).rrand(-4.00)   ,\out, Prand([Pseq([~micBus],16), Pseq([ ~distoPercu],16)],inf)/*~percuEq*/, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk)/*,\tS, 0.39550810372374*/,\modAmp,5000.00.rrand(1.00),\modAmp2,5000.00.rrand(1.00)),


	Pbind(\instrument, \disto, \dur, inf, \in, ~distoPercu , \out,~percuFil ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,inf,\which,2, \in,~percuFil,\busMod, ~bus4,\rqLPF,~bus7, \out,~percuEq/*~revSide2*/, \group,~filterGrp ,\freqFil, 30.rrand(-30)),


	Pbind(\instrument , \EQHP96, \frq, 100 ,\dur, inf,\in, ~percuEq, \group, ~eqGrp0,\val, 22000, \quant, 4, \gain, (-20),\val2,12000,\quant2,4, \gain2,(-12),\out , ~percuRev, \val3,3000,\shelf,1, \gain3,(-15)),


	 Pbindf( ~quickFix, \instrument, \reverb, \dur,inf, \in,~percuRev  , \out,~percuCom,\group,~revGrp),


	Pbind(\instrument,\compSX, \dur,Pseq([4/1],inf),\thr,0.7 ,\sB, 1.2,\sA, 1/2,\atk ,0.0001, \rel ,0.04840
		,\gain,1,\in, ~percuCom ,\ctrl, ~kbus, \out, Pwrand([~percuDelay,~percuLimit],[1,4].normalizeSum,inf),\group, ~compGrp ,\tS, 0.39550810372374),

	Pbind(\instrument, \pingDSX, \in, ~percuDelay ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,~percuComb,\group, ~delayGrp2,\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1)),

	///*MouseX.kr(0.01,2)*/maxDel, delayT /*MouseY.kr(0.01,2)*/,decT/*3*/)
	Pbind(\instrument, \combS,\in, ~percuComb,\out,~percuLimit,\dur, Pseq([4/1],inf),\group,~combGrp,
		\maxDel,2, \delayT,Pfunc({1.rrand(-1.00)}),\decT,1.00.rrand(0.1),\tS, 0.39550810372374, \amp,0.4
	),

Pbind(\instrument, \limiterStoMixer,\c9,1,\name, 9,\dur, inf, \in,~percuLimit, \gain,32,\group, ~limitGrp,\out,~percuStereo),

	Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Prand([0,1],inf),\out,~percuCom2/*~toCom*/,\tS, 0.39550810372374,\group, ~stereoGrp, \center,Pfunc({0.1.rrand(-0.1)}),\modPan, ~bus10),


	/*~percuCom2*/

		/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~percuCom2  ,\ctrl, ~snBus, \out, ~toGate10   ,\group, ~compGrp2,\tS, 0.39550810372374),*/


Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),


],1))

(~track = Ppar([ ~base, /*~kb ,*/ ~hitX, ],1).play(t,quant:1))


~hitX.stop;
(~hitX=

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


					Ppar([

				Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([8/1],1)),
				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur, Pseq([8/1],1),\tS, 0.39550810372374)],1),




			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~again,\dur,Pseq([56/1],1),\tS, 0.39550810372374 )


		],1),









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




Ppar([

			/*Pseq([
			Pxrand([Pbindf(~bang ,\dur, Pseq([8/1],1)) ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([8/1],1))],1),

		/*	NEVER

			Pbind(\instrument, \trippyRise, \dur,  Pseq([56/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),*/



			],1),

			Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(80)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([8/1],1),\tS, 0.39550810372374),*/





			Pseq([


			Ppar([Pxrand([Pbindf( ~bang ,\dur, Pseq([1/1],1))  ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([1/1],1))],1),
				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([1/1],1),\tS, 0.39550810372374)],1),

/*	Pbind(\instrument, \wNoise,\dur,Pseq([15/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),


		Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/
			Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),










			Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({5.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~bellFlang,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\atk,1, \fS,Pfunc({1.00.rand})),/*, \moduS

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })*/




Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374),
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,350,\crv,3.2),


		],1),

		],inf),


		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


// BG
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




	Pbind(\instrument,\EQHP2, \in, ~riToEq , \out, ~riToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev  , \out,~riToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp ,\ctrl, ~kbus, \out,~riToLimit, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c11,1,\name, 11,\in, ~riToLimit, \dur, inf,\gain,43,\group,~limitGrp,\out,~riToStereo),
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~risesGate,\tS, 0.39550810372374,\group, ~stereoGrp),


		Pbind(\instrument,\EQHP, \in, ~eqNoise , \out, ~noiseRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~again,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0,\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix/*~rLong*/,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c15,1,\name, 15,\in, ~limitFuzz3, \dur, inf,\gain,60,\group,~limitGrp,\out,~stereoBus4),
Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out, ~again, \group, ~stereoGrp),



	Pbind(\instrument,\flanger,\dur,Pseq([64/1],inf ), \in,~bellFlang, \out,~flanToDisto, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374),
	Pbind(\instrument, \distoS, \dur, inf, \in, ~flanToDisto , \out,~flanToEq ,\group, ~distoGrp),
	Pbind(\instrument,\EQHP2, \in, ~flanToEq , \out, ~flanToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-18).rrand(-4)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~flanToRev  , \out,~flanToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,2,\in, ~flanToComp ,\ctrl, ~kbus, \out,~flanToLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c16,1,\name, 16,\in, ~flanToLimit, \dur, inf,\gain,50,\group,~limitGrp,\out,~flanToStereo),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument, \distoS, \dur, inf, \in, ~bigRiToDisto , \out,~bigRiToEnv ,\group, ~distoGrp),
	Pbind(\instrument,\filterS, \in,~bigRiToEnv ,\out,~bigRiToEq, \group,~filterGrp ,\which, 0, \busMod, ~bus17,\qf,0.67,\dur, inf),

	Pbind(\instrument,\EQHP2, \in, ~bigRiToEq , \out, ~bigRiToRev ,\frq, 300, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~bigRiToRev  , \out,~bigRiToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~bigRiToComp ,\ctrl, ~kbus, \out,~bigRiToLimit, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c17,1,\name, 17,\in, ~bigRiToLimit, \dur, inf,\gain,55,\group,~limitGrp,\out,~bigRiToStereo),





/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~bigRiToStereo  ,\spread,1,\out,~again2,\tS, 0.39550810372374,\group, ~stereoGrp,\atkT,1,\decT,0),*/



	/*Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),*/


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872
			,\in,~again2   ,\ctrl, ~snBus, \out,~bigRiLastEq,\group, ~compGrp2,\tS, 0.39550810372374,\gain,10),



	Pbind(\instrument,\EQHP10, \in, ~bigRiLastEq ,\out, 0,\frq, 200, \dur,inf,\group, ~eqGrp2,\val,13800,\quant,1, \gain,(-18),\val2,2600.rrand(1900),\quant2,8.rrand(1), \gain2,(-16).rrand(-4),\vol, 1),


Pbind(\instrument, \distoS, \dur, inf, \in, ~riTriptoDisto , \out,~riTriptoEq ,\group, ~distoGrp),
		Pbind(\instrument,\EQHP2, \in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
		Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riTriptoRev  , \out,~riTriptoComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~riTriptoComp ,\ctrl, ~kbus, \out,~riTriptoLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c12,1,\name, 12,\in, ~riTriptoLimit, \dur, inf,\gain,39,\group,~limitGrp,\out,~riTriptoStereo),
	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),











	Pbind(\instrument,\EQHP2, \in, ~slideBus , \out, ~slideEq ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8), \vol,1),

	Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,15,   \dur, inf, \in,~slideEq  , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c9,1,\name, 9, \dur, inf, \in, ~slideBusToLimit, \gain, 45, \group,~limitGrp),


		Pbind(\instrument,\EQHP96, \in, ~slideBus2 , \out, ~slideEq2 ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8), \vol,1),

	Pbind(\instrument, \comp, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,   \dur, inf, \in,~slideEq2  , \out,~slideBusToLimit2,\ctrl, ~kbus, \group, ~compGrp),


	//BG SLIDE NOT CHECKED FOR VOLUME YET
	Pbind( \instrument, \limiter, \dur, inf, \in, ~slideBusToLimit2, \gain, 45, \out,~again,\group,~limitGrp),


		Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872
			,\in,~again   ,\ctrl, ~snBus, \out,~toGate102,\group, ~compGrp2,\tS, 0.39550810372374),
],1);
)

~sequ.play(t)
~t = Ppar([~base, /*~kb,*/~sequ],1).play(t,quant:1)


.stop

(
~sequ =
Ppar([


//For init

/*Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+100000).exprand("1".postln;~main1.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+100000).exprand("2".postln;~main2.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+100000).exprand("3".postln;~main3.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),*/


	Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+300000).rrand(~main1)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+300000).rrand(~main2)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus2x,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+300000).rrand(~main3)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toEq,\loopy,0)],4)].scramble,inf),



		Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~gateBus,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2,~s1x,\quant2,~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),



	Pbind(\instrument,\EQHP, \in, ~toEq , \out,~gateBus3,
		\val,~s2,\quant,~q2, \gain,~g2,
		\val2,~s2x,\quant2, ~q2x, \gain2,~g2x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	Pbind(\instrument,\EQHP, \in, ~eqBus2x , \out,~gateBusB,
		\val, ~s3,\quant, ~q3, \gain,~g3,
		\val2,~s3x,\quant2,~q3x, \gain2,~g3x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pxrand([


		Pbind(\instrument, \gateX2,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in, ~gateBus3,\out,~reverbBus,\group, ~gateGrp),




		Pbind(\instrument, \gate,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374,\in, ~gateBusB,\out,~reverbBus,\group, ~gateGrp,\vlSub,0.8,\vlSub2,Pkey(\vlSub)),



		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,~reverbBus,

		\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
			\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,  ~gateBus,\out,
			Pwrand([~reverbBus,~reverbSquelch ],[4,1].normalizeSum,inf),\group, ~gateGrp,
\atkC,9.00.rrand(2),	\atkT,1, \decT,0),




		Pbind(\instrument, \gate ,\in,  ~gateBus ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~reverbBus,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus),


		/*Pbind(\instrument, \gate, \dur, Prand([ Pseq([1/4],4),Pseq([1/1],1) ],1) ,\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~delayBus)*/

	],inf),





	/*Pxrand([
	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([1/4],64), \in,~filterBus/*~gateBus*/ /*~gateSeqBus*/ , \group, ~gateGrp2,
		\type, Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2),
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),


	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([16/1],1), \in,~filterBus /*~gateSeqBus*/ , \group, ~gateGrp2,
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),
],inf),*/

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~reverbBus , \out, ~comFuzz ,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,80,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiterStoMixer,\c2,1,\name, 2,\in, ~limitFuzz, \dur,inf,\gain,54,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),],1)


)


//NO2 had downshifter
~mainLead.play(t)
Ppar([~base, ~mainLead,~kb],1).play(t,quant:1)
~mainLead.stop;
(~mainLead =

Ppar([



	//SUPER IMPORTNT ::: ( ~buf.numFrames.rrand(100000)- 100000)
Pbind( \instrument, \playBufX, \impulse, 0.075,
		\dur,inf, \tS,  0.39550810372374,\start,~main1,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~filterRnd,\loo,1) ,


	Pbind( \instrument, \playBufX, \impulse,Prand([0.01875,0.075],1) ,
		\dur,inf, \tS,  0.39550810372374,\start,~main2,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,   ~gateRnd,\loo,1),



	Pbind( \instrument, \playBufX, \impulse,0.075 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,~main3,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toEqFlo,\loo,1),


	/*Pbind(\instrument, \gate,\dur,Pseq([64/1],inf) ,\in,Pseq([ ~reverbRnd,~filterRnd].scramble,inf),\out,~eqBus23/*~distoBus43*/,\group, ~lfoGrp,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),*/









	Pbind(\instrument,\EQHP, \in, /*~filterBus23*/ ~gateRnd, \out,~reverbMelo,
		\val, ~s3,\quant, ~q3, \gain,~g3,
		\val2, ~s3x,\quant2, ~q3x, \gain2,~g3x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	/*Pbind(\instrument,\EQHP, \in, ~filterBus23 , \out, ~distoBus43,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~distoBus43  , \out,~gateSeqRnd,\group,~revGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~gateSeqRnd  ,\ctrl, ~kbus, \out,~newBus1, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in,~newBus1 , \dur, inf,\gain,17,\group,~limitGrp,\out,~newBus2),

Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~newBus2  ,\out, ~no5, \group, ~stereoGrp),*/



/*	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus43 , \out,~eqBus23 ,\group, ~distoGrp0),*/

	Pbind(\instrument,\EQHP, \in, ~filterRnd , \out,~gateBus23,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2, ~s1x,\quant2, ~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\EQHP, \in, ~toEqFlo , \out,~toGateFlo,
		\val,~s2,\quant, ~q2, \gain,~g2,
		\val2, ~s2x,\quant2, ~q2x, \gain2,~g2x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),






	//GIVES BLANKS
	Pxrand([


	Pbind(\instrument, \gateX2,\dur,Prand([Pseq([3/1],1),Pseq([5/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in,~toGateFlo ,\out,~toReverbFlo,\group, ~gateGrp),


	Prand([
		Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([1/3],3),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

				Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([3/1],1),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
					\vlSub,Pfunc({1.exprand(0.9)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}))

		],1),

Pseq([


			Pbind(\instrument, \gate, \dur, Pseq([1/4],16),
			\type,/* Pxrand([ Pseq([\note],256), */ Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,inf),/*Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), */\group, ~gateGrp,
\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})


			,\in, ~gateBus2, \tS, 0.39550810372374,\out,~reverbBus23),

		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,Pwrand([~micBus33,~reverbBus23],[1,1].normalizeSum,inf)),

Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,~gateBus23  ,\out, Pwrand([~micBus33,~reverbBus23],[1,1].normalizeSum,inf),\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,Pwrand([~micBus23,~micBus33,~reverbBus23],[1,1,4].normalizeSum,inf),\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


].scramble,1),


	],inf),

	 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~toReverbFlo  , \out,~toCompFlo,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~toCompFlo ,\ctrl, ~kbus, \out,~toLimitFlo, \group, ~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c4,1,\name, 4,\in, ~toLimitFlo, \dur, inf,\gain,32,\group,~limitGrp,\out,~toStereoFlo),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \center, Pfunc({0.1.rrand(-0.2)}),\in, ~toStereoFlo   ,\out, ~no3, \group, ~stereoGrp),


 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus23  , \out,~comFuzz23,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz23 ,\ctrl, ~kbus, \out,~limitFuzz23, \group, ~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c5,1,\name, 5,\in, ~limitFuzz23, \dur, inf,\gain,52,\group,~limitGrp,\out,~stereoBus23),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out,~no3, \group, ~stereoGrp),


Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~outFil , \out,~comBusHat2,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~comBusHat2  ,\ctrl, ~kbus, \out,~comBusCymb2, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c6,1,\name, 6,\in,~comBusCymb2 , \dur, inf,\gain,40,\group,~limitGrp,\out,~limitRkick2),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~limitRkick2   ,\out,~no3, \group, ~stereoGrp),

 ],1)

)


~sequ.play(t, quant:1)

~test =Ppar([/*~bassShap,Ppar([~kick ,~bass],inf),*/~base, ~percheur /*,~sequ,*/ /*~kb*/],1).play(t);
~percheur.stop;
(~percheur = //percheur



Ppar([
	//THIS IS TOO SHORTT 1/4 HAVE SOME 1/1

	//debug

	Pxrand([

	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],24)  ,   Pseq([1/1],24)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, /*Prand([*/~audio2/*,~buf2],inf)*/,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

		\pos,Pxrand([ Pseq([0.950.rand],24),  Pseq([0.950.rand],24) , Pseq([0.950.rand],24), Pseq([0.950.rand],24) ,
			Pseq([0.950.rand],24),  Pseq([0.950.rand],24) , Pseq([0.950.rand],24), Pseq([0.950.rand],24)],inf),

\tS, 0.39550810372374 ,

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


	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],12)  ,   Pseq([1/1],12)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
			\amp, 1,\buf,/*Prand([ */~audio2/*,~buf2],inf)*/,\out,Pxrand([ Pseq([~phaseBus],12),Pseq([~distoPerch],12)],inf),\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

		\pos,Prand([ Pseq([0.950.rand],12),  Pseq([0.950.rand],12) , Pseq([0.950.rand],12), Pseq([0.950.rand],12) ,
			Pseq([0.950.rand],12),  Pseq([0.950.rand],12) , Pseq([0.950.rand],12), Pseq([0.950.rand],12)],inf),

\tS, 0.39550810372374 ,

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

	],inf),//was 10






	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,Pseq([24/1],inf),\value, Pfunc({1.2875.exprand(0.075)}),\amp,Pfunc({1.exprand(0.075)}),\decT,Pfunc({0.7744.exprand(0.0424)}),\out,~distoPerch, \group,~phaserGrp,
\tS, 0.39550810372374 ,),

			Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),

	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \limiterStoMixer,\c3,1,\name, 3,\in, ~limitPerch, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPerch ,\spread,1  ,\center,Pxrand([ Pfunc({0.80.rand}),Pfunc({-0.80.rand})],inf), \out,~stetoSnaCom12, \group, ~stereoGrp), ],1); )

~t = Ppar([~passant, ~base,/*~kb*/],1).play(t,quant:1);
~passant.stop;
(~passant=

	//passant

	Ppar([
////GOOD
	/*Pxrand([
//was ~buf
		Pbind( \instrument, \playBuf, \impulse, 0.075,
		\dur,Pseq([16/1],1), \tS,  0.39550810372374,\start,Pfunc({( ~buf.numFrames.rrand(400000)- 400000)}),\buf,~buf,\out, ~filterBou,\loopy,0),

		Pbind( \instrument, \playBuf, \impulse, 0.3,
			\dur,Pseq([4/1],4), \tS,  0.39550810372374,\start,Pxrand([
			Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),Pseq([(~buf.numFrames.rrand(400000)- 400000)],4),
		],inf)     ,\buf,~buf,\out, ~filterBou,\loopy,0),


	],inf),*/


		/*Pbind( \instrument, \playBuf, \impulse, 0.075,
		\dur,Pseq([16/1],1), \tS,  0.39550810372374,\start,Pfunc({( ~buf.numFrames.rrand(400000)- 400000)}),\buf,~buf,\out, ~filterBou,\loopy,0),*/

		/*Pbind( \instrument, \playBuf, \impulse, 0.3,
			\dur,Pseq([3/1],inf), \tS,  0.39550810372374,\start,Pxrand([
			Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),
				Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),Pseq([(~buf.numFrames.rrand(400000)- 400000)],3),
		],inf)     ,\buf,~buf,\out, ~filterBou,\loopy,0),*/


	//],inf),


	/*Pbind(\instrument, \disto, \dur, inf, \in ,~distoBou,\out,~filterBou, \group ,~distoGrp),*/


	Pbind(\instrument, \filter,\which,0, \in ,~filterBou, \dur, inf ,\busMod, ~bus3, \qf,0.7, \out, ~gateBou, \group ,~filterGrp),




/*	Pxrand([
	Pbind(\instrument, \gate ,\in,~gateBou   ,\vlDec,1,\vlSub,1, \vlSub2,Pkey(\vlSub),
		\dur, Pseq([4/1],1) ,    \group,~gateGrp, \out,~dead ,\tS, 0.39550810372374 ,\relSu,0,\atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,\vlAtk,0,\vlRel,Pkey(\vlAtk)),

		Pbind(\instrument, \gate ,\in,~gateBou   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~dead,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	)
	],inf),*/


	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in, ~gateBou/*~dead*/, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \out , ~reverbBus4),


	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~reverbBus4  , \out,~comFuzz4 ,\group,~revGrp),






	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1	,\in, ~comFuzz4 ,\ctrl, ~kbus, \out,~limitFuzz4, \group, ~compGrp),


	Pbind(\instrument, \limiterStoMixer,\c7,1,\name, 7,\in, ~limitFuzz4, \dur,inf,\gain,38,\group,~limitGrp,\out,~stereoBus14),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14  ,\spread,1 ,\out,~newCOn, \group, ~stereoGrp),

Pbind(\instrument,\EQHP10, \in, ~newCOn ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,1, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-16),\vol, 1),



/*//OLD HP

		Pbind(\instrument, \filter, \dur,inf, \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2/*~distoBus4*/, \group,~filterGrp/*,\freqFil, 30.rrand(-30)*/),

/*	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~eqBus2 ,\group, ~distoGrp0),*/

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~gateBus2,
		\val, 3400.00.rrand(2300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(2300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),

	Pxrand([

	Pbind(\instrument, \gate, \dur, Pseq([1/4],16),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,

				\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})


			,\in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),
	],inf),
Pbind(\instrument, \gate, \dur,Pwrand([~short,Pseq([1/4 ],16)],[4,1].normalizeSum,1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),\vlSub,1,\vlSub2,Pkey(\vlSub),\in, ~gateBus2, \tS, 0.39550810372374,\out,
~reverbBus2),


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitFuzz2, \dur, inf,\gain,22,\group,~limitGrp,\out,~stereoBus2),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus2   ,\out, ~newCOn2/*~no1*/, \group, ~stereoGrp)*/



	],1);

	)


/*~extraDelay= Group.after(~recGrp2);
~compGrp4 = Group.after(~extraDelay);
~limitGrp4 = Group.after(~compGrp4);
~stereoGrp4 = Group.after(~limitGrp4);
~compGrp4 = Group.after(~stereoGrp4);*/

Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([

//maybe add a limiter
		Pbind(\instrument, \pingD, \in, ~delayBus2 ,\bufnum, ~delayX, \feedback,0.33 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),


Pbind(\instrument, \limiterS , \in,~delayToLimit, \dur,inf, \gain,72,\group,~limitGrp4,\out , ~delayEq),

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~delayEq, \out,0,\group, ~eqGrp3, \frq, 100,\vol,0.4),


/*	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \feedback,0.38 ,\dur, inf,\out,/*~comDelay*/~revDelay,\group,~revGrp),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),



	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, /*~compGrp4*/~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c18,1,\in,~limitDelay, \dur,inf, \gain,20,\group,/*~limitGrp4*/~limitGrp,\out ,0/*~stereoBus3*/),


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp/*~stereoGrp4*/),


	Pbind(\instrument,\comp10, \dur,inf,\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,~eqBus310),*/


Pbindf( ~church,\dur,inf, \in,~reverbSquelch  , \out,~comSquelch ,\group,~extraRev),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp4),

	Pbind(\instrument, \limiterStoMixer,\c19,1,\name, 19,\in, ~limitSquelch, \dur, inf,\gain,20,\group,~limitGrp4,\out,~stereoBus3b),

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3b   ,\out,~newCOn2,\spread,Pfunc({1.00.rand}), \group, ~stereoGrp4/*~stereoGrp*/),



	Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
				,\in, ~newCOn2  ,\ctrl, ~snBus, \out,~eqBus310,\group,~compGrp5/*~compGrp2*/,\tS, 0.39550810372374)
	,


	Pbind(\instrument,\EQHP10, \in, ~eqBus310 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp3/*~eqGrp2*/,\val,11800,\quant,1, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-16),\vol, 1.8),
],1))



//new one

~base; ~kb; ~no4; ~rises; ~lp;~bp; ~hp;~deNo2; ~mainLead;~percheur;~passant
~base.play(t)/*~deNo2, */
~rises,
(~track = Ppar([~fx,~passant,~hitX,~kb,~base,~no4,~mainLead,~percheur,~sequ],1).play(t,quant:1))

Pseq([~kick],inf).play(t, quant:1)
Ppar([~bassShap,Pseq([~bass],inf)],1).play(t, quant:1)
~track.play(t, quant:1)


~track.stop

(~track = Ppar([ ~base, ~kb ],1).play(t,quant:1))
s.plotTree
s.meter
FreqScope.new

/*x = Synth(\recLoop10,[buf:~bufBg,\recording,1, \in,0],~recGrp2);// still neeeded ?

x = Synth(\recLoop10,[buf:~bufBg,\recording,1, \in,~toCom],~recGrp2);*/

(Pbind(\instrument, \recLoop10,\buf,~leTout,\recording,1, \in,~toCom,\group, ~recGrp2,\dur,inf).play(t, quant:1))

1.numOutputs

.numTicks_
//NO
// x = Synth(\recLoop10,[buf:~leTout,\recording,1, \in,~toCom],~recGrp2);//  this one

~leTout.free
~leTout.play
~bufBg.play
~buf.play
~bufSnoopy.play

s.meter
