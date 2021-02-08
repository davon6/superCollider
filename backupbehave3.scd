Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1)),

	Pseq([Pbindf(~kick,\out,~limitDumK)],4096),
	Pseq([Pbindf(~snare,\out,~limitDumB)],1024),

/*	Pbind(\instrument, \normaliza,\in, ~norm6, \dur, Pseq([1024/1],1),\gain,50,\du,~du, \vol,(-8),\out,~limitDumK),
	Pbind(\instrument, \normaliza,\in, ~norm7, \dur, Pseq([1024/1],1),\gain,50,\du,~du, \vol,(-8),\out,~limitDumB),*/


	Pbind(\instrument, \limiter2,\in, ~limitDumB, \dur,Pseq([1024/1],1),\du,~du, \vol,(-2),\gain,70,\out,~snBus),//,\group, ~compGrp),
	Pbind(\instrument, \limiter2,\in, ~limitDumK,\dur,Pseq([1024/1],1), \vol,(-0.5),\gain,20,\du,~du,\out,~kbus),//,\group, ~compGrp),





Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comBusHat ,\in2, ~kbus, \out,~limitHat,\group, ~compGrp),
	Pbind(\instrument,\comp,\dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\in, ~comBusCymb ,\in2, ~kbus, \out,~limitCymb,\group, ~compGrp),






	/*Pbind(\instrument, \normaliza,\in, ~norm1, \dur, Pseq([1024/1],1),\gain,20,\du,~du, \vol,(-8),\group,~normGrp,\out,~limitBass),
	Pbind(\instrument, \normaliza,\in, ~norm2, \dur, Pseq([1024/1],1),\gain,20,\du,~du, \vol,(-8),\group,~normGrp,\out,~limitKick),
	Pbind(\instrument, \normaliza,\in, ~norm3, \dur, Pseq([1024/1],1),\gain,20,\du,~du, \vol,(-8),\group,~normGrp,\out,~limitCymb),
	Pbind(\instrument, \normaliza,\in, ~norm4, \dur, Pseq([1024/1],1),\gain,20,\du,~du, \vol,(-8),\group,~normGrp,\out,~limitHat),
	Pbind(\instrument, \normaliza,\in, ~norm5, \dur, Pseq([1024/1],1),\gain,20,\du,~du, \vol,(-8),\group,~normGrp,\out,~limitSna),*/

	Pbind(\instrument, \limiter2,\in, ~limitBass, \dur,Pseq([1024/1],1),\du,~du, \vol,(-2),\gain,30,\group,~limitGrp2),
Pbind(\instrument, \limiter2,\in, ~limitKick,\dur,Pseq([1024/1],1), \vol,(-0.5),\gain,20,\du,~du,\group,~limitGrp2),
		Pbind(\instrument, \limiter2,\in, ~limitCymb,\dur,Pseq([1024/1],1),\du,~du, \gain,5,\vol,(-18),\group,~limitGrp2),
Pbind(\instrument, \limiter2,\in, ~limitHat,\dur,Pseq([1024/1],1),\du,~du, \gain,10, \vol,(-18),\group,~limitGrp2),
Pbind(\instrument, \limiter2,\in, ~limitSna, \dur, Pseq([1024/1],1),\du,~du,  \gain,1,\vol,(-12.5),\group,~limitGrp2),


	// Ppar([    Ppar([~kick , ~bass,],40)  ,~snare      ],40).play(t)

	// Pseq([~snare],40).play(t)





 	Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pseq([1/4],32), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -50,\amp,1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comRnd,\group, ~revGrp)
			,

Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.05,\sA, 1/4,\atk ,0.0121, \rel ,0.04840
,\in, ~comRnd,\in2, ~kbus, \out,~limitLeadgrp, \group, ~compGrp),

/*Pbind(\instrument, \normaliza,\in, ~normRnd, \dur, Pseq([1024/1],1),\gain,70,\du,~du, \vol,(-8),\group,~normGrp,\out,~comSnaGrpBus),*/





		Pdef(\revMelo,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, Pseq([1/1],1), \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-1),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp)),



Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus, \out,~limitLeadgrp, \group, ~compGrp),

/*	Pbind(\instrument, \normaliza,\in, ~normMelo, \dur, Pseq([1024/1],1),\du,~du, \vol,(-10),\group,~normGrp,\out,~comSnaGrpBus,\gain,62),*/





	Pdef(\revSquelch,Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 1, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,~spread.(),\wet,~wet.(),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp)),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/2,\atk ,0.0484, \rel ,0.3872
,\in, ~comSquelch ,\in2, ~kbus, \out,~limitLeadgrp, \group, ~compGrp),

/*	Pbind(\instrument, \normaliza,\in, ~normSquelch, \dur, Pseq([1024/1],1),\gain,70,\du,~du, \vol,(-8),\group,~normGrp,\out,~comSnaGrpBus),*/




				Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime, ~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -2, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp )),

	Pdef(\revHFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -15,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp )),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~limitLeadgrp, \group, ~compGrp),


	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~limitLeadgrp, \group, ~compGrp),


	/*Pbind(\instrument, \normaliza,\in, ~normFuzz, \dur, Pseq([1024/1],1),\du,~du, \vol,(-10),\gain,65,\group,~normGrp,\out,~comSnaGrpBus),

	Pbind(\instrument, \normaliza,\in, ~normFuzz2, \dur, Pseq([1024/1],1),\du,~du, /*\atk,1,\rel,0.4,*/\vol,(-10),\gain,52,\group,~normGrp,\out,~comSnaGrpBus),*/





	//Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\du,2.5, \vol,(-5.3),\gain,50,\group,~limitGrp,\out,0),




Pbind(\instrument, \limiter2,\in, ~limitLeadgrp,\dur, Pseq([1024/1],1),\du,~du, \vol,(-10.3),\group,~limitGrp2,\out,~comSnaGrpBus,\gain,55),


Pbind(\instrument,\grpComp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.086,\sA, 0.2,\atk ,0.5, \rel ,0.7744
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2,\out,0
),

/*Pbind(\instrument, \limiter2,\in, ~limitLeadgrp,\dur, Pseq([1024/1],1),\du,~du, \vol,(-10.3),\group,~limitGrp2,\out,0,\gain,55),*/
