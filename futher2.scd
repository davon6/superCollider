
(
~bus1 = Bus.control(s,1);
~bus2 = Bus.control(s,1);
~bus3 = Bus.control(s,1);
~bus4 = Bus.control(s,1);
~bus5 = Bus.control(s,1);
~bus6 = Bus.control(s,1);
~bus7 = Bus.control(s,1);
~bus8 = Bus.control(s,1);

~bus9 = Bus.control(s,1);

~bus10 = Bus.control(s,1);
~bus11 = Bus.control(s,1);
~bus12 = Bus.control(s,1);
~bus13 = Bus.control(s,1);

~bus14 = Bus.control(s,1);
)
//~arrSpecialKB.size-1
(//AFTER PBIND


f = { |n=12, min=0, max=11| (min..max).scramble.keep(n) };

//f.value(12, 0, 11);
~boo = f.value(12, 0, 11);

/*
~index = {


if( ~ind > (~boo.size-1 ),{"finito".postln;~ind=0;        },{


	if( ~arrSpecialKB[~boo[~ind]][1] ==True ,{~arrSpecialKB[~boo[~ind]][1]=False; ~ind = ~ind+1;~ind.postln;~arrSpecialKB[~boo[~ind]][0]; }
			}

					//{ ~index.();    });});*/






//~index = {    ~arrSpecialKB[~boo[~ind]][0];  ~ind = ~ind+1;




})



(SynthDef(\uuuu,{ Out.ar(~micBus,SinOsc.ar(432+ SinOsc.ar( 1.28).range(300,1400),mul:0.1/* EnvGen.kr(Env.perc(0.1,1.6),doneAction:2)*/))}).add;)

Pdef(\uuuuuuuu,Pbind(\instrument, \uuuu,\dur,Pseq([16/1],inf),\group, ~micGrp)).play;

s.scope
s.plotTree
(

~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~revGrp = Group.after(~granGrp);





Pdef(\melo,Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\dure,60/151.703592/3,//was 12
		\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\rest,\rest,\rest,\rest],inf),
	\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,


		380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45



	],inf),
	\which,2,\whichMod,2,\whichAmp,4,\whichEnv,3,\wCar,1,	\decE, 1,\bus,~bus12,\bus2,34,\bus3,24,\amp,0.0006,\out
,~reverbBus
));



Pdef(\r1,Pbind(\instrument,\reverb,\dur,Pseq([2/1],1),\roomsize, 16, \revtime, 3.24, \damping, 0.30, \inputbw, 0.95, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\out,~micBus,\group, ~micGrp

));


~melo = Ppar([Pdef(\melo),Pdef(\r1)],1);



Pdef(\pr22,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 32),//Pseq([1/4],8),
		\freq, 657.9895,
	\dure,60/151.703592/16,

\which,1,\whichMod,2,\whichAmp,4,\whichEnv,3,

			\bpFreq, Pseq([3050,3000,2950,2900,2850,2800,2700,2600,2500,2400,2300,2200,2100,2000,1800,1700,
			1600,1500,1400,1300,1200,1100,1000,900,800,700,600,500,400,300,200,100],inf  )  ,



		//\decE, 0.0986,
		\bus4,~bus9,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.0015, \out,~reverbBus
));



Pdef(\revpr22,Pbind(\instrument,\reverb,\dur,Pseq([2/1], 1),\roomsize, 40, \revtime, 1.5488, \damping, 0.9, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -28,\maxRoomsize,40,\out,~micBus,\group, ~micGrp

));


~pr = Ppar([Pdef(\pr22),Pdef(\revpr22)],1);



Pdef(\pre2,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 32),//Pseq([1/4],8),
		\freq, Pseq([657.9895,(657.9895-(657.9895-60.727/16*1)) ,(657.9895-(657.9895-60.727/16*2)) ,(657.9895-(657.9895-60.727/16*3)) ,(657.9895-(657.9895-60.727/16*4)) ,(657.9895-(657.9895-60.727/16*5)) ,(657.9895-(657.9895-60.727/16*6)) ,(657.9895-(657.9895-60.727/16*7)) ,(657.9895-(657.9895-60.727/16*8)) ,(657.9895-(657.9895-60.727/16*9)) ,(657.9895-(657.9895-60.727/16*10)) ,(657.9895-(657.9895-60.727/16*11)) ,(657.9895-(657.9895-60.727/16*12)) ,(657.9895-(657.9895-60.727/16*13)),(657.9895-(657.9895-60.727/16*14))  ,
(657.9895-(657.9895-60.727/16*15)),(657.9895-(657.9895-60.727/16*16)),(657.9895-(657.9895-60.727/16*17)),(657.9895-(657.9895-60.727/16*18)),(657.9895-(657.9895-60.727/16*19)),(657.9895-(657.9895-60.727/16*20)),(657.9895-(657.9895-60.727/16*21)),(657.9895-(657.9895-60.727/16*25)),(657.9895-(657.9895-60.727/16*26)),(657.9895-(657.9895-60.727/16*24)),(657.9895-(657.9895-60.727/16*14)),(657.9895-(657.9895-60.727/16*14)),(657.9895-(657.9895-60.727/16*27)),(657.9895-(657.9895-60.727/16*28)),(657.9895-(657.9895-60.727/16*29)),(657.9895-(657.9895-60.727/16*30)),60.727,],1),
	\dure,60/151.703592/16,

\which,1,\whichMod,2,\whichAmp,4,\whichEnv,3,
		\bpFreq, Pseq([50,100,150,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,
			1500,1600,1700,1800,2000,2100,2200,2300,2400,2500,2600,2700,2800,2900,3000,3050],1  )  ,

		//\decE, 0.0986,
		\bus4,~bus9,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.07
));





Pdef(\pre,

Pbind(\instrument,\lead, \dur,Pseq([1/1],1),//Pseq([1/4],8),
	\freq, 60.727,
	\dure,60/151.703592,
		\bpFreq,700,

\which,1,\whichMod,2,\whichAmp,4,\whichEnv,3,

		\decE, 1.6,\bus4,~bus10,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.009, \out, ~reverbBus
));



Pdef(\revPre,Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),

	\roomsize, 21, \revtime, 3.0976, \damping, 0.31, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -12,\maxRoomsize,21,\out,~micBus,\group, ~micGrp


));


~pre = Ppar([Pdef(\pre),Pdef(\revPre)],1);



Pdef(\tokeep,

Pbind(\instrument,\lead, \dur,Pseq([16/1],1),//Pseq([1/4],8),
	\freq, -100,
	\dure,60/151.703592*16,
		\bpFreq,700,

\which,1,\whichMod,2,\whichAmp,4,\whichEnv,3,


		\decE, 16,\bus4,0,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.135
));

/*   old one
Pdef(\proo,

Pbind(\instrument,\lead, \dur,Pseq([2/1],1),//Pseq([1/4],8),
	\freq,30,
	\dure,60/151.703592*4,
		\bpFreq,700,

\which,0,\whichMod,2,\whichAmp,4,\whichEnv,3,


		\decE, 1,\bus4,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.0135
));
*/


Pdef(\proo,

Pbind(\instrument,\lead, \dur,Pseq([2/1],1),//Pseq([1/4],8),
	\freq,30,
	\dure,60/151.703592*4,
		\bpFreq,700,

\which,0,\whichMod,2,\whichAmp,4,\whichEnv,3,


		\decE, 1,\bus4,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.001,\out, ~reverbBus
));


Pdef(\revProo,Pbind(\instrument,\reverb, \dur,Pseq([2/1],1),\roomsize, 51, \revtime,0.7744, \damping, 0.022, \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -0,\amp,0.1,\spread,100,\maxRoomsize,68,\wet,0.22,\out,~micBus,\group, ~micGrp

));

~proo = Ppar([Pdef(\proo),Pdef(\revProo)],1);


Pdef(\proot,

Pbind(\instrument,\lead, \dur,Pseq([1/1],1),//Pseq([1/4],8),
	//\freq,30,
	\dure,60/151.703592*4,
		//\bpFreq,700,
\eFreq,81.41,
\which,1,\whichMod,2,\whichAmp,4,\whichEnv,3,


		\decE, 60/151.703592*4,\bus4,24,\wCar,1,\bus5,~bus5,\bus6,~bus11,



	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.2, \out, ~reverbBus
));


Pdef(\revProot,Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),
	\roomsize, 61, \revtime, 3.5, \damping, 0.01, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -0,\maxRoomsize,71,\wet,0.15,\out,~micBus,\group, ~micGrp


));


~proot = Ppar([Pdef(\proot),Pdef(\revProot)],1);















Pdef(\fuzzy112,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 16),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592/16,
/*\bus, ~bus8,
\bus2, ~bus6,

\bus3,	~bus,*/
	\bus,~bus8,
		\bus2,~bus6,
			\bus3,~bus7,
		\bus4,24,

\which,0,\whichMod,2,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.0025, \out,~reverbBus
));

Pdef(\revfuzzy112,Pbind(\instrument,\reverb, \dur,Pseq([1/1], 1),\roomsize, 16, \revtime, 1.5488, \damping, 0.070, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -12,\maxRoomsize,16,\wet,0.2,\out,~micBus,\group, ~micGrp

));

~lpFuzz2 = Ppar([Pdef(\fuzzy112),Pdef(\revfuzzy112)],1);






Pdef(\fuzzyhIGH,

Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592,
\decE,1,
\bus, ~bus5,
		\bus4,24,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
		\amp,0.0022,\out,~micBus,\group, ~micGrp//~reverbBus
));

Pdef(\revfuzzyhIGH,Pbind(\instrument,\reverb, \dur,Pseq([1/1], 1),\roomsize, 16, \revtime, 3.24, \damping, 0.10, \inputbw, 0.95, \drylevel, -3, \earlylevel, -15, \taillevel, -17,\maxRoomsize,16,\out,~micBus,\group, ~micGrp

));

~hpFuzz2 = Ppar([Pdef(\fuzzyhIGH),Pdef(\revfuzzyhIGH)],1);




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
		\amp,0.0025,\out,~reverbBus/////~micBus,\group, ~micGrp//
/*,\roomsize, 46, \revtime, 3.5488, \damping, 0.50, \inputbw, 2, \drylevel, -3, \earlylevel, -7, \taillevel, -0,\maxRoomsize,66,\wet,0.7*/
));

Pdef(\refuzzy11122,Pbind(\instrument,\reverb, \dur,Pseq([1/16],48),\roomsize, 16, \revtime, 3.5488, \damping, 0.070, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -2,\maxRoomsize,16,\wet,0.2,\out,0//~micBus,\group, ~micGrp

));

~lpFuzz = Ppar([Pdef(\fuzzy11122),Pdef(\refuzzy11122)],1);


/*
Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,
\bus, ~bus1,
\bus2, ~bus2,
		\bus3, 24,\bus4,24,\bus7,~bus13,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0.2,0.2,0.2],inf),
		\amp,0.0020,\out,0//~micBus,\group, ~micGrp//~reverbBus
));*/


Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],64),\freq, 657.9895,\bus, ~bus5,\bus2,50,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,1/16,\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~micBus,\group, ~micGrp));

~ptr = Pbind(\instrument,\ptr, \buf, c, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([64/16],1));
~rec =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, c,\group,~recGrp,\dur,Pseq([64/16],1));



Pdef(\granHighFuzz,Pbind(\instrument,\gran,
	 \dur,Pseq([64/16],1),
	\amp, 0.05,
	\buf, c,
	\out,~reverbBus,
	\atk, 0,
	\rel, 1,
	\gate, 1,
	\ptrBus, ~ptrBus,
	//\ptrSampleDelay, s.sampleRate/3,
	\ptrRandSamples, 0,
	\minPtrDelay, 1000,\group,~granGrp,
	//\pitchRte,1,\duration,8,\impulse, 1.2875
	\duration,1/4,\impulse, 10.3,
//\duration,8,\impulse, 0.1


));


Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([1/16],64),\roomsize, 41, \revtime,1.5488, \damping, 0.422, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp

));


~fuzzyH =Ppar([~ptr,~rec, Pdef(\fuzzyhIGH2),Pdef(\granHighFuzz) ,Pdef(\revfuzzyhIGH2)],1);



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


Pdef(\e8,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],32 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.02
	);
);

Pdef(\e4,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],16 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.02
	);
);

Pdef(\sn8,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 4),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));

Pdef(\sn4,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 2),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));



Pdef(\d8,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 32),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.062

	//\rel,2,

	));


Pdef(\d4,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 16),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.062

	//\rel,2,

	));




Pdef(\e15,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],60 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.02
	);
);

Pdef(\sn15,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 7),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));



Pdef(\d15,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 60),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.062

	//\rel,2,

	));




Pdef(\e,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],64 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.02
	);
);
Pdef(\d,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 64),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.062

	//\rel,2,

	));
Pdef(\sn,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 8),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));

	~bassPat = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.24,
	);

	~kickPat = Pbind(
		\instrument, \kick,
		\dur, Pseq([1],1),
		\amp, 0.028,
	);

	~bassAndKick = Ppar([~bassPat, ~kickPat], 1);

~kickPatDemi = Pbind(
		\instrument, \kick,
		\dur, Pseq([1/2],2),
		\amp, 0.028,
);


~kickPatQuart = Pbind(
		\instrument, \kick,
		\dur, Pseq([1/4],2),
		\amp, 0.028,
);



~bassRest = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \rest, \rest, \rest], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.8,
	);


~kickPatToGran = Pbind(
		\instrument, \kick,
		\dur, Pseq([1/4],1),
		\amp, 0.028,
	\out,~micBus,\group, ~micGrp);

~ptrK1 = Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1/4],1));
~recK1 =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1/4],1));

Pdef(\granKick1,Pbind(\instrument,\gran,\dur,Pseq([1/4],1),\amp, 1,\buf, e,\out,0,\atk, 0,\rel, 1/4,\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,1/4,\impulse, 0.64375));



~kickR = Pbind(\instrument, \kick,\dur, Pseq([1/4],1), \amp, 0.028,\wR,1);
~reversedGrain =Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1);
~dbleRverseStart = Pseq([Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],2),~kbassRest,~bassRest,Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1)],1);
~kickGran = Pseq([~kickPatToGran],1);
~kick4 = Pseq([~kickPat],4);
~bar4 = Ppar([~bassPat, ~kickPat], 4);
~seq = Ppar([Pdef(\c),Pdef(\b),Pdef(\a),~barwithBre],1);
~seqRising = Ppar([~barwithBre, Pdef(\w)],1);
~bar16  = Pseq([~bassAndKick],16);
~bar15 = Ppar([~bassPat, ~kickPat], 15);
~bar8 = Ppar([~bassPat, ~kickPat], 8);
~semiBreak = Pseq([~bar8,Pseq([~bassRest],8)],1);
~kbassRest = Ppar([~kickPat, ~bassRest], 1);
~half16  = Pseq([Ppar([Pseq([~bassAndKick],8),Pdef(\d8),Pdef(\e8),Pdef(\sn8)],1),Pseq([~bassRest],8)],1);
~barwithBre= Pseq([~bar15, ~kbassRest], 1);//HERE
~ens = Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar16],1);//must include percu
~ens2 = Pseq([Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar15],1),~bassRest],1);//must include percu
//~seqPartRising =  Ppar([~ens, Pdef(\aR),Pdef(\bR),Pdef(\cD)],1);
~ens15Perc = Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),~kbassRest],1);
~ens16Perc = Ppar([Pdef(\d),Pdef(\e),Pdef(\sn),~bar16],1);
~ens15PercR = Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1);
//~broken  = Pseq([Pdef(\cD2),Pdef(\cD3)],1);
//~bwww = Ppar([~ens, ~broken], 1);
~ens15PercS = Pseq([~kbassRest,Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1)],1);
//~ens15PercS.stop
~fitDbleick = Pseq([Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1),  ~kbassRest  ,Pseq([~bassRest],2),
	~kickPatDemi, ~kbassRest  ,Pseq([~kickPatDemi],2),Pseq([~kickPatQuart],4)    ],1);

//~kbassRest,Pseq([~bassRest],8)

/*
~arrSpecialKB = [[~ens15PercS,True],[~ens15PercR,True],[~ens16Perc,True],[~ens15Perc,True],[~ens,True],[~half16,True],[~bar16,True],[~barwithBre,True],[~ens2,True],[~semiBreak,True],[~dbleRverseStart,True],[~fitDbleick,True]];*/

~arrSpecialKB = [~ens15PercS,Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),Ppar([~kickPat,Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],1)],1),~ens16Perc,~ens15Perc,~ens,~half16,~bar16,~barwithBre,~ens2,~semiBreak,Pseq([Pseq([Ppar([Pseq([~kickGran],1),~ptrK1,~recK1,Pdef(\granKick1)],1)],2),~kbassRest,~bassRest,Ppar([Pdef(\d4),Pdef(\e4),Pdef(\sn4),~bar4],1)],1),~fitDbleick];

)





~dbleRverseStart.play(t)

s.plotTree
s.scope

