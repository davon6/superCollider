(
~bassRest = Pbindf(~bass,  \type,\rest);

~kbassRest =Ppar([~kick, ~bassRest], 1);

~bar = [Ppar([~kick,~bass],1),Ppar([~kick,~bass],4),Ppar([~kick,~bass],8),Ppar([~kick,~bass],12),Ppar([~kick,~bass],14) ,Ppar([~kick,~bass],15) ,Ppar([~kick,~bass],16)];

~granK = Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1));


~rev =Ppar([Pbindf(~kick,\out,~micBus,/*\group, ~micGrp*/), Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1));],1);
/*.play(t,quant:1)*/
~perc = [


	Ppar([~bar[1],Pbindf(~cymbal, \dur,Pseq([1/4],16)),
		Pbindf(~hat, \dur,Pseq([1/4],16)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)),      ],1),


	Ppar([~bar[2],Pbindf(~cymbal, \dur,Pseq([1/4],32)),
		Pbindf(~hat, \dur,Pseq([1/4],32)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 4)),      ],1),

	Ppar([~bar[3],Pbindf(~cymbal, \dur,Pseq([1/4],48)),
		Pbindf(~hat, \dur,Pseq([1/4],48)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 6))],1),


	Ppar([~bar[4],Pbindf(~cymbal, \dur,Pseq([1/4],56)),
		Pbindf(~hat, \dur,Pseq([1/4],56)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7)),],1),


	Ppar([~bar[5],Pbindf(~cymbal, \dur,Pseq([1/4],60)),
		Pbindf(~hat, \dur,Pseq([1/4],60)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7))],1),


	Ppar([~bar[6],~hat,~cymbal,~snare],1)
];

Ppar([Pseq([~bass],inf),Pbindf(~snare,\da1,0)],1);//JEEEZ

~toUse = Prand([


	~perc[5],

	~bar[6],

	Ppar([~bar[6],~hat,Pbindf(~cymbal,\type,Pseq([\rest,\rest,\note,\rest ,\rest,\rest ,\note, \rest],inf)),~snare],1),

Ppar([~bar[6],~hat,~cymbal,~snare],1),

Ppar([~bar[6],~hat,~cymbal],1),
Ppar([~bar[6],~hat],1),
Ppar([~bar[6],~snare],1),
	Ppar([~bar[6],Pbindf(~snare,\da1,0)],1),

		Pseq([~perc[4] ,Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3)],1) ,

	Pseq([~perc[4],Pseq([Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1) ,Pseq([Pbindf(~kick, \dur,Pseq([1/12],1))],8)],1),~kick],1),

	Pseq([~perc[4],Pseq([~bassRest],2)],1)  ,

	Pseq([~perc[3],Pseq([~bassRest],2)],1) ,

	Pseq([~bassRest],16),

	Ppar([~kick,Pseq([~bassRest],16)],1),

	Pseq([~bar[5],~kbassRest],1),

	Pseq([~bar[1],Pseq([~bassRest],8)],1),

	Pseq([~perc[4],~bassRest],1),

	Pseq([~perc[4],~kbassRest],1),

	Pseq([~kbassRest,~perc[4]],1),

	 Pseq([~perc[4],        Pseq([ Ppar([Pbindf(~kick,\out,~micBus/*,\group, ~micGrp*/), Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1));],1)  ,


		Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],2),Ppar([Pbindf(~kick,\out,~micBus/*,\group, ~micGrp*/), Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1));],1), Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],1)
	],1   )],1) ,

	 Pseq([~perc[3],
 	Ppar([Pseq([	Pbindf(~kick,\out,~micBus/*,\group, ~micGrp*/,\dur,Pseq([1/1],1))],1),
 		Pbind(\instrument,\gran,\dur,Pseq([1/4],4),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
 	],1)
 ],1),



	Pseq([ ~perc[2], Ppar([~kick,   Ppar([   Pseq([	Pbindf(~kick,\out,~micBus,/*\group, ~micGrp,*/\dur,Pseq([1/1],1))],2),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],8),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
],1)                       ],1)   ],1)

],inf);
)

