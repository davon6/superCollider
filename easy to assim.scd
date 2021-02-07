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

~revGrp = Group.after(~delayGrp);
~revGrp2 = Group.after(~revGrp);

~compGrp = Group.after(~revGrp2);
~normGrp = Group.after(~compGrp);
~limitGrp = Group.after(~normGrp);
~compGrp2 = Group.after(~limitGrp);

~limitGrp2 = Group.after(~compGrp2);

~bd = TempoClock.beatDur;
o = {
	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));

	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3

/*	Out.kr(~bus6, SinOsc.ar(2.575).range(5274.04,0.0201171875));//c3*/

	Out.kr(~bus6,

		EnvGen.kr(
	Env([0,0,0,0,1,1,1,0],[0,0,0,TempoClock.beatDur/2,0, TempoClock.beatDur/2,0,0],6,6,0),Trig.kr(1,490));

	);
	Out.kr(~bus7, SinOsc.ar(5.15).range(5274.04,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(2637.02,0.0201171875));

	Out.kr(~bus9, //SinOsc.ar(1.2875).range(10.3,81.41));

		SinOsc.kr(     LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus10,  Lag.kr(LFNoise0.kr(1.2875).range(41.2,1318.51),0.2)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,0.321875])).range(5274.04,20.6));

	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.64375).range(20.6,41.20));   //   0.42916666666

	Out.kr(~bus14, MouseY.kr(0,70));

	Out.kr(~bus15, SinOsc.ar(1.2875).range(41.2,1318.51));


	Out.kr(~bus16, EnvGen.kr(Env(
		[0,0,0,0.8,0 ,0,0],
		[0,~bd   ,~bd,~bd  ,~bd ,~bd   ,~bd],           //    [0,1   ,1,1  ,1 ,1   ,1],
		[0, 8  ,-8, 8,-8,0   ,0],5,0),Trig.kr(1,490))
	);

}.play();

// modLvl

Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),
//  ,~pseq.()             ~pp
	Pseq([

		/*Pbind(\instrument,\lead, \dur,~pseq.(),\decE, ~pp,\freq, ~freq.(),\bus, ~busFi.(0),\lvlDec,~lvlDec.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,0 ,\whichMod,0,\whichEnv,1,\amp,(-20),\out,~reverbBus ,\group, ~micGrp),*/

	/*Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(2),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,2 ,\whichMod,0,\whichEnv,1,\amp,(-20),\out,~reverbBus2 ,\group, ~micGrp),*/

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\which, ~fil.(),\whichMod,0,
		\modLvl,True, \bus6,~bus16,
			\whichEnv,1,\amp,(-20),\out, ~rteFil.(~ff),\group, ~micGrp)

	],40),
	//          Pseq([1/4],4096),  Pseq([1/1],4096)]       .postln
   // .postln   .postln

	//      ~fil.()     ~rteFil.(~ff)




	Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime, ~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -2, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp )),

	Pdef(\revHFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -15,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp )),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~normFuzz, \group, ~compGrp),


	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~normFuzz2, \group, ~compGrp),


	Pbind(\instrument, \normaliza,\in, ~normFuzz, \dur, Pseq([1024/1],1),\du,~du, \vol,(-10),\gain,65,\group,~normGrp,\out,~limitFuzz),

	Pbind(\instrument, \normaliza,\in, ~normFuzz2, \dur, Pseq([1024/1],1),\du,~du, /*\atk,1,\rel,0.4,*/\vol,(-10),\gain,52,\group,~normGrp,\out,~limitFuzz),





	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\du,~du, \vol,(-10.3),\gain,50,\group,~limitGrp,\out,0),





	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\du,~du, \vol,1,\gain,50,\group,~limitGrp2,\out,0),


],1).play(t,quant:0)


)


Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),

	Pseq([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 2.575,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-20)	,\subsE,0,\lvlDec,0  ,\out,~reverbMelo)],40),






	Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, Pseq([1/1],1), \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-1),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp)),



Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~normMelo, \group, ~compGrp),

	Pbind(\instrument, \normaliza,\in, ~normMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normGrp,\out,0,\gain,62),




	Pbind(\instrument, \limiter,\in, ~limitMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~limitGrp,\out,0,\gain,30),

],1).play(t,quant:0))


Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),


	Pseq([ Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~reverbSquelch)],40),




	Pdef(\revSquelch,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 1, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,~spread.(),\wet,~wet.(),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp)),

	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872
,\in, ~comSquelch ,\in2, ~kbus, \out,~normSquelch, \group, ~compGrp),

	Pbind(\instrument, \normaliza,\in, ~normSquelch, \dur, Pseq([64/1],1),\gain,70,\du,2.5, \vol,(-8),\group,~normGrp,\out,0),

	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, Pseq([64/1],1),\du,2.5, \vol,(-5.3),\group,~limitGrp,\out,0,\gain,3),




],1).play(t,quant:0)
)



Ppar([



		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),


	Pseq([

	Pbind(\instrument,\lead, \dur,Pseq([1/4],16),\decE,Pseq([1/4],16),\freq,661.44.rand.postln,
			\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,\factor3,~fac3.(),
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
			\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-20), \gra,5.00.rand.postln,\out,~reverbRnd)    ],40),

// ~revTail.()    ~pseq.()    ~pp




	Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pseq([1/4],32), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -50,\amp,1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comRnd,\group, ~revGrp)
			,

Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0121, \rel ,0.04840
,\in, ~comRnd,\in2, ~kbus, \out,~normRnd, \group, ~compGrp),



	Pbind(\instrument, \normaliza,\in, ~normRnd, \dur, Pseq([1024/1],1),\gain,70,\du,2.5, \vol,(-8),\group,~normGrp,\out,0),




	 Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,80,\du,2.5, \vol,(-10),\group,~limitGrp,\out,0),

	/*Pbind(\instrument,\grpComp, \dur,Pseq([64/1],1),\thr,0.4 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.7744
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2),*/


],1).play(t,quant:0)
)




















Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),

	Pseq([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 2.575,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-20)	,\subsE,0,\lvlDec,0  ,\out,~normMelo)],40),


	Pbind(\instrument, \normaliza,\in, ~normMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normGrp,\out,~reverbMelo,\gain,60),



	Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, ~revTail.()/3, \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-1),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp)),



Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~limitMelo, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~limitGrp,\out,0,\gain,30),

],1).play(t,quant:0)

)

















)