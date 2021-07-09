








// ~mix32.free

~comp10Ry=Synth( \comp10, [\in,~toComp10,\out,~rythmLimit],~compGrp);
~comp10Ry.set(\thr,0.6 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1);
~mix32=	Synth( \limiter10toMixer,[\c32,1,\dur, inf, \in,~rythmLimit,\out,~flopped, \gain,22,], ~limitGrp);
~mix32.set(\gain,14.6);
~flopd = 	Synth(\stereoO10, [ \in,~flopped,\out,~toCom],~stereoGrp);
~flopd.set(\spread,0,\center,0,\dlt1,0.05,\dlt2,0,\decT,0, \mxDel,0);





/*~rHit= Synth(\EQHP96, [\frq, 100 ,\in,~revHitEq,\out,~hitLimit],~eqGrp0);
~rHit.set(\vol,0.63,\val4,3000,\shelf,1.6,\gain4,(-18));*/

//hit
// ~eqHit.free
~eqHit = Synth(\EQHP96, [\frq, 200 ],~eqGrp0);
~eqHit.set(\in,~hitEq,\out,~hitRev);
~revHit= Synth( \reverb ,~revRnd[0],~revGrp);~revHit.set(\in,~hitRev, \out,~hitComp);
~compHit=Synth(\comp, [\ctrl, ~kbus,\in,~hitComp,\out, ~hitLimit ],~compGrp);
~compHit.set(\thr,0.19 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\out,~hitLimit );
~limitHit =Synth(\limitertoMixer,[ \in,~hitLimit,\out,~hitStereo],~limitGrp);
~limitHit.set(\gain,70.3);
~panHit=Synth(\pan2, [\in, ~hitStereo, \out,0/*~hiCom*/], ~stereoGrp);


~bassFilter= Synth(\filter,[\in, ~bassFi,\out,~comFuzz,\freqFil,9800,\qf,0.8,\which,0,\busMod,~bassShapB],~filterGrp);


~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.2 ,\sB, 1.043,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~limitBass);

~limK=Synth(\limitertoMixer,[\c45,1,\in, ~limitKick, \gain,1,\out,~kToPan],~limitGrp);
~limK.set(\gain,154.7);
~limB=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass, \gain,68,\out,~kToPan],~limitGrp);
~limB.set(\gain,254);

~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,~toKbGate],~stereoGrp);




~comp2=Synth(\comp, [\ctrl, ~k2G ],~compGrp);
~comp2.set(\thr,0.05, \sB, 1, \sA ,-0.85,\atk ,0.0242, \rel ,t.beatDur/4.4, \gain,1,\in, ~comFuzz2,\out,~limitBass2);
~limB2=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass2, \gain,68,\out,~k2ToPan],~limitGrp);
~limB2.set(\gain,254,\out,~k2ToPan);
~kbPanX = Synth(\pan2,[ \in,~k2ToPan,\out,0],~stereoGrp);

//PERCUSSIONS
// ~eq31.free
/*Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256),Pseq([\rest],256) ],inf),\dur,Pseq([1/4],inf ),\stereoL, 0.00555,\out,    ~cymbalEq).play(t,quant:1)*/

~eq31=Synth(\EQHP96, [\frq, 3000, \in, ~cymbalEq,\out , ~comBusCymb, \vol,4],~eqGrp);
~eq31.set(\val, 5000,\quant, 1, \gain,(-15),\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\out , ~comBusCymb);
~comp31=Synth(\comp,[\ctrl, ~kbus,],~compGrp);
~comp31.set(\thr,0.3 ,\sB, 1.05,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,3.5,\in, ~comBusCymb , \out,~limitCymb);
~mix31= Synth(\limitertoMixer,[\c50,1,\in, ~limitCymb,\gain,20,\out,~stereoCymb],~limitGrp);
 ~mix31.set(\gain,6,\in, ~limitCymb,\out,~stereoCymb);
~sterCymb=Synth(\stereoO,[\in,~stereoCymb,\out,~comFuzz22],~stereoGrp);
~sterCymb.set(\spread,1,\center,1,\dlt1,0.4045,\dlt2,0.4,\decT,0.0242, \mxDel,1);

//group name chelou for dynaEq







//~eq33.free
/*Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~comBusHat,\type, Pseq([  Pseq([ Pseq([ \note],800)],inf)],1)).play(t,quant:1)*/
~comp33=Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp33.set(\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat, \out,~limitHat );


~mix33= Synth(\limitertoMixer,[\c52,1,\in, ~limitHat,\gain,36,\out,~hatEq ],~limitGrp);
~mix33.set(\gain,31.2,\out,~hatEq);

// ~eq33.free
~eq33=Synth(\EQHPDyna, [\frq, 3000 ,\in, ~hatEq,  \out,~stereoHat,\vol,0.5,\ctrl,~fusible2 ,\valD,3100, \quantD,8],~dynaEq2);

// Synth(\EQHP96, [\frq, 3000 ,\in, ~hatEq,  \out,0,\vol,0.5,\ctrl,~fusible2 ,\valD,3100, \quantD,8],~dynaEq);

~eq33.set(\out , ~stereoHat,\vol,5);


~sterHat=Synth(\stereoO,[\in,~stereoHat,\out,~comFuzz22],~stereoGr7);
~sterHat.set(\spread,0,\center,0,\dlt1,0.01,\dlt2,0.5,\decT,0.0121, \mxDel,1,\out,~comFuzz22);


~percuComp =Synth(\comp10, [\ctrl,~snBus ,   \in, ~comFuzz22 ,\out,~toKbGate],~compGrp8);
~percuComp.set(\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872,\out,~toKbGate);



/*
Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\type, Pseq([\rest,\rest,\note,\rest ],inf),\dur, Pseq([1/2], inf) ,\out,~snareEQ,\dA,Pseq([ /* Pseq([1],32), */Pseq([0.5],32)],inf)).play(t,quant:2)*/

//~eq34.free
~eq34= Synth(\EQHP96, [\frq, 220 ],~eqGrp);
~eq34.set(\in, ~snareEQ, \val, 400, \quant, 8, \gain, (-10), \out , ~snareComp,\frq, 120,);


~comp34=Synth(\comp, [\ctrl,~kbus ],~compGrp);
~comp34.set(\thr,0.88 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.1936, \in, ~snareComp ,\out,~snareLimit,\gain,14);


~mix34= Synth(\limitertoMixer,[\c34,1,\in, ~snareLimit,\gain,40,\out,~toPan2],~limitGrp);
~mix34.set(\gain,149.4);
~pan34=Synth( \pan2,[\in, ~toPan2,\out, ~toKbGate], ~stereoGrp);




~eq34= Synth(\EQHP96, [\frq, 220 ],~eqGrp);
~eq34.set(\in, ~snareEQ2, \val, 400, \quant, 8, \gain, (-10), \out , ~snareComp2,\frq, 120);

~comp34=Synth(\comp, [\ctrl,~kbus ],~compGrp);
~comp34.set(\thr,0.88 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.1936, \in, ~snareComp2 ,\out,~snareLimit2,\gain,14);

~mix34= Synth(\limitertoMixer,[\c34,1,\in, ~snareLimit2,\gain,40,\out,~toPanSn2],~limitGrp);
~mix34.set(\gain,149.4);
~pan34=Synth( \pan2,[\in, ~toPanSn2,\out, ~toKbGate], ~stereoGrp);




~fil20= Synth(\filter, [\busMod, ~bus31, \freqFil, 1000,\in, ~slideBus,\out,~slideEq,\qf,0.8],~filterGrp);
~eq20 =Synth(\EQHP96, [ \frq, 100 ], ~eqGrp0);
~eq20.set(\in, ~slideEq , \out, ~slideBusToStereo ,\frq, 500, \val,12000, \quant,1.6, \gain,(-26),\val2,0,\quant2,0, \gain2,0, \vol,0.125);
~pan20=Synth(\pan2, [/*\in, ~toPan2,*/\in,~slideBusToStereo, \out,~toKbGate], ~stereoGrp);













~bgX= Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~audio4,\out, ~bgDisto,\amp,1,\start,1500000]);

~distoBGX=Synth(\disto,[\in,~bgDisto,\out,~bgFilX],~distoGrp);

~filBgX=Synth(\filter, [\in,~bgFilX, \busMod,~bus25,\qf,0.5, \freqFil, 100,\which,0,\out,~bgGate],~filterGrp);

~compBgX=Synth(\comp, [\ctrl, ~kbus,\in, ~bgComp],~compGrp);
~compBgX.set(\thr,0.60 ,\sB, 1.080,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1 ,\out,~bgEqu);
~bgEqX=Synth(\EQHP96, [ \in, ~bgEqu, \out,~bgLimite,\frq,800],~delayGrp2);
~bgEqX.set(\frq,650,\val4,3668,\shelf,1.2,\gain4,(-20),\val,1950,\quant,1.6,\gain,(-15));
~limBgX=Synth(\limitertoMixer,[ \c50,1, \in,~bgLimite ,\out,~bgStereoO, \gain, 20],~limitGrp  );
~limBgX.set(\gain,46.5);
~stereoP=Synth(\stereoO,[\in,~bgStereoO ,\out,~toCom2],~stereoGrp);
~stereoP.set(\spread,0.8,\center,0,\dlt1,0.1,\dlt2,0.2,\decT,0.0242, \mxDel,1,\out,~toCom2);










/*// ~eqHit2.free
~eqHit2 = Synth(\EQHP96, [\frq, 100 ],~eqGrp0);
~eqHit2.set(\in,~hitEq2,\out,~hitStereoX,\val4,2600,\shelf,1,\gain4,(-19),\val,1850,\quant,1,\gain,(-12),\vol,0.7);*/







// ~eq43.free
~disto43=Synth( \disto,[ \in, ~bigRiToDisto , \out,~bigRiToEnv ], ~distoGrp);
~fil11= Synth( \filter,[ \in,~bigRiToEnv ,\out,~bigRiToEq,\which, 0, \busMod, ~bus17,\qf,0.67,\freqFil,100],~filterGrp );
~eq43= Synth( \EQHP96, [\frq, 100],~eqGrp0);
~eq43.set(\in, ~bigRiToEq, \out, ~bigRiToRev,\val,1800, \quant,1.6, \gain,(-16),\val2,0,\quant2,0, \gain2,0,\val4,2600,\shelf,1.2, \gain4,(-18),);
~rev43= Synth( \reverb, ~rShor, ~revGrp);~rev43.set(\in,~bigRiToRev  , \out,~bigRiToComp);
~comp43= Synth(\comp, [\ctrl, ~kbus],~compGrp);
~comp43.set(\thr,0.5 ,\sB, 1.065,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,120,\in, ~bigRiToComp , \out,~bigRiToLimit);
~mix43= Synth(\limitertoMixer,[\c43,1,\in, ~bigRiToLimit, \gain,40,\out,~bigRiToStereo],~limitGrp);
~mix43.set( \gain,11.1);
~stereo43= Synth(\stereoO,[  \in, ~bigRiToStereo   ,\out,~extraComp, ], ~stereoGrp);
~stereo43.set(\spread,0.6,\center,0,\dlt1,0.2,\dlt2,0.35,\decT,0.3872, \mxDel,1);






~slidy=Synth(\filter10, [\freqFil,100, \busMod,~bus34,\qf,0.5,\in,~toSlide,\out,~toExtraComp2],~filterGrp);

~del10=Synth(\del10,[\in,~toDelay10,\decT,t.beatDur*4,\out,~hiCom],~delayGrp);
~del10X=Synth(\del10,[\in,~toDelay10b,\decT,t.beatDur*4,\out,~toCom],~dispatchGrp2);

~del10Z=Synth(\del10,[\in,~toDelay10c,\decT,1.5544,\out,~toExtraComp2],~delayGrp);






~reverb =  Synth(\reverbMad, [\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.59, \drylevel, -8, \earlylevel, -9, \taillevel, -5 , \in,~reverbSquelch  , \out,~comSquelch],~extraRev);
~compReverb= Synth(\compS, [\ctrl, ~kbus],~compGrp4);
~compReverb.set(\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 5,\in, ~comSquelch , \out,~eqBus310);
~reverbEq=Synth( \EQHP2, [\in, ~eqBus310 ,\out, ~limitSquelch,], ~eqGrp4);
~reverbEq.set(\frq, 500,\vol, 0.2);
~mix30= Synth(\limiterStoMixer,[\c30,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mixa.set(\in,~limitSquelch);
 ~mix30.set(\gain,21);

~stereo30= Synth(\stereoS,[\dur, 9999, \in, ~stereoBus3b   ,\out,~toCom,\spread,1, ], ~stereoGrp4),


~finaldelay=Synth(\del , [\in, ~delayBus2,\out,~delayToLimit],~extraDelay);
~delayFx =  Synth(\limiterS, [\in,~delayToLimit, \gain,40,\out , ~delayEq],~compGrp4);
~delayFx.set(\gain,73);
~eqDelay=Synth(\EQHP2,[\in,~delayEq, \out,~delToStereo, \frq, 300,\vol,0.4], ~limitGrp4);



~fil10Start= Synth(\filter10, [\busMod,~bus17 , \freqFil, 830,\in,~toFilBefShift ,\out,~toCom2,\qf,0.8,\which,0],~lfoGrp2);


// ~padfader.free

~kickfader = Synth(\fader, [in: ~toCom, out: ~toCom3], ~kickgroup1, \addToTail);
	~padfader = Synth(\fader, [in: ~toCom2, out: ~toCom3], ~padgroup1, \addToTail);
	~fakeSidechain = Synth(\fakeSidechain, [
		out: ~toCom2, sideBus: ~toCom,
		relax: 0.1
	], ~padfader, \addBefore);


~fakeSidechain.set(\clampLevel,0.4);





~hitCompression= Synth(\comp10,[\ctrl, ~hiCom],~compGrp8);

~hitCompression.set(\in, ~toCom3,  \out ,~toExtraComp2,\thr, 0.05, \sB, 1, \sA ,-60, \atk, /*0.05*/  0.1, \rel, 0.1);



~kickfader2 = Synth(\fader, [in: ~extraComp    , out: ~toExtraComp], ~kickgroup2, \addToTail);
	~padfader2 = Synth(\fader, [in: ~toExtraComp2          , out: ~toExtraComp], ~padgroup2, \addToTail);
	~fakeSidechain2 = Synth(\fakeSidechain, [
		out: ~toExtraComp2      , sideBus: ~extraComp,
		relax: 0.1
	], ~padfader2, \addBefore);

~fakeSidechain2.set(\clampLevel,0.32);




~compUlti= Synth(\comp10Duo,[\ctrl, ~snBus,],~finalComp);
~compUlti.set(\thr,0.76 ,\sB, 1.04,\sA, 1/2,\atk ,0.0484, \rel ,0.1936 ,\in, ~toExtraComp, \in2,~hiCom,\out,~eqBus10);
// ~compUlti.set(\out,0)

/*~compUlti.set(\out,~eqBus10)*/

~mixingUlti = Synth(\EQHP10D, [\in, ~eqBus10, \frq, 100,\vol, 2.2,\out2,~fusible2,\out,0], ~finalEq);
 ~mixingUlti.set(\vol, 2.0716);

				// ~mixingUlti.free
