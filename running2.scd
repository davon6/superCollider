
//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd
//free delay (too choped/gated)
//share variable in between mainlead and seque (same sound)
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
//start noise reverb volume breaks somestimes good sometimes buzzkill
//unsync stereo no4
//arghh percheur sometimes comes mono in limiter
//chelou low freq noise wander in the project
//rythm sample 1/2 on kb needs mixing
//bell variable to save if necessary for mixing
//AMAZing limiter Synths off for a sequence
//missing slow motion of filters
//flanger with negative feedback
//does starts hits works?

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


/*
//FOR SELECT LOOP
		Pbind(\instrument, \playBuf10N,  \out, 0,\dur,Pseq([ 16/1],1),\in,~fusible
,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~pass4).play(t)


Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],24)  ,   Pseq([1/1],24)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,\pos,)*/


(//MUST RUN  ( ~buf.numFrames.rrand(320000)- 320000)
~rythm=( ~leTout.numFrames.rrand(320000)- 320000);
~main1= (~bufSnoopy.numFrames.rrand(1400000)- 1400000)   /*1200000*/;
~main2 =   ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)   /*0*/;
~main3= (~bufSnoopy.numFrames.rrand(1400000)- 1400000) /*3500000*/;
~s1=5400.00.rrand(1300,0.001);~q1=16.rrand(8,1);~g1=(-8).rrand((-2),1);~s1x =  5400.00.rrand(1300,0.001);~q1x= 16.rrand(8,1);~g1x=(-8).rrand((-2),1);
	~s2= 5400.00.rrand(1300,0.001);	~q2= 16.rrand(8,1);~g2=(-8).rrand((-2),1);~s2x= 5400.00.rrand(1300,0.001);~q2x=16.rrand(8,1);~g2x=(-8).rrand((-2),1);
	~s3=3400.00.rrand(1300,0.001);~q3=16.rrand(8,1);~g3=(-8).rrand((-2),1);~s3x= 5400.00.rrand(1300,0.001);~q3x= 16.rrand(8,1);~g3x=(-8).rrand((-2),1);
	~pass1 =(~buf.numFrames.rrand(400000)- 400000);~pass2=(~buf.numFrames.rrand(400000)- 400000);~pass3=(~buf.numFrames.rrand(400000)- 400000);~pass4=(~buf.numFrames.rrand(400000)- 400000);
~mster= /* (~lpPrec.numFrames.rrand(400000)- 400000) ;*/ (~leTout.numFrames/ 256 * 226.rand);
~bssFreq1= 1200.rrand(-140);~bssFreq2= 1200.rrand(-140);~bssFreq3= 1200.rrand(-140);
~r1= 3.rand;~r2= 3.rand;~r3= 3.rand;
~modHz=240.00.rand; ~carHz=140.00.rrand(10.00); ~noiLv=1.00.rrand(0.3); ~crv1=(-12.00).rrand(-4.00); ~crv2=(-12.00).rrand(-4.00); ~rel=0.0968.rrand(0.05); ~rel2=0.0968.rrand(0.05); ~modAmp=5000.00.rrand(1.00); ~modAmp2=5000.00.rrand(1.00);
~rythm1=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm2=[\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble; ~rythm3=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm4=[\rest,\rest,\rest,\note ,\note,\note ,\note, \rest].scramble;
	~rythmL = [\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble;
/* ~perc1 = 0.950.rand;~perc2 = 0.950.rand;~perc3 = 0.950.rand;~perc4 = 0.950.rand;~perc5 = 0.950.rand;
~perc6 = 0.950.rand;~perc7 = 0.950.rand;~perc8 = 0.950.rand;*/

~perc1 = (~buf.numFrames.rrand(1400000)- 1400000);~perc2 = (~buf.numFrames.rrand(1400000)- 1400000);~perc3 = (~buf.numFrames.rrand(1400000)- 1400000);~perc4 = (~buf.numFrames.rrand(1400000)- 1400000);~perc5 = (~buf.numFrames.rrand(1400000)- 1400000);~perc6 = (~buf.numFrames.rrand(1400000)- 1400000);~perc7 = (~buf.numFrames.rrand(1400000)- 1400000);~perc8 = (~buf.numFrames.rrand(1400000)- 1400000);

~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~no4S = ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000);
~ri1vlAtk=4.00.rand;~ri1f1=1.00.rand;~ri1f2=10.00.rrand(1);~ri1f3= 1.00.rand;~ri1ic_atk=10.00.rrand(-5);~ri1index=5.00.rrand(1);~ri1mRatio=3.rrand(1);~ri1fs=1.00.rand;
~ri2vlAtk=4.00.rand;~ri2f1=1.00.rand;~ri2f2=10.00.rrand(1);~ri2f3= 1.00.rand;~ri2ic_atk=10.00.rrand(-5);~ri2index=50.00.rrand(1);~ri2mRatio=3.rrand(1);~ri2fR=1.00.rand;
~ri3vlAtk=4.00.rand;~ri3f1=1.00.rand;~ri3f2=10.00.rrand(1);~ri3f3=1.00.rand;~ri3ic_atk=10.00.rrand(-5);~ri3index=50.00.rrand(1);~ri3mRatio=3.rrand(1);/*~ri3fR=1.00.rand*/
~pHVal=1.2875.exprand(0.075); ~pHdecT=0.3872.rrand((-0.3872));~pHVal2=1.2875.exprand(0.075);~pHdecT2=0.3872.rrand((-0.3872));
~pHVal3=1.2875.exprand(0.075); ~pHdecT3=0.3872.rrand((-0.3872));~pHVal4=1.2875.exprand(0.075);~pHdecT4=0.3872.rrand((-0.3872));
~pHVal5=1.2875.exprand(0.075); ~pHdecT5=0.3872.rrand((-0.3872));~pHVal6=1.2875.exprand(0.075);~pHdecT6=0.3872.rrand((-0.3872));
~pHVal7=1.2875.exprand(0.075); ~pHdecT7=0.3872.rrand((-0.3872));~pHVal8=1.2875.exprand(0.075);~pHdecT8=0.3872.rrand((-0.3872));
~pSub =0.5.rrand(0.2,1);~pAtkT=0.10.rrand(0.01);~pDecT =  0.3.rrand(0.8,0.3);~pSubT = 0.3.rrand(0.2);~pRelT=0.22.rrand(0.1,1);~pAtkC=6.rrand(1,1);~pDecC=(-4).rrand(-0.1);~pRelC=(-8).rrand(-2,1);
~pvlAtk =0.1.rrand(0.01);
~pSub2 =0.5.rrand(0.2,1);~pAtkT2=0.10.rrand(0.01);~pDecT2 =  0.3.rrand(0.8,0.3);~pSubT2 = 0.3.rrand(0.2);~pRelT2=0.22.rrand(0.1,1);~pAtkC2=6.rrand(1,1);~pDecC2=(-4).rrand(-0.1);~pRelC2=(-8).rrand(-2,1);
~pvlAtk2 =0.1.rrand(0.01);
~pSub3 =0.5.rrand(0.2,1);~pAtkT3=0.10.rrand(0.01);~pDecT3 =  0.3.rrand(0.8,0.3);~pSubT3 = 0.3.rrand(0.2);~pRelT3=0.22.rrand(0.1,1);~pAtkC3=6.rrand(1,1);~pDecC3=(-4).rrand(-0.1);~pRelC3=(-8).rrand(-2,1);
~pvlAtk3 =0.1.rrand(0.01);
~pSub4 =0.5.rrand(0.2,1);~pAtkT4=0.10.rrand(0.01);~pDecT4 =  0.3.rrand(0.8,0.3);~pSubT4 = 0.3.rrand(0.2);~pRelT4=0.22.rrand(0.1,1);~pAtkC4=6.rrand(1,1);~pDecC4=(-4).rrand(-0.1);~pRelC4=(-8).rrand(-2,1);
~pvlAtk4 =0.1.rrand(0.01);
~pSub5 =0.5.rrand(0.2,1);~pAtkT5=0.10.rrand(0.01);~pDecT5 =  0.3.rrand(0.8,0.3);~pSubT5 = 0.3.rrand(0.2);~pRelT5=0.22.rrand(0.1,1);~pAtkC5=6.rrand(1,1);~pDecC5=(-4).rrand(-0.1);~pRelC5=(-8).rrand(-2,1);
~pvlAtk5 =0.1.rrand(0.01);
~pSub6 =0.5.rrand(0.2,1);~pAtkT6=0.10.rrand(0.01);~pDecT6 =  0.3.rrand(0.8,0.3);~pSubT6 = 0.3.rrand(0.2);~pRelT6=0.22.rrand(0.1,1);~pAtkC6=6.rrand(1,1);~pDecC6=(-4).rrand(-0.1);~pRelC6=(-8).rrand(-2,1);
~pvlAtk6 =0.1.rrand(0.01);
~pSub7 =0.5.rrand(0.2,1);~pAtkT7=0.10.rrand(0.01);~pDecT7 =  0.3.rrand(0.8,0.3);~pSubT7 = 0.3.rrand(0.2);~pRelT7=0.22.rrand(0.1,1);~pAtkC7=6.rrand(1,1);~pDecC7=(-4).rrand(-0.1);~pRelC7=(-8).rrand(-2,1);
~pvlAtk7 =0.1.rrand(0.01);
~pSub8 =0.5.rrand(0.2,1);~pAtkT8=0.10.rrand(0.01);~pDecT8 =  0.3.rrand(0.8,0.3);~pSubT8 = 0.3.rrand(0.2);~pRelT8=0.22.rrand(0.1,1);~pAtkC8=6.rrand(1,1);~pDecC8=(-4).rrand(-0.1);~pRelC8=(-8).rrand(-2,1);
~pvlAtk8 =0.1.rrand(0.01);
~bangVar = (~leTout.numFrames/ 256 * 145.rand);
~first=  ~leTout2.numFrames/ 256 * 222.rrand(1);
		 ~second= ~leTout2.numFrames/ 256 * 222.rrand(1);
/*~zigoui= ~bufSnoopy.numFrames/256 * 240.rand;
~zigoui2= ~bufSnoopy.numFrames/256 * 240.rand;
~zigoui3= ~bufSnoopy.numFrames/256 * 240.rand;*/

~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");

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
~gateGrp8= Group.after(~limitGrp);
~gateGrp9= Group.after(~gateGrp8);
~stereoGrp = Group.after(~gateGrp9);
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
~gateGrp7 = Group.after(~recGrp2);
~extraDelay= Group.after(~gateGrp7);
~extraRev= Group.after(~extraDelay);
~compGrp4 = Group.after(~extraRev);
~limitGrp4 = Group.after(~compGrp4);
~stereoGrp4 = Group.after(~limitGrp4);
~compGrp5 = Group.after(~stereoGrp4);
~eqGrp3=Group.after(~compGrp5);
~recGrp3= Group.after(~eqGrp3);



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


	// Out.kr(~bus14, SinOsc.kr( LFTri.kr( 0.08046875).range(0.321875,1.2875)).range(1.5,0.27));//changed from 0.45

	Out.kr(~bus14,SinOsc.ar(0.6).range(1.5,0.27));

	/*Out.kr(~bus3, SinOsc.kr(0.3 ).range((-140),1500));*/


	Out.kr(~bus18, /* Lag.kr(*/LFNoise0.kr(1.2875).range(0.15,0.0)/*,0.05)*/
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0,4))

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

	Pseq([
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/4],16),\pitchRte,Pfunc({6.rrand(0.1)}),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \busMod,~bus18 ),//16

		Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],inf),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub),\pitchRte,Pfunc({8.rrand(0.1)}) ),],inf),



	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),



	Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, ~f2,\out,~main1GToG/*~reverbBus23*/,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,0.8,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~main1GToG/*~reverbBus23*/,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),*/

	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,3200,\rH,1720, \ph,1.4,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

		Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],1),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*~bassShap,*/

//FOR BG
/*	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus24 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,(-0.8),\rH,(-0.08), \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus25 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,0.8,\rH,0.08, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([32/1],inf),\rL,40,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,40,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([8/1],inf),\rL,40,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),


	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,/* Prand([ */Pseq([3/1],inf)/* , Pseq([2/1],2)],inf)*/,\group,~lfoGrp ,\frq,Pfunc({5.15.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),

		Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 9999, \group, ~lfoGrp),


		Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),


	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\modu, 0.001875 ,\ph,1.4),

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),



	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 1/4,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~limitHat,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.001, \rel ,0.04840,\gain,3.5,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~limitCymb,\group, ~compGrp),




	Pbind(\instrument ,\EQHP2Dyna, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~delayGrp2, \out,~limitHat    ,\vol,4,\ctrl,~fusible10 ,\valD,3100, \quantD,4),

	/*Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~eqGrp, \out , ~comBusHat,\vol,4),*/
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~delayGrp2,\out , ~limitCymb    ,\vol,4),


Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.3872,\ctrl,~snBus ,   \in, ~comFuzz22 ,\out,~toKbGate,\group,~eqGrp2),


	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareComp),

		Pbind(\instrument,\comp, \dur,inf,\thr,0.92 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.12,\ctrl,~snBus ,   \in, ~snareComp ,\out,~snareLimit,\group,~compGrp),

	/*Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),*/

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\out, ~toKbGate,\group, ~stereoGrp),


	/*Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1/*\val, 659.255, \quant,1, \gain ,(-20)*/),
*/

	//BG

	Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\vl,0.3),


/*


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

*/


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


	Pbind(\instrument,\gateS, \dur, Pxrand([ /*Pseq([4/1],16), Pseq([8/1],8) */ Pseq([12/1],1)  ],1)
		,\in,Pseq([ /*~newCOn,*//*~new10*/~no1 ],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

Pxrand([

	Pbind(\instrument,\gateS, \dur,Pseq([64/1],1)
				,\in, ~no3,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([56/1],1)
			,\in, ~no3 ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),


				Pbind(\instrument,\gateS, \dur,Pseq([4/1],1),\in, ~no3  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([6/1],1),\in,~no1 /*~new10*//*~newCOn*/  ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in,~no1/*~new10*/ /*~newCOn*/  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374),].scramble,1)
		],1),



		//to chnage for final
		Pbind(\instrument,\gateS, \dur,Pseq([4/1],16)
			,\in,Pseq([~percuCom2 ,~vocToDispatch,~percuCom2,~comSnaGrpBus2,/*~rndBus,~rndBus,*/~no2,~no2,~no2,~no2
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)





	].scramble,inf),


	//for record
/*Pbind(\instrument, \gateS, \dur,   Pseq([262/1],inf) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/




	Pseq([
/*
		Pseq([
				Pbind(\instrument, \gateS, \dur,   Pseq([32/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),
		Pseq([
Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, ~toCom,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~gateGrp5)
		],2),

				/*Pbind(\instrument, \gateS, \dur,   Pseq([64/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/
			].scramble,1),


		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,~toCom,\group,~gateGrp5),
*/

//PASSANT DisAABLE FOR RISE INIT
		Pseq([

		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start,~pass1 ,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([2/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass2,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start,~pass3,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,~toCom,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\start,~pass4,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0),

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








	/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
		,\in, ~toCom  ,\ctrl, ~snBus, \out,/*~eqBus10*/~toGate10,\group, ~compGrp2,\tS, 0.39550810372374),*/

Prand([

	//here

	Pbind(\instrument,\gateS, \dur, Prand([/* Pseq([4/1],4),Pseq([1/1],4),*/ Pseq([1.5/1],1), Pseq([3/1],1),/*Pseq([1/3],1) ,*/Pseq([1/1],1),
		/*Pseq([4/1],1)*/],inf),
		\in, ~toGate10 /* Prand([~toGate10,~toGate102], inf)*/  ,\out ,Pwrand([~eqBus10,

		~delayBus2,~reverbSquelch],[16,1,1].normalizeSum,inf)

	,  \group, ~gateGrp6,\tS, 0.39550810372374),


		Pbind(\instrument,\gateS, \dur,Pseq([1/8],8),\type,Pseq([\note, \rest,\note, \rest,\note, \note,\note],inf),
		\in,  Pxrand([~toGate10,~toGate102], inf)  ,\out ,Pwrand([~eqBus10,

				Pseq([~delayBus2],8)],[4,1].normalizeSum,inf) ,\group, ~gateGrp6,\tS, 0.39550810372374),
	],inf),



Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,/*\val,13000,\quant,4, \gain,(-16),\val2,3600,\quant2,16, \gain2,(-8),*/\vol, 2.2),








	Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~part2RiComp2  ,\ctrl, ~snBus, \out,0,\group, ~compGrp2,\tS, 0.39550810372374),


 //for BG
	/*Pbind(\instrument, \filter, \dur, inf,\in,~bgFil22, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2, \group,~compGrp ),

	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([16/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf),\spread, 0.8,\tS,  0.39550810372374),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~shifGrp),

	Pbind(\instrument,  \limiter10toMixer, \c13,1,\name,13,\dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 27,\group,~limitGrp2   ),

	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.05,\sA, 1/2,\atk ,0.024, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,0,\group,~compGrp2 )*/


],1)/*.play(t, quant:1)*/)
s.scope
Ppar([~base, ~kb],1).play(t,quant:1)
~kb.stop;
(~kb =
Ppar([


	Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.05,\tS,  0.39550810372374),

	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1) ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.003,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte, (-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.04,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.001,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.003,\pos,0.04,\tS,  0.39550810372374)


	],inf),


	Pbind(\instrument, \gate ,\vlSub,1,\vlSub2, Pkey(\vlSub),\dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out,Prand([~lpK,~bpK,~hpK],inf),\tS,  0.39550810372374),


	Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 30, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
		Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],inf), \out,~dipatchKB, \freq,Prand([~bssFreq3,~bssFreq1,~bssFreq2],inf), \group,~shifGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,100,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
	],1),

	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374, \rte,-3,	\buf,~snare,\type,
		Prand([Pseq([\note ,\rest,\rest,\rest] ,1),Pseq([\rest ,\note,\rest,\rest] ,1),Pseq([\rest ,\rest,\rest,\rest] ,1)],inf),\dur, Pseq([1/2], inf),\out,~snareEQ),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,
		\type,
		Pseq([
		Pseq([
				Pseq([\rest ,\rest,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
						\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest
					],1),
	/*Pseq([\rest ,\rest,\note,\rest], 96),*/
Pwrand([    Pseq([\rest ,\rest,\note,\rest] ,1),Pseq([\rest ,\note,\note,\rest],1),

		],[26,1].normalizeSum , 88),//was 96
				Pseq([\rest,\rest,\rest,\rest],32)].scramble,1),    Pseq([\rest,\rest,\rest,\rest ],128), /*Pseq([\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
						\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest
					],1), */   Pseq([\rest,\rest,\rest,\rest ],120)],inf)//l embrouille
	,\dur, Pseq([1/2], inf) ,\out,~snareEQ,
	\dA,Prand([ /*Pseq([2],32),Pseq([0],32)*/  Pseq([1],32), Pseq([0.5],32),Pseq([0.25],32)],inf)      ),

	Pbind(\instrument, \playBufS,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],128) ],inf),\dur,Pseq([1/4],inf ),\stereoL, 0.00555,\out,   ~comBusCymb),


	Pbind(\instrument, \playBufS,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~comBusHat,\type, Pseq([ Pseq([ \note],512),Pseq([\rest],128)],inf)),

Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, ~toKbGate),



	Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/4],inf), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Prand([
			Pseq([
			Pseq([\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest],1),
			Pseq([\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest],1),
			],4),
			Pseq([\rest],16)
	],inf)          ),


	Pbind(\instrument, \filter10,\freqFil,600 ,\busMod,~bus21 ,\in,~rythmFil,\which,0,\qf,0.75, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),

	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~rythmLimit, \group,~eqGrp,\vol,10,\val,120,\quant,4, \gain,(-12)),

/*	Pbind(\instrument, \limiter10toMixer,\c20,1,\name,30, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,40, \group, ~limitGrp),*/

	Pbind(\instrument,\comp10, \dur,inf,\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.001, \rel ,0.3872,\dur,99999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, ~toKbGate,\group, ~compGrp2 ,\tS, 0.39550810372374),


	Pseq([
	Pseq([
Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([15/1],1)),

	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([1/1],1))].scramble,1),

	Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK],inf), \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([8/1],1)),

	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([8/1],1))].scramble,1)

		].scramble,4),


		//all new perspective
		Pseq([
		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([31/1],1)),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1)),

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([16/1],1)),

			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([1/1],1)),




		].scramble,4),

		Pseq([

			Pbind(\instrument,\gate2, \group, ~gateGrp7, \tS,  0.39550810372374,\in,~rollingK,
		\dur, Pseq([31/1],1)),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1)),

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([16/1],1)),

			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([1/1],1)),




		].scramble,4)

	],inf),





	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/





	//INCORPORAE SLIGHT MOVEMENT

	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,(-540),\val2,1200,\crv,3.2),




	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1))

Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([


		//no2

	/*Pbind( \instrument, \playBufX, \impulse, 1.2875,
		\dur,9999, \tS,  0.39550810372374,\start, ~no2S,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toGateX2,\loopy,1),*/


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2ToRev,\group, ~gateGrp),


	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in, ~no2ToRev , \out, ~no2ToCom,\group,~revGrp),
/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 1,\in,~no2ToCom  ,\ctrl, ~kbus, \out,~no2ToLimit, \group, ~compGrp),*/

	/*Pbind(\instrument, \limiterStoMixer,\c8,1,\name,10,\in, ~no2ToLimit, \dur, inf,\gain,40,\group,~limitGrp,\out,~no2ToStereo),*/

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp,\tS, 0.39550810372374),/*.play(t, quant:1)*/




	Pbind( \instrument, \playBufX, \impulse, 0.321875,
		\dur,9999, \tS,  0.39550810372374,\start, ~no4S,\buf,~bufSnoopy,\out, ~delayBus,\loopy,1),



/*	Pbind( \instrument, \playBuf, \impulse, 20.6,
	\dur,9999, \tS,  0.39550810372374,\start,Pfunc({( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)}),\buf,~bufSnoopy,\out, ~delayBus,\loopy,1),*/

	// Pbind(\instrument, \delay, \in,~delayBus, \out,~delayToEq, \group,~revGrp, \dur, inf),


	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum,~delay, \feedback,0.38 ,\dur, inf,\out,~delayToEq,\group,~revGrp),

	Pbind(\instrument,\EQHP2, \in, ~delayToEq , \out, ~revDelay ,\frq, 100, \dur,inf, \group, ~eqGrpplus, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),

Pbindf( Prand([~rLong, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),


	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),*/

/*	Pbind(\instrument, \limiterStoMixer,\c9,1,\name, 18,\in,~limitDelay, \dur,inf, \gain,43,\group,~limitGrp,\out ,~stereoBus3),*/


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374),



	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({(~leTout.numFrames/ 256 * 222.rand)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),

	Prand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
\vl,0.162
	),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],inf),



	Pbind(\instrument,\disto,\in,~vocalBus,\out,~vocToEq,\group,~phaserGrp,\dur,inf),
	Pbind(\instrument,\EQHP96,\in,~vocToEq,\out,~vocToRev,\group,~distoGrp,\dur,inf),

	Pbindf( Prand(/*[~quickFix,*/[ ~rShort, ~rLong]),\dur,inf, \in, ~vocToRev , \out, ~vocToFil ,\group,~dispatchGrp),


	Pbind(\instrument, \filterS, \dur, inf,\in,~vocToFil, \busMod,~bus2, \rqLPF, ~bus1,\which,0,\out,~vocToComp ,\group,~filterGrp,\freqFil,2220 ),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.3872
		,\gain,1,\in, ~vocToComp ,\ctrl, ~kbus, \out, ~vocToLimit, \group,~compGrp ),
	Pbind(\instrument,\limiterS,\in,~vocToLimit,\out, ~vocToStereo,\group,~limitGrp,\dur,inf,\gain, 18),

	Pbind(\instrument,  \stereoS, \in,~vocToStereo,  \out,~vocToDispatch , \dur,9999, \spread, 0.8.rrand(0.1),\tS,  0.39550810372374,\group,~stereoGrp),






//rythm needs to evolve
Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out,~no4ToGate2

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),


	Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out,~micBus

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),







	// Pxrand([
	//
	// 	Pbind(\instrument, \gate, \vlSub,1,\vlSub2, Pkey(\vlSub),\dur,Pseq([4/1],1),\tS, 0.39550810372374,\out, ~distoPercu,\in,~no4ToGate,\group,~phaserGrp),




	Pbind(\instrument, \gate, \vlSub,1,\vlSub2, Pkey(\vlSub),\dur,Pseq([4/1],inf),\tS, 0.39550810372374,\out,~distoPercu,\in,Prand([~no4ToGate2,~no4ToGate],inf),\group,~phaserGrp),
	/*Pxrand([

		//4


	],inf),
*/

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoPercu , \out,~percuFil ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,inf,\which,1, \in,~percuFil,\busMod, ~bus4,\qf2,0.4, \out,/*~toLim*/~percuEq, \group,~filterGrp ,\freqFil, 30.rrand(-30)),



	Pbind(\instrument , \EQHP96, \frq, 100 ,\dur, inf,\in, ~percuEq, \group, ~eqGrp0,\val, 22000, \quant, 4, \gain, (-20),\val2,12000,\quant2,4, \gain2,(-12),\out , ~percuRev, \val3,3000,\shelf,1, \gain3,(-15)),


	 Pbindf( ~quickFix, \instrument, \reverb, \dur,inf, \in,~percuRev  , \out,~percuCom,\group,~revGrp),


/*	Pbind(\instrument,\compS, \dur,inf/*\compSX, \dur,Pseq([4/1],inf)*/,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0001, \rel ,0.0968,\gain,1,\in, ~percuCom ,\ctrl, ~kbus, \out,~percuLimit/* Pwrand([~percuComb,~percuLimit],[1,4].normalizeSum,inf)*/,\group, ~compGrp ,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \pingDSX, \in, ~percuDelay ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,~percuComb,\group, ~delayGrp2,\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1)),*/


/*	Pbind(\instrument, \combS,\in, ~percuComb,\out,~percuLimit,\dur, Pseq([4/1],inf),\group,~combGrp,
		\maxDel,2, \delayT,Pfunc({1.rrand(-1.00)}),\decT,1.00.rrand(0.1),\tS, 0.39550810372374, \amp,0.4
	),*/

/*Pbind(\instrument, \limiterStoMixer,\c10,1,\dur, inf, \in,~percuLimit, \gain,32,\group, ~limitGrp,\out,~percuStereo),*/

	Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({~spread = 1.rand}),\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,~panning = 0.1.rrand(-0.1),\modPan, ~bus24),

	Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({~spread}),\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,~panning,\modPan, ~bus25),



/*	Pbind(\instrument,\brokenStereo, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({1.rrand(0.1)}),\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,Pfunc({0.1.rrand(-0.1)}),\bus1, ~bus24,
	\bus5, ~bus25)*/


	/*~percuCom2*/

		/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~percuCom2  ,\ctrl, ~snBus, \out, ~toGate10   ,\group, ~compGrp2,\tS, 0.39550810372374),*/





],1))

(~track = Ppar([ ~base,/*~kb ,*/ ~hitX, ],1).play(t,quant:1))



~hitX.stop;
(~hitX=

Ppar([



		Ppar([





			Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,~ri1vlAtk ,\f1, ~ri1f1 , \f2, ~ri1f2 , \f3,~ri1f3,  \ic_atk,~ri1ic_atk,\index,~ri1index,\mRatio,~ri1mRatio,\out ,~bellFlang2,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\atk,1, \fS,~ri1fs)


		,


		Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk, ~ri2vlAtk,\f1, ~ri2f1 , \f2, ~ri2f2 , \f3, ~ri2f3,  \ic_atk,~ri2ic_atk,\index,~ri2index,\mRatio,~ri2mRatio,\out ,Prand([~bellFlang4, ~riToDisto2],inf),\tS, 0.39550810372374, \fR,~ri2fR, \moduR,~mod1,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


Pbind(\instrument,\rise,\dur,Pseq([1/1],inf/*64*/),\vlAtk, ~ri3vlAtk,\f1, ~ri3f1 , \f2, ~ri3f2 , \f3, ~ri3f3,  \ic_atk,~ri3ic_atk,\index,~ri3index,\mRatio,~ri3mRatio,\out ,Prand([~bellFlang3, ~riToDisto3],inf),\tS, 0.39550810372374,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


],inf),




Pseq([


		Pseq([


					Ppar([

				/*Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([8/1],1)),*/

				Pxrand([

							Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
						Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),

						],1),



				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(180)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur, Pseq([8/1],1),\tS, 0.39550810372374)],1),




			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~again,\dur,Pseq([56/1],1),\tS, 0.39550810372374 )


		],1),




//WARNING BANGLIMIT NEEDs ROUTING




		Pseq([
			Pxrand([
				Pseq([
					Ppar([

				Pxrand([/* ~bang,Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([3/1],1))*/

							Pbind(\instrument, \wNoise,\dur, Pseq([3/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
						Pbind(\instrument, \percussion, \dur,Pseq([3/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],3) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
						],1),

				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(380)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur, Pseq([4/1],1),\tS, 0.39550810372374)],1),


					Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([13/1],1),\tS, 0.39550810372374 )
				],1),

Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),
			],1),





	/*	Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/

			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~again,\dur,Pseq([48/1],1),\tS, 0.39550810372374 )


		],1),





		Pseq([


			Ppar([
				Pxrand([
					/*Pbindf( ~bang ,\dur, Pseq([1/2],2)  ),Pbindf( Pxrand([ ~bell,~noise],inf) ,\dur, Pseq([2/1],1))*/

						Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
						Pbind(\instrument, \percussion, \dur,Pseq([2/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/2],4) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)

				],1),
			Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(380)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([2/1],1),\tS, 0.39550810372374,\vol,0.7)],1),



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


			Ppar([Pxrand([
					/*Pbindf( ~bang ,\dur, Pseq([1/1],1))  ,Pbindf( Pxrand([ ~bell,~noise, ~hit2],inf) ,\dur, Pseq([1/1],1))*/
					~hit2,
					Pbind(\instrument, \wNoise,\dur, Pseq([1/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
						Pbind(\instrument, \percussion, \dur,Pseq([1/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],1) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
				],1),
				Pbind(\instrument,\filterX,  \freqFil,Pfunc({3000.rrand(380)}),\in,~filterNoise,\out, ~eqNoise, \group,~filterGrp,\dur,Pseq([1/1],1),\tS, 0.39550810372374)],1),

/*	Pbind(\instrument, \wNoise,\dur,Pseq([15/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),


		Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/
			Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~again,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),








Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374, \fR,Pfunc({1.00.rand}), \moduR,~mod1,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),/*, \moduS

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })*/




/*Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~bigRiToDisto,\tS, 0.39550810372374),
			Pbind(\instrument,\envSli,\out, ~bus17,\dur,Pseq([64/1],1),\tS, 0.39550810372374,\val1,350,\crv,3.2),*/


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







//maybe to throw in the mixer
	Pbind(\instrument, \limiter10, \in, ~bangLimit, \out, ~again,\group, ~limitGrp,\dur, inf, \gain,50),





	Pbind(\instrument,\flanger,\dur,Pseq([64/1],inf ), \in,~bellFlang4, \out,~riToDisto2, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({0.8.rrand(0.1)}),\tS , 0.39550810372374),

	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto2 , \out,~riToEnv3 ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv3,\out,~riToEq , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus19, \which, 0,\qf,0.5)  ,

	Pbind(\instrument,\EQHP2, \in, ~riToEq , \out, ~riToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev  , \out,~riToComp,\group,~revGrp),


		/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp ,\ctrl, ~kbus, \out,~riToLimit, \group, ~compGrp),*/

	/*Pbind( \instrument, \limiterStoMixer,\c11,1,\in, ~riToLimit, \dur, inf,\gain,43,\group,~limitGrp,\out,~riToStereo),*/
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate,\tS, 0.39550810372374,\group, ~stereoGrp),



	Pbind(\instrument,\flanger,\dur,Pseq([64/1],inf ), \in,~bellFlang3, \out,~riToDisto3, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({0.8.rrand(0.1)}),\tS , 0.39550810372374),

	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto3 , \out,~riToEnv2 ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv2,\out,~riToEq3 , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus12, \which, 0,\qf,0.55)  ,

	Pbind(\instrument,\EQHP2, \in, ~riToEq3 , \out, ~riToRev3 ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev3  , \out,~riToComp3,\group,~revGrp),
		/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp3 ,\ctrl, ~kbus, \out,~riToLimit3, \group, ~compGrp),*/
//TO CHANGE
	/*Pbind( \instrument, \limiterStoMixer,\c12,\in, ~riToLimit3, \dur, inf,\gain,43,\group,~limitGrp,\out,~riToStereo3),*/
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo3  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate2,\tS, 0.39550810372374,\group, ~stereoGrp),




	Pbind(\instrument,\flanger,\dur,Pseq([64/1],inf ), \in,~bellFlang2, \out,~flanToDisto2, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374),
	Pbind(\instrument, \distoS, \dur, inf, \in, ~flanToDisto2 , \out,~flanToEq2 ,\group, ~distoGrp),

	Pbind(\instrument,\EQHP2, \in, ~flanToEq2 , \out, ~flanToRev2 ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-18).rrand(-4)),

	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~flanToRev2  , \out,~flanToComp2,\group,~revGrp),
		/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,2,\in, ~flanToComp2 ,\ctrl, ~kbus, \out,~flanToLimit2, \group, ~compGrp),*/
	/*Pbind( \instrument, \limiterStoMixer,\c27,1,\name, 16,\in, ~flanToLimit2, \dur, inf,\gain,50,\group,~limitGrp,\out,~flanToStereo2),*/

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo2  ,\spread,0.2,\out,~riToGate3,\tS, 0.39550810372374,\group, ~stereoGrp),







	Pbind(\instrument, \gate2, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],inf), \in,Prand([~riToGate,~riToGate3,~riToGate2],inf)  ,\out,~risesGate , \group,~dispatchGrp2,\tS, 0.39550810372374,),














	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto , \out,~riToEnv ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv,\out, ~riToEq2 , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus20, \which, 0,\qf,0.6)  ,



	Pbind(\instrument,\EQHP2, \in, ~riToEq2 , \out, ~riToRev2 ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev2  , \out,~riToComp2,\group,~revGrp),
		/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp2 ,\ctrl, ~kbus, \out,~riToLimit2, \group, ~compGrp),*/
//TO CHANGE
	/*Pbind( \instrument, \limiterStoMixer,\c14,\in, ~riToLimit2, \dur, inf,\gain,43,\group,~limitGrp,\out,~riToStereo2),*/
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo2  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),





		Pbind(\instrument,\EQHP2, \in, ~eqNoise , \out, ~noiseRev ,\frq, 100, \dur,inf, \group, ~eqGrp0,\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~noiseToComp,\group,~revGrp),

/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~noiseToComp  ,\ctrl, ~kbus, \out,~noiseToLimit, \group, ~compGrp),*/


	/*Pbind( \instrument, \limiterStoMixer,\c15,1,\in, ~noiseToLimit, \dur, inf,\gain,43,\group,~limitGrp,\out,~noiseToStereo),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~noiseToStereo ,\spread,0.2,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0,\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~quickFix/*~rLong*/,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),
	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),*/
	/*Pbind( \instrument, \limiterStoMixer,\c16,1,\in, ~limitFuzz3, \dur, inf,\gain,60,\group,~limitGrp,\out,~stereoBus4),*/
Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out, ~again, \group, ~stereoGrp),



	Pbind(\instrument,\flanger,\dur,Pseq([64/1],inf ), \in,~bellFlang, \out,~flanToDisto, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(-0.2)}),\tS , 0.39550810372374),
	Pbind(\instrument, \distoS, \dur, inf, \in, ~flanToDisto , \out,~flanToEq ,\group, ~distoGrp),
	Pbind(\instrument,\EQHP2, \in, ~flanToEq , \out, ~flanToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-18).rrand(-4)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~flanToRev  , \out,~flanToComp,\group,~revGrp),
	/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,2,\in, ~flanToComp ,\ctrl, ~kbus, \out,~flanToLimit, \group, ~compGrp),*/
	/*Pbind( \instrument, \limiterStoMixer,\c16,1,\name, 16,\in, ~flanToLimit, \dur, inf,\gain,50,\group,~limitGrp,\out,~flanToStereo),*/

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),





	/*Pbind(\instrument, \distoS, \dur, inf, \in, ~bigRiToDisto , \out,~bigRiToEnv ,\group, ~distoGrp),
	Pbind(\instrument,\filterS, \in,~bigRiToEnv ,\out,~bigRiToEq, \group,~filterGrp ,\which, 0, \busMod, ~bus17,\qf,0.67,\dur, inf),

	Pbind(\instrument,\EQHP2, \in, ~bigRiToEq , \out, ~bigRiToRev ,\frq, 300, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~bigRiToRev  , \out,~bigRiToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~bigRiToComp ,\ctrl, ~kbus, \out,~bigRiToLimit, \group, ~compGrp),*/

	/*Pbind( \instrument, \limiterStoMixer,\c17,1,\name, 17,\in, ~bigRiToLimit, \dur, inf,\gain,55,\group,~limitGrp,\out,~bigRiToStereo),*/





/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~bigRiToStereo  ,\spread,1,\out,~again2,\tS, 0.39550810372374,\group, ~stereoGrp,\atkT,1,\decT,0),*/



	/*Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),*/


	Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872
			,\in,~again2   ,\ctrl, ~snBus, \out,~bigRiLastEq,\group, ~compGrp2,\tS, 0.39550810372374,\gain,10),



	Pbind(\instrument,\EQHP10, \in, ~bigRiLastEq ,\out, 0,\frq, 200, \dur,inf,\group, ~eqGrp2,/*\val,13800,\quant,1, \gain,(-18),\val2,2600.rrand(1900),\quant2,8.rrand(1), \gain2,(-16).rrand(-4),*/\vol, 1),


Pbind(\instrument, \distoS, \dur, inf, \in, ~riTriptoDisto , \out,~riTriptoEq ,\group, ~distoGrp),
		Pbind(\instrument,\EQHP2, \in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
		Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riTriptoRev  , \out,~riTriptoComp,\group,~revGrp),
		/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~riTriptoComp ,\ctrl, ~kbus, \out,~riTriptoLimit, \group, ~compGrp),*/
	/*Pbind( \instrument, \limiterStoMixer,\c18,1,\name, 12,\in, ~riTriptoLimit, \dur, inf,\gain,39,\group,~limitGrp,\out,~riTriptoStereo),*/
	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),






	Pbind(\instrument,\EQHP2, \in, ~slideBus , \out, ~slideEq ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8), \vol,1),

	/*Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,12,   \dur, inf, \in,~slideEq  , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),*/
	/*Pbind( \instrument, \limiterStoMixer,\c19,1,\name, 14, \dur, inf, \in, ~slideBusToLimit, \gain, 45, \group,~limitGrp),*/


	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~slideBusToStereo  ,\spread,0.1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


		Pbind(\instrument,\EQHP96, \in, ~slideBus2 , \out, ~slideEq2 ,\frq, 400, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8), \vol,1),

	Pbind(\instrument, \comp, \thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,   \dur, inf, \in,~slideEq2  , \out,~slideBusToLimit2,\ctrl, ~kbus, \group, ~compGrp),



/*	Pbind( \instrument, \limiter, \dur, inf,\c26 \in, ~slideBusToLimit2, \gain, 45, \out,~again,\group,~limitGrp),*/
	Pbind(\instrument,\stereo, \dur, 9999, \in, ~toStereoRise  ,\spread,0.1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),




		Pbind(\instrument,\comp10, \dur,9999,\thr,0.9 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872
			,\in,~again   ,\ctrl, ~snBus, \out,~toGate102,\group, ~compGrp2,\tS, 0.39550810372374),
],1);
)

~sequ.play(t)
~t = Ppar([~base, /*~kb,*/~sequ],1).play(t,quant:1)


.stop
//WATCH OUT LP MODU ON IN THIS ONE !!!! actually record in a buff be easier
(
~sequ =
Ppar([


//For init

/*Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+100000).exprand("1".postln;~main1.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrumen * [1, 2, 4, 8] t, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+100000).exprand("2".postln;~main2.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+100000).exprand("3".postln;~main3.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),*/


	/*Pseq([*/



/*Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+s.sampleRate*t.beatDur).exprand(~main1)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus1,\loopy,0)],4),*/


/*	Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,784344.24425935, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),*/

	Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,499638.18770068, \tS, 0.39550810372374 ,
	\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),




Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+s.sampleRate*t.beatDur).exprand(~main2)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~eqBus2x,\loopy,0)],inf),
	/*Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+s.sampleRate*t.beatDur).exprand(~main3)}),\buf,~bufSnoopy,\out, ~toEq,\loopy,0)],inf),

*/
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur, ~lpPrec.numFrames/s.sampleRate /*Pseq([4/1],inf)*/, \tS,  0.39550810372374,\start,/*(~lpPrec.numFrames.rrand(140000)-140000)*/0,\buf,~lpPrec2,\out,~eqBus1 ,\loopy,0),



	/*  ].scramble,inf),*/
//PETIT ROMAN < WONT TAKE LONG RECORD LP ON MAIN1 for this one


		/*Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~gateBus,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2,~s1x,\quant2,~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),*/



	/*Pbind(\instrument,\EQHP, \in, ~toEq , \out,~gateBus3,
		\val,~s2,\quant,~q2, \gain,~g2,
		\val2,~s2x,\quant2, ~q2x, \gain2,~g2x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),*/




	/*Pbind(\instrument,\EQHP, \in, ~eqBus2x , \out,~gateBusB,
		\val, ~s3,\quant, ~q3, \gain,~g3,
		\val2,~s3x,\quant2,~q3x, \gain2,~g3x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),*/


	Pxrand([


		Pbind(\instrument, \gateX2,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in, ~gateBus3,\out,~revBus1,\group, ~gateGrp),




		Pbind(\instrument, \gate,\dur,Prand([Pseq([1/1],1),Pseq([3/1],1)],1), \tS, 0.39550810372374,\in, ~gateBusB,\out,~revBus2,\group, ~gateGrp,\vlSub,0.8,\vlSub2,Pkey(\vlSub)),



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
			/*Pwrand([*/   ~reverbBus,
\tS, 0.39550810372374


			/*,~reverbSquelch ],[4,1].normalizeSum,inf)*/,\group, ~gateGrp,
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

	/*Pbindf(  ~revL[~r1] ,\dur,inf, \in, ~reverbBus , \out, ~comFuzz ,\group,~revGrp),*/

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,80,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),*/


	/*Pbind(\instrument, \limiterStoMixer,\c2,1,\name, 2,\in, ~limitFuzz, \dur,inf,\gain,54,\group,~limitGrp,\out,~stereoBus1),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),


/*	Pbindf(  ~revL[~r2] ,\dur,inf, \in, ~revBus1 , \out, ~comBus1 ,\group,~revGrp),*/

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,80,\in, ~comBus1 ,\ctrl, ~kbus, \out,~limitBus1, \group, ~compGrp),
*/
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~sterBus1   ,\out,~no1, \group, ~stereoGrp,\center,Pfunc({0.1.rrand(-0.1)}),\tS, 0.39550810372374),


	/*Pbindf(  ~revL[~r3] ,\dur,inf, \in, ~revBus2 , \out, ~comBus2 ,\group,~revGrp),*/

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,80,\in, ~comBus2 ,\ctrl, ~kbus, \out,~limitBus2, \group, ~compGrp),*/

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~sterBus2   ,\out,~no1, \group, ~stereoGrp,\center,Pfunc({0.1.rrand(-0.1)}),\tS, 0.39550810372374),


],1)

)


//NO2 had downshifter
~mainLead.play(t)
Ppar([~base, ~mainLead],1).play(t,quant:1)
~mainLead.stop;
(~mainLead =

Ppar([
/*+s.sampleRate*t.beatDur*/


	//SUPER IMPORTNT ::: ( ~buf.numFrames.rrand(100000)- 100000)
/*Pbind( \instrument, \playBufX, \impulse, 0.321875,
		\dur,inf, \tS,  0.39550810372374,\start,~main1,\buf,~bufSnoopy/*~lpPrec2*/,\out, ~filterRnd,\loo,1) ,*/


	/*Pbind( \instrument, \playBufX, \impulse, 0.321875  /*Prand([0.01875,0.075],1)*/ ,
		\dur,inf, \tS,  0.39550810372374,\start,~main2,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,   ~gateRnd,\loo,1),*/



/*	Pbind( \instrument, \playBufX, \impulse,0.3218750 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,~main3,\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toGateFlo,\loo,1),*/


		/*Pbind( \instrument, \playBufX, \impulse,0.3218750 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,0,\buf,~lpPrec,\out, ~toGateFlo,\loo,1),*/

	Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~bufSnoopy,\out,~toGateFlo,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~main3, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, ~pDecT ,	\subsT,~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


	/*Pbind(\instrument, \gate,\dur,Pseq([64/1],inf) ,\in,Pseq([ ~reverbRnd,~filterRnd].scramble,inf),\out,~eqBus23/*~distoBus43*/,\group, ~lfoGrp,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),*/









	/*Pbind(\instrument,\EQHP, \in, /*~filterBus23*/ ~gateRnd, \out,~reverbMelo,
		\val, ~s3,\quant, ~q3, \gain,~g3,
		\val2, ~s3x,\quant2, ~q3x, \gain2,~g3x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),*/


	/*Pbind(\instrument,\EQHP, \in, ~filterBus23 , \out, ~distoBus43,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~distoBus43  , \out,~gateSeqRnd,\group,~revGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~gateSeqRnd  ,\ctrl, ~kbus, \out,~newBus1, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in,~newBus1 , \dur, inf,\gain,17,\group,~limitGrp,\out,~newBus2),

Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~newBus2  ,\out, ~no5, \group, ~stereoGrp),*/



/*	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus43 , \out,~eqBus23 ,\group, ~distoGrp0),*/

	/*Pbind(\instrument,\EQHP, \in, ~filterRnd , \out,~gateBus23,
		\val, ~s1,\quant, ~q1, \gain,~g1,
		\val2, ~s1x,\quant2, ~q1x, \gain2,~g1x
		,\frq, 100, \dur,inf, \group, ~eqGrp0),*/



	Pseq([
		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~distoGrp2,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,~micBus33),


Pbind(\instrument,\gate,\dur,Pxrand([ /*Pseq([1/4],1),*/Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~micBus33,\group, ~distoGrp2,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),


		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~distoGrp2, \out,Pwrand([~micBus23,~micBus33],[1,1].normalizeSum,inf),\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)/*Pfunc({0.1.exprand(0.01)})*/
	),



	].scramble,inf),



	Pxrand([


	Pbind(\instrument, \gateX2,\dur,Prand([Pseq([3/1],1),Pseq([1.5/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in,~toGateFlo ,\out,~toEqFlo,\group, ~gateGrp),


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


		/*	NO

			Pbind(\instrument, \gate, \dur, Pseq([1/4],16),
			\type,/* Pxrand([ Pseq([\note],256), */ Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,inf),/*Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), */\group, ~gateGrp,
\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})


			,\in, ~gateBus23, \tS, 0.39550810372374,\out,~reverbBus23),*/



		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,/*Prand([~micBus33,*/~reverbBus23/*],inf)*/),


Pbind(\instrument,\gate,\dur,Pxrand([ /*Pseq([1/4],1),*/Pseq([1/1],1)],1), \in,~gateBus23  ,\out, /*Pwrand([*/~micBus33/*,~reverbBus23],[1,1].normalizeSum,inf)*/,\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,/*Pwrand([~micBus23,~micBus33,*/~reverbBus23/*],[1,1,4].normalizeSum,inf)*/,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)/*Pfunc({0.1.exprand(0.01)})*/
	),



Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


				Pbind(\instrument, \gate ,\dur, Pseq([  Pseq([2/1 ],1), Pseq([0.75/1 ],1), Pseq([1/1],1)].scramble,1),
		\in,~main1GToG ,\group,~gateGrp2 ,\out,~reverbBus23,\vlSub,1,\vlSub2,Pkey(\vlSub),\tS, 0.39550810372374)


].scramble,1),


	],inf),





		/*Pbind(\instrument,\EQHP, \in, ~toEqFlo , \out,~toReverbFlo,
		\val,~s2,\quant, ~q2, \gain,~g2,
		\val2, ~s2x,\quant2, ~q2x, \gain2,~g2x
		,\frq, 100, \dur,inf, \group, ~gateGrp2),*/



/*	 Pbindf(  ~revL[~r2],\dur,inf, \in,~toReverbFlo  , \out,~toCompFlo,\group,~revGrp),*/

	// Pbind(\instrument, \lim2,\in,~toLim,\out,~toCompFlo,\group,~granGrp,\ml,0.1,\dur, inf),

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~toCompFlo ,\ctrl, ~kbus, \out,~toLimitFlo, \group, ~compGrp),*/

	/*Pbind(\instrument, \limiterStoMixer,\c5,1,\name, 4,\in, ~toLimitFlo, \dur, inf,\gain,32,\group,~limitGrp,\out,~toStereoFlo),*/




	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \center, Pfunc({0.1.rrand(-0.2)}),\in, ~toStereoFlo   ,\out, ~no3, \group, ~stereoGrp,\tS, 0.39550810372374),


/* Pbindf(  ~revL[~r1] ,\dur,inf, \in,~reverbBus23  , \out,~comFuzz23,\group,~revGrp),*/

	/*Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz23 ,\ctrl, ~kbus, \out,~limitFuzz23, \group, ~compGrp),*/

	/*Pbind(\instrument, \limiterStoMixer,\c6,1,\name, 5,\in, ~limitFuzz23, \dur, inf,\gain,52,\group,~limitGrp,\out,~stereoBus23),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out,~no3, \group, ~stereoGrp),


/*Pbindf(  ~revL[~r3],\dur,inf, \in, ~outFil , \out,~comBusHat2,\group,~revGrp),*/

/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~comBusHat2  ,\ctrl, ~kbus, \out,~comBusCymb2, \group, ~compGrp),*/

/*	Pbind( \instrument, \limiterStoMixer,\c7,1,\name, 6,\in,~comBusCymb2 , \dur, inf,\gain,40,\group,~limitGrp,\out,~limitRkick2),*/

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~limitRkick2   ,\out,~no3, \group, ~stereoGrp),

 ],1)

)


~sequ.play(t, quant:1)

~test =Ppar([/*~bassShap,Ppar([~kick ,~bass],inf),*/~base, ~percheur /*,~sequ,*/ /*~kb*/],1).play(t);
~percheur.stop;
(~percheur = //percheur



Ppar([



	/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc1, \tS, 0.39550810372374 ,
\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc1, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc2, \tS, 0.39550810372374 ,
\vlSub,  ~pSub2 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT2,/*\decT, ~pDecT2 ,*/	\subsT, ~pSubT2 , \relT,~pRelT2,\atckC,~pAtkC2,\decC,~pDecC2,\relC,~pRelC2,\vlAtk , ~pvlAtk2 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc2, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc3, \tS, 0.39550810372374 ,
\vlSub,  ~pSub3 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT3,/*\decT, ~pDecT3 ,*/	\subsT, ~pSubT3 , \relT,~pRelT3,\atckC,~pAtkC3,\decC,~pDecC3,\relC,~pRelC3,\vlAtk , ~pvlAtk3 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc3, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus4,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc4, \tS, 0.39550810372374 ,
\vlSub,  ~pSub4 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT4,/*\decT, ~pDecT4 ,*/	\subsT, ~pSubT4 , \relT,~pRelT4,\atckC,~pAtkC4,\decC,~pDecC4,\relC,~pRelC4,\vlAtk , ~pvlAtk4 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus4,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc4, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus5,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc5, \tS, 0.39550810372374 ,
\vlSub,  ~pSub5 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT5,/*\decT, ~pDecT5 ,*/	\subsT, ~pSubT5 , \relT,~pRelT5,\atckC,~pAtkC5,\decC,~pDecC5,\relC,~pRelC5,\vlAtk , ~pvlAtk5,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus5,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc5, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus6,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc6, \tS, 0.39550810372374 ,
\vlSub,  ~pSub6 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT6,/*\decT, ~pDecT6 ,*/	\subsT, ~pSubT6 , \relT,~pRelT6,\atckC,~pAtkC6,\decC,~pDecC6,\relC,~pRelC6,\vlAtk , ~pvlAtk6 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus6,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc6, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus7,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc7, \tS, 0.39550810372374 ,
\vlSub,  ~pSub7 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT7,/*\decT, ~pDecT7 ,*/	\subsT, ~pSubT7 , \relT,~pRelT7,\atckC,~pAtkC7,\decC,~pDecC7,\relC,~pRelC7,\vlAtk , ~pvlAtk7 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus7,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc7, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),

/*Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus8,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc8, \tS, 0.39550810372374 ,
\vlSub,  ~pSub8 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT8,/*\decT, ~pDecT8 ,*/	\subsT, ~pSubT8 , \relT,~pRelT8,\atckC,~pAtkC8,\decC,~pDecC8,\relC,~pRelC8,\vlAtk , ~pvlAtk8 ,  \vlRel,  Pkey(\vlAtk)),*/


Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus8,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc8, \tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999/*Pseq([24/1],inf)*/,\value, ~pHVal,\amp,1,\decT,~pHdecT,\out,~eqPerch, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \phaser,\in,~phaseBus2,\dur ,9999,\value,~pHVal2,\amp,1,\decT,~pHdecT2,\out,~eqPerch2, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch2 , \out,~eqPerch2,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch2 , \out, ~revPerch2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch2  , \out,~comPerch2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch2 ,\ctrl, ~kbus, \out,~limitPerch2, \group, ~compGrp),


	Pbind(\instrument, \phaser,\in,~phaseBus3,\dur ,9999,\value, ~pHVal3,\amp,1,\decT,~pHdecT3,\out,~eqPerch3, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch3 , \out,~eqPerch3,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch3 , \out, ~revPerch3,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch3  , \out,~comPerch3 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch3 ,\ctrl, ~kbus, \out,~limitPerch3, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus4,\dur ,9999,\value, ~pHVal4,\amp,1,\decT,~pHdecT4,\out,~eqPerch4, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch4 , \out,~eqPerch4,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch4 , \out, ~revPerch4 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch4  , \out,~comPerch4 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch4 ,\ctrl, ~kbus, \out,~limitPerch4, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus5,\dur ,9999,\value, ~pHVal5,\amp,1,\decT,~pHdecT5,\out,~eqPerch5, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch5 , \out,~eqPerch5,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch5 , \out, ~revPerch5 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch5  , \out,~comPerch5 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch5 ,\ctrl, ~kbus, \out,~limitPerch5, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus6,\dur ,9999,\value, ~pHVal6,\amp,1,\decT,~pHdecT6,\out,~eqPerch6, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch6 , \out,~eqPerch6,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch6 , \out, ~revPerch6 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch6  , \out,~comPerch6 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch6 ,\ctrl, ~kbus, \out,~limitPerch6, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus7,\dur ,9999,\value, ~pHVal7,\amp,1,\decT,~pHdecT7,\out,~eqPerch7, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch7 , \out,~eqPerch7,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch7 , \out, ~revPerch7 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch7  , \out,~comPerch7 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch7 ,\ctrl, ~kbus, \out,~limitPerch7, \group, ~compGrp),
	Pbind(\instrument, \phaser,\in,~phaseBus8,\dur ,9999,\value, ~pHVal8,\amp,1,\decT,~pHdecT8,\out,~eqPerch8, \group,~phaserGrp,\tS, 0.39550810372374 ,),
			/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch8 , \out,~eqPerch8,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP, \in, ~eqPerch8 , \out, ~revPerch8 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch8  , \out,~comPerch8 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch8 ,\ctrl, ~kbus, \out,~limitPerch8, \group, ~compGrp),

	/*	Pbind(\instrument, \limiterStoMixer,\c3,1,\name, 3,\in, ~limitPerch, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/
/*	Pbind(\instrument, \limiterStoMixer,\c31,1,\in, ~limitPerch2, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c32,\in, ~limitPerch3, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c33,\in, ~limitPerch4, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c34,\in, ~limitPerch5, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c35,\in, ~limitPerch6, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c36,\name, 3,\in, ~limitPerch7, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/

/*	Pbind(\instrument, \limiterStoMixer,\c37,\name, 3,\in, ~limitPerch8, \dur, inf,\gain,50,\group,~limitGrp,\out,~stereoPerch),*/


	Pbind(\instrument,\gate2, \dur,Pseq([Pseq ([Pseq([1/4],24) ],8),Pseq([Pseq([1/4],12)],8)].scramble,inf),\in,
		Pseq([~perchLimiToG,~perchLimiToG2,~perchLimiToG3,~perchLimiToG4,~perchLimiToG5,~perchLimiToG6,~perchLimiToG7,~perchLimiToG8].scramble,inf),	\out,~stereoPerch, \group,~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoPerch ,\spread,0.6  ,\center, Pfunc({0.80.rrand(-0.80)}), \out,~stetoSnaCom12, \group, ~dispatchGrp2 ,\tS, 0.39550810372374)


],1) )

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


	Pbind(\instrument, \filter,\which,0, \in ,~filterBou, \dur, inf ,\busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~gateBou, \group ,~filterGrp),

	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in, ~gateBou/*~dead*/, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \out , ~reverbBus4),
	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~reverbBus4  , \out,~comFuzz4 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1	,\in, ~comFuzz4 ,\ctrl, ~kbus, \out,~limitFuzz4, \group, ~compGrp),

	/*Pbind(\instrument, \limiterStoMixer,\c21,1,\name, 7,\in, ~limitFuzz4, \dur,inf,\gain,38,\group,~limitGrp,\out,~stereoBus14),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),




	Pbind(\instrument, \filter,\which,0, \in ,~filterPass1, \dur, inf ,\busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~eqPass1, \group ,~filterGrp),

	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in,~eqPass1, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \out , ~revPass1),
	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~revPass1  , \out,~compPass1 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1	,\in, ~compPass1 ,\ctrl, ~kbus, \out,~limitPass1, \group, ~compGrp),

	/*Pbind(\instrument, \limiterStoMixer,\c22,\in, ~limitFuzz4, \dur,inf,\gain,38,\group,~limitGrp,\out,~stereoBus14),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass1  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument, \filter,\which,0, \in ,~filterPass2, \dur, inf ,\busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~eqPass2, \group ,~filterGrp),

	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in,~eqPass2, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \out , ~revPass2),
	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~revPass2  , \out,~compPass2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1	,\in, ~compPass2 ,\ctrl, ~kbus, \out,~limitPass2, \group, ~compGrp),

	/*Pbind(\instrument, \limiterStoMixer,\c23,\in, ~limitFuzz4, \dur,inf,\gain,38,\group,~limitGrp,\out,~stereoBus14),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass2  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument, \filter,\which,0, \in ,~filterPass3, \dur, inf ,\busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~eqPass3, \group ,~filterGrp),

	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in,~eqPass3, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \out , ~revPass3),
	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~revPass3  , \out,~compPass3 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1	,\in, ~compPass3 ,\ctrl, ~kbus, \out,~limitPass3, \group, ~compGrp),

	/*Pbind(\instrument, \limiterStoMixer,\c24,\in, ~limitFuzz4, \dur,inf,\gain,38,\group,~limitGrp,\out,~stereoBus14),*/

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),



	Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~newCOn  ,\ctrl, ~snBus, \out,~comp10Pass,\group, ~compGrp2,\tS, 0.39550810372374),


/*Pbind(\instrument,\EQHP10, \in, ~comp10Pass ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,/*\val,13000,\quant,2, \gain,(-12),\val2,3100,\quant2,8, \gain2,(-8),*/\vol, 1.2),*/




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



Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([

//maybe add a limiter
		Pbind(\instrument, \pingD, \in, ~delayBus2 ,\bufnum, ~delayX, \feedback,0.33 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),


Pbind(\instrument, \limiterS , \in,~delayToLimit, \dur,inf, \gain,80,\group,~limitGrp4,\out , ~delayEq),

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~delayEq, \out,~delToStereo,\group, ~eqGrp3, \frq, 100,\vol,0.4),

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~delToStereo   ,\out,0,\spread,Pfunc({1.00.rrand(0.4)}), \group,~stereoGrp),

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
,\gain, 5,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp4),

	/*Pbind(\instrument, \limiterStoMixer,\c19,1,\name, 19,\in, ~limitSquelch, \dur, inf,\gain,20,\group,~limitGrp4,\out,~stereoBus3b),*/

	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3b   ,\out,~newCOn2,\spread,Pfunc({1.00.rrand(0.2)}), \group, ~stereoGrp4/*~stereoGrp*/),



	Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
				,\in, ~newCOn2  ,\ctrl, ~snBus, \out,~eqBus310,\group,~compGrp5/*~compGrp2*/,\tS, 0.39550810372374)
	,


	Pbind(\instrument,\EQHP10, \in, ~eqBus310 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp3/*~eqGrp2*/,\val,11800,\quant,1, \gain,(-18),\val2,2600,\quant2,8, \gain2,(-16),\vol, 1.8),
],1))



//new one

~base; ~kb; ~no4; ~rises; ~lp;~bp; ~hp;~deNo2; ~mainLead;~percheur;~passant
~base.play(t)/*~deNo2, */
~rises,
(~track = Ppar([~hitX,/*~kb,~fx,*/~passant,~base,~no4,~mainLead,~sequ],1).play(t,quant:1))

Pseq([~kick],inf).play(t, quant:1)
Ppar([~bassShap,Pseq([~bass],inf)],1).play(t, quant:1)
~track.play(t, quant:1)


~track.stop

(~track = Ppar([ ~base, ~kb ],1).play(t,quant:1))
s.plotTree
s.meter
FreqScope.new



(Pbind(\instrument, \recLoop10,\buf,~leTout,\recording,1, \in,~toCom,\group, ~recGrp2,\dur,inf).play(t, quant:1))


(Pbind(\instrument, \recLoop102,\buf,~leTout2,\recording,1, \in,0,\group, ~recGrp3,\dur,inf).play(t, quant:1))

1.


.numTicks_
//NO
// x = Synth(\recLoop10,[buf:~leTout,\recording,1, \in,~toCom],~recGrp2);//  this one

~leTout.free
~leTout.play
~bufBg.play
~buf.play
~bufSnoopy.play
~leTout2.play
s.meter
