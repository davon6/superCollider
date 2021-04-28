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


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 40, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
		Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],inf), \out,~dipatchKB, \freq,Prand([~bssFreq3,~bssFreq1,~bssFreq2],inf), \group,~shifGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
	],1),

	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),

Pbind(\instrument, \snare,\carHz, 41.2 ,\type,
		Pseq([
		Pseq([
	/*Pseq([\rest ,\rest,\note,\rest], 96),*/
Pwrand([    Pseq([\rest ,\rest,\note,\rest] ,1),Pseq([\rest ,\note,\note,\rest],1),
			Pseq([\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest],1)
		],[26,1,4].normalizeSum , 96),
				Pseq([\rest,\rest,\rest,\rest],32)].scramble,1), Pseq([\rest ],128)],inf)
	,\atk, 0.00502929687,\rel, 0.0968,\rel2,
	Pseq([Pseq([ 0.3872],32), Pseq([ 0.7744],32)],inf),\dur, Pseq([1/2], inf),\amp,1, \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),
	\da1,Prand([ Pseq([2],32),Pseq([0],32)],inf)      ),


Pbind(\instrument, \percussion,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 224 /*32*/),Pseq(~rythmL, 256) ],inf),\dur,Pseq([1/4],inf ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, ~cymbalEq),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], inf),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -16.7),( -16.5),( -16.2),( -16.2),( -15.9),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~hatEq),

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
		\dur, Pseq([48/1],1)),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingK,~to4bar],inf), \group, ~gateGrp7, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1))

		Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~gateGrp7, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),




		],4)

	],1),





	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/





	//INCORPORAE SLIGHT MOVEMENT

	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,(-540),\val2,1200,\crv,3.2),




	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1))









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


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 40, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



						Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),
		Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],inf), \out,~dipatchKB, \freq,Prand([~bssFreq3,~bssFreq1,~bssFreq2],inf), \group,~shifGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,)
	],1),

	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),

Pbind(\instrument, \snare,\carHz, 41.2 ,\type,Pseq([
	/*Pseq([\rest ,\rest,\note,\rest], 96),*/
Pwrand([    Pseq([\rest ,\rest,\note,\rest] ,1),Pseq([\rest ,\note,\note,\rest],1),
			Pseq([\rest ,\note,\note,\rest,\rest,\rest,\rest,\rest],1)
		],[26,1,4].normalizeSum , 96),
		Pseq([\rest,\rest,\rest,\rest],32)].scramble,inf)
	,\atk, 0.00502929687,\rel, 0.0968,\rel2,
	Pseq([Pseq([ 0.3872],32), Pseq([ 0.7744],32)],inf),\dur, Pseq([1/2], inf),\amp,1, \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),
	\da1,Prand([ Pseq([2],32),Pseq([0],32)],inf)      ),


Pbind(\instrument, \percussion,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 32) ],inf),\dur,Pseq([1/4],inf ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, ~cymbalEq),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], inf),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -16.7),( -16.5),( -16.2),( -16.2),( -15.9),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~hatEq),

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

		].scramble,inf),





	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/





	//INCORPORAE SLIGHT MOVEMENT

	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,(-540),\val2,1200,\crv,3.2),




	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1))