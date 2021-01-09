

~bar16
~ens15Perc
~half16.play(t)
~bassRest
~barwithBre
~ens
~ens2//15 kic + 1/16 break
~naked8 = Pseq([~bassAndKick],8);

Pdef(\c2,Pbind(\instrument,\lead, \dur,Pseq([16/1],inf ),\freq, 76.midicps, \dure,60/151.703592*16,\amp,0.002,\which,3,\whichMod,0,\whichAmp,3));



s.plotTree

~work = Ppar([~ens15Perc, Pdef(\c3)],1);



Pdef(\c3,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps, \dure,60/151.703592*16 ,\amp,0.002,\which,0,\whichMod,0,\whichAmp,3,\ftime2,6.1952,\ftime3,3.0976)).play(t);



Pdef(\c4,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 300, \dure,60/151.703592*16 ,\amp,0.014,\which,0,\whichMod,2,\whichAmp,3,\ftime2,6.1952,\ftime3,3.0976)).play(t);

(

~more = Pseq([~here2,~bwww3,~work,~seq,~seqRising, ~seq,~seqPartRising,

	~here,~bwww3,~work,~seq,~seqRising, ~seq,~seqPartRising],inf).play(t);
)
s.plotTree

Pdef(\c4,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1));


Pdef(\c4b,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*2 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1));


Pdef(\c5,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 686.727, \dure,60/151.703592*4 ,\amp,0.06,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,2,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1),\dec, 2.7744,\mix, 3,\predel,0.025
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


Pdef(\c42b,Pbind(\instrument,\lead, \dur,Pseq([16/1],inf),\freq, 86.727, \dure,60/151.703592*16 ,\amp,0.006,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,2,\ftime2,6.1952,\ftime3,3.0976,\timeSca2,1)).play(t);

(
Pdef(\c42b2,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b3,Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));

)


(
Pdef(\c42b4,Pbind(\instrument,\lead, \dur,Pseq([1/1],48),\freq, 86.727,
	//\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),



	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	//\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,0,\whichMod,2,\whichAmp,3,\whichEnv,0)

).play(t);
)


s.plotTree

~bus9








(

o = {Out.kr(~bus1, SinOsc.ar(1.2875).range(5274.04,81.41))  ;
	Out.kr(~bus2, SinOsc.ar(5.15).range(164.81,81.41));
	Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));
	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0,2.575)  ).range(10.3,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3
	Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );

	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3


	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));

 }.play;










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
\amp,0.135
));










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
\amp,0.135
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
\amp,0.135
));



   //Pseq([Pdef(\fuzzyhIGH2),Pdef(\pr22),Pdef(\pre)],inf).play(t);













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




~snewww= Pseq([Pdef(\fuzzy11122),Pdef(\fuzzyhIGH),Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),
	Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),Pdef(\pr22),Pdef(\pre),Pdef(\fuzzy112),Pdef(\proo)
],1);


~ee3 = Ppar([       Pseq([~ens15Perc],2),           Pseq([Pdef(\wNoise2) ,~snewww,Pdef(\wNoise2)  ],1)    ],inf).play(t);



)


Pdef(\fuzzyhIGH2)



(
Pdef(\c42b5,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([600,700,800,900,1000,1100,1200],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0)).play(t);
)

(
Pdef(\c42b6,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([1300,1400,1500,1600,1700,1800,2000],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b7,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([2100,2200,2280,2320,2400,2650,2800],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

~ph = 0;
~phase = {

	if(~ph >= (-8)){ ~ph  };

	~ph = ~ph +(-0.5)}



var a = 1, z;
z = if (a < 5, { 100 },{ 200 });

z.postln;



(
Pbind(\instrument,\lead, \dur,Pseq([1/16],inf),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,

	\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		 ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),

).play(t))


///////////1.28/////////
(
Pdef(\fuzzy11,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 32),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,3,\whichMod,2,\whichAmp,4,\whichEnv,4,

	\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		 ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.01
));


Pdef(\fuzzy111,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],96),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,3,\whichMod,2,\whichAmp,4,\whichEnv,4,

	\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0,0,0],inf),
		\amp,0.01

));)

Pdef(\fusbr2,Pbind(\instrument,\lead, \dur,Pseq([1/16],2-0.01)));

~sq2 = Pseq([Pdef(\fusbr2),Pdef(\fuzzy3),Pdef(\fuzzy2)],2);

~sq2 = Pseq([Pdef(\fuzzy111),Pdef(\fuzzy11)],2);
~ee2 = Ppar([~ens15Perc ,~sq2],inf).play(t);




//starts here

(
Pdef(\fuzzy112,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 16),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592/16,

\bus, ~cd2,
\bus2, ~cd6,

\bus3,	~cd7,
\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.0135
));

Pdef(\fuzzy11122,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,
		\bus, ~cd5,


\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0.2,0.2,0.2],inf),
		\amp,0.0135

));)
1+1
~sq2 = Pseq([Pdef(\fusbr2),Pdef(\fuzzy3),Pdef(\fuzzy2)],2);

~sq223 = Pseq([Pdef(\fuzzy11122),Pdef(\fuzzy112)],4);

~sq22pla3 = Pseq([Pdef(\fuzzy11122),Pdef(\fuzzy112)],inf).play(t);
~ee2 = Ppar([~ens15Perc ,~sq223],inf).play(t);


(
//special
Pdef(\fuzzyhIGHsoGoood,

Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592,
\decE,1,
\bus, ~cd2,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.015
));
)






(
Pdef(\fuzzyhIGH,

Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),//Pseq([1/4],8),
	\freq, 657.9895,
	\dure,60/151.703592,
\decE,1,
\bus, ~cd3,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

	//\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		// ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.013
));
)
(

Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,
\bus, w,
\bus2, ~ww,
		\bus3, ~www,
\which,2,\whichMod,2,\whichAmp,4,\whichEnv,4,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
		\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0.2,0.2,0.2],inf),
		\amp,0.013

));)

~sq22pla3 = Pseq([Pdef(\fuzzyhIGH),Pdef(\fuzzyhIGH2)],inf).play(t);
(
~sq22pla33= Pseq([Pdef(\fuzzy11122),Pdef(\fuzzyhIGH),Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),
	Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),Pdef(\fuzzyhIGH2),Pdef(\fuzzy112)
],1);)
~ee2 = Ppar([~ens15Perc ,~sq22pla33],inf).play(t);
~infkick.play(t)
1+1
comD
(
//~cd = Bus.control(s,1);

~cd2 = Bus.control(s,1);

~cd3 = Bus.control(s,1);
~cd4 = Bus.control(s,1);
//~cd5 = Bus.control(s,1);

//~cd6 = Bus.control(s,1);
//~cd7 = Bus.control(s,1);

)
~c2 = Bus.control(s,1);
~c3 = Bus.control(s,1);
~c4 = Bus.control(s,1);
(
w = Bus.control(s,1);
~ww = Bus.control(s,1);
~www = Bus.control(s,1);
)
Pseq([Pdef(\fuzzy112)],inf).play(t)

Pseq([Pdef(\fuzzyhIGH2)],inf).play(t)




(

o = {Out.kr(w, SinOsc.ar(1.2875).range(3290.63,81.41))  ;
Out.kr(~ww, SinOsc.ar(5.15).range(329.63,81.41));
	Out.kr(~www, SinOsc.ar(0.0201171875).range(164.81,2.575));

 }.play;
		//Out.kr(~cd3, SinOsc.ar(1.2875).range(5274.04,0201171875));
	//.Out.kr(~cd4, SinOsc.ar(0.0201171875).range(164.81,2.575));


//}.play;

Pseq([Pdef(\fuzzyhIGH2)],inf).play(t)

//Pseq([Pdef(\fuzzyhIGH2)],inf).play(t);
)

(

Pdef(\fuzzyhIGH22,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,
\bus, ~c2,
\bus2, ~c3,
		\bus3, ~c4,
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

~gg = { //Out.kr(c, LFTri.ar(0.040234375).range(100,400));

	//Out.kr(~cd, SinOsc.ar(10.3).range(81.41,659.25));
	Out.kr(~c3, SinOsc.ar(1.2875).range(5274.04,0.0201171875));
	Out.kr(~c2, SinOsc.ar(5.15).range(329.63,81.41));

	Out.kr(~c4, SinOsc.ar(0.0201171875).range(164.81,2.575));

//	Out.kr(~cd5, SinOsc.ar( 2.575 +SinOsc.ar(0.64375).range(0,2.575)  ).range(10.3,1318.51) );

//	Out.kr(~cd6, SinOsc.ar(1.2875).range(0.0201171875,1318.51));

//	Out.kr(~cd7, LFNoise0.ar(1.2875).range(0.0201171875,659.25));



}.play;

/*


~snewww= Pseq([Pdef(\fuzzy11122),Pdef(\fuzzyhIGH),Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),
	Pdef(\fuzzyhIGH2),Pdef(\fuzzy112),Pdef(\fuzzyhIGH2),Pdef(\fuzzy112)
],1);


~ee3 = Ppar([~ens15Perc ,~snewww],inf).play(t);
*/


//Pseq([Pdef(\fuzzy112)],inf).play(t)

Pseq([Pdef(\fuzzyhIGH22)],inf).play(t)



)




(

~yu = {
	Out.kr(~c3, SinOsc.ar(1.2875).range(5274.04,0201171875));
	Out.kr(~c2, SinOsc.ar(5.15).range(329.63,81.41));

	Out.kr(~c4, SinOsc.ar(0.0201171875).range(164.81,2.575));



}.play;


Pseq([Pdef(\fuzzyhIGH22)],inf).play(t)


)

{SinOsc.ar(432 +SinOsc.ar( 5.15+SinOsc.ar(0.64375).range(0,5.15)    ).range(0,23)      ,mul:0.2)!2}.play

(
~vh = Bus.control(s,1);
~vhh = Bus.control(s,1);
~vhhh = Bus.control(s,1);)
(

Pdef(\buu,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],48),
	\freq, 657.9895,
	\dure,60/151.703592/16,/*
\bus, ~vh,
\bus2, ~vhh,
		\bus3, ~vhhh,*/
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
/*
l = {
	//Out.kr(~vh, SinOsc.ar(1.2875).range(5274.04,0201171875));
	//Out.kr(~vhh, SinOsc.ar(5.15).range(329.63,81.41));

	//Out.kr(~vhhh, SinOsc.ar(0.0201171875).range(164.81,2.575));



}.play;*/


Pseq([Pdef(\buu)],inf).play(t)



)


31.32780310528-0.049438512965468
//31.32780310528-0.024719256482734  =  31.303083848797
0.024719256482734*4
31.32780310528-0.098877025930936
(
Pdef(\fuzzy2,

Pbind(\instrument,\lead, \dur,Pseq([1/16], 31.32780310528),//-0.04),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,

	\filF,Pseq([ 0,125,250,375,500,625,750,875,1000,1125,1250,1375,1500,1625,1750,1875,2000
		 ,1875,1750,1625,1500,1375,1250,1125,1000,875,750,625,500,375,250,125],inf),
	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
\amp,0.01
));


Pdef(\fuzzy3,
Pbind(\instrument,\lead, \dur,Pseq([1/16],96.6721968947),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,

	\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	\atkE,Pseq([0.4,0.2,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0,0,0],inf),
		\amp,0.01

)))

Pdef(\fusbr,Pbind(\instrument,\lead, \dur,Pseq([0.04],1),));
Pdef(\fusbr,Pbind(\instrument,\lead, \dur,Pseq([1/64],1),));

changed phase of pbind sounded sickk!!!!!!!!
0.049438512965468


~sq = Pseq([Pdef(\fusbr),Pdef(\fuzzy3),Pdef(\fuzzy2)],2);
~sq = Pseq([Pdef(\fuzzy3),Pdef(\fuzzy2)],2);
~ee = Ppar([~ens15Perc ,~sq],inf).play(t);


(
Pdef(\fuzzyEXP,
Pbind(\instrument,\lead, \dur,Pseq([0.1936],inf),
	\freq, 657.9895,
	\dure,60/151.703592/16,


\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,



		//\filF,800,
	\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	\atkE,Pseq([0,0,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decE,Pseq([1,1,1,1],inf),
		\amp,0.01

)).play(t)
)



~barwithBre.play(t)

(
Pdef(\fuzzy,Pbind(\instrument,\lead, \dur,Pseq([1/16],inf),\freq, 657.9895,//1575.3105
	//\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	//\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,
	//\phLF, Pseq([0,-1,-2,3,-4,-5,-6,-7,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8],inf),
	\phLF,Pseq([0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12.5,13.5,14,14.5,15,15.5,16,16.5,17,17.5,18,18.5,19,19.5,20,20.5,21.5,22,22.5,23,23.5,24,24.5,25,25.5,26],inf),
	\atkE,Pseq([0.4,0.2,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0,0,0],inf)
)).play(t);
)

(
Pdef(\fuzzy,Pbind(\instrument,\lead, \dur,Pseq([1/16],inf),\freq, 657.9895,//1575.3105
	//\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	//\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,4,
	//\phLF, Pseq([0,-1,-2,3,-4,-5,-6,-7,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8],inf),
	\phLF,Pseq([0,0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4,4.2,4.4,4.6,4.8,5,5.2,5.4,5.6,5.8,6,6.2,6.4,6.6,6.8,7,7.2,7.4,7.6,7.8,8],inf),
	\atkE,Pseq([0.4,0.2,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decEC,Pseq([0,0,0,0],inf)
)).play(t);
)





//ok
(
~cMon2 = Pseq([Pdef(\c42b4),Pdef(\c42b3),
	     Pdef(\c42b5),Pdef(\c42b3),
	     Pdef(\c42b6),Pdef(\c42b3),
	Pdef(\c42b7),Pdef(\c42b3)],1);)
~here4 = Ppar([~ens15Perc,~cMon2],1);



~cMon = Pseq([Pdef(\c42b2),Pdef(\c42b3)],4);
~here3 = Ppar([~ens15Perc,~cMon],1)


(

~cMon2b = Pseq([Pdef(\c42b4b),Pdef(\c4break),Pdef(\c42b3),
	Pdef(\c42b5b),Pdef(\c4break),Pdef(\c42b3),
	Pdef(\c42b6b),Pdef(\c4break),Pdef(\c42b3),
	Pdef(\c42b7b)],1);)
~here42 = Ppar([~ens15Perc,~cMon2b],1);





(
Pdef(\c4break,Pbind(\instrument,\lead, \dur,Pseq([1/16],32),\freq, 86.727,
	\type, Pseq([\rest,\rest,\rest,\rest],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b4b,Pbind(\instrument,\lead, \dur,Pseq([1/16],32),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b5b,Pbind(\instrument,\lead, \dur,Pseq([1/16],32),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([600,700,800,900,1000,1100,1200],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b6b,Pbind(\instrument,\lead, \dur,Pseq([1/16],32),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([1300,1400,1500,1600,1700,1800,2000],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42bb,Pbind(\instrument,\lead, \dur,Pseq([1/16],32),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([2100,2200,2280,2320,2400,2650,2800],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)



(
Pdef(\b2,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 86.727, \dure,(8/1-1.70),\amp,0.003,\which,2,\whichMod,1,\whichAmp,0));
Pdef(\c2,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 86.727, \dure,(8/1-1.70),\amp,0.003,\which,0,\whichMod,0,\whichAmp,1));
Pdef(\a2,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 86.727, \dure,(8/1-1.70),\amp,0.003,\which,1,\whichMod,1,\whichAmp,2));



~seq2 = Ppar([Pdef(\c2),Pdef(\b2),Pdef(\a2),~barwithBre],1);
)
(
~heregogo  =Pseq([Ppar([Pdef(\hit),Pseq([~here4,~here42],1)],1),Ppar([~seq2,Pdef(\wNoise)],1),~hem,
	Ppar([Pdef(\hit2),~here4],1),~here42,~seq2,~hem

],inf).play(t);
)
v = 740;


f = { v =  v + 20;    (
 if (v > 4000, { v= 740 },{ v });)};
f.()
v;

(
Pdef(\c42bbbb,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,520,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740],inf),




		\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42bbbb2,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.()],inf),




		\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)


~rand = {~number = 76.midicps.rand};

//~rand = {76.midicps.rand};
~rand.()
~number

f.()
n = 10;
~inc =  {n = n + 20}
~inc.()


//TOMOZ
(
(
Pdef(\c44,Pbind(\instrument,\lead, \dur,Pseq([1/4],4),
	\eFreq, Pseq([~rand.(),~rand.(),~rand.(),~rand.()],1),
	//\type, Pseq([\note,\note,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592/4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\phFm,11));

);


Pdef(\c444,Pbind(\instrument,\lead, \dur,Pseq([1/4],4),
	\eFreq, Pseq([~number+ 40,~number+ 80,~number+ 120,~number+ 160],1),
	//\type, Pseq([\note,\note,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592/4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\phFm,11));



Pdef(\c4444,Pbind(\instrument,\lead, \dur,Pseq([1/4],4),
		\eFreq, Pseq([~number+ 200,~number+ 240,~number+ 280,~number+ 320],1),
	//\type, Pseq([\note,\note,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592/4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\phFm,11));




Pdef(\c44444,Pbind(\instrument,\lead, \dur,Pseq([1/4],4),
		\eFreq, Pseq([~number+ 360,~number+ 400,~number+ 440,~number+ 480],1),
	//\type, Pseq([\note,\note,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592/4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\phFm,11));



)

(




~yo = Pseq([Pdef(\c42bbbb),Pdef(\c44),Pdef(\c42bbbb2),Pdef(\c444),Pdef(\c42bbbb2),Pdef(\c4444),Pdef(\c42bbbb2),Pdef(\c44444)],1);

~hem = Ppar([~half16, ~yo],1);








//stereo
{[Pulse.ar(Line.kr(40,200,5),mul:Lag.kr(0.1+MouseY.kr(0,0.0312),14)),Pulse.ar(Line.kr(40,200,5),mul:0.1- MouseY.kr(0,0.0422))]}.play

{Pan2.ar(Pulse.ar(532,mul:0.24),0)}.play
{Pulse.ar(532,mul:0.12)!2}.play

{[Pulse.ar(432,mul:0.1+MouseY.kr(0,0.0312)),Pulse.ar(432,mul:0.1- MouseY.kr(0,0.0422).poll)]}.play







(
x = { arg spread=1, level=0.2, center=0.0;
 Splay.ar(
  SinOsc.ar( { |i| LFNoise2.kr(1).exprange(200, 4000) } ! 10),
  spread,
  level,
  center
 );
}.play;
)

x.set(\spread, 1,   \center, 0);  // full stereo
x.set(\spread, 0.5, \center, 0);  // less wide
x.set(\spread, 0,   \center, 0);  // mono center
x.set(\spread, 0.5, \center, 0.5);
// spread from center to right
x.set(\spread, 0,   \center, -1); // all left
x.set(\spread, 1,   \center, 0);  // full stereo


 // the a similar example written with arFill:
(
x = { arg spread=1, level=0.2, center=0.0;
 Splay.arFill(10,
  { |i| SinOsc.ar( LFNoise2.kr( rrand(10, 20), 200, i + 3 * 100))  },
  spread,
  level,
  center
 );
}.play;
)
