
~bassRest = Pbindf(~bass,  \type,\rest);

~kbassRest =Ppar([~kick, ~bassRest], 1);

~rev =Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/4],1)),

		Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,~norm1,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1))
	],1);

~spe1 =
Pseq([

~kbassRest,Pseq([~bassRest],3),
	Ppar([
	Ppar([
			Pbindf(~kick,\out,~effctBus2),
			Pbindf(~bass,\out,~effctBus2)], 4),


		Pbind(\instrument, \effect,\dur, Pseq([4/1],1),\dec1, Pseq([4/1],1), \in,~effctBus2,\out,~norm1,\group,~effctGrp2 )

	], 1),

	~kbassRest,Pseq([~bassRest],3)],1);

~spe2 =

Ppar([Pseq([  Pseq([ Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],4),Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],16), Pseq([Pbindf(~kick,\dur, Pseq([1/3],1),\out,~effctBus2)],3),Pseq([Pbindf(~kick,\dur, Pseq([1/1],1),\out,~effctBus2)],4), Pseq([Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],2) ,Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],4)],1) ,Pbind(\instrument, \effect,\wE,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,~norm1,\group,~effctGrp2,\dec1,6 ),
],1);

~spe3 =   Ppar([

	Ppar([Ppar([Pbindf(~kick,\out,~effctBus2),Pbindf(~bass,\out,~effctBus2)],16),Pbindf(~cymbal, \dur,Pseq([1/4],64),\out,~effctBus2),
		Pbindf(~hat, \dur,Pseq([1/4],64),\out,~effctBus2)    ,
	Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 8),\out,~effctBus2)	],1)      ,

	Pbind(\instrument, \effect,\wF,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,~norm1,\group,~effctGrp2,\dec1,6 )], 1);


~spe4 =

Pseq([

Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1)),
	Pbind(\instrument,\gran,\dur,Pseq([1/16],16),\amp, 1,\buf, e,\out,~norm1,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1.2),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.09,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],4),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, e,\out,~norm1,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],3),
	Pbind(\instrument,\gran,\dur,Pseq([1/1],3),\amp, 1,\buf, e,\out,~norm1,\atk, 0,\rel, Pseq([1/1],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/1],inf))
	],1)

],1);

//~spe1.play(t, quant:1)
~specialHits = [~spe1,~spe2,~spe3,~spe4].scramble;



~bar = [Ppar([~kick,~bass],1),Ppar([~kick,~bass],4),Ppar([~kick,~bass],8),Ppar([~kick,~bass],12),Ppar([~kick,~bass],14) ,Ppar([~kick,~bass],15) ,Ppar([~kick,~bass],16)];



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

~toUse = [


	~perc[5],

	~bar[6],

	Ppar([~bar[6],~hat,Pbindf(~cymbal,\type,Pseq([\rest,\rest,\note,\rest ,\rest,\rest ,\note, \rest],inf)),~snare],2),

Ppar([~bar[6],~hat,~cymbal,~snare],2),

Ppar([~bar[6],~hat,~cymbal],2),
Ppar([~bar[6],~hat],2),
Ppar([~bar[6],~snare],2),
	Ppar([~bar[6],Pbindf(~snare,\da1,0)],1)

	,

	Pseq([~perc[4], Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4) ,Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3)],1),


 Pseq([~perc[4],Pseq([Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1) ,Pseq([Pbindf(~kick, \dur,Pseq([1/12],1))],8)],1),~kick],1),



 Pseq([~perc[4],Pseq([~bassRest],2)],1)  ,



 Pseq([~perc[4],        Pseq([ ~rev  ,


		Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],2),~rev, Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],1)
	],1   )],1) ,

 Pseq([~perc[3],Pseq([~bassRest],2)],1) ,
 Pseq([~perc[3],
 Ppar([Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],1),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],4),\amp, 1,\buf, e,\out,~norm1,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1)

],1),

	Pseq([ ~perc[2], Ppar([~kick,   Ppar([   Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],2),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],8),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
],1)                       ],1)   ],1),
 Pseq([~kick, Pseq([~bassRest],14) ,~kick ],1) ,







	Ppar([~kick,~spe3],1),

//ADD FILTERING!!
	Pseq([
	Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4),
	Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3),
	Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4),
	Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1),
	Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4),
	Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1),
	],1)

	,



Ppar([
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)) ,
		Pbindf(~cymbal, \type,\note, \dur, Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),
		Pbindf(~hat, \type,\note, \dur, Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),

			Pseq([  Pseq([ Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],4),Pseq([Pbindf(~kick,\dur, Pseq([1/8],1),\out,~effctBus2)],8), Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],16),Pseq([Pbindf(~kick,\dur, Pseq([1/32],1),\out,~effctBus2)],32), Pseq([Pbindf(~kick,\dur, Pseq([1/64],1),\out,~effctBus2)],60),~rev],1) ,
		Pbind(\instrument, \effect,\wE,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,~comBusHat,\group,~effctGrp2,\dec1,6 ),
	],1)

	,

	Pseq([~bassRest],16),

	Pseq([~kick,Pseq([~bassRest],16)],1),
//];

//~dbleRverseStart =

	Pseq([Pseq([~rev],2),~kbassRest,~bassRest,~perc[0],~perc[1]],1),

//~barwithBre=

	Pseq([~bar[5],~kbassRest],1),

//~semiBreak =

	Pseq([~bar[1],Pseq([~bassRest],8)],1),

//~ens2 =
	Pseq([~perc[4],~bassRest],1),

//~ens15Perc =
	Pseq([~perc[4],~kbassRest],1),

//	~ens15PercR =
	Pseq([ Pseq([~perc[4]],1),~rev],1),

//~ens15PercS =

	Pseq([~kbassRest,~perc[4]],1),

//~fitDbleick = ADD FILTERING!!

	Pseq([~perc[0],  ~kbassRest  ,Pseq([~bassRest],2),
		Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],1), ~kbassRest  ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],2), Pseq([Pbindf(~kick,\dur,Pseq([1/4],1))],4) ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],3)],1)

];
