
(
~bus1 = Bus.control(s,1);
~bus2 = Bus.control(s,1);
~bus3 = Bus.control(s,1);
)






(

Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,
\bus, ~bus1,
\bus2, ~bus2,
		\bus3, ~bus3,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0.2,0.2,0.2],inf),
		\amp,0.013

));)




(

o = {Out.kr(~bus1, SinOsc.ar(1.2875).range(3290.63,81.41))  ;
Out.kr(~bus2, SinOsc.ar(5.15).range(329.63,81.41));
	Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));

 }.play;
		//Out.kr(~cd3, SinOsc.ar(1.2875).range(5274.04,0201171875));
	//.Out.kr(~cd4, SinOsc.ar(0.0201171875).range(164.81,2.575));


//}.play;

Pseq([Pdef(\fuzzyhIGH2)],inf).play(t)

//Pseq([Pdef(\fuzzyhIGH2)],inf).play(t);
)
