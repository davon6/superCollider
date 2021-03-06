(
~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,( -3.5),\out,0);

	~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\dA1,2,\out,~bassShapB);

	~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.82,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, (-10),\out,0
	);

	~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-16.3),\rel,Pseq([1/16],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-4.4), \crv1b,(-4), \mulMod, 1691,\out, ~comBusCymb);

~hat = Pbind(\instrument,\percussion,\dur,Pseq([1/4], 64),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -17), ( -18),( -18),( -19),( -17),( -17),( -18),( -17)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~comBusHat);

	~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-20.5), \crv1,(-8),\crv2,(-7)   ,\out,0);


~bassRest = Pbindf(~bass,  \type,Pseq([\rest],inf));

~kbassRest =Ppar([~kick, ~bassRest], 1);

~bar = [Ppar([~kick,~bass],1),Ppar([~kick,~bass],4),Ppar([~kick,~bass],8),Ppar([~kick,~bass],12),Ppar([~kick,~bass],14) ,Ppar([~kick,~bass],15) ,Ppar([~kick,~bass],16)];

~granK = Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, ~k,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1));


~rev =Ppar([Pbindf(~kick,\out,~micBus,/*\group, ~micGrp*/), Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, ~k,\out,0,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1),\crv,50);],1);
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

~toUse =  Pseq([


	~perc[5],

	~bar[6],

	Ppar([~bar[6],~hat,Pbindf(~cymbal,\type,Pseq([\rest,\rest,\note,\rest ,\rest,\rest ,\note, \rest],inf)),~snare],1),

Ppar([~bar[6],~hat,~cymbal,~snare],1),

Ppar([~bar[6],~hat,~cymbal],1),
Ppar([~bar[6],~hat],1),
Ppar([~bar[6],~snare],1),
	Ppar([~bar[6],Pbindf(~snare,\da1,0)],1),

		Pseq([~perc[4] ,Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3)],1) ,

	Pseq([~perc[4],Pseq([Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1) ,Pseq([Pbindf(~kick, \dur,Pseq([1/12],1))],8)],1)],1),

	Pseq([Pseq([~bassRest],1),~perc[3],Pseq([~bassRest],1)],1)  ,

	Pseq([~perc[3],Pseq([~bassRest],2)],1) ,

	Pseq([~bassRest],16),

	Ppar([~kick,Pseq([~bassRest],16)],1),

	Pseq([~bar[5],~kbassRest],1),

	Pseq([~bar[2],Pseq([~bassRest],8)],1),

	Pseq([~perc[4],~bassRest],1),

	Pseq([~perc[4],~kbassRest],1),

	Pseq([~kbassRest,~perc[4]],1),



	Pseq([~perc[3],      /*  Pseq([ Pbindf(~kick,\out,~micBus/*,\group, ~micGrp*/),*/


		Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],2),Pbindf(~kick,\out,~micBus)/*, Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],1)*/
	],1   )/*],1) */,

	 Pseq([~perc[4],
 	Pbindf(~kick,\out,~micBus,\dur,Pseq([1/1],1))],1),




	Pseq([ ~perc[3], Ppar([~kick,    Pseq([	Pbindf(~kick,\out,~micBus,\dur,Pseq([1/4],1))],8),   Pseq([	Pbindf(~kick,\out,~micBus,\dur,Pseq([1/1],1))],2),

	],1)   ],1)

].scramble,inf);
)

