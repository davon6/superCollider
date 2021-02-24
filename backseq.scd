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





//~dbleRverseStart =

	Pseq([Pseq([~rev],2),~kbassRest,~bassRest,~perc[0],~perc[1]],1);//NOT USED YET !!!!!

~barwithBre= Pseq([~bar[5],~kbassRest],1);
~semiBreak =   Pseq([~bar[1],Pseq([~bassRest],8)],1);
~kbassRest =Ppar([~kick, ~bassRest], 1);
~ens2 =  Pseq([~perc[5],~bassRest],1);
~ens15Perc =   Pseq([~perc[5],~kbassRest],1);
~ens15PercR =Pseq([ Pseq([~perc[5]],1),~rev],1);
~ens15PercS = Pseq([~kbassRest,~perc[5]],1);
~fitDbleick = Pseq([~perc[0],  ~kbassRest  ,Pseq([~bassRest],2),
	Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],1), ~kbassRest  ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],2), Pseq([Pbindf(~kick,\dur,Pseq([1/4],1))],4) ,Pseq([Pbindf(~kick,\dur,Pseq([1/2],1))],3)],1);

];


~arrSpecialKB = [~ens15PercS,Pseq([~perc[5],Ppar([~kick,~rev],1)],1),~perc[5],~ens15Perc,~perc[5],~perc[1],~bar[6],~barwithBre,~ens2,~semiBreak,Pseq([Pseq([~rev],2),~kbassRest,~bassRest,~perc[1]],1),~fitDbleick];

~starters = [~ens15Perc, ~perc[5],~ens15PercS,Pseq([ ~perc[2], ~kbassRest,Pseq([~bassRest],2),~kbassRest],1)];




