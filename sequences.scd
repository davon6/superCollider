

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



Pdef(\c3,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps, \dure,60/151.703592*16 ,\amp,0.002,\which,0,\whichMod,0,\whichAmp,3,\ftime2,6.1952,\ftime3,3.0976));



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
Pdef(\c42b4,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
)

(
Pdef(\c42b5,Pbind(\instrument,\lead, \dur,Pseq([1/16],48),\freq, 86.727,
	\type, Pseq([\note,\rest,\note,\note],inf),
	\eFreq,Pseq([1700,0,0,0],inf),
	\pitch,Pseq([600,700,800,900,1000,1100,1200],inf),




	\dure,60/151.703592/16 ,\amp,~vol1,\which,1,\whichMod,2,\whichAmp,4,\whichEnv,0));
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


(
Pdef(\fuzzy,Pbind(\instrument,\lead, \dur,Pseq([1/4],48),\freq, 657.9895,
	//\type, Pseq([\note,\rest,\note,\note],inf),
	//\eFreq,Pseq([1700,0,0,0],inf),
	//\pitch,Pseq([20,40,60,80,100,120,140],inf),

	//\pitch,Pseq([0,100,200,300,400,500],inf),
	//\pitch,Pseq([-200,0,400,600,800,1000],inf),



	\dure,60/151.703592/4 ,\amp,~vol1,\which,3,\whichMod,2,\whichAmp,4,\whichEnv,4,
	\atkE,Pseq([0.4,0.2,0,0])
	\decE,Pseq([0.4,0.2,0,0])
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
(
Pdef(\c44,Pbind(\instrument,\lead, \dur,Pseq([1/4],1),
	\eFreq, Pseq([76.midicps.rand+ ~inc.()],inf),
	\type, Pseq([\note,\note,\note,\note],inf),
	//\eFreq,Pseq([0,1700],inf),
	\dure,60/151.703592/4 ,\amp,0.006,\which,0,\whichMod,2,\whichAmp,4,\whichEnv,0,\phFm,11));

);


)




~yo = Pseq([Pdef(\c42bbbb),Pdef(\c44),Pdef(\c42bbbb2),Pdef(\c444),Pdef(\c42bbbb2),Pdef(\c4444),Pdef(\c42bbbb2),Pdef(\c44444)],1)

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
