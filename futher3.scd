
(

f = { |n=12, min=0, max=11| (min..max).scramble.keep(n) };


~boo = f.value(12, 0, 11);

/*
~dure= [256,256,256,256,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1];  ~busFilter = [~bus4,~bus5,~bus5,~bus6,~bus7,~bus8];
~number = [4,4,4,4,4,4,4,4,16,16,16,16,64,64,64,64,256];
~revTail = [4,16];
~wFil = [0,2,3];





~number2 = 4/16;
*/
)


(SynthDef(\uuuu,{ Out.ar(~micBus,SinOsc.ar(432+ SinOsc.ar( 1.28).range(300,1400),mul:0.1/* EnvGen.kr(Env.perc(0.1,1.6),doneAction:2)*/))}).add;)

Pdef(\uuuuuuuu,Pbind(\instrument, \uuuu,\dur,Pseq([16/1],inf),\group, ~micGrp)).play;

s.scope
s.plotTree
(

~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~revGrp = Group.after(~effctGrp);





Pdef(\melo,Pbind(\instrument,\lead,		\dur,Pseq([1/6],24),
	//	\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\rest,\rest,\rest,\rest],inf),
	\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichAmp,4,\whichEnv,0,\wCar,1,	\decE, 0.05,\bus,~bus12,\bus2,34,\bus3,24,\bus4,~bus3,\amp,0.0006,\out,~reverbBus));


Pdef(\r1,Pbind(\instrument,\reverb,\dur,Pseq([1/6],24),\roomsize, 16, \revtime, Pseq([1/6],24)+ 3.7936, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp));

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




Pdef(\proo,Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\freq,30,\dure,60/151.703592*4,\bpFreq,700,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,3,\decE, 1,\bus4,~bus11,\bus, ~bus4,\amp,0.01,\out, ~reverbBus));//bus4 was4


Pdef(\revProo,Pbind(\instrument,\reverb, \dur,Pseq([2/1],1),\roomsize, 51, \revtime,0.7744, \damping, 0.022, \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -0,\amp,0.1,\spread,100,\maxRoomsize,68,\wet,0.22,\in, ~reverbBus,\out,0,\group, ~revGrp));

~proo = Ppar([Pdef(\proo),Pdef(\revProo)],1);




Pdef(\proot,Pbind(\instrument,\lead, \dur,Pseq([16/1],1),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,\decE,16/1,\bus4,24,\wCar,1,\bus5,~bus5,\bus6,40,\bus4,~bus2,\amp,0.2, \out,~reverbBus));


Pdef(\revProot,Pbind(\instrument,\reverb,\dur,Pseq([16/1],1),
	\roomsize, 61, \revtime,15, \damping, 0.1, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -5,\maxRoomsize,71,\wet,0.15,  \in, ~reverbBus ,   \out,0  , \group, ~micGrp ));


~proot = Ppar([Pdef(\proot),Pdef(\revProot)],1);



~fuzzyL =   {arg dure = 512;

	Ppar([
~ptrLF = Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([dure/32],1)),
~recLF =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, d,\group,~recGrp,\dur,Pseq([512/32],1)),


Pdef(\fuzzy11122,
	Pbind(\instrument,\lead, \dur,Pseq([1/32],dure),\freq, 657.9895,\bus, ~bus4,\bus2, 44,\bus3, 44,\which,0,\whichMod,2,\whichEnv,1,\amp,0.0025,\decE,0.0986,\subsE,0,\out,~micBus,\group, ~micGrp)),

Pdef(\hey4,Pbind(\instrument,\gran,
	 \dur,Pseq([dure/32],1),\amp, 1.5,\buf, d,\out,~reverbBus,\atk, 0,\rel, 1,\gate, 1,\sync, 1,\dens, 40,\baseDur, 0.05,\durRand, 1,\rate, 1,\rateRand, 1,\pan, 0,\panRand, 0,\grainEnv, -1,\ptrBus, ~ptrBus,\ptrSampleDelay, s.sampleRate/3,\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,1/4,\impulse, 10.3)),

		Pdef(\refuzzy11122,Pbind(\instrument,\reverb, \dur,Pseq([1/16],(dure/2)),\roomsize, 46, \revtime, 1.5488, \damping, 0.2, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -14,\maxRoomsize,70,\wet,0.2,\in,~reverbBus,\out,0,\group,~revGrp));

],1)};




//~fuzzyL =Ppar([~ptrLF ,~recLF,Pdef(\fuzzy11122),Pdef(\hey4),Pdef(\refuzzy11122)],1);








~fuzzyH =   {arg dure = 64;


	Ppar([


~ptr = Pbind(\instrument,\ptr, \buf, c, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([dure/16],1)),
~rec =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, c,\group,~recGrp,\dur,Pseq([dure/16],1)),

Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],dure),\freq, 657.9895,\bus, ~bus5,\bus2,50,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,1/16,\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~micBus,\group, ~micGrp)),

Pdef(\granHighFuzz,Pbind(\instrument,\gran,
	 \dur,Pseq([dure/16],1),
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


)),


Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([1/16],dure),\roomsize, 41, \revtime,1.5488, \damping, 0.422, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp

))],1)};




/*

~fuzzyHunGran =   {arg dure = 64, dec=0.05;

Ppar([



Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/4],dure),\freq, 657.9895,\bus, ~bus5,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,dec,\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),


Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([1/4],dure),\roomsize, 41, \revtime,1.5488, \damping, 0.122, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.3,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp

))],1)


};



*/


/*

~fuzzyHunGran =   {arg  number=Pseq([4/16],16), busFilter = ~bus5, revTail = 1.5488, dec =1;// freq, revTime// reverb parameters// filter// make more adsr env//melody pack?

Ppar([



Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,number,\freq, 657.9895,\bus, busFilter,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,dec,\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),


Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,number,\roomsize, 41, \revtime,revTail, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp

))],1)


};


*/



~fuzzyHunGran = {/*arg dure = 64,  number=4/16, busFilter = ~bus5, revTail = 1.5488;*/// freq, revTime// reverb parameters// filter// make more adsr env//melody pack?

	//~fuzzyHunGran.(~dure[3.rand].postln,~number[4.rand].postln,~busFilter[5.rand].postln,~revTail[2.rand].postln

	/*

	~dure= [256,256,256,256,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1];  ~busFilter = [~bus4,~bus5,~bus5,~bus6,~bus7,~bus8];
~number = [4,4,4,4,4,4,4,4,16,16,16,16,64,64,64,64,256];
~revTail = [4,16];
~wFil = [0,2,3];
	*/	arg number=4;


	var dure, durees= [256,256,256,256,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1],numbers = [4,4,4,4,4,4,4,4,16,16,16,16,64,64,64,64,256], revTail,wFil, revTails = [4,16], wFils = [0,2], busFil, busFils = [~bus4,~bus5,~bus5,~bus6,~bus7,~bus8];



	dure = durees[37.rand];
	//number = numbers[17.rand].postln;
	revTail =revTails[2.rand];
	wFil = wFils[2.rand];
	busFil = busFils[6.rand];



	//Pseq([
//10.do({
Ppar([


//Pseq([~number[17.rand].postln/16],~dure[37.rand].postln)      ~number[17.rand]/16

Pdef(\fuzzyhIGH2,
			Pbind(\instrument,\lead, \dur,Pseq([number/16],~varia),\freq, 657.9895,\bus, busFil,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,[number/16],\subsE,0,\which,wFil,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),


		Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([number/16],~varia),\roomsize, 41, \revtime,[number/16]+revTail/16, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp))






			],1).postln// + ", ";

	//});
	//],1);






};












//~fuzzyH =Ppar([~ptr,~rec, Pdef(\fuzzyhIGH2),Pdef(\granHighFuzz) ,Pdef(\revfuzzyhIGH2)],1);






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





~spe1 =
Pseq([

~kbassRest,Pseq([~bassRest],3),
	Ppar([
	Ppar([
			Pbind(\instrument, \kick,\dur, Pseq([1],1),\amp, 0.028,\out,~effctBus),
			Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note], inf),\dur, Pseq([1/4],4),\midinote, 28,\atk, t.beatDur/4 * 0.01,\rel, t.beatDur/4 * 0.99,\atkcrv, -2,\relcrv, -1,\amp, 0.24,\out,~effctBus),], 4),


		Pbind(\instrument, \effect,\wF,1,\dur, Pseq([4/1],1), \in,~effctBus,\out,0,\group,~effctGrp )

], 1),



	~kbassRest,Pseq([~bassRest],3)],1);

~spe2 = Pbind(\instrument, \kick,\dur, Pseq([Pseq([1/4],4), Pseq([1/16],16),  Pseq([1/3],3),Pseq([1/1],4) ,Pseq([1/4],2),Pseq([1/16],4)],1),\amp, 0.028);


~spe3 =   Ppar([Pbind(\instrument, \cymb,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,  Pseq([1/4],64 ),\rel, 0.3872,\rel2,0.0968,\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,0.02,\out,~effctBus),

Pbind(\instrument,\percu2,\dur, Pseq([1/4], 64),\carHz,164.81,\modHz,164.81,\atk, 0,\rel,0.04840,\rel2,0.02420,\amp, 0.062,\out,~effctBus),

Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest,\rest ,\note, \rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2,0.7744,\dur, Pseq([1/2], inf),\amp,0.04,\out,~effctBus),

Ppar([ Pbind(\instrument, \kick,\dur, Pseq([1],1),\amp, 0.028,\out,~effctBus),Pbind(\instrument, \bass,\type, Pseq([\rest, \note, \note, \note], inf),\dur, Pseq([1/4],4),\midinote, 28,\atk, t.beatDur/4 * 0.01,\rel, t.beatDur/4 * 0.99,\atkcrv, -2,\relcrv, -1,\amp, 0.24,\out,~effctBus),],16),

Pbind(\instrument, \effect,\wF,1,\dur, Pseq([16/1],1), \in,~effctBus,\out,0,\group,~effctGrp,\dec1,6 )], 1);


~spe4 = Pbind(\instrument, \kick,\dur, Pseq([Pseq([1/16],16),Pseq([1/4],16),Pseq([1/1],3) ],1)  , \amp, 0.028,\wR,1);


~specialHits = [~spe1,~spe2,~spe3,~spe4].scramble;







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
(

{SinOsc.ar(432,mul:0.01);}.play)

1+1


~dbleRverseStart.play(t)

s.plotTree
s.scope

