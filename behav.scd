
s.scope
s.plotTree
(

~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~effctGrp2 = Group.after(~effctGrp);
~revGrp = Group.after(~effctGrp2);
~revGrp2 = Group.after(~revGrp);
~compGrp = Group.after(~revGrp2);

~limitGrp = Group.after(~compGrp);

~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, -12,\out,~limitBass
);




~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp, -10.5,\out,~limitKick);


~cymbal = Pbind(\instrument, \cymb,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,Pseq([1/4],64 ),\rel, 0.3872,\rel2,0.0968,\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-18),\out, ~comBusCymb);

~hat = Pbind(\instrument,\percu2,\dur,Pseq([1/4], 64),\carHz,164.81,\modHz,164.81,\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,( -18),\out,~comBusHat);

~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest,\rest ,\note, \rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2,0.7744,\dur, Pseq([1/2], inf),\amp,(-15.5),\out,~limitSna);




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
	],1);



];







Ppar([

Pseq([Pbindf(~kick,\out,~kbus)],1024),

Pbind(\instrument,\comp,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1) ,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\in, ~comBusCymb ,\in2, ~kbus, \out,~limitCymb,\group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\dec,Pseq([64/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comBusHat ,\in2, ~kbus, \out,~limitHat,\group, ~compGrp),



Pbind(\instrument, \limiter,\in, ~limitBass, \dur,Pseq([64/1],1),\dec,Pseq([64/1],1),\du,0.001, \vol,(-12),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitKick,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1), \vol,(-10.5),\du,0.001,\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitCymb,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1),\du,0.001, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitHat,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1),\du,0.001, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitSna, \dur, Pseq([64/1],1),\dec,Pseq([64/1],1),\du,0.001, \vol,(-16.5),\group,~limitGrp),



//Pseq([~perc[4]],4)


],1).play(t);




~ptrK1 = Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1/4],1));
~recK1 =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1/4],1));

Pdef(\granKick1,Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, 1/4,\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,1/4,\impulse, 0.64375));








~spe1 =
Pseq([

~kbassRest,Pseq([~bassRest],3),
	Ppar([
	Ppar([
			Pbind(\instrument, \kick,\dur, Pseq([1],1),\amp, 0.028,\out,~effctBus2),
			Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note], inf),\dur, Pseq([1/4],4),\midinote, 28,\atk, t.beatDur/4 * 0.01,\rel, t.beatDur/4 * 0.99,\atkcrv, -2,\relcrv, -1,\amp, 0.24,\out,~effctBus2),], 4),


		Pbind(\instrument, \effect,\wF,1,\dur, Pseq([4/1],1), \in,~effctBus2,\out,0,\group,~effctGrp2 )

], 1),



	~kbassRest,Pseq([~bassRest],3)],1);

~spe2 = Pbind(\instrument, \kick,\dur, Pseq([Pseq([1/4],4), Pseq([1/16],16),  Pseq([1/3],3),Pseq([1/1],4) ,Pseq([1/4],2),Pseq([1/16],4)],1),\amp, 0.028);


~spe3 =   Ppar([Pbind(\instrument, \cymb,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,  Pseq([1/4],64 ),\rel, 0.3872,\rel2,0.0968,\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,0.02,\out,~effctBus2),

Pbind(\instrument,\percu2,\dur, Pseq([1/4], 64),\carHz,164.81,\modHz,164.81,\atk, 0,\rel,0.04840,\rel2,0.02420,\amp, 0.062,\out,~effctBus2)    ,

Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest,\rest ,\note, \rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2,0.7744,\dur, Pseq([1/2], inf),\amp,0.04,\out,~effctBus2),

Ppar([ Pbind(\instrument, \kick,\dur, Pseq([1],1),\amp, 0.028,\out,~effctBus2),Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note], inf),\dur, Pseq([1/4],4),\midinote, 28,\atk, t.beatDur/4 * 0.01,\rel, t.beatDur/4 * 0.99,\atkcrv, -2,\relcrv, -1,\amp, 0.24,\out,~effctBus2),],16),

	Pbind(\instrument, \effect,\wF,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,0,\group,~effctGrp2,\dec1,6 )], 1);


~spe4 = Pbind(\instrument, \kick,\dur, Pseq([Pseq([1/16],16),Pseq([1/4],16),Pseq([1/1],3) ],1)  , \amp, 0.028,\wR,1);




~specialHits = [~spe1,~spe2,~spe3,~spe4].scramble;




/*

~bar14S = Pseq([ Ppar([ ~bar14, Pbindf(~cymbal, \dur,Pseq([1/4],56)), Pbindf(~hat, \dur,Pseq([1/4],56)),Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7)) ],1)],1);


*/

//Pbindef

	//Pseq([Pbindf(~cymbal, \dur,Pseq([1/16],1),\out,0,\type,\note)],56).play(t)


~ending = [ Pseq([~perc[4], Pseq([Pbindf(~kick, \dur,Pseq([1/16],1))],4) ,Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],3)                               ],1) ,


 Pseq([~perc[4],Pseq([Pseq([Pbindf(~kick, \dur,Pseq([1/3],1))],1) ,Pseq([Pbindf(~kick, \dur,Pseq([1/12],1))],8)],1),~kick],1),



 Pseq([~perc[4],Pseq([~bassRest],2)],1)  ,



 Pseq([~perc[4],Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1),


		Pbindf(~kick, \dur, Pseq([   1/2     ],2)),Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1),Pbindf(~kick, \dur, Pseq([   1/2     ],1))],1   )],1) ,



 Pseq([~bar14S,Pseq([~bassRest],2)],1)  ,
 Pseq([~bar14S,Pseq([~kickR],4)],1) ,

	Pseq([  Pseq([ Ppar([ ~bar12, Pbindf(~cymbal, \dur,Pseq([1/4],48)), Pbindf(~hat, \dur,Pseq([1/4],48)),Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 6)) ],1)],1), Ppar([~kickPat,  Pseq([~kickR],8) ],1)       ],1) ,

 Pseq([~kickPat, Pseq([~bassRest],14) ,~kickPat ],1),

  Ppar([~kickPat,~spe3],1) ,


	Pbindf(~kick, \dur,Pseq([  Pseq([1/16],4), Pseq([1/3],3)  ,Pseq([1/16],4),Pseq([1/3],1)  ,Pseq([1/16],4), Pseq([1/3],1)  ,Pseq([1/16],4),       ],1) ),



Ppar([
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)) ,
		Pbindf(~cymbal, \type,\note, \dur, Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),
		Pbindf(~hat, \type,\note, \dur, Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),

			Pseq([  Pseq([ Pbindf(~kick,\dur, Pseq([1/4],1),\out,~effctBus2)],4),Pseq([Pbindf(~kick,\dur, Pseq([1/8],1),\out,~effctBus2)],8), Pseq([Pbindf(~kick,\dur, Pseq([1/16],1),\out,~effctBus2)],16),Pseq([Pbindf(~kick,\dur, Pseq([1/32],1),\out,~effctBus2)],32), Pseq([Pbindf(~kick,\dur, Pseq([1/64],1),\out,~effctBus2)],64)],1) ,

Ppar([Pbindf(~kick,\out,~micBus,\group, ~micGrp) ,~ptrK1,~recK1,Pdef(\granKick1)],1),


//NOT QUIET WORKING  manage rversed kick
		Pbind(\instrument, \effect,\wE,1,\dur, Pseq([16/1],1), \in,~effctBus2,\out,~compHat,\group,~effctGrp2,\dec1,6 )],1),


	Pseq([~bassRest],16)


];



~half16  = Pseq([Ppar([Pseq([~bassAndKick],8),Pdef(\d8),Pdef(\e8),Pdef(\sn8)],1),Pseq([~bassRest],8)],1);
~ens = Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar16],1);//must include percu
~ens16Perc = Ppar([Pdef(\d),Pdef(\e),Pdef(\sn),~bar16],1);
~bar12 = Ppar([~bassPat, ~kickPat], 12);
~bar14 = Ppar([~bassPat, ~kickPat], 14);//.play(t);
//~bar16  = Pseq([~bassAndKick],16);
~bar15 = Ppar([~bassPat, ~kickPat], 15);
~bar8 = Ppar([~bassPat, ~kickPat], 8);



~kick4 = Pseq([~kickPat],4);
~bar4 = Ppar([~bassPat, ~kickPat], 4);





~kickR = Pbind(\instrument, \kick,\dur, Pseq([1/4],1), \amp, 0.028,\wR,1);
~reversedGrain =Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1);
~dbleRverseStart = Pseq([Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],2),~kbassRest,~bassRest,Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1)],1);
~kickGran = Pseq([~kickPatToGran],1);

~seq = Ppar([Pdef(\c),Pdef(\b),Pdef(\a),~barwithBre],1);
~seqRising = Ppar([~barwithBre, Pdef(\w)],1);

~semiBreak =   Pseq([~bar[1],Pseq([~bassRest],8)],1); //Pseq([~bar8,Pseq([~bassRest],8)],1);
~kbassRest =Ppar([~kick, ~bassRest], 1);   //Ppar([~kickPat, ~bassRest], 1);

~barwithBre= Pseq([~bar15, ~kbassRest], 1);//TO DESTROY


//Pseq([~perc[3]],4).play(t);

~ens2 =  Pseq([~perc[5],~bassRest],1);         // Pseq([Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar15],1),~bassRest],1);
//~seqPartRising =  Ppar([~ens, Pdef(\aR),Pdef(\bR),Pdef(\cD)],1);

//~ens15Perc = Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),~kbassRest],1).play(t);
~ens15Perc =   Pseq([~perc[5],~kbassRest],1)   ;


~ens15PercR =Pseq([ Pseq([~perc[5]],1),Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1);


//Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1);




~ens15PercS = Pseq([~kbassRest,~perc[5]],1);                   //Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1)],1);
//~ens15PercS.stop
~fitDbleick = Pseq([Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1),  ~kbassRest  ,Pseq([~bassRest],2),
	~kickPatDemi, ~kbassRest  ,Pseq([~kickPatDemi],2),Pseq([~kickPatQuart],4)    ],1);




/*
~arrSpecialKB = [~ens15PercS,Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1),~ens16Perc,~ens15Perc,~ens,~half16,~bar16,~barwithBre,~ens2,~semiBreak,Pseq([Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],2),~kbassRest,~bassRest,Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1)],1),~fitDbleick];   */

~arrSpecialKB = [~ens15PercS,Pseq([~perc[5],Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1),~ens16Perc,~ens15Perc,~ens,~half16,~bar16,~barwithBre,~ens2,~semiBreak,Pseq([Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],2),~kbassRest,~bassRest,Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1)],1),~fitDbleick];



~starters = [~ens15Perc, ~ens16Perc,~ens15PercS,Pseq([ Ppar([ ~bar12, Pbindf(~cymbal, \dur,Pseq([1/4],48)), Pbindf(~hat, \dur,Pseq([1/4],48)),Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 6)) ],1), ~kbassRest,Pseq([~bassRest],2),~kbassRest],1)];


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




Pdef(\hit,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 2),
		\dur, Pseq([2/1], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, 0.006,//exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan,rand(-1.0, 1.0),
	)
);
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