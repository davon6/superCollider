
//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd
//free delay (too choped/gated)

//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!
// Percu Dynamic EQ not quiet right
//RISE add more filtering
//comp10 might be overlapping
//plop noise in bass
//bass has too much high, blocks leads
//start noise reverb volume breaks somestimes good sometimes buzzkill
//unsync stereo no4

//chelou low freq noise wander in the project

//where to add the delay/reverb +

//final delay browken


~audio3.play
~hat2.play
~buf.play
~bufSnoopy.play

(//MUST RUN  ( ~buf.numFrames.rrand(320000)- 320000)
~rythm= ~leTout.numFrames/256* 220.rand  ;
~rythmB= ~leTout.numFrames/256* 220.rand;
~main1= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983 ) ;
~main2 =   ( ~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983) ;
~main3= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983)  ;

	~pass1 =(~buf.numFrames.rrand(400000)- 400000);~pass2=(~buf.numFrames.rrand(400000)- 400000);~pass3=(~buf.numFrames.rrand(400000)- 400000);~pass4=(~buf.numFrames.rrand(400000)- 400000);
/*~mster= (~leTout.numFrames/ 256 * 226.rand);
~mster2= (~leTout.numFrames/ 256 * 226.rand);*/
~mster3= (~leTout.numFrames/ 256 * 226.rand);
~mster3=  (~leTout.numFrames/ 256 * 226.rand);
~bssFreq1= 1200.rrand(-140);~bssFreq2= 1200.rrand(-140);~bssFreq3= 1200.rrand(-140);
~r1= 3.rand;~r2= 3.rand;~r3= 3.rand;
~modHz=240.00.rand; ~carHz=140.00.rrand(10.00); ~noiLv=1.00.rrand(0.3); ~crv1=(-12.00).rrand(-4.00); ~crv2=(-12.00).rrand(-4.00); ~rel=0.0968.rrand(0.05); ~rel2=0.0968.rrand(0.05); ~modAmp=5000.00.rrand(1.00); ~modAmp2=5000.00.rrand(1.00);
~rythm1=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm2=[\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble; ~rythm3=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm4=[\rest,\rest,\rest,\note ,\note,\note ,\note, \rest].scramble;
	~rythmL = [\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble;


~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~no4S = ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000);





~ri1vlAtk=4.00.rand;~ri1f1=1.00.rand;~ri1f2=10.00.rrand(1);~ri1f3= 1.00.rand;~ri1ic_atk=10.00.rrand(-5);~ri1index=5.00.rrand(1);~ri1mRatio=3.rrand(1);~ri1fs=1.00.rand;
~ri2vlAtk=4.00.rand;~ri2f1=1.00.rand;~ri2f2=10.00.rrand(1);~ri2f3= 1.00.rand;~ri2ic_atk=10.00.rrand(-5);~ri2index=50.00.rrand(1);~ri2mRatio=3.rrand(1);~ri2fR=1.00.rand;
~ri3vlAtk=4.00.rand;~ri3f1=1.00.rand;~ri3f2=10.00.rrand(1);~ri3f3=1.00.rand;~ri3ic_atk=10.00.rrand(-5);~ri3index=50.00.rrand(1);~ri3mRatio=3.rrand(1);/*~ri3fR=1.00.rand*/




~perc1 = (~buf.numFrames.rrand(1400000)- 1400000);~perc2 = (~buf.numFrames.rrand(1400000)- 1400000);~perc3 = (~buf.numFrames.rrand(1400000)- 1400000);~perc4 = (~buf.numFrames.rrand(1400000)- 1400000);~perc5 = (~buf.numFrames.rrand(1400000)- 1400000);~perc6 = (~buf.numFrames.rrand(1400000)- 1400000);~perc7 = (~buf.numFrames.rrand(1400000)- 1400000);~perc8 = (~buf.numFrames.rrand(1400000)- 1400000);
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
~noiseFrq = 3000.rrand(180); ~noiseFrq2 = 3000.rrand(180); ~noiseFrq3 = 3000.rrand(180); ~noiseFrq4 = 2500.rrand(180);


~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");
// ~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated-01.wav");
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
~gateGrp10 = Group.after(~compGrp2);
~gateGrp6 = Group.after(~gateGrp10);
~eqGrp2 = Group.after(~gateGrp6);
~recGrp2= Group.after(~eqGrp2);
~gateGrp7 = Group.after(~recGrp2);
~extraDelay= Group.after(~gateGrp7);
~extraRev= Group.after(~extraDelay);
~compGrp4 = Group.after(~extraRev);
~eqGrp4 = Group.after(~compGrp4);
~limitGrp4 = Group.after(~eqGrp4);
~stereoGrp4 = Group.after(~limitGrp4);
~gateGrp11 = Group.after(~stereoGrp4);
~compGrp5 = Group.after(~gateGrp11);
~eqGrp3=Group.after(~compGrp5);
~stereoGrp5 = Group.after(~eqGrp3);
~recGrp3= Group.after(~stereoGrp5);



o = {


	Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));


	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));//DONT DELETE


	Out.kr(~bus14,SinOsc.ar(0.6).range(1.5,0.27));

	//super important for gran modu
	/*Out.kr(~bus18, /* Lag.kr(*/LFNoise0.kr(1.2875).range(0.15,0.0)/*,0.05)*/
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0,4))*/

}.play;

)


~base.play(t,quant:1)
(

~base = Ppar([


/*	Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp0,\dur,inf),

	Pseq([
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/4],16),\pitchRte,Pfunc({6.rrand(0.1)}),\impulse,0.03,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \busMod,~bus18 ),//16

		Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, ~k,\out,~no4ToGate,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],inf),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub),\pitchRte,Pfunc({8.rrand(0.1)}) ),],inf),*/



//??
/*	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1720, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),




//??
	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,0, \rL,(-0.38),\rH,0.38, \group, ~lfoGrp,\tS, 0.39550810372374),*/



	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus24 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,(-0.8),\rH,(-0.08), \group, ~lfoGrp,\tS, 0.39550810372374),*/

	/*Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus25 ,\dur,Pseq([4/1],inf),\ph,Pfunc({1.rand}), \rL,0.8,\rH,0.08, \group, ~lfoGrp,\tS, 0.39550810372374),*/





/*GOOD CONCEPT
	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp,\tS, 0.39550810372374),*/




	/*Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\modu, 0.001875 ,\ph,1.4),*/



	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

/*	Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~k2,\out, ~kbus,\loopy,0,\start,0),*/

	/*Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),*/


	/*Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 20,\group, ~limitGrp,\out,~snBus),*/


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),


/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 1/4,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~limitHat,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.001, \rel ,0.04840,\gain,3.5,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~limitCymb,\group, ~compGrp),


	Pbind(\instrument ,\EQHP2Dyna, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~delayGrp2, \out,~limitHat    ,\vol,4,\ctrl,~fusible10 ,\valD,3100, \quantD,4),

	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~delayGrp2,\out , ~limitCymb    ,\vol,4),

Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.3872,\ctrl,~snBus ,   \in, ~comFuzz22 ,\out,~toKbGate,\group,~eqGrp2),*/




	/*Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), \out , ~snareComp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.92 ,\sB, 1.04,\sA, 1/
		2,\atk ,0.0242, \rel ,0.12,\ctrl,~snBus ,   \in, ~snareComp ,\out,~snareLimit,\group,~compGrp),

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\out, ~toKbGate,\group, ~stereoGrp),*/

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
		/*Pbind(\instrument,\gateS, \dur,Pseq([4/1],16)
			,\in,Pseq([~percuCom2 ,~vocToDispatch,~percuCom2,~comSnaGrpBus2,/*~rndBus,~rndBus,*/~no2,~no2,~no2,~no2
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)*/


Pbind(\instrument,\gateS, \dur,Pseq([4/1],1)
			,\in,Pseq([/*~percuCom2 ,*/~vocToDispatch,~percuCom2,~comSnaGrpBus2,~tam,
				/*~rndBus,~rndBus,*/~no2/*,~no2,~no2,~no2*/
		].scramble,inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)


	].scramble,inf),


	//for record
/*Pbind(\instrument, \gateS, \dur,   Pseq([262/1],inf) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/




	Pseq([

		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,/*~toGate10*/0,\group,~gateGrp5),


//PASSANT DisAABLE FOR RISE INIT
		Pseq([
//maybe no rrepeat wiht this one
		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([6/1],1), \tS,  0.39550810372374,\start,~pass1 ,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([10/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([3/1],1), \tS,  0.39550810372374,\start, ~pass2,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start,~pass3,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\start,~pass4,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1),


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


	/*Pwrand([

	//here

Pbind(\instrument,\gateS, \dur, Prand([/* Pseq([4/1],4),Pseq([1/1],4),*/ Pseq([1.5/1],1), Pseq([3/1],1),/*Pseq([1/3],1) ,*/Pseq([1/1],1),
		/*Pseq([4/1],1)*/],1),
		\in, ~toGate10   ,\out ,Pwrand([0/*~eqBus10*/,

	~reverbSquelch],[16,1].normalizeSum,inf)

	,  \group, ~gateGrp6,\tS, 0.39550810372374),

Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),
		\in, ~toGate10 ,\out ,~delayBus2 ,\group, ~gateGrp6,\tS, 0.39550810372374),


			Pbind(\instrument,\gateS, \dur, Pseq([2/1],1),\tS, 0.39550810372374,\type,\rest)

			],1)
	],[16,1].normalizeSum,  inf),*/

],1))

s.scope
Ppar([~base, ~kb],1).play(t,quant:1)
~kb.play(t);
.stop
(~kb =
Ppar([

		Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),




	Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.05,\tS,  0.39550810372374),

	Pbind(\instrument,\kick,\dur,Prand([ Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1) ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.003,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte, (-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.04,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.001,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.003,\pos,0.04,\tS,  0.39550810372374)


	],inf),


	Pbind(\instrument, \gate ,\vlSub,1,\vlSub2, Pkey(\vlSub),\dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out,Prand([~lpK,~bpK,~hpK],inf),\tS,  0.39550810372374),


	Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 30, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],inf), \out,~dipatchKB, \freq,Prand([/*~bssFreq3,*/~bssFreq1,~bssFreq2],inf), \group,~shifGrp,\tS, 0.39550810372374,\vl,Pseq([1,1],inf)),

	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,100,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
	],1),


	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),




		Pbind(\instrument, \playBuf,  \tS,  0.39550810372374, \rte, (-4.4),	\buf,~snare,\type,
		Pwrand([Pseq([\note ,\rest,\rest,\rest] ,1),Pseq([\rest ,\note,\rest,\rest] ,1),

			Pseq([\rest ,\rest,\rest,\rest] ,1)

	],[1,1,128].normalizeSum,inf),\dur, Pseq([1/2], inf),\out,~snareEQ),

	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,	\buf,~snare,\type,
		Pwrand([Pseq([\note ,\rest,\note,\rest],1), Pseq([\rest ,\rest,\rest,\rest],1) ],[2,1,32].normalizeSum,inf)  ,\dA,Pseq([0.25],inf),\dur, Pseq([1/2], inf),\out,~snareEQ),

	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,
		\type,
		Pseq([


				Pseq([\rest ,\rest,\note,\rest,\rest,\note,\rest,\rest,
						\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,

					],4),
		Pseq([
				Pseq([\rest ,\rest,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
						\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest,
						\rest,\rest,\rest,\rest,\rest,\rest,\note,\rest
					],1),
   Pseq([\rest ,\rest,\note,\rest] , 88),//was 96
				Pseq([\rest,\rest,\rest,\rest],32)].scramble,1),    Pseq([\rest,\rest,\rest,\rest ],128),    Pseq([\rest,\rest,\note,\rest ],128)],inf)//l embrouille
	,\dur, Pseq([1/2], inf) ,\out,~snareEQ,
	\dA,Pseq([  Pseq([1],32), Pseq([0.5],32)],inf)),


//for future
	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],256) ],inf),\dur,Pseq([1/4],inf ),\stereoL, 0.00555,\out,    ~cymbalEq),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~hatEq,\type, Pseq([ Pseq([ \note],768),Pseq([\rest],256)],inf))
	,




	/*	Pbind(\instrument, \percussion ,\dur,Pseq([1/4],inf ),
		\carHz, 525.12070612224.rrand(0.01),
		\modHz,11899.3343179398.rrand(0.001),
		\modAmp, 0.12875.rrand(0.000001).postln ,
		 \crv1,  (-14.4).rrand(-1),
		\crv1b,(-4),
		\mulMod, 1691,

		\amp,1,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),
		\latch,8000,
		\stereoL, 0.00555,\out,   ~cymbalEq,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],128) ],inf)),




Pbind(\instrument,\percussion,\dur,Pseq([1/4], inf),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,1, \crv1, (-3), \crv1b, (-5),
		\modHz, exprand(500,10000).postln,
		\mulMod, rrand(100, 500).postln,
		\carHz, exprand(20,10000),
		\modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,   ~hatEq,
		\amp,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf)
	),*/











	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~kb2,\out, ~toKbGate,\loopy,0),


Pseq([
	Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),

		Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythmB,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),



],inf),


	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,1600,\val2,(-40),\crv,-3.2),


	Pbind(\instrument, \filter10,\freqFil,600 ,\busMod,~bus21 ,\in,~rythmFil,\which,0,\qf,0.75, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),

	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~rythmLimit, \group,~eqGrp,\vol,4,\val,320,\quant,4, \gain,(-16)),

/*	Pbind(\instrument, \limiter10toMixer,\c20,1,\name,30, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,40, \group, ~limitGrp),*/

	Pbind(\instrument,\comp10, \dur,inf,\thr,0.9 ,\sB, 1.08,\sA, 1/2,\atk ,0.001, \rel ,0.3872,\dur,99999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, ~toKbGate,\group, ~compGrp2 ,\tS, 0.39550810372374),


	Pseq([
	/*Pseq([*/

		Pseq([
Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([15/1],1)),


			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
			\dur, Pseq([1/1],1))].scramble,1),
			],1),

			].scramble,1),

	Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3/*~gateGrp7*/, \tS,  0.39550810370174,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~eqGrp3, \tS,  0.39550810370174,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810370174),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK],inf), \group, ~gateGrp7, \tS,  0.39550810370174,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([8/1],1)),

						Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
			\dur, Pseq([8/1],1))].scramble,1),
					],1),

		/*].scramble,4),*/


		//all new perspective
	/*	Pseq([*/
		Pseq([
		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([31/1],1)),

		Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),
						],1),

				].scramble,1),
		Pseq([
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810370174,
			\dur, Pseq([4/1],1)),

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),	].scramble,1),

		Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([3/1],1)),

			Ppar([
			Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))
				],1),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([11/1],1)),
			Ppar([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))
				],1)
		],1),






	/*	].scramble,4),*/




/*		Pseq([*/
		Pseq([

			Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

									Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))
									],1),

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

										Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),
										],1),

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([7/1],1)),

											Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))
											],1),

			].scramble,1),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([6/1],1)),

												Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1))
												],1),

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([4/1],1)),


					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
				Pbind(\instrument,\gate2, \in ,Prand([~to4bar,~rollingK],inf), \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),


				Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1))

			].scramble,1),


			//trying

			Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([7/1],1)),

														Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1))
														],1),

			].scramble,1),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([6/1],1)),

															Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
					Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1))
															],1),

			].scramble,1),

				Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([4/1],1)),

				Pbind(\instrument,\gate2, \in ,Prand([~to4bar,~rollingK],inf), \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1)),

				Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([2/1],1))

			].scramble,1),


		/*].scramble,4)*/

	].scramble,4),

		Pseq([
Pseq([
			Pbind(\instrument,\gate2, \group, ~eqGrp3, \tS,  0.39550810370174,\in,~rollingK,
		\dur, Pseq([31/1],1)),

				Pbind(\instrument,\gate2, \in ,~dipatchKB2, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),

					].scramble,1),

			Pseq([
			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810370174,
			\dur, Pseq([4/1],1)),
															],1),

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),
				].scramble,1),



			Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([15/1],1)),

																Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),],1),


				].scramble,1),



Pseq([
				Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([12/1],1)),

			Pbind(\instrument,\gate2, \in ,~to4bar, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([4/1],1)),
			].scramble,1),




Pseq([

					Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([15/1],1)),

																		Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~dipatchKB2, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([1/1],1)),


			],1),

			].scramble,2),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~eqGrp3, \tS,  0.39550810370174,
		\dur, Pseq([16/1],1)),






		].scramble,2),

],inf),





	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/







	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1))

Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus2 ,\dur,999,\ph,0, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),

	/*Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([16/1],inf),\ph,1.4, \rL,500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,Pseq([3/1],inf),\group,~lfoGrp ,\frq,Pfunc({5.15.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2Eq,\group, ~distoGrp0),



	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp,\tS, 0.39550810372374),


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374),


//no limiter
/*	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({(~leTout.numFrames/ 256 * 222.rand)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),*/

	Prand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
\vl,0.162
	),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],inf),


	/*Pbind(\instrument,  \stereoS, \in,~vocToStereo,  \out,~vocToDispatch , \dur,9999, \spread, 0.8.rrand(0.1),\tS,  0.39550810372374,\group,~stereoGrp),*/


//rythm needs to evolve
Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out, ~distoPercu/*~no4ToGate2*/

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),


	/*Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out,~micBus

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),*/



	/*Pbind(\instrument, \gate, \vlSub,1,\vlSub2, Pkey(\vlSub),\dur,Pseq([4/1],inf),\tS, 0.39550810372374,\out,~distoPercu,\in,Prand([~no4ToGate2,~no4ToGate],inf),\group,~phaserGrp),*/

	/*Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({~spread = 1.rand}),\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,~panning = 0.1.rrand(-0.1),\modPan, ~bus24),*/

	/*Pbind(\instrument,\stereoX1, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,1,\out,~percuCom2,\tS, 0.39550810372374,\group, ~stereoGrp, \center,0.3,\modPan, ~bus25),*/


],1))

(~track = Ppar([ ~base, ~hitX, ],1).play(t,quant:1))


/*BELL EXAMPLE MEASURE

Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,0 /*~bellFlang*/,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)*/

~hitX.play(t)
~hitX.stop;
(~hitX=

Ppar([


	//??
	Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([16/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([16/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),
//



		Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([16/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1300,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,700,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,700,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

		Pbind(\instrument, \envSli, \val1,50, \val2, 5600, \dur, Pseq([1/1],inf),\out, ~bus8,\tS, 0.39550810372374),


	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\modu,

		0.001875/**4*/,\ph,1.42),


	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~bus27,\rL,1700 ,\rH,4200,\modu,

		0.001875/**4*/,\ph,1.42),







/*
	Pbind(\instrument, \sinModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\lS,0 ,\hS,1200,\modu, 0.001875*2 ,\ph,1.4),*/

		Ppar([

			/*Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,~ri1vlAtk ,\f1, ~ri1f1 , \f2, ~ri1f2 , \f3,~ri1f3,  \ic_atk,~ri1ic_atk,\index,~ri1index,\mRatio,~ri1mRatio,\out ,~bellFlang2,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\atk,1, \fS,~ri1fs),*/




		Pbind(\instrument,\rise,\dur,Pseq([16/1],inf), \vlAtk,0,\f1, 0.004 , \f2,0.001, \f3,0.00001,  \ic_atk,-3,\index,151,\mRatio,5,\out ,~flanToDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),

		/*Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk, ~ri2vlAtk,\f1, ~ri2f1 , \f2, ~ri2f2 , \f3, ~ri2f3,  \ic_atk,~ri2ic_atk,\index,~ri2index,\mRatio,~ri2mRatio,\out ,Prand([~bellFlang4, ~riToDisto2],inf),\tS, 0.39550810372374, \fR,~ri2fR, \moduR,~mod1,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/
	//~bellFlang4
		Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk,-1 ,\f1, 0.001 , \f2, 0.03 , \f3,0,  \ic_atk,4,\index,9,\mRatio,1,\out ,~riToDisto2,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),

/*Pbind(\instrument,\rise,\dur,Pseq([1/1],inf/*64*/),\vlAtk, ~ri3vlAtk,\f1, ~ri3f1 , \f2, ~ri3f2 , \f3, ~ri3f3,  \ic_atk,~ri3ic_atk,\index,~ri3index,\mRatio,~ri3mRatio,\out ,Prand([~bellFlang3, ~riToDisto3],inf),\tS, 0.39550810372374,
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/

		Pbind(\instrument,\rise,\dur,Pseq([1/1],inf), \vlAtk,0 ,\f1, 0.01 , \f2, 0.3 , \f3,0.01,  \ic_atk,4,\index,140,\mRatio,0.1,\out ,~bellFlang3,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })


],inf),


Pseq([
		Pseq([
					Ppar([

				Pxrand([

							Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
					/*	Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/



			Pbind(\instrument, \playBufS,\buf,~bell2,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([8/1],1 ),\vl,1 )
						],1),



				Pbind(\instrument,\filterX,  \freqFil,~noiseFrq,\in,~filterNoise,\out, ~noiseToMixA, \group,~filterGrp,\dur, Pseq([8/1],1),\tS, 0.39550810372374)],1),





			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([56/1],1),\tS, 0.39550810372374 )


		],1),

		Pseq([
			Pxrand([
				Pseq([
					Ppar([

				Pxrand([

							Pbind(\instrument, \wNoise,\dur, Pseq([3/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),


						/*	Pbind(\instrument, \percussion, \dur,Pseq([3/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/
							Pbind(\instrument, \playBufS,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([3/1],1))

							,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],3) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
						],1),

				Pbind(\instrument,\filterX,  \freqFil,~noiseFrq2,\in,~filterNoise,\out, ~noiseToMixB, \group,~filterGrp,\dur, Pseq([4/1],1),\tS, 0.39550810372374)],1),

					Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([13/1],1),\tS, 0.39550810372374 )
				],1),

Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),
			],1),

			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([48/1],1),\tS, 0.39550810372374 )

		],1),

		Pseq([


			Ppar([
				Pxrand([

						Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise),
						/*Pbind(\instrument, \percussion, \dur,Pseq([2/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}))*/


Pbind(\instrument, \playBufS,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([2/1],1))

					,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/2],4) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)

				],1),
			Pbind(\instrument,\filterX,  \freqFil,~noiseFrq3,\in,~filterNoise,\out, ~noiseToMixC, \group,~filterGrp,\dur,Pseq([2/1],1),\tS, 0.39550810372374,\vol,0.7)],1),


			Pbind(\instrument, \gateS, \group,~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([62/1],1),\tS, 0.39550810372374 )
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
						/*Pbind(\instrument, \percussion, \dur,Pseq([1/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),*/


						Pbind(\instrument, \playBufS,\buf,~bell2,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),



						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],1) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~bangLimit,\loopy,0,\vl,0.25)
				],1),
				Pbind(\instrument,\filterX,  \freqFil,~noiseFrq4,\in,~filterNoise,\out, ~noiseToMixD, \group,~filterGrp,\dur,Pseq([1/1],1),\tS, 0.39550810372374)],1),

/*	Pbind(\instrument, \wNoise,\dur,Pseq([15/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 ),


		Pbind(\instrument, \wNoise,\dur,Pseq([48/1],1),\dec ,Pkey(\dur),\type,\rest,\tS, 0.39550810372374 )*/
			Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),








/*Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374, \fR,Pfunc({1.00.rand}), \moduR,~mod1,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),*/


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk,0.4,\f1, 1 , \f2,1, \f3,0.001,  \ic_atk,4,\index,1,\mRatio,3,\out ,~riToDisto,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })

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

/*	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo3  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~riToGate2,\tS, 0.39550810372374,\group, ~stereoGrp),


Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo2  ,\spread,0.2,\out,~riToGate3,\tS, 0.39550810372374,\group, ~stereoGrp),*/





	Pbind(\instrument, \gateS, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],inf), \in,Prand([~riToGate,~riToGate3,~riToGate2],inf)  ,\out,~risesGate , \group,~dispatchGrp2,\tS, 0.39550810372374,),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo2  ,\spread,0,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~noiseToStereo ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus4   ,\out, ~gateRise, \group, ~stereoGrp),


Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

	Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~slideBusToStereo  ,\spread,0.4,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~toStereoRise  ,\spread,0.1,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

		Prand([
		Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,
			Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note,

				\note,\note,\rest,\rest,\note,\note,\note,\rest
			],inf),
		\in,  ~gateRise ,\out ,~toGate102,\group, ~gateGrp10,\tS, 0.39550810372374),


		Pbind(\instrument,\gateS, \dur,Pseq([3/1],1),\in, ~gateRise  ,\out ,~toGate102 ,\group, ~gateGrp10,\tS, 0.39550810372374),
				],inf)

],1);
)

~sequ.play(t)
~t = Ppar([~base, ~sequ],1).play(t,quant:1)
.stop
(
~sequ =
Ppar([

	Pbind(\instrument, \lfoSin, \out, ~bus15, \dur, 9999, \group, ~lfoGrp),

Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 100000,\tS, 0.39550810372374,\loo,0),


	Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,581638.18770068, \tS, 0.39550810372374 ,
	\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loo,0),

	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~eqBus2x,\impulse,0.003,\start, 0,\tS, 0.39550810372374,\loo,1),

/*Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+s.sampleRate*t.beatDur).exprand(~main2)}),\buf,~bufSnoopy/,\out, ~eqBus2x,\loopy,0)],inf),*/

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
   ~reverbBus, \tS, 0.39550810372374,\group, ~gateGrp,\atkC,9.00.rrand(2),	\atkT,1, \decT,0),

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
\in,~gateBus ,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus),

	],inf),

	/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),*/

	/*Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~sterBus2   ,\out,~no1, \group, ~stereoGrp,\center,0,\tS, 0.39550810372374),
*/

],1)

)

~mainLead.play(t)
Ppar([~base, ~mainLead],1).play(t,quant:1)
~mainLead.stop;
(~mainLead =

Ppar([



	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),



	Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, ~f2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,0.8,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),









	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~filterRnd,\impulse,0.003,\start, 600000,\tS, 0.39550810372374 ,\loo,1),



	Pseq([
		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~distoGrp2,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~micBus33),


Pbind(\instrument,\gate,\dur,Pxrand([ /*Pseq([1/4],1),*/Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~micBus33,\group, ~distoGrp2,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),


		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~distoGrp2, \out,Pwrand([~micBus23,~micBus33],[1,1].normalizeSum,inf),\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)),

	].scramble,inf),

	Pxrand([

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

		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~micBus33,\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~reverbBus23,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)),



Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


				Pbind(\instrument, \gate ,\dur, Pseq([  Pseq([2/1 ],1), Pseq([0.75/1 ],1), Pseq([1/1],1)].scramble,1),\in,~main1GToG ,\group,~gateGrp2 ,\out,~reverbBus23,\vlDec,4.5,\vlSub,4.5,\vlAtk,3.5, \vlSub2,Pkey(\vlSub),\tS, 0.39550810372374)


].scramble,1),


	],inf),


/*	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \center, Pfunc({0.1.rrand(-0.2)}),\in, ~toStereoFlo   ,\out, ~no3, \group, ~stereoGrp,\tS, 0.39550810372374),*/


	/*Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out,~no3, \group, ~stereoGrp),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~limitRkick2   ,\out,~no3, \group, ~stereoGrp),*/

 ],1)

)


/*~t = Ppar([~passant, ~base],1).play(t,quant:1);
~passant.play(t);
.stop
(~passant=

	Ppar([
	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass1  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass2  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,~newCOn, \group, ~stereoGrp),],1);

	)*/



Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([

//maybe add a limiter
	/*	Pbind(\instrument, \pingD, \in, ~delayBus2 ,\bufnum, ~delayX, \feedback,0.43 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),*/

		/*Pbind(\instrument, \del ,\in, ~delayBus2 ,\dur, inf,\out,~delayToLimit,\group,~extraDelay),



	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~delayEq, \out,~delToStereo,\group, ~eqGrp3, \frq, 300,\vol,0.4),*/

	Pbind(\instrument,\stereoS, \dur,Pseq([8/1],inf), \in, ~delToStereo   ,\out,~toCom,\spread,1, \center, Prand([ Pfunc({0.8.rrand(0.4)}),Pfunc({-0.8.rrand(-0.5)})],inf),\group,~stereoGrp4,\tS, 0.39550810372374),


	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus3b   ,\out,~tofinalRythm,\spread,1, \group, ~stereoGrp4),



	/*Pbind(\instrument,\comp10, \dur,9999,\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872
	,\in, ~newCOn2  ,\ctrl, ~snBus, \out,~eqBus310,\group,~compGrp5,\tS, 0.39550810372374)*/

],1))
Ppar([~kb,~pedonk],1).play(t)
~pedonk.play(t)
.stop
(~pedonk =Ppar([

	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 100000,\tS, 0.39550810372374 ,\vlSub,  1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,0,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



	Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
		~eqBus2x,\impulse,0.003,\start, 600000,\tS, 0.39550810372374,\loo,1),

//rework something harmonieu
	Pbind(\instrument,\playBufXG,\dur, Pseq([Pseq([1/8],2), Pseq([1/4],1),Pseq([1/2],1),Pseq([1.25/1],1) ].scramble,inf),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,461638.18770068, \tS, 0.39550810372374 ,\loopy,0,\vlDec,Pseq([ Pseq([1],98), Pseq([0.5],32)],inf)    ),


Pwrand([
		Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([Pseq([2.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBusB,\tS, 0.39550810372374,\group, ~gateGrp,\out, ~revBus2),

	Pwrand([

			Prand([
	Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),

				Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
					Pseq([1/4],6)  ,Pseq([1/4],5)],1),\type, Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note],inf),
				\in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),
			],1),

			Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1)],[1,2].normalizeSum,5)

	],[2,8].normalizeSum,inf),

	Pwrand([
	Pbind(\instrument,\gateS, \in,~deadS, \out,0, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),
		Pbind(\instrument,\gateS, \in,~no1, \out,  ~part2Fuzz, \group,~dispatchGrp2,\dur,Pseq([7.75/1],1),\tS, 0.39550810372374  ),

	],[1,16].normalizeSum,inf),


	Pseq([

		Prand([
		Pbind(\instrument,\playBufXG, \dur,Pseq([3.75/1],1),\amp, 1,\buf,~lpPrec,\out,~eqBus4,\impulse,0.003,\start,~st2 ,\tS, 0.39550810372374,\vlDec,~pSub ,\vlSub,  ~pSub,\vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT+0.14 ,	\subsT, ~pSubT+0.1 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )


		],inf),

				Pbind(\instrument,\gateS, \in,~part2Fuzz, \out,~absoFinalGate, \group,~gateGrp3,\dur, Pseq([56.5/1],1),\tS, 0.39550810372374  ),    // was 60.25 -3.75



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )

		],inf)
],1))


(Pbind(\instrument, \recLoop102,\buf,~leTout,\recording,1, \in,0,\group, ~recGrp3,\dur,inf).play(t, quant:1))

(Pbind(\instrument, \recLoop102,\buf,~leTout2,\recording,1, \in,~absoFinalGate2,\group, ~recGrp3,\dur,inf).play(t, quant:1))


~leTout.free
~leTout.play
~bufBg.play
~buf.play
~bufSnoopy.play
~leTout2.play

s.scope

