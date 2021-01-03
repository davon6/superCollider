Pdef(\c2,Pbind(\instrument,\lead, \dur,Pseq([16/1],inf ),\freq, 76.midicps, \dure,60/151.703592*16,\amp,0.014,\which,3,\whichMod,0,\whichAmp,3));



s.plotTree

~work = Ppar([~ens15Perc, Pdef(\c3)],1);



Pdef(\c3,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps, \dure,60/151.703592*16 ,\amp,0.014,\which,0,\whichMod,0,\whichAmp,3,\ftime2,6.1952,\ftime3,3.0976));



Pdef(\c4,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 300, \dure,60/151.703592*16 ,\amp,0.014,\which,0,\whichMod,2,\whichAmp,3,\ftime2,6.1952,\ftime3,3.0976)).play(t);

(

~more = Pseq([~here2,~bwww3,~work,~seq,~seqRising, ~seq,~seqPartRising,

	~here,~bwww3,~work,~seq,~seqRising, ~seq,~seqPartRising],inf).play(t);
)
s.plotTree

Pdef(\c4,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1));


Pdef(\c4b,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*2 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1));


Pdef(\c5,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*4 ,\amp,0.006,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,2,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1),\dec, 2.7744,\mix, 3,\predel,0.025
	//,\rteLF, 0.064375

);

Pdef(\c6,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(15)));

s.plotTree
~dream = Pseq([Pdef(\c4),Pdef(\x),Pdef(\c5),Pdef(\c6)],1);
~dream2 = Pseq([Pdef(\c4b),Pdef(\x),Pdef(\c5),Pdef(\c6)],1);
~here = Ppar([~ens15Perc,~dream],1);
~here2 = Ppar([~ens15Perc,~dream2],1);
(
Pdef(\x,
	   Pbind(
	\instrument, \lead,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),

		//\type, Pseq([\note,\rest],inf),
	\dur,  Pseq([1/4],16 ),
		//\dur,  Pseq([16/1],16 ),
		\dure,60/151.703592/4 ,
	\freq, 686.727,
		//\phLF ,Pseq([0,-1,-2,0 ,1,2,0,-1],inf),//,\rest,\note ,\note, \rest],inf),

		\phLF ,Pseq([0,1,2,3 ,2,1,0,-1],inf),
		//\phLF ,Pseq([0,10,20,30 ,20,10,0,-10],inf),

	\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,2,\relNode,7
	);
))


Splay!!


//stereo
{[Pulse.ar(Line.kr(40,200,5),mul:Lag.kr(0.1+MouseY.kr(0,0.0312),14)),Pulse.ar(Line.kr(40,200,5),mul:0.1- MouseY.kr(0,0.0422))]}.play

{Pan2.ar(Pulse.ar(532,mul:0.24),0)}.play
{Pulse.ar(532,mul:0.12)!2}.play

{[Pulse.ar(432,mul:0.1+MouseY.kr(0,0.0312)),Pulse.ar(432,mul:0.1- MouseY.kr(0,0.0422).poll)]}.play 