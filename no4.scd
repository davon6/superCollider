Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out, Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),


	Pbind(\instrument, \disto, \dur, inf, \in, ~distoPercu , \out,~percuFil ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,inf,\which,1, \in,~percuFil,\busMod, ~bus4,\qf2,0.4, \out,/*~toLim*/~percuEq, \group,~filterGrp ,\freqFil, 30.rrand(-30)),

	// Pbind(\instrument, \lim2,\in,~toLim,\out,~percuEq,\group,~distoGrp0,\ml,0.1,\dur, inf),

	Pbind(\instrument , \EQHP96, \frq, 100 ,\dur, inf,\in, ~percuEq, \group, ~eqGrp0,\val, 22000, \quant, 4, \gain, (-20),\val2,12000,\quant2,4, \gain2,(-12),\out , ~percuRev, \val3,3000,\shelf,1, \gain3,(-15)),


	 Pbindf( ~quickFix, \instrument, \reverb, \dur,inf, \in,~percuRev  , \out,~percuCom,\group,~revGrp),


	Pbind(\instrument,\compS, \dur,inf/*\compSX, \dur,Pseq([4/1],inf)*/,\thr,0.8 ,\sB, 1.2,\sA, 1/2,\atk ,0.0001, \rel ,0.0968,\gain,1,\in, ~percuCom ,\ctrl, ~kbus, \out,~percuLimit/* Pwrand([~percuComb,~percuLimit],[1,4].normalizeSum,inf)*/,\group, ~compGrp ,\tS, 0.39550810372374),

	/*Pbind(\instrument, \pingDSX, \in, ~percuDelay ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,~percuComb,\group, ~delayGrp2,\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1)),*/


/*	Pbind(\instrument, \combS,\in, ~percuComb,\out,~percuLimit,\dur, Pseq([4/1],inf),\group,~combGrp,
		\maxDel,2, \delayT,Pfunc({1.rrand(-1.00)}),\decT,1.00.rrand(0.1),\tS, 0.39550810372374, \amp,0.4
	),*/

/*Pbind(\instrument, \limiterStoMixer,\c9,1,\name, 9,\dur, inf, \in,~percuLimit, \gain,32,\group, ~limitGrp,\out,~percuStereo),*/

	Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Pfunc({1.rand}),\out,0/*~percuCom2*/,\tS, 0.39550810372374,\group, ~stereoGrp, \center,Pfunc({0.1.rrand(-0.1)}),\modPan, ~bus10),

],1))