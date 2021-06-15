//\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\val5,0,\shelf2,0, \gain5,0,

//Eq default out must be reverb in first line, enhance workflow


//watch out shelf2 variables not inits

~eq49=Synth(\EQHP96,[\frq, 100],~eqGrp0);
~eq49.set(\in, ~eqBus4 , \out,~revBus4,\val, ~val,\quant, ~quant, \gain,~gain,\val2,~val2,\quant2,~quant2, \gain2,~gain2,\val3,~val3,\quant3,~quant3, \gain3,~gain3,\val4,~val4,\shelf,~shelf, \gain4,~gain4,\val5,1900,\shelf2,1.3, \gain5,(-12));
~rev49=Synth( \reverb ,~revRnd[1],~revGrp);~rev49.set(\in, ~revBus4 , \out, ~comBus4,\mix, 0.25);
~comp49=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp49.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,10,\in, ~comBus4,\out,~part2Limit4);
~mix49= Synth(\limitertoMixer,[\c49,1,\in,~part2Limit4 , \gain,8,\out,~sterBus4],~limitGrp);
// ~mixa.set(\in,~sterBus4);
 ~mix49.set(\gain,~gainMix);
~stereo49= Synth(\stereoO,[  \in, ~sterBus4   ,\out,0/*~absoFinalGate*/, ], ~stereoGrp);
~stereo49.set(\spread,0,\center,-0.1,\dlt1,0,\dlt2,0,\decT,0, \mxDel,1);




// ~mixa.set(\in,~no1);

// ~eq2.free

// ~playLp.free
~playLp=Synth(\playBufXs,[\buf, ~lpPrec2, \impulse, 0.080475,\out,~eqBus1,\start,1800000]);
~playLp.set(\start,600000);
~eq2=Synth(\EQHP96, [\frq, 100,\out, ~reverbBus],~eqGrp0);
~eq2.set(\val, 20000,\quant, 4, \gain,(-24),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,6700,\shelf,1, \gain4,(-12),\val5,1900,\shelf2,1, \gain5,(-30),\in, ~eqBus1 ,\out,~gateBus,\frq, 210);
~rev2=Synth( \reverb ,~revRnd[2],~revGrp);~rev2.set( \in, ~reverbBus , \out, ~comFuzzy);
~comp2=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp2.set(\thr,0.42 ,\sB, 1.06,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,25,\in, ~comFuzzy,\out,~limitFuzz);
~mix2= Synth(\limitertoMixer,[\c2,1,\in, ~limitFuzz, \gain,20,\out,~stereoBus1],~limitGrp);
~mix2.set(\gain,36.7);
~stereo2= Synth(\stereoO,[\in, ~stereoBus1   ,\out,~no1,],~stereoGrp);
// ~stereo2.set(\spread,0,\center,1,\dlt1,0.01,\dlt2,0.02,\decT,0, \mxDel,0);
~stereo2.set(\spread,0,\center,0,\dlt1,0.19,\dlt2,0.2,\decT,0.0121, \mxDel,1);

// ~eq3.free


/*Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out, ~toEq,\impulse,0.03,\busMod,~bus6
,\start,Pfunc({~lpPrec.numFrames.rand})).play(t)*/


~eq3=Synth(\EQHP96, [\frq, 100, \out,~revBus1],~eqGrp0);
~eq3.set(\in, ~toEq ,\out,~gateBus3,\val, ~val=1850,\quant, ~quant=2, \gain,~gain=(-12),\val2,~val2=270,\quant2,~quant2=1, \gain2,~gain2=(-20),\val3,~val3=3700,\quant3,~quant3=1, \gain3,~gain3= (-13),\val4,~val4=1400,\shelf,~shelf=1, \gain4,~gain4=(-35),\val5,1900,\shelf2,1.3, \gain5,(-12),\vol,1,\frq, 100);
~rev3=Synth( \reverb ,~revRnd[1],~revGrp); ~rev3.set(\in, ~revBus1 , \out, ~comBus1,\mix, 0.25);
~comp3=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp3.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comBus1, \out,~limitBus12);
~mix3= Synth(\limitertoMixer,[\c3,1,\in, ~limitBus12,\gain,10,\out,~sterBus1],~limitGrp);
 ~mix3.set(\gain,~gainMix=75.4,\out,~sterBus1);
~stereo3= Synth(\stereoO,[  \in, ~sterBus1   ,\out,~no1, ], ~stereoGrp);
~stereo3.set(\spread,0,\center,-0.1,\dlt1,0,\dlt2,0,\decT,0, \mxDel,1);
/*~stereo3b= Synth(\stereoO,[  \in, ~sterBus1   ,\out,~no1b, ], ~stereoGrp);
~stereo3b.set(\spread,0,\center,0,\dlt1,0.08,\dlt2,0,\decT,0.0242, \mxDel,1);*/

//herebelow
//~eq4.free

~playBp=Synth(\playBufXs,[\buf, ~lpPrec3, \impulse, 0.080475,\out,~eqBus2x]);
~playBp.set(\start,30000,\out,~eqBus2x);
~eq4=Synth(\EQHP96, [\frq, 100, \out, ~revBus2],~eqGrp0);
~eq4.set(\in, ~eqBus2x,\out,~gateBusB,\val, 1800,\quant, 1, \gain,(-15),\val2,5200,\quant2,1, \gain2,(-12), \val3,2800,\quant3,1, \gain3,(-6.2),\val4,6000,\shelf,1.2, \gain4,(-11),\val5,2200,\shelf2,1.1, \gain5,(-18));
~rev4=Synth( \reverb ,~revRnd[1],~revGrp); ~rev4.set(\in, ~revBus2 , \out, ~comBus2);
~comp4=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp4.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,4,\in, ~comBus2, \out,~limitBus2);
~mix4= Synth(\limitertoMixer,[\c4,1,\in, ~limitBus2,\gain,2,\out,~sterBus2],~limitGrp);
~mix4.set(\gain,42);
~stereo4= Synth(\stereoO,[  \in, ~sterBus2, \out,~no1/*~no3*/], ~stereoGrp);
//main2
~stereo4.set(\spread,0,\center,0,\dlt1,0.35,\dlt2,0.34,\decT,0.0121, \mxDel,1);


~playBp22=Synth(\playB10,[\buf, ~lpPrec32, \impulse, 0.019753071875,\out,~no41]);
~playBp23=Synth(\playB10,[\buf, ~lpPrec33, \impulse, 0.019753071875,\out,~no51]);

//~del10=Synth(\del10,[\in,~toDelay10,\decT,1.5544,\out,0],~delayGrp);


// ~mixa.set(\in,~no3);

~playBp2=Synth(\playBufXs,[\buf, ~lpPrec3, \impulse, 0.080475,\out,~filterRnd]);
~playBp2.set(\start,2100000,\out,~filterRnd);
//~eq5.free
~eq5=Synth(\EQHP96, [\frq, 100, \out, ~reverbBus23],~eqGrp0);
~eq5.set(\in, ~filterRnd,\out,~gateBus23,\val, 1800,\quant, 1, \gain,(-15),\val2,5200,\quant2,1, \gain2,(-12), \val3,2800,\quant3,1, \gain3,(-6.2),\val4,6000,\shelf,1.2, \gain4,(-11),\val5,2200,\shelf2,1.1, \gain5,(-18));
~rev5=Synth( \reverb ,~revRnd[1],~revGrp); ~rev5.set(\in,~reverbBus23  , \out,~comFuzz23);
~comp5=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp5.set(\thr,0.88 ,\sB, 1.016,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,4,\in, ~comFuzz23, \out,~limitFuzz23);
~mix5= Synth(\limitertoMixer,[\c5,1,\in, ~limitFuzz23, \gain,0.3, \out,~stereoBus23],~limitGrp);
~mix5.set(\gain,42,\out,~stereoBus23);
~stereo5=Synth(\stereoO,[\in, ~stereoBus23,\out,~no3], ~stereoGrp);
~stereo5.set(\spread,0,\center,0,\dlt1,0.35,\dlt2,0.34,\decT,0.0121, \mxDel,1,\out,~no3);



//fromhereabove
/*~playM2=Synth( \playBufX, [\impulse, 0.321875/4, \start,~main3,\buf,~bufSnoopy,\out,  ~toEqFlo,\loo,1]);
~eq6= Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq6.set(\in, ~toEqFlo , \out,~toGateFlo,\val,600,\quant, 6, \gain,(-18),\val2, 7000,\quant2, 4, \gain2,(-20));
~rev6=Synth( \reverb ,~revRnd[~r2],~revGrp); ~rev6.set(\in,~toReverbFlo, \out,~toCompFlo);
// ~lim=Synth( \lim2,[\in,~toLim,\out,~toCompFlo,\ml,0.1], ~eqGrp);~lim.set(\ml,0.4,\out,0);
~comp6=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp6.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~toCompFlo, \out,~toLimitFlo);
~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~toLimitFlo, \gain,35, \out,~toStereoFlo],~limitGrp);
// ~mixa.set(\in,~toStereoFlo);
~mix6.set(\gain,60);*/

// 1101232.9643174

//~main1=~main1+10000
// ~main1= ~bufSnoopy.numFrames.rrand(80000)- 80000  ;
~playM=Synth( \playBufX, [\impulse, 0.321875, /*\start,~main1,*/\buf,~bufSnoopy,\out, ~gateRnd,\loo,0]);
~playM.set( \start,929658,\impulse,0.321875);
// ~main3= (~bufSnoopy.numFrames.rrand(s.sampleRate*16*t.beatDur)- s.sampleRate*16*t.beatDur)  ;
// ~eq7.free    ~playM.free
// ~playM.set(  \start,~main3);
~eq7=Synth(\EQHP96, [\frq, 100, \out, ~outFil],~eqGrp0);
~eq7.set(\in, ~gateRnd,\out,~reverbMelo,\val, 0,\quant, 0, \gain,(-0),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,1900,\shelf,1.3, \gain4,(-12),\frq, 220,\val5,1900,\shelf2,1.1, \gain5,(-15),);
~rev7=Synth( \reverb ,~revRnd[2],~revGrp); ~rev7.set(\in, ~outFil , \out,~comBusHat2);
~comp7=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp7.set(\thr,0.68 ,\sB, 1.045,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat2 , \out,~comBusCymb2);
~mix7= Synth(\limitertoMixer,[\c7,1,\in, ~comBusCymb2, \gain,20, \out,~limitRkick2],~limitGrp);
// ~mixa.set(\in,~limitRkick2);
~mix7.set(\gain,23);
~stereo7=Synth(\stereoO,[\in, ~limitRkick2,\out,~no3], ~stereoGrp);
~stereo7.set(\spread,0.43,\center,-0.2);
~stereo7.set(\spread,0.6,\center,0.1,\dlt1,0.16,\dlt2,0.1,\decT,0.0212, \mxDel,1);





// ~no2S =~no2S-40000
// 3870814
// (~bufSnoopy.numFrames.rrand(1400000)- 1400000);
// ~eq8.free
~playNo2= Synth(\playBufX, [\impulse, 1.2875,\buf,~bufSnoopy2,\out, ~toGateX2,\loopy,1]);
~playNo2.set(\start, 1321552,\impulse, 1.2875);
~eq8=Synth(\EQHP96, [\frq, 100],~eqGrp0);
/*~eq8.set(\in, ~no2Eq, \out,~no2ToRev,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2900,\shelf,1.1, \gain4,(-23),\val5,1000,\shelf,1.8, \gain4,(-17));*/
~eq8.set(\in, ~no2Eq, \out,~no2ToRev,\val, 900,\quant, 1.2, \gain,(-12),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2800,\shelf,1, \gain4,(-17),\val5,0,\shelf2,0, \gain5,(-0),\frq,150);
~rev8=Synth( \reverb ,~revRnd[1],~revGrp); ~rev8.set(\in, ~no2ToRev , \out, ~no2ToCom,\group,~revGrp);
~comp8=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp8.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\in,~no2ToCom ,\out,~no2ToLimit);
~mix8= Synth(\limitertoMixer,[\c8,1,\in, ~no2ToLimit,\gain,5.2,\out,~no2ToStereo],~limitGrp);
// ~mixa.set(\in,~no2);
~mix8.set(\gain,17.9 );
~stereo8=Synth(\stereoO,[\in, ~no2ToStereo,\out,~no2], ~stereoGrp);
~stereo8.set(\spread,1,\center,0.1,\dlt1,0.26,\dlt2,0.19,\decT,0.0484, \mxDel,1);

// ~no4S=~no4S+400000
//(~bufSnoopy2.numFrames.rrand(80000)- 80000);
// ~eq9.free     5263937    1900000
~play4= Synth(\playBufX, [\impulse, 0.321875 ,/*\start, ~no4S,*/\buf,~bufSnoopy2,\out, ~delayBus,\loopy,1]);
~play4.set(\start, 2729299,\out,~delayBus);
/*~no4S=  ~no4S +10000   584874.34558758*/
~del1=Synth( \pingD, [\in, ~delayBus ,\bufnum,~delay, \feedback,0.35 ,\out,~delayToEq],~revGrp);
~eq9=Synth(\EQHP2, [\frq, 100],~eqGrpplus);
/*~eq9.set(\in, ~delayToEq, \out, ~revDelay,\val, 1000,\quant, 1, \gain,(-6),\val2,1700,\quant2,1, \gain2,(-9), \val3,0,\quant3,0, \gain3,0,\val4,2900,\shelf,1, \gain4,(-14),\frq, 130,\val5,800,\shelf2,1.2, \gain5,(-21));*/
~eq9.set(\in, ~delayToEq, \out, ~revDelay,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2900,\shelf,1, \gain4,(-20),\frq, 180,\val6,1000,\shelf2,1, \gain6,(-11));

~rev9=Synth(  \reverbS, ~revRnd[1],~delayGrp); ~rev9.set(\in,~revDelay,\mix,0.12, \out,~comDelay);
~comp9=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp9.set(\thr,0.3 ,\sB, 1.10,\sA, 1/2,\atk ,0.0484, \rel ,0.0968 ,\gain, 1,\in, ~comDelay, \out,~limitDelay);
~mix9= Synth(\limiterStoMixer,[\c9,1,\in,~limitDelay,\gain,12,\out ,~stereoBus3],~limitGrp);
// ~mixa.set(\in,~comSnaGrpBus2);
~mix9.set(\gain,21.7,\out,~stereoBus3);



//delay broken





//~eq11.free
~dist2= Synth(\disto,[ \in, ~distoPercu , \out,~percuFil],~distoGrp);
~fil2=Synth( \filter, [\freqFil,100,\which,2,\in,~percuFil,\busMod, ~bus4,\qf2,0.4,\out,~percuEq],~filterGrp);
~eq11 =Synth(\EQHP96,[ \frq, 100 ], ~eqGrp0);
~eq11.set(\val, 1300,\quant, 1, \gain,(-9),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2900,\shelf,1.2, \gain4,(-13),\in, ~percuEq, \out , ~percuRev,\frq, 100,\val5,1900,\shelf2,1.8,\gain5,(-32));
~rev11=Synth( \reverb, ~revRnd[1],~revGrp);~rev11.set(\in,~percuRev, \out,~percuCom);
~comp11=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp11.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,30,\in, ~percuCom, \out,~percuLimit);
~mix11= Synth(\limitertoMixer,[ \c11,1,\in,~percuLimit, \gain,1,\out,~percuStereo],~limitGrp);
// ~mixa.set(\in,~percuCom2);
~mix11.set(\gain,15.3 );
~stereo11=Synth(\stereoO,[\in, ~percuStereo ,\out,~percuCom2], ~stereoGrp);
~stereo11.set(\spread,0.4,\center,0.2,\dlt1,0,\dlt2,0,\decT,0.0121, \mxDel,1);

//~eqTam.free
~play1= Synth(\playBufXsS,[\buf,~funkPerc,\out,~tamFil,\impulse,~hz1beat,\start,17000]);
~fil12	=Synth(\filterS, [\busMod,~bus10, \which,0,\in,~tamFil, \out,~tamEq,\freqFil,3200,\qf,0.5],~filterGrp);
~eqTam=	Synth(\EQHP2, [\in,~tamEq,\out,~tamComp],~eqGrp);
~eqTam.set(\val, 1600,\quant, 1, \gain,(-8),\val2,110,\quant2,4,\gain2,(-10),\frq, 180,\val2,3700,\quant2,1.8,\gain2,(-16),\val4,2700,\shelf,1, \gain4,(-16.7),\val6,800,\shelf2,1, \gain6,(-22),\frq,200);
~compTam=	Synth(\compS,[\in,~tamComp,\out,~tamLimit,\ctrl, ~kbus ],~compGrp);
~compTam.set(\thr,0.6 ,\sB, 1.06,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1);
~limitTam=	Synth(\limiterS,[\in,~tamLimit,\out,~tam],~limitGrp);
~limitTam.set(\gain,76);
// ~mixa.set(\in,~tam);



//passant


//Pbindef.all.do(_.clear);

//(~bufSnoopy2.numFrames.rrand(400000)- 400000).postln;

//514019
/*
Pbindef(\testPa, \instrument,\playBuf , \impulse, 0.3,\dur,Pseq([6/1],inf), \tS,  0.39550810372374,\start, 2005447,\buf,~bufSnoopy2,\out,~gateBou,\loopy,0).play(t,quant:1)
Pbindef(\testPa,\start,1676373);
*/

// ~eq24.free

~eq24=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq24.set(\in, ~gateBou, \out ,~revPass3 ,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2600,\shelf,1, \gain4,(-20),\frq, 100,\val5,1000,\shelf2,1.6,\gain5,(-10),\vol,0.0011);


/*
Pbindef(\testPa, \instrument,\playBuf , \impulse, 0.3,\dur,Pseq([6/1],inf), \tS,  0.39550810372374,\start, 3805559,\buf,~bufSnoopy2,\out, ~eqPass5,\loopy,0).play(t,quant:1)
Pbindef(\testPa, \start,3890307)*/
// Pbindef(\testPa).free
// ~eq29.free
~eq29=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq29.set(\in, ~eqPass5, \out ,~revPass3 ,\val, 600,\quant, 1.4, \gain,(-9),\val2,0,\quant2,0, \gain2,0, \val3,3000,\quant3,1.2, \gain3,(-7),\val4,3000,\shelf,1.1, \gain4,(-19),\frq, 100,\val5,800,\shelf2,1.54,\gain5,(-15.7),\vol,0.00098);



// 1194540

//(~bufSnoopy2.numFrames.rrand(400000)- 400000).postln;
//4060549  3659560
/*
Pbindef(\testPa,\instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],inf), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy2,\out, ~eqPass1,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)).play(t,quant:1)
Pbindef(\testPa, \start,3659560)*/
// ~eq25.free
~eq25=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq25.set(\in, ~eqPass1,\out, ~revPass3,\val, 524,\quant, 1, \gain,(-8),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,3000,\shelf,1, \gain4,(-12),\frq, 100,\vol,0.000919);


/*
Pbindef(\testPa,\instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],inf), \tS,  0.39550810372374,\start, 127335,\buf,~bufSnoopy2,\out, ~eqPass6,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)).play(t,quant:1)
Pbindef(\testPa, \start,135844)*/
// ~eq30.free
~eq30=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq30.set(\in, ~eqPass6,\out, ~revPass3,\val, 3600,\quant, 1.4, \gain,(-13),\val2,800,\quant2,1.4, \gain2,(-10), \val3,0,\quant3,0, \gain3,0,\val4,2900,\shelf,1, \gain4,(-21),\frq, 100,\vol,0.00416);



//(~bufSnoopy2.numFrames.rrand(400000)- 400000).postln;
/*
Pbindef(\testPa,\instrument,\playBuf, \impulse, 0.3,\dur,Pseq([1.5/1],inf), \tS,  0.39550810372374,\start,373706,\buf,~bufSnoopy2,\out, ~eqPass2,\loopy,0).play(t,quant:1)
Pbindef(\testPa,\start,373706)
*/
// ~eq26.free
~eq26=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq26.set(\in, ~eqPass2,\out, ~revPass3,\val, 368,\quant, 1.6, \gain,(-14),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,3000,\shelf,1, \gain4,(-20),\frq, 200,\vol,0.00136);


/*
Pbindef(\testPa,\instrument,\playBuf, \impulse, 0.3,\dur,Pseq([1.5/1],inf), \tS,  0.39550810372374,\start,2321737,\buf,~bufSnoopy2,\out, ~eqPass7,\loopy,0).play(t,quant:1)
Pbindef(\testPa,\start,2321737)
*/

// ~eq32.free
~eq32=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq32.set(\in, ~eqPass7,\out, ~revPass3,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,3200,\shelf,1.1, \gain4,(-19),\frq, 150,\vol,0.00076,\val5,1200,\shelf2,1.6, \gain5,(-10),\vol,0.0013);








// ~eq27.free
// (~bufSnoopy2.numFrames.rrand(400000)- 400000).postln
// Pbindef(\testPa, \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],inf), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy2,\out, ~eqPass3,\loopy,0,\decT,0,\atkT,1,\atckC,8,\type,Pseq([\note,\rest].scramble,inf)).play(t,quant:2)  Pbindef(\testPa, \start,285965)
~eq27=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq27.set(\in, ~eqPass3,\out, ~revPass3,\val, 3600,\quant, 1.1, \gain,(-18),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,1000,\shelf,1.85, \gain4,(-11.6),\frq, 200,\val5,400,\shelf2,1.5,\gain5,(-6),\vol,0.00592);





/*
Pbindef(\testPa, \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],inf), \tS,  0.39550810372374,\start, 1353931,\buf,~bufSnoopy2,\out, ~eqPass4,\loopy,0,\decT,0,\atkT,1,\atckC,4,\type,Pseq([\note,\rest].scramble,inf)).play(t,quant:1);
Pbindef(\testPa, \start,65263)
*/
// ~eq28.free
~eq28=Synth(\EQHP96, [\frq, 100 ],~gateGrp2);
~eq28.set(\in, ~eqPass4,\out, ~revPass3,\val, 560,\quant, 1.4, \gain,(-12),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,2650,\shelf,1, \gain4,(-21),\frq, 100,\val5,1200,\shelf2,1.4,\gain5,(-15),\vol,0.0032);


~rev27=Synth(\reverb,~quickFi,~revGrp);~rev27.set(\in,~revPass3, \out,~compPass3);
~fil9 =Synth(\filter,[\which,0, \in ,~filterPass3, \busMod, ~bus3,\freqFil,2800, \qf,0.7, \out, ~eqPass3],~filterGrp2);
~comp27=Synth(\comp,[\ctrl, ~kbus],~compGrp);
~comp27.set(\thr,0.38 ,\sB, 1.051,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,10,\in, ~compPass3, \out,~limitPass3);
~mix27= Synth(\limitertoMixer,[\c56,1,\in, ~limitPass3, \gain,35, \out,~stereoPass3],~limitGrp);
~mix27.set(\gain,37.6,\out,~stereoPass3, \c56,1);
~stereo27=Synth(\stereo,[ \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,0], ~stereoGrp);















//TIL HERE








//~eq12.free
 ~flang1=Synth( \flanger1Mod,[ \in,~bellFlang4, \out,~riToDisto2],~phaserGrp);
 ~flang1.set(\flangefreq,0,\fdback,-0.46,\flangMod,~bus26,\out,~riToDisto2);
~dist3= Synth(\disto,[\in, ~riToDisto2 , \out,~riToEnv3], ~distoGrp);
~fil3=Synth( \filter, [\in,~riToEnv3,\out,~riToEq, \busMod,~bus19, \which, 0,\qf,0.5, \freqFil, 100],~filterGrp);
~eq12 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq12.set(\in, ~riToEq , \out, ~riToRev, \val4,200,\shelf,1.2, \gain4,(-14), \val5,200,\shelf2,1.2, \gain5,(-14)/*\val,3000, \quant,1, \gain,(-8),\val2,5000,\quant2,6, \gain2,(-8)*/);
~rev12=Synth( \reverb, ~quickFi ,~revGrp);~rev12.set(\in,~riToRev, \out,~riToComp);
~comp12=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp12.set(\thr,0.90 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in, ~riToComp ,\out,~riToLimit);
~mix12= Synth(\limitertoMixer,[\c12,1,\in, ~riToLimit,\gain,13,\out,~riToStereo],~limitGrp);
// ~mixa.set(\in,~riToGate);
~mix12.set(\gain,9.1);
~stereo12=Synth(\stereoO, [\in, ~riToStereo,\out,~riToGate], ~stereoGrp);
~stereo12.set(\spread,0,\center,0.4,\dlt1,0.2,\dlt2,0.1,\decT,0.0242, \mxDel,1);


//~eq13.free
~flang2=Synth( \flanger1,[ \in,~bellFlang3, \out,~riToDisto3] ,~phaserGrp); ~flang2.set(\flangefreq,1.2875/128,\fdback,-0.9);
~dist4= Synth(\disto,[\in, ~riToDisto3, \out,~riToEnv2],~distoGrp);
~fil4=Synth( \filter, [\in,~riToEnv2,\out,~riToEq3 ,\busMod,~bus12, \which, 0,\qf,0.55, \freqFil, 100],~filterGrp);
~fil4.set(\freqFil,3400, \qf,0.6);
~eq13 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq13.set(\in, ~riToEq3 , \out, ~riToRev3,\val,130,\quant, 1,\gain,(-15), \val5,200,\shelf2,1.2, \gain5,(-10) );
~rev13=Synth( \reverb, ~quickFi ,~revGrp); ~rev13.set(\in,~riToRev3, \out,~riToComp3);
~comp13=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp13.set(\thr,0.6 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp3, \out,~riToLimit3);
~mix13= Synth(\limitertoMixer,[\c13,1,\in,~riToLimit3 ,\gain,13,\out,~riToStereo3],~limitGrp);
~mix13.set(\gain,11.3);
~stereo13=Synth(\stereoO, [\in, ~riToStereo3 ,\out,~riToGate2],~stereoGrp);
~stereo13.set(\spread,0,\center,0,\dlt1,0.3,\dlt2,0.6,\decT,0.0242, \mxDel,1);
// ~mixa.set(\in,~riToGate2);


//~eq14.free
// ~flang3=Synth( \flanger,[ \in,~bellFlang2, \out,~flanToDisto2] ,~phaserGrp); ~flang3.set(\flangefreq,0.075/16,\fdback,0.1);
// ~flang3.set(\in,~riToStereo3)
~dist5= Synth(\disto,[\in, ~flanToDisto2 , \out,~flanToFilter2 ],~distoGrp);
~fil14=Synth(\filter, [\in,~flanToFilter2,\out,~flanToEq2,\busMod,~bus27,\which,0, \freqFil, 100,\qf,0.6 ],~filterGrp);
~eq14 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq14.set(\in, ~flanToEq2 , \out, ~flanToRev2 ,\val,200, \quant,1, \gain,(-8),\val2,0,\quant2,0, \gain2,0,\val4,1200 ,\shelf,1.1,\gain4,(-8),\val5,600,\shelf2,1.2, \gain5,(-15) );
~rev14=Synth( \reverb, ~quickFi ,~revGrp); ~rev14.set(\in,~flanToRev2, \out,~flanToComp2);
~comp14=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp14.set(\thr,0.9 ,\sB, 1.045,\sA, 1/2,\atk ,0.0484, \rel ,0.0968, \in,~flanToComp2, \out,~flanToLimit2);
~mix14= Synth(\limitertoMixer,[\c14,1,\in, ~flanToLimit2,\gain,1,\out,~flanToStereo2],~limitGrp);
// ~mixa.set(\in,~riToGate3);
~mix14.set(\gain,23.6);
~stereo14=Synth(\stereoO, [\in, ~flanToStereo2 ,\out,~riToGate3],~stereoGrp);
~stereo14.set(\spread,0,\center,1,\dlt1,0.6,\dlt2,0.4,\decT,0, \mxDel,1);


// ~eq15.free
//one hit // rise below
~dist6= Synth(\disto,[\in, ~riToDisto , \out,~riToEnv], ~distoGrp);
~fil5=Synth( \filter, [\in,~riToEnv,\out, ~riToEq2,\busMod,~bus20, \which, 0,\qf,0.6 ,\freqFil, 100],~filterGrp);
~eq15 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq15.set(\in, ~riToEq2 , \out, ~riToRev2, \val5,1200, \shelf2,1.1, \gain5,(-12),\val2,540,\quant2,2, \gain2,(-14),\val4,1400, \shelf,1.8, \gain4,(-21), \frq, 160 );
~rev15=Synth( \reverb, ~rShor ,~revGrp); ~rev15.set(\in,~riToRev2, \out,~riToComp2);
~comp15=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp15.set(\thr,0.8 ,\sB, 1.085,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in, ~riToComp2 ,\out,~riToLimit2,\gain,30);
~mix15= Synth(\limitertoMixer,[\c15,1,\in, ~riToLimit2,\gain,7,\out,~riToStereo2],~limitGrp);
// ~mixa.set(\in,~gateRise);
~mix15.set(\gain,8.31);
~stereo15=Synth(\stereoO, [\in, ~riToStereo2 ,\out,~gateRise],~stereoGrp);
~stereo15.set(\spread,0,\center,0,\dlt1,0.55,\dlt2,0.6,\decT,0, \mxDel,1);





/*~mix16a= Synth(\limiterStoMixer,[ \in,~noiseToMixA , \out,~eqNoise],~distoGrp0);~mix16a.set(\gain,70);
~mix16b= Synth(\limiterStoMixer,[ \in,~noiseToMixB , \out,~eqNoise],~distoGrp0);~mix16b.set(\gain,30);
~mix16c= Synth(\limiterStoMixer,[ \in,~noiseToMixC , \out,~eqNoise],~distoGrp0);~mix16c.set(\gain,50);
~mix16d= Synth(\limiterStoMixer,[ \in,~noiseToMixD , \out,~eqNoise],~distoGrp0);~mix16d.set(\gain,55);
~eq16 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq16.set(\in, ~eqNoise, \out, ~noiseRev ,\val2,0,\quant2,0, \gain2,0);
~rev16=Synth( \reverbS, ~revRnd[0.rrand(3)],~revGrp);~rev16.set(\in,~noiseRev, \out,~noiseToComp);
~comp16=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp16.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in,~noiseToComp, \out,~noiseToLimit);
~mix16= Synth(\limiterStoMixer,[\c16,1,\in,~noiseToLimit ,\gain,25,\out,~noiseToStereo],~limitGrp);
// ~mixa.set(\in,~noiseToStereo);
 ~mix16.set(\gain,15);*/

//gosh
/*~eq17 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq17.set(\in, ~eqDs , \out, ~reverbBus3, \val2,0,\quant2,0, \gain2,0,);
~rev17=Synth( \reverb, ~quickFi ,~revGrp); ~rev17.set(\in,~reverbBus3, \out,~comFuzz3);
~comp17=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp17.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 , \out,~limitFuzz3);
~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~limitFuzz3,\gain,30,\out,~stereoBus4],~limitGrp);
// ~mixa.set(\in,~stereoBus4);
 ~mix17.set(\gain,30);*/




// ~mix22= Synth(\limiter10,[\in, ~bangLimit, \out, ~gateRise/*~again*/, \gain,50], ~limitGrp);
// ~mix22.set(\gain,30);


/*~mix23=	Synth(\comp10, [\ctrl, ~snBus],~compGrp2);
~mix23.set(\thr,0.9 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872 ,\in,~again,\gain,0.6, \out,~gateRise);*/





// ~mixa.set(\in,~stereoPerch);
// ~mix31.set(\gain,6)
/*~mix32= Synth(\limiterStoMixer,[\c32,1,\in, ~limitPerch3,\gain,88,\out,~perchLimiToG3],~limitGrp);
// ~mix32.set(\gain,88)
~mix33= Synth(\limiterStoMixer,[\c33,1,\in,~limitPerch4 ,\gain,90,\out,~perchLimiToG4],~limitGrp);
//~mix33.set(\gain,90)
~mix34= Synth(\limiterStoMixer,[\c34,1,\in,~limitPerch5 ,\gain,90,\out,~perchLimiToG5],~limitGrp);
// ~mix33.set(\gain,90)
~mix35= Synth(\limiterStoMixer,[\c35,1,\in, ~limitPerch6,\gain,105,\out,~perchLimiToG6],~limitGrp);
// ~mix35.set(\gain,105)
~mix36= Synth(\limiterStoMixer,[\c36,1,\in,~limitPerch7 ,\gain,90,\out,~perchLimiToG7],~limitGrp);
// ~mix36.set(\gain,90)
~mix37= Synth(\limiterStoMixer,[\c37,1,\in,~limitPerch8 ,\gain,95,\out,~perchLimiToG8],~limitGrp);
 //~mix37.set(\gain,95)*/

/*~mix42= Synth(\limiterStoMixer,[\c42,1,\in, ~limitPerch9, \gain,55, \out,~perchLimiToG9],~limitGrp);
// ~mix3.set(\gain,55)
~mix43= Synth(\limiterStoMixer,[\c43,1,\in,~limitPerch10 ,\gain,65,\out,~perchLimiToG10],~limitGrp);
// ~mix31.set(\gain,65)
~mix44= Synth(\limiterStoMixer,[\c44,1,\in, ~limitPerch11,\gain,65,\out,~perchLimiToG11],~limitGrp);
// ~mix32.set(\gain,65)
~mix45= Synth(\limiterStoMixer,[\45,1,\in,~limitPerch12 ,\gain,50,\out,~perchLimiToG12],~limitGrp);*/






//stereoAbove not sync




~eq23=Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq23.set( \in,   ~hit2ToEq,\out,~hit2ToStereo   ,\val4,3000,\shelf,1.6, \gain4,(-12),\vol,3.3,\frq, 200);
~pan23=Synth(\pan2, [\in, ~hit2ToStereo, \out,~toCom], ~stereoGrp);

//TO ADDD

//~eq10.free
~dist1= Synth(\disto,[\in,~vocalBus,\out,~vocToEq],~phaserGrp);
~dist1.set(\out,~vocToEq);
~eq10 =Synth(\EQHP96,[\in,~vocToEq,\out,~vocToRev],~distoGrp);
~eq10.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\out,~vocToRev);
~rev10=Synth(\reverb, ~revRnd[2],~dispatchGrp); ~rev10.set(\in, ~vocToRev , \out, ~vocToComp);
/*~fil1=Synth(\filter, [\in,~vocToFil, \busMod,~bus2, \qf,0.1,/*\rqLPF, ~bus1,*/\which, 0,\out,~vocToComp,\freqFil,2220],~filterGrp);

~fil1.set(\qf,0.8)


~fil1.set(\out,0);*/
~comp10=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp10.set(\thr,0.8 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.3872,\gain,11,\in, ~vocToComp,  \out, ~vocToLimit);
~mix10= Synth(\limitertoMixer,[\c10,1,\in,~vocToLimit,\out, ~vocToStereo,\gain, 10],~limitGrp);
~mix10.set(\gain,19.6 );
~stereo10=Synth(\stereoO,[ \in,~vocToStereo,  \out,0/*~vocToDispatch*/, \spread,0.2],~stereoGrp);
~stereo10.set(\center,-1);
~stereo10.set(\spread,1,\center,-0.3,\dlt1,0.06,\dlt2,0.12,\decT,0.0242, \mxDel,1);
//~mixa.set(\in,~vocToDispatch);


//AADD THE BELL
// ~eq18.free
~flang4=Synth( \flanger1,[ \in,~bellFlang, \out,~flanToDisto],~phaserGrp);~flang4.set(\flangefreq,0.3,\fdback,0.1);
~dist7= Synth(\disto,[\in, ~flanToDisto, \out,~flanToEq],~distoGrp);
~eq18 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq18.set(\in, ~flanToEq , \out, ~flanToRev , \val,6700, \quant,1, \gain,(-16),\val2,520,\quant2,1, \gain2,(-20),\val4,2700,\shelf,1.4, \gain4,(-17),\frq, 100);
~rev18=Synth( \reverb, ~rLon ,~revGrp);~rev18.set( \in,~flanToRev, \out,~flanToComp,\room,0.7);
~comp18=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp18.set(\thr,0.2 ,\sB, 1.05,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,25,\in, ~flanToComp, \out,~flanToLimit);
~mix18= Synth(\limitertoMixer,[\c18,1,\in, ~flanToLimit,\gain,12,\out,~flanToStereo],~limitGrp);
// ~mixa.set(\in,~gateRise);
~mix18.set(\gain,7.92);




















// PART 5

//not working, plop noise


~part5Dis= Synth(\disto,[\in,~downDisto,\out,~downSG],~distoGrp);

/*~part5Dis.set(\out,~downSG)*/

// ~part5=Synth( \pingD, [\in, ~downdel ,\bufnum,~delay2, \feedback,0.63 ,\out,~downEq],~filterGrp);

~part5Eq=Synth(\EQHP96, [\in,~downEq,\out,~downRev],~eqGrp0);
~part5Eq.set(\frq,600,\val4,2300,\shelf,1.18,\gain4,(-14),);
~part5Rev=Synth(\reverb, ~rShor,~revGrp);   ~part5Rev.set(\in,~downRev,\out,~downComp);
~part5Comp=Synth( \comp, [\ctrl, ~kbus,\in,~downComp,\out,~downLimit],~compGrp);
~part5Comp.set(\thr,0.8 ,\sB, 1.050,\sA, 1/2,\atk ,0.0242, \rel ,0.0968);
~part5Limit=Synth( \limitertoMixer,[\in,~downLimit,\out,~downStereo],~limitGrp);
~part5Limit.set(\gain,23,\out,~downStereo);
~part5Stereo= Synth(\stereoO,[\in, ~downStereo,\out,~toCom], ~stereoGrp);
~part5Stereo.set(\spread,0.3,\center,0,\dlt1,0.06,\dlt2,0,\decT,0, \mxDel,1);



~part5Dis2= Synth(\disto,[\in,~downDisto2,\out,~downFil2],~phaserGrp);
~part5Fil2=Synth(\filter,[\freqFil,100, \which,1,\qf2,0.2, \busMod,~bus16,\in,~downFil2,\out,~downSG2],~distoGrp);
/*~part5Fil2.set(\out,~downSG2)*/
// ~part5Dis2.set(\out,0)
~part52=Synth( \pingD, [\in, ~downdel ,\bufnum,~delay2, \feedback,0.33 ,\out,~downEq2],~filterGrp);

/*~part52.set(\out,0)*/
~part5Eq2=Synth(\EQHP96, [\in,~downEq2,\out,~downRev2],~eqGrp0);
~part5Eq2.set(\frq,350,\out,~downRev2,\val4,800,\shelf,1,\gain4,(-24),\val,3400,\quant,1,\gain,(-25),\val3, 1300,\quant3,1,\gain3,(-14));
~part5Rev2=Synth(\reverb, ~rLon,~revGrp);   ~part5Rev2.set(\in,~downRev2,\out,~downComp2);
~part5Comp2=Synth( \comp, [\ctrl, ~kbus,\in,~downComp2,\out,~downLimit2],~compGrp);
~part5Comp2.set(\thr,0.9 ,\sB, 1.003,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\out,~downLimit2 );
~part5Limit2=Synth( \limitertoMixer,[\in,~downLimit2,\out,~downStereo2],~limitGrp);
~part5Limit2.set(\gain,68.6,);
~part5Stereo2= Synth(\stereoO,[\in, ~downStereo2,\out,~toCom], ~stereoGrp);
~part5Stereo2.set(\spread,0.4,\center,0,\dlt1,0,\dlt2,0,\decT,0, \mxDel,1);











//gosh

// ~part5Dis= Synth(\disto,[\in,~downDisto,\out,~downSG],~distoGrp);
//
// /*~part5Dis.set(\out,~downSG)*/
//
// // ~part5=Synth( \pingD, [\in, ~downdel ,\bufnum,~delay2, \feedback,0.63 ,\out,~downEq],~filterGrp);
//
// ~part5Eq=Synth(\EQHP96, [\in,~downEq,\out,~downRev],~eqGrp0);
// ~part5Eq.set(\frq,600);
// ~part5Rev=Synth(\reverb, ~rShor,~revGrp);   ~part5Rev.set(\in,~downRev,\out,~downComp);
// ~part5Comp=Synth( \comp, [\ctrl, ~kbus,\in,~downComp,\out,~downLimit],~compGrp);
// ~part5Comp.set(\thr,0.9 ,\sB, 1.050,\sA, 1/2,\atk ,0.0242, \rel ,0.0968);
// ~part5Limit=Synth( \limitertoMixer,[\in,~downLimit,\out,~downStereo],~limitGrp);
// ~part5Limit.set(\gain,60,\out,~downStereo);
// ~part5Stereo= Synth(\stereoO,[\in, ~downStereo,\out,~toCom], ~stereoGrp);
// ~part5Stereo.set(\spread,1,\center,0.8,\dlt1,0,\dlt2,0,\decT,0, \mxDel,1);






// Synth(\playB10,[\buf, ~leTout,\out,~finGran ]);

// PART 3 BELOW

// ~eq35.free

~shift1 =  Synth(\shiftEx,[\in,~limitBus1,\out,  ~distoPerch2 ],~shiftGrpEx);
~disto35=Synth(\disto, [\in, ~distoPerch2 , \out,~eqPerch2], ~distoGrpEx);
~disto35.set(\out,~eqPerch2);
~eq35= Synth(\EQHP96, [\in, ~eqPerch2, \out, ~revPerch2 ], ~eqGrpEx);
~eq35.set(\out,~revPerch2,\val4,2450,\shelf,1.64,\gain4,(-22),\val5,1900,\shelf2,1.2,\gain5,(-16),\val,700,\quant,1.4,\gain,(-11));
~rev35=Synth(\reverb, ~quickFi ,~revGrpEx);~rev35.set(\in,~revPerch2, \out,~comPerch2 );
~comp35=Synth(\comp, [\ctrl, ~kbus],~compGrpEx);
~comp35.set(\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comPerch2, \out,~limitPerch2);
~mix35= Synth(\limitertoMixer,[\c36,1,\in,~limitPerch2 ,\gain,6,\out,~stereoPerch],~limitGrpEx);
~mix35.set(\gain,62.6);
~stereo35=Synth(\stereo,[ \dur, 9999, \in, ~stereoPerch ,\spread,1 , \out,~toCom], ~stereoGrpEx );


// .set(\out,0)
//~eq36.free
//half way vaation
~shift2 =  Synth(\shiftEx,[\in,~shiftPlay,\out,  ~shiftDisto ],~filterGrp);
~disto36=Synth(\disto, [\in, ~shiftDisto , \out,~shiftEq], ~distoGrp0);
~eq36= Synth(\EQHP96, [\in, ~shiftEq, \out, ~shiftRev/*~buildUpG*/ ], ~eqGrp0);
~eq36.set(\out,~shiftRev/*~buildUpG*/,\val4,2250,\shelf,1.58,\gain4,(-12),\frq,350,\val,1000,\quant,1.4,\gain,(-16),\val2,2000,\quant2,1.8,\gain2,(-12));
~rev36=Synth(\reverb, ~rShor ,~revGrp);
~rev36.set(\in,~shiftRev, \out,~shiftComp);
~comp36=Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp36.set(\thr,0.85 ,\sB, 1.036,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,5,\in, ~shiftComp, \out,~shiftLimit );
~mix36= Synth(\limitertoMixer,[\c33,1,\in,~shiftLimit ,\gain,6,\out,~shiftStereo],~limitGrp);
~mix36.set(\gain,52);
~stereo36=Synth(\stereo,[ \dur, 9999, \in, ~shiftStereo ,\spread,0.4 , \out,~toCom], ~stereoGrp );



// ~shift3 =  Synth(\shiftEx,[\in,~shiftPlay2,\out,  ~shiftDisto2 ],~filterGrp);
~disto37=Synth(\disto, [\in, ~shiftDisto2 , \out,~shiftGate], ~distoGrp0);

// ~disto37.set(\out,~shiftGate);

~eq37= Synth(\EQHP96, [\in, ~shiftEq2, \out, ~shiftRev2 ], ~eqGrp0);
~eq37.set(\val,6500,\quant,1.68,\gain,(-17),\val4,1250,\shelf,1.58,\gain4,(-14),\out,~shiftRev2,\frq,360);


~rev37=Synth(\reverb, ~quickFi ,~revGrp);~rev37.set(\in,~shiftRev2, \out,~shiftComp2 );
~comp37=Synth(\compMod, [\ctrl, ~kbus],~compGrp);
~comp37.set(\thr,0.33 ,\sB, 1.240,\sA, 1/2,\atk ,0.0242, \rel ,0, \relMod,~bus28,\gain,1,\in, ~shiftComp2, \out,~shiftLimit2 );
~mix37= Synth(\limitertoMixer,[\c35,1,\in,~shiftLimit2 ,\gain,6,\out,~shiftStereo2],~limitGrp);
~mix37.set(\gain,81.5);
~stereo37=Synth(\stereo,[ \dur, 9999, \in, ~shiftStereo2 ,\spread,1 , \out,~toCom], ~stereoGrp );

//STEREO BROKEN
// ~eq38.free
~disto38=Synth(\disto, [\in, ~buildupDisto , \out,~buildupEq], ~distoGrp0);
// ~disto38.set(\out,~buildupEq)
~eq38= Synth(\EQHP96, [\in, ~buildupEq, \out, ~buildupRev ], ~eqGrp0);
~eq38.set(\val5,1900,\shelf2,1.5,\gain5,(-21),\val4,2900,\shelf,1.1,\gain4,(-12),\frq,220);
~rev38=Synth(\reverb, ~quickFi ,~revGrp);~rev38.set(\in,~buildupRev, \out,~buildupComp );
~comp38=Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp38.set(\thr,0.95 ,\sB, 1.190,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~buildupComp, \out,~buildupLimit );
~mix38= Synth(\limiterStoMixer,[\c38,1,\in,~buildupLimit ,\gain,6,\out,~buildupSter],~limitGrp);
~mix38.set(\gain,55.62);
~stereo38=Synth(\stereo,[ \dur, 9999, \in, ~buildupSter ,\spread,1 , \out,~toCom], ~stereoGrp );


/*~stereo38.set(\out,0)*/









~kiDis=Synth(\distoS,[\in,~kiasDisto,\out,~kiasEq],~distoGrp0);

~kiEq=Synth( \EQHP2, [\in, ~kiasEq ,\out, ~kiasRev,], ~eqGrp0);
~kiEq.set(\frq, 120/*,\val,11800,\quant,1, \gain,(-18),\val2,2600,\quant2,8, \gain2,(-16)*/,\vol, 0.01);

~kiRev=Synth(\reverbS, ~rShor,~revGrp);~kiRev.set(\in,~kiasRev ,\out,~kiasComp);

~kiComp= Synth(\compS, [\ctrl, ~kbus],~compGrp);
~kiComp.set(\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 28,\in, ~kiasComp , \out,0);






/*~mix38= Synth(\limiterStoMixer,[\c38,1,\in,~part2ToLimit ,\gain,25,\out,~part2ToStereo],~limitGrp);
// ~mixa.set(\in,~part2ToStereo);
 //~mix38.set(\gain,20)
~mix39= Synth(\limiterStoMixer,[\c39,1,\in,~part2SLimit ,\gain,45,\out,~part2SStereo],~limitGrp);
// ~mixa.set(\in,~part2SStereo);
 //~mix39.set(\gain,45)
~mix40= Synth(\limiterStoMixer,[\c40,1,\in,~part2RiLimit ,\gain,5,\out,~part2RiStereo],~limitGrp);
// ~mixa.set(\in,~part2RiStereo);
// ~mix40.set(\gain,5)
~mix41= Synth(\limiterStoMixer,[\c41,1,\in,~part2SLimit2 ,\gain,45,\out,~part2SStereo2],~limitGrp);
// ~mixa.set(\in,~part2SStereo2);
// ~mix41.set(\gain,105)*/
















// ~mix32.free

~comp10Ry=Synth( \comp10, [\in,~toComp10,\out,~rythmLimit],~compGrp);
~comp10Ry.set((\thr,0.6 ,\sB, 1.05,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1);
~mix32=	Synth( \limiter10toMixer,[\c32,1,\dur, inf, \in,~rythmLimit,\out,/*~toKbGate*/~flopped, \gain,22,], ~limitGrp);
~mix32.set(\gain,14.6);
~flopd = 	Synth(\stereoO10, [ \in,~flopped,\out,~toCom/*~rythmComp*/],~stereoGrp);
~flopd.set(\spread,0,\center,0,\dlt1,0.05,\dlt2,0,\decT,0, \mxDel,0);


//PERCUSSIONS
// ~eq31.free
/*Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],256) ],inf),\dur,Pseq([1/4],inf ),\stereoL, 0.00555,\out,    ~cymbalEq).play(t,quant:1)*/

~eq31=Synth(\EQHP96, [\frq, 3000, \in, ~cymbalEq,\out , ~comBusCymb, \vol,4],~eqGrp);
~eq31.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,3000,\shelf,1.3, \gain4,(-15),\out , ~comBusCymb);
~comp31=Synth(\comp,[\ctrl, ~kbus,],~compGrp);
~comp31.set(\thr,0.6 ,\sB, 1.05,\sA, 1/2,\atk ,0.0121, \rel ,0.0968,\gain,3.5,\in, ~comBusCymb , \out,~limitC);
~mix31= Synth(\limitertoMixer,[\c50,1,\in, ~limitC,\gain,20,\out,~stereoCymb],~limitGrp);
 ~mix31.set(\gain,4.8,\in, ~limitC,\out,~stereoCymb);
~sterCymb=Synth(\stereoO,[\in,~stereoCymb,\out,~comFuzz22],~stereoGrp);
~sterCymb.set(\spread,1,\center,1,\dlt1,0.4045,\dlt2,0.4,\decT,0.0242, \mxDel,1);

//group name chelou for dynaEq







//~eq33.free
/*Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~comBusHat,\type, Pseq([  Pseq([ Pseq([ \note],800)],inf)],1)).play(t,quant:1)*/
~comp33=Synth(\comp, [\ctrl, ~kbus],~compGrp4);
~comp33.set(\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat, \out,~limitHat );


~mix33= Synth(\limitertoMixer,[\c52,1,\in, ~limitHat,\gain,36,\out,~hatEq ],~limitGrp4);
~mix33.set(\gain,25.4,\out,~hatEq);

// ~eq33.free
~eq33=Synth(\EQHPDyna, [\frq, 3000 ,\in, ~hatEq,  \out,~stereoHat,\vol,0.5,\ctrl,~fusible2 ,\valD,3100, \quantD,8],~dynaEq);

// Synth(\EQHP96, [\frq, 3000 ,\in, ~hatEq,  \out,0,\vol,0.5,\ctrl,~fusible2 ,\valD,3100, \quantD,8],~dynaEq);

~eq33.set(\val, 6500,\quant, 4, \gain,(-12),\val2,22000,\quant2,4, \gain2,(-12), \val3,0,\quant3,0, \gain3,0,\out , ~stereoHat,\vol,1);


~sterHat=Synth(\stereoO,[\in,~stereoHat,\out,~comFuzz22],~stereoGrp5);
~sterHat.set(\spread,0,\center,0,\dlt1,0.01,\dlt2,0.5,\decT,0.0121, \mxDel,1,\out,~comFuzz22);


~percuComp =Synth(\comp10, [\ctrl,~snBus ,   \in, ~comFuzz22 ,\out,~toKbGate],~compGrp6);
~percuComp.set(\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872,\out,~toKbGate);



/*
Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\type, Pseq([\rest,\rest,\note,\rest ],inf),\dur, Pseq([1/2], inf) ,\out,~snareEQ,\dA,Pseq([ /* Pseq([1],32), */Pseq([0.5],32)],inf)).play(t,quant:2)*/

//~eq34.free
~eq34= Synth(\EQHP96, [\frq, 220 ],~eqGrp);
~eq34.set(\in, ~snareEQ, \val, 400, \quant, 8, \gain, (-10), \out , ~snareComp,\frq, 120,\val5,1800,\shelf2,1.6,\gain5,(-8),\val4,3000,\shelf,1.6,\gain4,(-12));


~comp34=Synth(\comp, [\ctrl,~kbus ],~compGrp);
~comp34.set(\thr,0.88 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.1936, \in, ~snareComp ,\out,~snareLimit);


~mix34= Synth(\limitertoMixer,[\c34,1,\in, ~snareLimit,\gain,40,\out,~toPan2],~limitGrp);
~mix34.set(\gain,40);
~pan34=Synth( \pan2,[\in, ~toPan2,\out, /*~tofinalRythm*/  ~toKbGate], ~stereoGrp);

// ~eq40.free
// Pbind(\instrument, \playBuf, \buf, ~clap,\vl,1,\tS,t.beatDur,\dur,Pseq([1/2],inf),\loopy,0,\type, Pseq([\rest,\rest,\note,\rest ],inf),\out,~clapEq).play(t,quant:2)
~eq40 = Synth(\EQHP96, [\frq, 100 ],~eqGrp);
~eq40.set(\in, ~clapEq, \out , ~clapComp,\frq, 140,\val, 2000, \quant, 1, \gain,0, \val5,1100,\shelf2,1.1,\gain5,(-18),\val4,6000,\shelf,1.1,\gain4,(-16));
~comp40=Synth(\comp, [\ctrl,~kbus ],~compGrp);
~comp40.set(\thr,0.28 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in, ~clapComp ,\out,~claplimit);
~mix40= Synth(\limitertoMixer,[\c34,1,\in, ~claplimit,\gain,40,\out,~clapPan2],~limitGrp);
~mix40.set(\gain,37.7);
~pan40=Synth( \pan2,[\in, ~clapPan2,\out,  ~toKbGate], ~stereoGrp);



// ~eq39.free
// ~fil39.free
/*
~fil39= Synth(\filter, [\in,~toNoise,\out,~toNoiseEq,\freqFil,400,\busMod, ~bus23,\which,0,\qf,0.4],~eqGrp);
~eq39= Synth(\EQHP96Mod, [\frq, 220 ,\gainMod,~fusible2],~dynaEq);
~eq39.set(\in, ~toNoiseEq, \out , ~toNoiseStereo /*\val, 400, \quant, 8, \gain, (-10),,\frq, 120,\val5,1800,\shelf2,1.6,\gain5,(-8),\val4,3000,\shelf,1.6,\gain4,(-12)*/,\frq, 100,\vol,0.1,\val5,2500,\shelf2,1.5,\gain5,(-19),\amp,0.06);
/*~comp39=Synth(\comp, [\ctrl,~kbus ],~stereoGrp5);
~comp39.set(\thr,0.98 ,\sB, 1.06,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in, ~toNoiseCom ,\out,~toNoiseStereo);*/

// ~ampMod= Synth(\ampO,[\in, ~hitStereo,\out,~bus25],~stereoGrp);

/*~mix39= Synth(\limitertoMixer[\c39,1,\in, ~toNoiseLimit,\gain,40,\out,~toNoiseStereo],~compGrp6);
~mix39.set(\gain,15.7,/*\gainMod,~fusible2*/);*/
~stereo39=Synth(\pan2,[\dur,9999,\in,~toNoiseStereo,\out,~toKbGate,/*\spread,0.6*/], ~extraGrp);*/

/*~stereo39.free*/





~fil20= Synth(\filter, [\busMod, ~bus31, \freqFil, 1000,\in, ~slideBus,\out,~slideEq,\qf,0.8],~filterGrp);
~eq20 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq20.set(\in, ~slideEq , \out, ~slideBusToStereo ,\frq, 500, \val,12000, \quant,1.6, \gain,(-26),\val2,0,\quant2,0, \gain2,0, \vol,0.125);
~pan20=Synth(\pan2, [/*\in, ~toPan2,*/\in,~slideBusToStereo, \out,~toKbGate], ~stereoGrp);



// ~bassEqX.free


/*~bassEqX=Synth(\EQHP2 ,[\in,~bassEq, \out,~comFuzz, \frq, 20.6,\vol,1,


			\val7,329.6275,\quant7,1.2 ,\gain7,(-4),
			\val,659.255, \quant,1.9, \gain,(-9),
\val2,1318.51, \quant2,1.4, \gain2,(-11),
		\val3,2637.02, \quant3,1.4, \gain3,(-18),


//that one
	\val5,164.81375, \quant5,2.4, \gain5,(-15)],~eqGrp0);*/

~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.2 ,\sB, 1.034,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~limitBass);


~limK=Synth(\limitertoMixer,[\c45,1,\in, ~limitKick, \gain,1,\out,~kToPan],~limitGrp);
~limK.set(\gain,202);
~limB=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass, \gain,68,\out,~kToPan],~limitGrp);
~limB.set(\gain,178.5);

~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,~toKbGate],~stereoGrp);


/*~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.7 ,\sB, 1.024,\sA, 1/2,\atk ,0.0484, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~limitBass);
~limK=Synth(\limitertoMixer,[\c45,1,\in, ~limitKick, \gain,40,\out,~kToPan],~limitGrp);
~limK.set(\gain,110);
~limB=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass, \gain,40,\out,~kToPan],~limitGrp);
~limB.set(\gain,90);
~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,~toKbGate],~stereoGrp);*/






/*
~comp20= Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp20.set(\thr,0.5 ,\sB, 1,\sA, 1/2,\atk ,0.0242, \rel ,0.1936,\gain,4, \in,~slideComp, \out,~slideBusToStereo);
~mix20= Synth(\limitertoMixer,[ \c20,1,\in, ~slideBusToLimit,\out,~slideBusToStereo, \gain, 30],~limitGrp);
// ~mixa.set(\in,~slideBusToStereo);
 ~mix20.set(\gain,8,\out,0,\in,~slideBusToStereo);
~mix20.free*/

//BG SLIDE
/*~fil10= Synth(\filter, [\in,~bgSfil,\which,0, \out,~slideBus2, \busMod, ~bus8 ],~ptrGrp);
~eq21 =Synth(\EQHP96,[\frq, 400 ],~recGrp);
~eq21.set( \in, ~slideBus2, \out, ~slideEq2, \val,0, \quant,0, \gain,0,\val2,0,\quant2,0, \gain2,0, \vol,1);
~comp21=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp21.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10, \in,~slideEq2  , \out,~slideBusToLimit2);
~mix21= Synth(\limitertoMixer,[\c21,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
 ~mix21.set(\gain,20);*/
//~mixa.set(\in,~toStereoRise);



// ~bgEq.free
~bg= Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~audio3,\out, ~bgFil22,\amp,5,\start,30000]);
//maybe delete filter on bg
~filBg=Synth(\filter, [\in,~bgFil22, \busMod,~bus24,\qf,0.5, \freqFil, 100, /*\rqLPF, ~bus1,*/\which,0,\out,~bgCom2],~filterGrp);
~compBg=Synth(\comp, [\ctrl, ~kbus,\in, ~bgCom2],~compGrp);
~compBg.set(\thr,0.95 ,\sB, 1.060,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1 ,\out,~eqBg10);
~bgEq=Synth(\EQHP96, [ \in, ~eqBg10, \out,~bgLimit2,\frq,800],~delayGrp2);
~bgEq.set(\frq,600,\val,268,\quant,1,\gain,(-20),\val2,668,\quant2,1,\gain2,(-12)/*,\frq,100*/,\val4,8000, \shelf,1.2,\gain4,(-18));
//add reverb
~limBg=Synth(\limitertoMixer,[ \c50,1, \in,~bgLimit2 ,\out,~bgStereo2, \gain, 20],~limitGrp  );
~limBg.set(\gain,40.6);



// ~perc= Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~ambPerc,\out, ~distoPercBg]);

~distoP=Synth(\disto,[\in,~distoPercBg,\out,~eqPercBg],~distoGrp0);
~eqP= Synth(\EQHP96,[\in,~eqPercBg ,\out,~reverbPercBg,\frq,100],~eqGrp0);
~eqP.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,);
~revP=Synth(\reverb, ~rLon,~revGrp);~revP.set(\in,~reverbPercBg ,\out,~compPercBg);
~compP=Synth(\comp,[\in,~compPercBg ,\out,~limitPercBg,\ctrl, ~kbus],~compGrp);
~compP.set(\thr,0.95 ,\sB, 1.060,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1);
~limitP=Synth(\limitertoMixer,[\in, ~limitPercBg,\out, ~stereoPercBg],~limitGrp);
~limitP.set(\gain,85,\out,~stereoPercBg);
~stereoP=Synth(\stereoO,[\in,~stereoPercBg ,\out,~toCom],~stereoGrp);
~stereoP.set(\spread,0,\center,0,\dlt1,0.6,\dlt2,0.7,\decT,0.0242, \mxDel,1,\out,~toCom/*~percGate*/);





~bgX= Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~audio4,\out, ~bgDisto,\amp,1,\start,1500000]);

~distoBGX=Synth(\disto,[\in,~bgDisto,\out,~bgFilX],~distoGrp);

~filBgX=Synth(\filter, [\in,~bgFilX, \busMod,~bus25,\qf,0.5, \freqFil, 100,\which,0,\out,~bgGate],~filterGrp);

~compBgX=Synth(\comp, [\ctrl, ~kbus,\in, ~bgComp],~compGrp);
~compBgX.set(\thr,0.60 ,\sB, 1.080,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1 ,\out,~bgEqu);
~bgEqX=Synth(\EQHP96, [ \in, ~bgEqu, \out,~bgLimite,\frq,800],~delayGrp2);
~bgEqX.set(\frq,650,\val4,3668,\shelf,1.2,\gain4,(-20),\val,1950,\quant,1.6,\gain,(-15));
~limBgX=Synth(\limitertoMixer,[ \c50,1, \in,~bgLimite ,\out,~bgStereoO, \gain, 20],~limitGrp  );
~limBgX.set(\gain,35.2);
~stereoP=Synth(\stereoO,[\in,~bgStereoO ,\out,~toCom,\dur,9999],~stereoGrp);
~stereoP.set(\spread,0.8,\center,0,\dlt1,0.1,\dlt2,0.2,\decT,0.0242, \mxDel,1,\out,~toCom);


/*~compUltiBG= Synth(\comp10,[\ctrl, ~snBus,],~compGrp5);
~compUltiBG.set(\thr,0.85 ,\sB, 1.04,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom2, \out,0);*/





//hit
// ~eqHit.free
~eqHit = Synth(\EQHP96, [\frq, 200 ],~eqGrp0);
~eqHit.set(\in,~hitEq,\out,~hitRev,\val,260,\quant,1,\gain,(-15),\val2,650,\quant,1,\gain,(-23),\val4,2800, \shelf,1.2,\gain4,(-18.5));
~revHit= Synth( \reverb ,~revRnd[0],~revGrp);~revHit.set(\in,~hitRev, \out,~hitComp);
~compHit=Synth(\comp, [\ctrl, ~kbus,\in,~hitComp,\out, ~hitLimit ],~compGrp);
~compHit.set(\thr,0.19 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\out,~hitLimit );
~limitHit =Synth(\limitertoMixer,[ \in,~hitLimit,\out,~hitStereo],~limitGrp);
~limitHit.set(\gain,89);
~panHit=Synth(\pan2, [\in, ~hitStereo, \out,~toCom], ~stereoGrp);

/*~stereoHit= Synth(\stereoO,[\in, ~hitStereo,\out,~toCom], ~stereoGrp);
~stereoHit.set(\spread,1,\center,0.8,\dlt1,0.3,\dlt2,0.5,\decT,0.0968, \mxDel,1);*/





// ~eqHit2.free
~eqHit2 = Synth(\EQHP96, [\frq, 100 ],~eqGrp0);
~eqHit2.set(\in,~hitEq2,\out,~hitStereoX/*~hitComp2*/,\val4,260,\shelf,1,\gain4,(-15),\val,1850,\quant,1,\gain,(-12),\vol,0.7);


/*~compHit2=Synth(\comp, [\ctrl,/*~kbToPan4*/ ~kbus2,\in,~hitComp2,\out, ~hitLimit2],~compGrp);
~compHit2.set(\thr,0.90 ,\sB, 1.206,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \out,~hitLimit2);
/*~compHit2.free*/
~limitHit2 =Synth(\limitertoMixer,[ \in,~hitLimit2,\out,~hitStereoX],~limitGrp);
~limitHit2.set(\gain,32,\out,~hitStereoX);
/*~limitHit2.free*/*/













// ~eq43.free
~disto43=Synth( \disto,[ \in, ~bigRiToDisto , \out,~bigRiToEnv ], ~distoGrp);
~fil11= Synth( \filter,[ \in,~bigRiToEnv ,\out,~bigRiToEq,\which, 0, \busMod, ~bus17,\qf,0.67,\freqFil,100],~filterGrp );
~eq43= Synth( \EQHP96, [\frq, 100],~eqGrp0);
~eq43.set(\in, ~bigRiToEq, \out, ~bigRiToRev,\val,1800, \quant,1.6, \gain,(-16),\val2,0,\quant2,0, \gain2,0,\val4,2600,\shelf,1.2, \gain4,(-18),);
~rev43= Synth( \reverb, ~rShor, ~revGrp);~rev43.set(\in,~bigRiToRev  , \out,~bigRiToComp);
~comp43= Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp43.set(\thr,0.5 ,\sB, 1.065,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,120,\in, ~bigRiToComp , \out,~bigRiToLimit);
~mix43= Synth(\limitertoMixer,[\c43,1,\in, ~bigRiToLimit, \gain,40,\out,~bigRiToStereo],~limitGrp);
~mix43.set( \gain,12.1);
~stereo43= Synth(\stereoO,[  \in, ~bigRiToStereo   ,\out,~toCom, ], ~stereoGrp);
~stereo43.set(\spread,1,\center,0,\dlt1,0.2,\dlt2,0.35,\decT,0.3872, \mxDel,1);
~stereo43.set(\out,~toCom);
/*~revB43= Synth( \reverbMad2, ~rLong, ~dispatchGrp2);~revB43.set(\in,~bigRiToRevXten  , \out,0);*/
//missing snare compression



~disto44=Synth( \disto,[ \in, ~bigRiToDisto2 , \out,~bigRiToEnv2 ], ~distoGrp);
~fil44= Synth( \filter,[ \in,~bigRiToEnv2 ,\out,~bigRiToEq2,\which, 0, \busMod, ~bus17,\qf,0.67,\freqFil,(-100)],~filterGrp );
~eq44= Synth( \EQHP96, [\frq, 100],~eqGrp0);
~eq44.set(\in, ~bigRiToEq2, \out, ~bigRiToRev2,\val4,1600, \shelf,1.4, \gain4,(-23),\val2,1000,\quant2,1, \gain2,(-10),\val3,3000,\quant3,1.6, \gain3,(-8));
~rev44= Synth( \reverb, ~rShor, ~revGrp);~rev44.set(\in,~bigRiToRev2  , \out,~bigRiToComp2);
~comp44= Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp44.set(\thr,0.8 ,\sB, 1.035,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~bigRiToComp2 , \out,~bigRiToLimit2);
~mix44= Synth(\limitertoMixer,[\c43,1,\in, ~bigRiToLimit2, \gain,40,\out,~bigRiToStereo2],~limitGrp);
~mix44.set( \gain,12.5);
~stereo44= Synth(\stereoO,[  \in, ~bigRiToStereo2   ,\out,~toCom, ], ~stereoGrp);
~stereo44.set(\spread,1,\center,0.3,\dlt1,0.41,\dlt2,0.35,\decT,0.0968, \mxDel,1);



//~eq19.free
~dist8= Synth(\disto,[ \in, ~riTriptoDisto , \out,~riTriptoEq], ~distoGrp);
~eq19 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq19.set(\in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 350, \val,500, \quant,0.3, \gain,(-30),\val2,0,\quant2,0, \gain2,0,\val5,1200,\shelf2,1,\gain5,(-30));
~rev19=Synth( \reverb, ~rShor ,~revGrp); ~rev19.set(\in,~riTriptoRev, \out,~riTriptoComp);
~comp19=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp19.set(\thr,0.92 ,\sB, 1.065,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riTriptoComp,\out,~riTriptoLimit);
~mix19= Synth(\limitertoMixer,[\c19,1,\in, ~riTriptoLimit,\gain,20,\out,~riTriptoStereo],~limitGrp);
// ~mixa.set(\in,~riTriptoStereo);
 ~mix19.set(\gain,26.8);
~stereo19=Synth(\stereoO,[ \in, ~riTriptoStereo  ,\spread,0,\out,~toCom], ~stereoGrp);
~stereo19.set(\dlt1,0.5,\dlt2,0.4,\decT,0, \mxDel,1);
~stereo19b=Synth(\stereoO,[ \in, ~riTriptoStereo  ,\spread,1,\out,~toDelay10,\dlt1,0.5,\dlt2,0.4,\decT,0, \mxDel,1], ~stereoGrp);

//~eqAbc.free
~eqAbc=Synth(\EQHP2, [\frq, 100,\out, ~abcRev],~eqGrp0);
~eqAbc.set(\val, 0,\quant, 0, \gain,0,\val2,3000,\quant2,1, \gain2,(-20), \val3,0,\quant3,0, \gain3,0,\val4,3000,\shelf,1.4, \gain4,(-12),\in, ~abcEq , \out,~abcRev,\vol,1.58,\frq, 200,\val6,1900,\shelf2,1.4,\gain6,(-15));
~revAbc=Synth( \reverbS ,[\in, ~abcRev ,\room, 0.8, \mix,0.5, \damp, 0.7,\out,~abcComp],~revGrp);
~compAbc=Synth(\compS, [\ctrl, ~kbus],~compGrp);
~compAbc.set(\thr,0.65 ,\sB, 1.090,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~abcComp, \out,~toCom );
/*
~stereoAbc= Synth(\stereoS,[\dur,9999, \in, ~abcStereo,\out,~toCom], ~stereoGrp);
~stereoAbc.set(\spread,1,\center,0,\dlt1,0.3,\dlt2,0.4,\decT,0, \mxDel,1,\out,0);*/


////break
~eqBss=	Synth(\EQHP2,[ \in,~bassEq, \out,~kbToPan4,\frq, 20.6,\vol,1,	\val,659.255, \quant,1.1, \gain,(-16),
\val2,1318.51, \quant2,2, \gain2,(-8),\val3,2637.02, \quant3,1, \gain3,(-7),\val5,164.81375, \quant5,1, \gain5,(-14)],~eqGrp0);
~fKb=Synth(\filterS, [\in, ~toFilRise, \out, ~toCom   ,\which,2, \qf2,0.4, \busMod,~bus30,/*\freqFil,60*/],~compGrp4);

~pan2K	=Synth( \pan2,[ \in,~ktoPan2,\out,~filKB ],~granuGrp);

~brkFil = Synth(\filterS,[\freqFil,100, \which,2,\qf2,0.7,\busMod,~bus32,\in,~filKB,\out,0/*~kbToPan5*/],~filterGrp);

~brkFilb = Synth(\filterS,[\freqFil,100, \which,2,\qf2,0.7,\busMod,~bus32,\in,~filKBX,\out,~kSRise],~filterGrp);

~brkFil2 = Synth(\filterS,[\freqFil,10, \which,0,\qf,0.7,\busMod,~bus29,\in,~filKB2,\out,0],~filterGrp);


~pan2K5	=Synth( \pan2,[ \in,~kbToPan5,\out,0 ],~stereoGrp);
~pan2K4=Synth( \pan2,[ \in,~kbToPan4,\out,~toFilRise ],~stereoGrp);
~revKick2=Synth(\reverbMad, [\roomsize, 38, \revtime, 14.85, \damping, 0.1, \inputbw, 0.39, \drylevel, -8, \earlylevel, -9, \taillevel, 10 ,\in,~revKck2,\out, ],~revGrp);
~revKick=Synth(\reverbModu, [\mix,0,\room, 0, \damp, 0,\in,~kickRv,\out,~filKick,\mixMod,~mixM,\roomMod,~roomM,\dampMod,~dampM],~revGrp);
~flangSna= Synth( \flanger1,[ \in,~snareFlang, \out,~distoPercBg, \flangefreq,0.01005859375,\fdback,-0.8,\ph,5.6],~phaserGrp);
~fKick= Synth(\filter, [\which,0,\busMod, ~bus29, \in,~filKick,\out,~kbToPan3,\qf,0.7,\freqFil,100],~delayGrp);
 ~kbPan	=	Synth( \pan2, [\in,~kbToPan3,\out,0],~recGrp3);
///////


~del10=Synth(\del10,[\in,~toDelay10,\decT,t.beatDur*4,\out,~toCom],~delayGrp);
~del10X=Synth(\del10,[\in,~toDelay10b,\decT,t.beatDur*4/*0.7772*/,\out,~tofinalRythm],~delayGrp);

/*
~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.4 ,\sB, 1.034,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~limitBass);

~limK=Synth(\limitertoMixer,[\c45,1,\in, ~limitKick, \gain,1,\out,~kToPan],~limitGrp);
~limK.set(\gain,182);
~limB=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass, \gain,68,\out,~kToPan],~limitGrp);
~limB.set(\gain,132);

~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,~toKbGate],~stereoGrp);*/



~reverb =  Synth(\reverbMad, [\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.59, \drylevel, -8, \earlylevel, -9, \taillevel, -5 , \in,~reverbSquelch  , \out,~comSquelch],~extraRev);
~compReverb= Synth(\compS, [\ctrl, ~kbus],~compGrp4);
~compReverb.set(\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 5,\in, ~comSquelch , \out,~eqBus310);
~reverbEq=Synth( \EQHP2, [\in, ~eqBus310 ,\out, ~limitSquelch,], ~eqGrp4);
~reverbEq.set(\frq, 500/*,\val,11800,\quant,1, \gain,(-18),\val2,2600,\quant2,8, \gain2,(-16)*/,\vol, 0.2);
~mix30= Synth(\limiterStoMixer,[\c30,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mixa.set(\in,~limitSquelch);
 ~mix30.set(\gain,21);


~finaldelay=Synth(\del , [\in, ~delayBus2,\out,~delayToLimit],~extraDelay);
~delayFx =  Synth(\limiterS, [\in,~delayToLimit, \gain,40,\out , ~delayEq],~compGrp4);
~delayFx.set(\gain,73);
~eqDelay=Synth(\EQHP2,[\in,~delayEq, \out,~delToStereo, \frq, 300,\vol,0.4], ~limitGrp4);


~compUlti= Synth(\comp10,[\ctrl, ~snBus,],~compGrp5);
~compUlti.set(\thr,0.76 ,\sB, 1.08,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toCom, \out,~eqBus10);
// ~compUlti.set(\out,0)

/*~compUlti.set(\out,~eqBus10)*/

~mixingUlti = Synth(\EQHP10D, [\in, ~eqBus10, \frq, 100,\vol, 2.2,\out2,~fusible2,/*\val,4000,\quant,1.98,\gain,(-6.8)*/], ~eqGrp3);
 ~mixingUlti.set(\vol, 1.774,/*\gain,(-6.9),\quant,1.98*/);//1.82

				// ~mixingUlti.free
