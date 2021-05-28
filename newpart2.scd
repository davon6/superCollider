(

/*Routine({*/

Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,999,\ph,4.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,-0.4,\rH,0.4, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pseq([Pbindf(~kick,\out,~kbus)],inf),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),



	/*Pbind(\instrument,\lfo13,\out, ~bus29,\dur,Pseq([64/1],inf),\tS, 0.39550810372374,\rL,4600,\rH,1160,\ph,2.2,\val,(~hzQbeat/16)),*/



	Pbind(\instrument, \lfo13T,  \val, 0.1609375, \ph, 2.9,  \out,~bus32, \dur,Pseq([32/1],inf),\rL,150,\rH,1600,\tS, 0.39550810372374),


Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp,\tS, 0.39550810372374),

/*~kb,~hitX,~pedonk,*/ ~fx, ~justHit,

	//if below repeat maybe change to Pfunc

	Pbind(\instrument, \playBuf10, \buf ,~leTout,\out,~toGate10, \start,

	Pseq([
			Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1) )],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
		Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([(~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	Pseq([ (~leTout.numFrames/ 256 * 222.rrand(1))],3),
	],inf)
	,\loopy,0,\tS,0.39550810372374,\dur,  Pseq([

			Pseq([ Pseq([4/1],1) ,Pseq([2/1],1) ],1) ,

Pseq([ Pseq([8/1],1)],1)  ,Pseq([ Pseq([4/1],1)],1)   ,Pseq([Pseq([16/1],1) ,Pseq([8/1],1)],1) ,Pseq([Pseq([32/1],1) ,Pseq([16/1],1)],1)

].scramble,inf)),




	Pbind(\instrument,\gateS, \dur, Prand([ Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],inf),
		\in,  Prand([~toGate10,~toGate102], inf)  ,\out ,~absoFinalGate2

	,  \group, ~gateGrp6,\tS, 0.39550810372374),




	Pseq([

	/*		Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)*/

//have one ris



		~part3a,
		~part3b,~part3e,
		/*Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate2 ,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374),
		Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in,~absoFinalGate,\out , ~toExtraFx,\group, ~recGrp2,\tS, 0.39550810372374)*/

	].scramble,inf),


	Pwrand([

		Pbind(\instrument,\gateS, \dur, Prand([Pseq([1.5/1],1), Pseq([3/1],1),Pseq([1/1],1),],1),
			\in,  ~toExtraFx  ,\out ,Pwrand([~tofinalRythm,~reverbSquelch],[16,1].normalizeSum,inf), \group, ~gateGrp7,\tS, 0.39550810372374),

		Pseq([
			Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\rest],inf),\in,~toExtraFx  ,\out ,~delayBus2 ,\group, ~gateGrp7,\tS, 0.39550810372374),

			Pbind(\instrument,\gateS, \dur, Pseq([1/2],1),\tS, 0.39550810372374,\type,\rest)

			],1)

	],[48,1].normalizeSum,  inf),


	],1).play(t);

/*	wait(0.15);

	 /* s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/stem2.aiff",numChannels:10,duration:t.beatDur*256);*/


	// s.record;


}).play;*/)






