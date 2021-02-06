
	/*Pbind(\instrument,\ptr, \buf, f, \out, ~ptrBus3,\group,~ptrGrp,\dur,Pseq([64/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, f,\group,~recGrp,\dur,Pseq([64/1],1)),*/



	Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([64/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([64/1],1)),


	/*Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([64/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, d,\group,~recGrp,\dur,Pseq([64/1],1)),*/




		Pbind(\instrument, \normaliza,\in, ~normFuzz, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\gain,40,\group,~normGrp,\out,~reverbBus    ,\atk,0.08),//~reverbBus



	Pbind(\instrument, \normaliza,\in, ~normFuzz2, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\gain,40,\group,~normGrp,\out,~reverbBus2,\atk,0.08),





/*Pbind(\instrument, \normaliza,\in, ~limitSquelch, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normaGrp,\out,~reverbSquelch,\gain,1),*/









	Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime, ~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -2, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp )),


	Pdef(\revHFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -15,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp )),
	// ~fuzz.play(t,quant:0)
	/*Pdef(\revSquelch,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 1, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,~spread.(),\wet,~wet.(),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp)),*/

	Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, ~revTail.()/3, \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-1),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp)),


	Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comRnd,\group, ~revGrp),

	 Pbind(\instrument, \normaliza,\in, ~normRnd, \dur, Pseq([64/1],1),\gain,1,\du,2.5, \vol,(-8),\group,~normGrp,\out,~reverbRnd),



	Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -50,\amp,1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comRnd,\group, ~revGrp)
			,


Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0121, \rel ,0.04840
,\in, ~comRnd,\in2, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([64/1],1),\gain,40,\du,2.5, \vol,(-13),\group,~limitGrp,\out,~comSnaGrpBus),






		 Pbind(\instrument, \normaliza,\in, ~normSquelch, \dur, Pseq([64/1],1),\gain,1,\du,2.5, \vol,(-8),\group,~normGrp,\out,~reverbSquelch),


	Pdef(\revSquelch,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 1, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,~spread.(),\wet,~wet.(),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp)),


	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872
,\in, ~comSquelch ,\in2, ~kbus, \out,~limitFuzz, \group, ~compGrp),



	Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, Pseq([64/1],1),\du,2.5, \vol,(-13),\group,~limitGrp,\out,~comSnaGrpBus,\gain,40),




Pbind(\instrument,\comp,\dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\in, ~comBusCymb ,\in2, ~kbus, \out,~limitCymb,\group, ~compGrp),
Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comBusHat ,\in2, ~kbus, \out,~limitHat,\group, ~compGrp),








	Pbind(\instrument, \normaliza,\in, ~normMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normGrp,\out,~reverbMelo),



	Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, ~revTail.()/3, \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp)),



Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~limitFuzz, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-15),\group,~limitGrp,\out,~comSnaGrpBus,\gain,10),

/*[~melo1,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz,~fuzz, ~squelch, ~rnd,Pbindf(~bassRest, \dur,Pseq([1/4],1))];   ~rnd.play(t)*/

/*Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~reverbBus, \group, ~compGrp),


	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~reverbBus2, \group, ~compGrp),*/


	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~limitFuzz2, \group, ~compGrp),




/*	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872
,\in, ~comSquelch ,\in2, ~kbus, \out,~limitSquelch, \group, ~compGrp),*/


/*	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~limitMelo, \group, ~compGrp),*/







Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 0.0625,\atk ,0.0242, \rel ,0.04840
,\in, ~comMiniRise ,\in2, ~kbus, \out,~limitMiniRise, \group, ~compGrp),


Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.8 ,\sB, 1.05,\sA, 0.0625,\atk ,0.0121, \rel ,0.04840
,\in, ~comDelayed,\in2, ~kbus, \out,~delayBus, \group, ~compGrp),






	//Ppar([

	//~trans.(~pm)                ~trans.(~pm)+~revTail.()





//	~trans.(~tpp)           ~trans.(~tpp)+(~revTails.()/3)



	// Pbindf(~fuzz,  \dur,Pseq([16/1],1),\decE,Pseq([16/1],1)).play(t)

// ~trans.(~pp)               ~trans.(~pp)+~revTail.()





//   ~pp          ~pp+~revTail.()






Pbind(\instrument, \limiter,\in, ~limitBass, \dur,Pseq([64/1],1),\du,2.5, \vol,(-12),\gain,60,\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitKick,\dur,Pseq([64/1],1), \vol,(-10.5),\du,2.5,\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitCymb,\dur,Pseq([64/1],1),\du,2.5, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitHat,\dur,Pseq([64/1],1),\du,2.5, \vol,(-18),\group,~limitGrp),
Pbind(\instrument, \limiter,\in, ~limitSna, \dur, Pseq([64/1],1),\du,2.5, \vol,(-16.5),\group,~limitGrp),

Pbind(\instrument, \limiter,\in, ~limitNonRec2, \dur, Pseq([64/1],1),\du,2.5, \vol,(-25),\group,~limitGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([64/1],1),\du,2.5, \vol,(-20),\gain,50,\group,~limitGrp,\out,~comSnaGrpBus),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([64/1],1),\du,2.5, \vol,(-13),\gain,43,\group,~limitGrp,\out,~comSnaGrpBus),

	// ~fuzz.play(t,quant:0)



/*	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\gain,15,\group,~normaGrp,\out,~comSnaGrpBus),

	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\gain,20,\group,~normaGrp,\out,~comSnaGrpBus),


Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normaGrp,\out,~comSnaGrpBus,\gain,1),
Pbind(\instrument, \limiter,\in, ~limitMelo, \dur, Pseq([64/1],1),\du,2.5, \vol,(-10),\group,~normaGrp,\out,~comSnaGrpBus,\gain,10),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([64/1],1),\gain,1,\du,2.5, \vol,(-8),\group,~normaGrp,\out,~comSnaGrpBus),*/










Pbind(\instrument, \limiter,\in, ~limitMiniRise, \dur, Pseq([64/1],1),\gain,20,\du,2.5, \vol,(-25),\group,~limitGrp,\out,~reverbMiniRise),



	Pbind(\instrument, \limiter,\in, ~limitDelayed, \dur, Pseq([64/1],1),\du,2.5, \vol,(-15),\gain,1,\group,~limitGrp,\out,~delayToRevBus),

	Pbind(\instrument, \limiter,\in, ~limitNonRec, \dur, Pseq([64/1],1),\du,2.5, \vol,(-27),\gain,1,\group,~limitGrp,\out,0),//~reverbNonRec

Pbind(\instrument,\grpComp, \dur,Pseq([64/1],1),\thr,0.4 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.7744
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2,\out,0),//~limitLeadgrp


	/*Pbind(\instrument, \limiter2,\in, ~limitLeadgrp, \dur, Pseq([64/1],1),\gain,50,\du,2.5, \vol,(-9),\rel,0.8,\group,~limit2Grp),*/
