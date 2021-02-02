//PSEQ On vlvEnv for adsr
// WRITE MELO OUT OF RANDOM
//is PAN2 STILL NEEEDED IN LEAD INSTRU
//make sure 1/3 pseq end on round
//COMPR ONLY NEED 1 CHANNEL
//try put ALL kb seqs in same array
//dont forget double Rkick start seq
//why 2 grps effect

s.scope
s.plotTree
s.meter
(


~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~effctGrp2 = Group.after(~effctGrp);

~delayGrp =  Group.after(~effctGrp2);

~compGrp = Group.after(~delayGrp);

~revGrp = Group.after(~compGrp);
~revGrp2 = Group.after(~revGrp);

~limitGrp = Group.after(~revGrp2);

~compGrp2 = Group.after(~limitGrp);


~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
	\amp, (-0),\out,~limitBass
);


~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,( -10.5),\out,~limitKick);


~cymbal = Pbind(\instrument, \cymb,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,Pseq([1/4],64 ),\rel, 0.3872,\rel2,0.0968,\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-18.5),\rel,0.0968,\rel2,0.0968,\out, ~comBusCymb);

~hat = Pbind(\instrument,\percu2,\dur,Pseq([1/4], 64),\carHz,164.81,\modHz,164.81,\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,( -17),\out,~comBusHat);

~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\note], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/1], inf),\amp,(-15.5),\out,~limitSna);



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


	Ppar([~bar[6],Pbindf(~cymbal, \dur,Pseq([1/4],64)),
		Pbindf(~hat, \dur,Pseq([1/4],64)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 8))
	],1),

	Ppar([~kick,~bass],16),

	Ppar([~bar[6],~hat,Pbindf(~cymbal,\type,Pseq([\rest,\rest,\note,\rest ,\rest,\rest ,\note, \rest],inf)),~snare],2),

Ppar([~bar[6],~hat,~cymbal,~snare],2),

Ppar([~bar[6],~hat,~cymbal],2),
Ppar([~bar[6],~hat],2),
Ppar([~bar[6],~snare],2),
	Ppar([~bar[6],Pbindf(~snare,\da1,0)],1)


];



/*
Pbind(\instrument, \limiter,\in, ~limitLead1, \dur, Pseq([64/1],1),\du,0.001, \vol,(-23),\group,~limitGrp),


Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comLead1 ,\in2, ~kbus, \out,~limitFuzz,\group, ~compGrp)
*/

Ppar([

	Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),

	Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([64/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([64/1],1)),


	Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([64/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, d,\group,~recGrp,\dur,Pseq([64/1],1)),




Pbind(\instrument,\comp,\dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\in, ~comBusCymb ,\in2, ~kbus, \out,~limitCymb,\group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comBusHat ,\in2, ~kbus, \out,~limitHat,\group, ~compGrp),



Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~reverbBus, \group, ~compGrp),




	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.2,\sA, 0.1,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~reverbMelo, \group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.2,\sA, 0.25,\atk ,0.0484, \rel ,0.3872
,\in, ~comSquelch ,\in2, ~kbus, \out,~reverbSquelch, \group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 0.0625,\atk ,0.0242, \rel ,0.04840
,\in, ~comMiniRise ,\in2, ~kbus, \out,~limitMiniRise, \group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 0.0625,\atk ,0.0121, \rel ,0.04840
,\in, ~comRnd,\in2, ~kbus, \out,~reverbRnd, \group, ~compGrp),

Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 0.0625,\atk ,0.0121, \rel ,0.04840
,\in, ~comDelayed,\in2, ~kbus, \out,~delayBus, \group, ~compGrp),


	//Ppar([

	//~trans.(~pm)                ~trans.(~pm)+~revTail.()

	Pdef(\revSquelch,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,Pseq([16/1],4096), \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbSquelch , \out,~comSnaGrpBus,\group, ~revGrp)),



//	~trans.(~tpp)           ~trans.(~tpp)+(~revTails.()/3)

Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 16, \revtime, Pseq([16/1],4096), \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)),

	// Pbindf(~fuzz,  \dur,Pseq([16/1],1),\decE,Pseq([16/1],1)).play(t)

// ~trans.(~pp)               ~trans.(~pp)+~revTail.()



	Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,Pseq([16/1],4096), \damping,0.1, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp )),


//   ~pp          ~pp+~revTail.()

	Pdef(\revRnd,
	Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pseq([16/1],4096), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comSnaGrpBus,\group, ~revGrp))
			,




Pbind(\instrument, \limiter,\in, ~limitBass, \dur,Pseq([64/1],1),\du,0.2, \vol,(-12),\gain,400,\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitKick,\dur,Pseq([64/1],1), \vol,(-10.5),\du,0.2,\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitCymb,\dur,Pseq([64/1],1),\du,0.2, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitHat,\dur,Pseq([64/1],1),\du,0.2, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitSna, \dur, Pseq([64/1],1),\du,0.2, \vol,(-16.5),\group,~limitGrp),

Pbind(\instrument, \limiter,\in, ~limitNonRec2, \dur, Pseq([64/1],1),\du,0.2, \vol,(-25),\group,~limitGrp),

Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([64/1],1),\du,0.2, \vol,(-25),\gain,10,\group,~limitGrp,\out,~reverbBus),
Pbind(\instrument, \limiter,\in, ~limitMelo, \dur, Pseq([64/1],1),\du,0.2, \vol,(-25),\group,~limitGrp,\out,~reverbMelo,\gain,-2),





Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, Pseq([64/1],1),\du,0.2, \vol,(-25),\group,~limitGrp,\out,~reverbSquelch,\gain,5460),






Pbind(\instrument, \limiter,\in, ~limitMiniRise, \dur, Pseq([64/1],1),\gain,20,\du,0.2, \vol,(-25),\group,~limitGrp,\out,~reverbMiniRise),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([64/1],1),\gain,3540,\du,0.2, \vol,(-25),\group,~limitGrp,\out,~reverbRnd),

	Pbind(\instrument, \limiter,\in, ~limitDelayed, \dur, Pseq([64/1],1),\du,0.2, \vol,(-15),\gain,1,\group,~limitGrp,\out,~delayToRevBus),

	Pbind(\instrument, \limiter,\in, ~limitNonRec, \dur, Pseq([64/1],1),\du,0.2, \vol,(-27),\gain,1,\group,~limitGrp,\out,0),//~reverbNonRec

Pbind(\instrument,\grpComp, \dur,Pseq([64/1],1),\thr,0.4 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.7744
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2),


],1).play(t, quant:1);





~rev =Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/4],1)),

		Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],1),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],1),\impulse,Pseq([1/4],1))
	],1);


//bersek
Pseq([

Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1)),
	Pbind(\instrument,\gran,\dur,Pseq([1/16],16),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1.4),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.09,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],4),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],3),
	Pbind(\instrument,\gran,\dur,Pseq([1/1],3),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/1],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/1],inf))
	],1)

],1);

~bassRest = Pbindf(~bass,  \type,\rest);        //\amp,-80);//WHY NOT \REST
~spe1 =
Pseq([

~kbassRest,Pseq([~bassRest],3),
	Ppar([
	Ppar([
			Pbindf(~kick,\out,~effctBus2),
			Pbindf(~bass,\out,~effctBus2)], 4),


		Pbind(\instrument, \effect,\dur, Pseq([4/1],1),\dec1, Pseq([4/1],1), \in,~effctBus2,\out,~limitKick,\group,~effctGrp2 )

	], 1),

	~kbassRest,Pseq([~bassRest],3)],1);

~spe2 =

Ppar([Pseq([  Pseq([ Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],4),Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],16), Pseq([Pbindf(~kick,\dur, Pseq([1/3],1),\out,~effctBus2)],3),Pseq([Pbindf(~kick,\dur, Pseq([1/1],1),\out,~effctBus2)],4), Pseq([Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],2) ,Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],4)],1) ,Pbind(\instrument, \effect,\wE,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,~limitKick,\group,~effctGrp2,\dec1,6 ),
],1);

~spe3 =   Ppar([

	Ppar([Ppar([Pbindf(~kick,\out,~effctBus2),Pbindf(~bass,\out,~effctBus2)],16),Pbindf(~cymbal, \dur,Pseq([1/4],64),\out,~effctBus2),
		Pbindf(~hat, \dur,Pseq([1/4],64),\out,~effctBus2)    ,
	Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 8),\out,~effctBus2)	],1)      ,

	Pbind(\instrument, \effect,\wF,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,0,\group,~effctGrp2,\dec1,6 )], 1);


~spe4 =

Pseq([

Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1)),
	Pbind(\instrument,\gran,\dur,Pseq([1/16],16),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1.2),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.09,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],4),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1),

Ppar([

	Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],3),
	Pbind(\instrument,\gran,\dur,Pseq([1/1],3),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/1],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/1],inf))
	],1)

],1);

//~spe1.play(t, quant:1)
~specialHits = [~spe1,~spe2,~spe3,~spe4].scramble;

~ending = [ Pseq([~perc[4], Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4) ,Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3)],1) ,


 Pseq([~perc[4],Pseq([Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1) ,Pseq([Pbindf(~kick, \dur,Pseq([1/12],1))],8)],1),~kick],1),



 Pseq([~perc[4],Pseq([~bassRest],2)],1)  ,



 Pseq([~perc[4],        Pseq([ ~rev  ,


		Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],2),~rev, Pseq([Pbindf(~kick, \dur, Pseq([1/2],1))],1)
	],1   )],1) ,

 Pseq([~perc[3],Pseq([~bassRest],2)],1) ,
 Pseq([~perc[3],
 Ppar([Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],1),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],4),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1)

],1),

	Pseq([ ~perc[2], Ppar([~kick,   Ppar([   Pseq([	Pbindf(~kick,\out,~micBus,\group, ~micGrp,\dur,Pseq([1/1],1))],2),
	Pbind(\instrument,\gran,\dur,Pseq([1/4],8),\amp, 1,\buf, e,\out,~limitKick,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,0.3,\impulse,Pseq([1/16],inf))
	],1)                       ],1)   ],1),
 Pseq([~kick, Pseq([~bassRest],14) ,~kick ],1),

  Ppar([~kick,~spe3],1) ,


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

	Pseq([~bassRest],16)
];

~dbleRverseStart = Pseq([Pseq([~rev],2),~kbassRest,~bassRest,~perc[0],~perc[1]],1);//NOT USED YET !!!!!

~barwithBre= Pseq([~bar[5], ~kbassRest], 1);
~semiBreak =   Pseq([~bar[1],Pseq([~bassRest],8)],1);
~kbassRest =Ppar([~kick, ~bassRest], 1);
~ens2 =  Pseq([~perc[5],~bassRest],1);
~ens15Perc =   Pseq([~perc[5],~kbassRest],1);
~ens15PercR =Pseq([ Pseq([~perc[5]],1),~rev],1);
~ens15PercS = Pseq([~kbassRest,~perc[5]],1);
~fitDbleick = Pseq([~perc[0],  ~kbassRest  ,Pseq([~bassRest],2),
	Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],1), ~kbassRest  ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],2), Pseq([Pbindf(~kick,\dur,Pseq([1/4],1))],4) ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],3)],1);


~arrSpecialKB = [~ens15PercS,Pseq([~perc[5],Ppar([~kick,~rev],1)],1),~perc[5],~ens15Perc,~perc[5],~perc[1],~bar[6],~barwithBre,~ens2,~semiBreak,Pseq([Pseq([~rev],2),~kbassRest,~bassRest,~perc[1]],1),~fitDbleick];

~starters = [~ens15Perc, ~perc[5],~ens15PercS,Pseq([ ~perc[2], ~kbassRest,Pseq([~bassRest],2),~kbassRest],1)];








			~fuzz =	Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp);





~squelch = Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch);


~melo1 = Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 2.575,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-30)	,\subsE,0,\lvlDec,0  ,\out,~comMelo);

// \vlPE, 3.01518518519
~rnd = Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
	\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-2), \gra,5.00.rand.postln,\out,~comRnd);












~miniRise = Ppar([Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\decE,0,\atkE,Pseq([1/1],1),\freq,661.44.rand.postln,

	\bus,~bus5 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,//\bus5,~bus10,
	\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,(-0), \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp)


],1);

~delayed = Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/8],32),\type,Pseq([\note, \rest],inf),
				\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,0.0484,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,(-25),\factor,~factor.(),\subsE,0,\out, ~comDelayed),


Pbind(\instrument,\pingD,\dur,~trans.(Pseq([1/8],32)),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,~trans.(Pseq([1/8],32)),\amp,4,\in, ~delayBus,\out,~limitDelayed,\group,~delayGrp)],1); // can use non rec


~hit =   Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 4),
		\dur, Pseq([2/1], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
		\amp, (-22),//exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan,rand(-1.0, 1.0),
);


~h1 = Pbindf(~hit,\type,Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h2 = Pbindf(~hit,\type, Pseq([\rest,\note ,\rest, \rest,\rest,\rest ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h3 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\note, \rest,\rest,\rest ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h4 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\rest, \note,\rest,\rest ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h5 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\rest, \rest,\note,\rest ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h6 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\rest, \rest,\rest,\note ,\rest, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h7 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\rest, \rest,\rest,\rest ,\note, \rest], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);
~h8 = Pbindf(~hit,\type, Pseq([\rest,\rest ,\rest, \rest,\rest,\rest ,\rest, \note], 64),\dur, Pseq([1/1], inf),\carHz, exprand(20,10000).postln,\modHz, exprand(20,10000).postln,\modAmp, rrand(0, 10000).postln,\amp, (-22),\atk, exprand(0.001, 0.05),\rel,exprand(0.05, 1.2),\pan,rand(-1.0, 1.0),\out,~limitNonRec);

)

























Pdef(\wNoise2,
	Pbind(
		\instrument, \wNoise,
	\dur, Pseq([1/4], 16),
		//\type, Pseq([\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest], inf),
		\type, Pseq([\rest,\rest,\rest,\rest,\note,\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\note,\rest,[\note,\note],\note,\rest,\rest,\rest], inf),
\wet,0,\sub, 0.3872,\valStart,1000,  \valEnd,300,\sub2,0.5,\wFil,0, \out ,~reverbBus,\amp,0.015


));


Pdef(\wNoise3,
	Pbind(
		\instrument, \wNoise,
	\dur, Pseq([1/4], 16),
		//\type, Pseq([\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest], inf),
		\type, Pseq([\note,\rest,\rest,\rest,\note,\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\note,\rest,[\note,\note],\note,\rest,\rest,\rest], inf),
\wet,0,\sub, 0.3872,\valStart,1000,  \valEnd,300,\sub2,0.5,\wFil,0, \out ,~reverbBus,\amp,0.015


));




Pdef(\revWNoise2,Pbind(\instrument, \reverb, \dur,  Pseq([1/4], 16),\roomsize, 35, \revtime, 3.0976, \damping, 0.42, \inputbw, 0.48, \drylevel, -6, \earlylevel, -11, \taillevel, -13, \amp,0.03,\maxRoomsize,65,\wet,0.2,\in, ~reverbBus, \group ,~revGrp


//	\roomsize, 16, \revtime, 3.0976, \damping, 0.10, \inputbw, 0.95, \drylevel ,-3, \earlylevel, -15, \taillevel, -17
));





~noise =Ppar([Pdef(\wNoise2),Pdef(\revWNoise2),],1);

~noise2 =Ppar([Pdef(\wNoise3),Pdef(\revWNoise2),],1);



Pdef(\wNoise,
	Pbind(
		\instrument, \wNoise,
	\dur, Pseq([1/1], 1),
		\amp,0.08



));



(
Ppar([
//HERE
	Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.1,\out, ~micBus2,\group, ~micGrp),

	Pbind(\instrument,\gran,\dur,Pseq([1/1],1),\amp, 1,\buf, d,\out,~limitKick,\atk, 0,\rel, Pseq([1/1],1),\ptrBus, ~ptrBus2,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/1],1),\impulse,Pseq([1/1],1))//0.321875)

],1).play(t, quant:1))




(
Ppar([

Pseq([

		Ppar([
			Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,(-23),\out, ~reverbBus2,))
	,
	Pbind(\instrument,\reverb,\dur , Pseq([4/1], 1), \revtime, Pseq([4/1],1), \in, ~reverbBus2,\group,~revGrp2,\out,~limitNonRec2,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,60,\wet,0.8,\amp,0.8
)],1),
		Pseq([~bassRest],26),
		Ppar([
//HERE
	Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.1,\out, ~micBus2,\group, ~micGrp),

	Pbind(\instrument,\gran,\dur,Pseq([1/1],1),\amp, 1,\buf, d,\out,~limitKick,\atk, 0,\rel, Pseq([1/1],1),\ptrBus, ~ptrBus2,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/1],1),\impulse,Pseq([1/1],1))//0.321875)

],1)



	],1),



	Pseq([~bar[6] ,Ppar([~bar[6] ,Pbindf(~cymbal, \dur,Pseq([1/4],64),\out, ~effctBus2),
		Pbindf(~hat, \dur,Pseq([1/4],64),\out, ~effctBus2),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 8),\out, ~effctBus2),

		Pbind(\instrument, \effect,\dur,Pseq([16/1],1),\wE,1,\dec1,Pseq([16/1],1),\lvl1,7000,\lvl2,10,\crv2,(-8),\in,~effctBus2,\out,~limitNonRec,\group,~effctGrp)],1 )         ],1),~h1,~h2,~h3,~h4,~h5,~h6,~h7,~h8,





],1).play(t,quant:1))


Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 16, \revtime, Pseq([16/1],4096), \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)),


//s.plotTree

Pdef(\hit2,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 1),
		\dur, Pseq([1/1], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, 0.006,//exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);
Pdef(\hit3,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest], 7),
		\dur, Pseq([1/2], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);
Pdef(\hit4,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest], 7),
		\dur, Pseq([1/2], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);