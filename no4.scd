Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	/*Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,1,\out,~kbus),
	Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf)
,
Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1.7, \gain ,(-20))

,*/

Pbind(\instrument, \snare,/*\carHz, 41.2 */\type,Pseq([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
],inf),
	\modHz,240.00.rand , \carHz,140.00.rrand(10.00), \noiLv,1.00.rrand(0.1),

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\rel,0.0968.rrand(0.05),\rel2, 0.0968.rrand(0.05),\dur, Pseq([1/4], inf),\amp,(-16.5), \crv1,(-12.00).rrand(-4.00),\crv2,(-12.00).rrand(-4.00)   ,\out, Prand([Pseq([~micBus],16), Pseq([ ~distoPercu],16)],inf)/*~percuEq*/, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk)/*,\tS, 0.39550810372374*/,\modAmp,5000.00.rrand(1.00),\modAmp2,5000.00.rrand(1.00)),


	Pbind(\instrument, \disto, \dur, inf, \in, ~distoPercu , \out,~percuFil ,\group, ~distoGrp),


	Pbind(\instrument, \filter, \dur,inf,\which,2, \in,~percuFil,\busMod, ~bus4,\rqLPF,~bus7, \out,~percuEq/*~revSide2*/, \group,~filterGrp ,\freqFil, 30.rrand(-30)),

	/*Pbind(\instrument, \distoS, \dur, inf, \in, ~revSide2 , \out,~percuEq ,\group, ~distoGrp0),*/

	Pbind(\instrument , \EQHP96, \frq, 100 ,\dur, inf,\in, ~percuEq, \group, ~eqGrp0,\val, 1800, \quant, 4, \gain, (-20),\val2,12000,\quant2,4, \gain2,(-12),\out , ~percuRev, \val3,3000,\shelf,1, \gain3,(-15)),


	/*, REPLACE WITH A FLANGER*/

	 Pbindf( ~quickFix, \instrument, \reverb, \dur,inf, \in,~percuRev  , \out,~percuCom,\group,~revGrp),


	Pbind(\instrument,\compSX, \dur,Pseq([4/1],inf),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
		,\gain,1,\in, ~percuCom ,\ctrl, ~kbus, \out, Pwrand([~percuDelay,~percuLimit],[1,4].normalizeSum,inf),\group, ~compGrp ,\tS, 0.39550810372374),

	Pbind(\instrument, \pingDSX, \in, ~percuDelay ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,~percuComb,\group, ~delayGrp2,\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1)),

	///*MouseX.kr(0.01,2)*/maxDel, delayT /*MouseY.kr(0.01,2)*/,decT/*3*/)
	Pbind(\instrument, \combS,\in, ~percuComb,\out,~percuLimit,\dur, Pseq([4/1],inf),\group,~combGrp,
		\maxDel,2, \delayT,Pfunc({6.rrand(0.01)}),\decT,1.00.rrand(0.1),\tS, 0.39550810372374, \amp,0.4
	),

Pbind(\instrument, \limiterStoMixer,\c8,1,\dur, inf, \in,~percuLimit, \gain, 30,\group, ~limitGrp,\out,~percuStereo),


	Pbind(\instrument,\stereoS2, \dur, Pseq([16/1],inf), \in, ~percuStereo  ,\spread,Prand([0,1],inf),\out,0/*~percuCom2*/,\tS, 0.39550810372374,\group, ~stereoGrp, \center,Pfunc({0.3.rrand(-0.3)}),\modPan, ~bus10),


],1))