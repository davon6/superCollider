(
Pdef(\fuzzy11122,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),//48
	\freq, 657.9895,
	\dure,60/151.703592/16,
		\bus, ~bus4,\bus2, 44,\bus3, 44,
//\bus4,11,

\which,0,\whichMod,2,\whichEnv,1,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	//\decEC,Pseq([0,0.3872,0.3872,0.3872],inf),
		\amp,0.0025,\out,~micBus,\group, ~micGrp//
/*,\roomsize, 46, \revtime, 3.5488, \damping, 0.50, \inputbw, 2, \drylevel, -3, \earlylevel, -7, \taillevel, -0,\maxRoomsize,66,\wet,0.7*/
));
/*
Pdef(\refuzzy11122,Pbind(\instrument,\reverb, \dur,Pseq([1/16],48),\roomsize,45, \revtime, 0.7744, \damping, 0.070, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -9,\maxRoomsiz,70,\wet,0.2,\out,0//,~micBus,\group, ~micGrp

));
*/

















Pdef(\hey4,Pbind(\instrument,\gran,
	//\dur, Pseq([24/1],inf),
	 \dur,Pseq([48/16],1),
	//\dur, Pseq([48/16],1),

	\amp, 1.5,
	\buf, b,
	\out,~reverbBus,
	\atk, 0,
	\rel, 1,
	\gate, 1,
	\sync, 1,
	\dens, 40,
	\baseDur, 0.05,

	//\baseDur, 1,
	\durRand, 1,
	\rate, 1,
	\rateRand, 1,
	\pan, 0,
	\panRand, 0,
	\grainEnv, -1,
	\ptrBus, ~ptrBus,
	\ptrSampleDelay, s.sampleRate/3,
	\ptrRandSamples, 0,
	\minPtrDelay, 1000,\group,~granGrp,
	//\pitchRte,1,\duration,8,\impulse, 1.2875
	\duration,1/16,\impulse, 10.3,
//\duration,8,\impulse, 0.1


));

Pdef(\refuzzy11122,Pbind(\instrument,\reverb, \dur,Pseq([1/16],48),\roomsize, 46, \revtime, 1.5488, \damping, 0.07, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -9,\maxRoomsize,56,\wet,0.3,\in,~reverbBus,\out,0,\group,~revGrp
));

v =Ppar([Pdef(\fuzzy11122),Pdef(\hey4),Pdef(\refuzzy11122)],inf).play(t);


)




~ptrK = Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([4/4],1));
~recK =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([4/4],1));



Pdef(\granKick,Pbind(\instrument,\gran,
	 \dur,Pseq([1/4],16),
	\amp, 1,
	\buf, e,
	\out,0,
	\atk, 0,
	\rel, 1/4,
	\gate, 1,
	\ptrBus, ~ptrBus,
	\pitchRte,(-1),
	//\ptrSampleDelay, s.sampleRate/3,
	\ptrRandSamples, 0,
	\minPtrDelay, 1000,\group,~granGrp,
	//\pitchRte,1,\duration,8,\impulse, 1.2875
	\duration,1/4,\impulse, 0.64375,
//\duration,8,\impulse, 0.1


));


~kick4Grain =Ppar([Pseq([~kickGran],16),~ptrK,~recK,Pdef(\granKick)              ],1);


k = Ppar([Pseq([~kickPat],1),~kickGrain],inf).play(t);