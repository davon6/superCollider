






(
Ppar([

Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),


	Pbind(\instrument, \lfo12, \dur,Pseq([16/1],inf), \val, Prand([0,1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus8, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),


	~bassShap,



/*	Pbind(\instrument, \lfo3, \dur, Pwrand([ Pseq([ 1/4 ],16), Pseq([ 1/1 ],4)],  [1,4].normalizeSum,inf)   , \out,~bus2, \group, ~lfoGrp),*/


	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.8),\rH,0.8, \group, ~lfoGrp),


	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pseq([Pbindf(~snare,\out,~snBus)],inf),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,0/*~dipatchKB*/,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,0/*~dipatchKB*/,\group, ~compGrp),




	Pbind(\instrument, \limiter, \dur,inf, \in , ~limitRkick,  \out, ~stereoRkick, \gain , 20, \group, ~limitGrp),
	Pbind(\instrument, \stereo, \dur,9999, \in, ~stereoRkick,  \group, ~stereoGrp),



Prand([

	/*Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~rollingK,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.2),

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), Pseq([1/64],64),Pseq([1/64],256)   ],1),\amp, 1,\buf, ~k2,\out,~rollingK,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.17),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~rollingK,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),*/


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~rollingK/*~dispatchBus*/,\pitchRte,(-1),/*\group,~granGrp,*/\duration,0.1/*Pkey(\dur)*/,\impulse,0.001,\pos,0.22)

	],inf),






Pbind(\instrument, \dispatch , \dur,999 /*Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf)*/, \in,~dispatchBus, \out, Prand([~lpK,~bpK,~hpK],inf)),

Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiter,\dur,inf,\gain, 10, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),




	Pbind(\instrument, \stereo,  \dur, 999/*Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf) */ ,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK,   \group,~stereoGrp),




	Pseq([ Prand([~bar[2],~perc[1] ],1),


			Pbind(\instrument, \dispatchS102, \dur, Pseq([8/1],1),\in,~rollingK/*Prand([ 0, ~rollingK],inf)*/,\out,~again,\group,~dispatchGrp2),





	],inf),


Pbind(\instrument, \dispatchS10, \dur, 9999,\in,~again,\group,~finalDispatchGrp)


],1).play(t)

)



s.meter