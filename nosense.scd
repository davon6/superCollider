

(
~ind = 0;
~pseqs =    [Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];
//~pseqs =    [Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([1 /1],16)];
~dure = [1,4,4,4,4,16];
~busFis = [~bus4,~bus4,~bus4,~bus4,~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];
~wFils = [0,2];
~revTails = [0.1936,0.3872, 0.7744,1.5488];//Pseq([1/1],1),Pseq([1/4],1)
~factors = [500,5000,5,1,1,10];
~psqRises = [Pseq([1 /1],1),Pseq([4 /1],1),Pseq([1 /4],1),Pseq([1 /16],1)];
~damps = [0.022,0.22,0.8,0.4 ];

~freqs = [657.9895,657.9895];//, 698.46.rand ];

~pp;~ff;~dd;~bf;~rt;~frq;~fct;~ps;~dps;

~damp = {~dps = ~damps[4.rand];~dps;};
~psqRise = {~ps = ~psqRises[4.rand];~ps;};
~factor = {~fct = ~factors[6.rand];  ~fct;};
~freq = {~frq= ~freqs[2.rand];~frq;};
~revTail = {~rt = ~revTails[4.rand]; ~rt;};
~busFi = {~bf = ~busFis[10.rand];~bf;};
~dur =  {~dd =~dure[6.rand];~dd;};
~fil =  {~ff =~wFils[2.rand];~ff;};
~pseq = {~pp =~pseqs[9.rand];~pp;};

~trans = {|input|

var compared,list,list2,count;

	count = 0;

	list  = [Pseq([1/4],32),Pseq([1/8],32),Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];

	list2  =[Pseq([32/4],1),Pseq([32/8],1),Pseq([1 /4],1),Pseq([4 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([1 /1],1),Pseq([4 /1],1),Pseq([4 /1],1) ];

	compared = list[count];

	while({input.asCompileString.compare(compared.asCompileString)!=0},{count=count+1;compared = list[count];});

	/*count.postln;*/list2[count];};

f = { |n=12, min=0, max=11| (min..max).scramble.keep(n) };
//~f2 = { |n=6, min=0, max=5| (min..max).scramble.keep(n) };

~boo = f.value(12, 0, 11);

)



s.defaultGroup.stop
(



// w = Pbindf(~kick, \dur, Pseq([1],1024), \out,20)



o = {

	/*



	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41);
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));

*/

	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));



	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless


//Out.kr(~bus2, SinOsc.ar(0.08046875).range(81.41,1318.51));


	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3


	Out.kr(~bus6, SinOsc.ar(2.575).range(5274.04,0.0201171875));//c3
	Out.kr(~bus7, SinOsc.ar(5.15).range(5274.04,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(5274.04,0.0201171875));

	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41));

	Out.kr(~bus10,  MouseY.kr(0,957.9895));//,doneAction:2));


	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }.play;

/*
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~revGrp = Group.after(~effctGrp);*/













//s.scope
//s.plotTree







Ppar([



Pbindf(~kick,\out,~kbus),



	Pseq([


		~starters[4.rand],        Pseq([~bar14S,  ~ending[~boo[~ind]]],1) ,
		~starters[4.rand],         Pseq([~bar14S,  ~ending[~boo[~ind+1]]],1) ,

	 ~starters[4.rand],     Pseq([~bar14S,  ~ending[~boo[~ind+2]]],1),
		~starters[4.rand],      Pseq([~bar14S,  ~ending[~boo[~ind+3]]],1),

	~starters[4.rand],           Pseq([~bar14S,  ~ending[~boo[~ind+4]]],1),
		~starters[4.rand],              Pseq([~bar14S,  ~ending[~boo[~ind+5]]]),


		Pseq([~kbassRest,Pseq([~bassRest],47),  	Ppar([
Pbindf(~cymbal, \dur,Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2), Pbindf(~hat, \dur,Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)) ,

			Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.008,\out, ~reverbBus2,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus2,\group,~revGrp2,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
)
],1)],1),



	~starters[4.rand],      Pseq([~bar14S,  ~ending[~boo[~ind+6]]],1),
		~starters[4.rand],        Pseq([~bar14S,  ~ending[~boo[~ind+7]]],1),
	~starters[4.rand],         Pseq([~bar14S,  ~ending[~boo[~ind+8]]],1),
		~starters[4.rand],         Pseq([~bar14S,  ~ending[~boo[~ind+9]]]),
		 ~starters[4.rand],      Pseq([~bar14S,  ~ending[~boo[~ind+10]]],1),
		  ~starters[4.rand],      Pseq([~bar14S,  ~ending[~boo[~ind+11]]],1),



		~specialHits[4.rand],~specialHits[4.rand],~specialHits[4.rand],~specialHits[4.rand]





],1)   ,   //.play(t);









Ppar([

	Pbind(\instrument, \lead,\dur, Pseq([64/1],1), \gra, 0, \eFreq, [329.63,331.63,334.63,335.63], \subsE, 0,\amp,0.005,\whichMod,2, \decE, Pseq([64/1],1),\whichEnv,1,\bus4, ~bus2 , \which,1,\out, ~reverbBus3),


Pbind(\instrument,\reverb,\dur,Pseq([64/1],1),\roomsize, 16, \revtime, Pseq([64/1],1)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus3 , \out,0,\group, ~revGrp,\spread, 1,   \center, 0),

			Pbind(\instrument,\comp,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1) ,\thr ,0.8 ,\sB , 1, \sA , 2, \atk , 0.001, \rel ,0.04840

		,\in, ~compressBus ,\in2, ~kbus,\group, ~compGrp),




//Pseq([



Pseq([
//4.do({

Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.0005,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),










Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

			Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),









	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.03, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),







Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.002, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.0005,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


		Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.03, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
			Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1).play(t),



Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.002, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.0005,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.03, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.002, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.0005,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),








		Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/8],32),\type,Pseq([\note, \rest],inf),
\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,0.0484,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.006,\factor,~factor.(),\subsE,0,\out, ~delayBus),


Pbind(\instrument,\pingD,\dur,~trans.(Pseq([1/8],32)),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,~trans.(Pseq([1/8],32)),\amp,0.06,\in, ~delayBus,\out,~reverbBus,\group,~effctGrp),


Pbind(\instrument,\reverb,\dur,~trans.(Pseq([1/8],32)),\roomsize, 16, \revtime,/*Pseq([1/8],32)+*/1.5488 , \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),









Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.002, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

//],inf)
		].scramble,8),

		],1)











],1).play(t);


//Compander

//Limiter
//9.6727405929565        3.73355448246
// 16.377023048401       2.9488724470139
//7.4276504516602     4.4187152385712*/



)














(
Ppar([





	Pseq([
		Pseq([~specialHits[1],Ppar([~specialHits[2],     Ppar([
	Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.008,\out, ~reverbBus2,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus2,\group,~revGrp2,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
)],1) ,~specialHits[3]     ],1),~specialHits[0]  ],1),~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]


	, Pseq([~ens],3),~half16],1),






Pseq([

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


	],~dur.()),
		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


		],~dur.()),
	Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


],~dur.()),
	Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~bus5,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

			Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


		],~dur.())


],16)

	//],inf)



	],1).play(t)




//],inf),

//],1)

//.play(t)







)
s.defaultGroups.freeAll
s.scope
s.plotTree





//INSPO FOR LOOSE BIT AROUND


Ppar([

	Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.1,\factor,~factor.(),\subsE,0,\out, ~delayBus),




	Pbind(\instrument,\pingD,\dur,Pseq([1/1],1),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,5,\in, ~delayBus,\out,0,\group,~effctGrp),




Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+1.5488 , \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t)