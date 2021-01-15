
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

(//to on before Pbind !!!!!
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~revGrp = Group.after(~granGrp);
)

s.scope

(o = {//Out.kr(~bus1, SinOsc.ar(1.2875).range(2637.02,0.1609375))  ;
	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless
	//Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));
	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3
	/*Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );

	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));
	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));

	 Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
*/

	 Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }.play;







Pdef(\fuzzyhIGH2,
	Pbind(\instrument,\lead, \dur,Pseq([1/16],58),//48
	\freq, 657.9895,
	//\dure,60/151.703592/16,

		\bus, ~bus5,
\bus2,50,//~bus2,
		\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,


	/*
\bus, ~bus1,
\bus2, ~bus2,
		\bus3, 24,\bus4,24,\bus7,~bus13,*/



\which,2,\whichMod,2,\whichEnv,4,

		//\filF,Pseq([ 0,250,500,750,1000,1250,1500, 1750,2000,1750,1500,1250,1000,750,500,250],inf),

	//\filF,Pseq([ 0,500,700,1000,1500,1700, 2000,0],inf),
	//\atkE,Pseq([0.4,0.2,0,0,0.2,0.1,0,0],inf),
	/*	\atkE,Pseq([0.3,0,0,0,0.2,0.1,0,0],inf),
	\subsE,Pseq([0,0,0,0],inf),
	\decE,Pseq([0,0.2,0.2,0.2],inf),*/
		\decE,Pseq([58/16],1),
		\amp,0.0030,
		//\amp,1,
		\out,~micBus,
		\group, ~micGrp
//~reverbBus
));
/*
~ptr = Pbind(\instrument,\ptr, \buf, b, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],inf)).play;
~rec =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b,\group,~recGrp,\dur,Pseq([1024/1],inf)).play;
*/


~ptr = Pbind(\instrument,\ptr, \buf, c, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([58/16],1)
	//,\dec,Pseq([58/16],1)

);
~rec =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, c,\group,~recGrp,\dur,Pseq([58/16],1));



Pdef(\granHighFuzz,Pbind(\instrument,\gran,
	 \dur,Pseq([58/16],1),
	\amp, 0.5,
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







Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([1/16],58),\roomsize, 41, \revtime,1.5488, \damping, 0.422, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp

));


v =Ppar([~ptr,~rec, Pdef(\fuzzyhIGH2),Pdef(\granHighFuzz) ,Pdef(\revfuzzyhIGH2)],1);//.play(t);

//,Pdef(\revfuzzyhIGH2)      Pdef(\granHighFuzz),
/*
~snewww= Pseq([~lpFuzz,~hpFuzz2,~hpFuzz,~lpFuzz2,~melo,
	~hpFuzz,~lpFuzz2,~pr,~pre,~lpFuzz2,~proo,~proot
],1);*/



~ee3 = Ppar([       Pseq([~ens15Perc],2),           Pseq([v,~noise  ],4)    ],inf).play(t);

//~ee3 = Ppar([       Pseq([~ens15Perc],2),           Pseq([v  ],4)    ],inf).play(t);


//~ee3 =  Pseq([~noise ,v  ],inf).play(t)
//~noise.play(t);


//Pdef(\wNoise2).play(t)

//~noise =Ppar([Pdef(\wNoise2),Pdef(\revWNoise2),],inf).play(t);
//~noise.play(t);
//~lpFuzz = Ppar([Pdef(\fuzzy11122),Pdef(\refuzzy11122)],inf);



//Pdef(\fuzzy11122).play(t);

//~lpFuzz.play(t)



//,Pdef(\refuzzy11122)
//Pdef(\hey4).play(t)
)


{
	o.stop;~ptr.stop;~rec.stop;v.stop;~ee3.stop;s.defaultGroup.deepFree;
}
~reverb2Bus
1+1
~micBus
s.scope
s.plotTree
{SinOsc.ar(432,mul:0.2)}.play