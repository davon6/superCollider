(
Pdef(\fuzzy11122,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),//48
	\freq, 657.9895,
	\dure,60/151.703592/16,
		\bus, ~bus4,\bus2, 44,\bus3, 44,
\which,0,\whichMod,2,\whichEnv,1,
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	//\decEC,Pseq([0,0.3872,0.3872,0.3872],inf),
		\amp,0.0025,\out,~micBus,\group, ~micGrp//

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







{//Out.kr(~bus1, SinOsc.ar(1.2875).range(2637.02,0.1609375))  ;
	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless
	//Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));
	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3
	/*Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );

	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));
*/


Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
 Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	 Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }