
~num =~number[17.rand]  ;
~num2 =~number[17.rand]  ;
(
~pseqs =    [Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];
//~pseqs =    [Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([1 /1],16)];
~dure = [1,4,4,4,4,16];
~busFis = [~bus4,~bus4,~bus4,~bus4,~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];
~wFils = [0,2];
~revTails = [0.1936,0.3872, 0.7744,1.5488];//Pseq([1/1],1),Pseq([1/4],1)
~factors = [500,5000,5,1,1,10];
~psqRises = [Pseq([1 /1],1),Pseq([4 /1],1),Pseq([1 /4],1),Pseq([1 /16],1)];

~freqs = [657.9895,657.9895];//, 698.46.rand ];

~pp;~ff;~dd;~bf;~rt;~frq;~fct;~ps;


~psqRise = {~ps = ~psqRises[4.rand];~ps;};
~factor = {~fct = ~factors[6.rand];  ~fct;};
~freq = {~frq= ~freqs[2.rand];~frq;};
~revTail = {~rt = ~revTails[4.rand]; ~rt;};
~busFi = {~bf = ~busFis[10.rand];~bf;};
~dur =  {~dd =~dure[6.rand];~dd;};
~fil =  {~ff =~wFils[2.rand];~ff;};
~pseq = {

~pp =~pseqs[9.rand];

	~pp;

};

)

(



~loook = Ppar([  Pdef(\ooo,    Pbind(\instrument,\lead, \dur,Pseq([1 /4],8),\freq, 657.9895,\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,Pseq([1/4],8),\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),

		Pdef(\oooo, 	Pbind(\instrument,\reverb,  \dur,Pseq([1/4],8),\roomsize, 41, \revtime,[1/4], \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp))],1);







~loook2 = Ppar([ Pdef(\ooooo,    Pbind(\instrument,\lead, \dur,Pseq([1 /4],16),\freq, 657.9895,\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,Pseq([1 /4],16),\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),

	Pdef(\oooo, 	Pbind(\instrument,\reverb,  \dur,Pseq([1/4],16),\roomsize, 41, \revtime,[1/4], \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp))],1);




)
(




o = {

	/*



	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41);
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));

*/

	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));



	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless





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


~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~revGrp = Group.after(~effctGrp);




Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.1,\factor,~factor.(),\subsE,0,\out,~effctBus),




	Pbind(\instrument,\effect,\dur,Pseq([1/1],1),\wS,1,\in, ~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,Pseq([1/1],1)),




	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t)




)

s.scope


(

Ppar([Pseq([Pseq([~specialHits[1],Ppar([~specialHits[2],     Ppar([
	Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.008,\out, ~reverbBus,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus,\group,~revGrp,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
)],1)      ],1),~specialHits[3],~specialHits[0]],1),~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]


,~index.(), Pseq([~ens],4) ,~index.()],1),







Pseq([
//4.do({

Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.001,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.008, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.004, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.001,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.008, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.004, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.001,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.008, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.004, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.001,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),

	Ppar([Pbind(\instrument,\lead, \dur,~psqRise.(),\decE,0,\atkE,~ps,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.008, \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, ~ps, \in,~effctBus,\out,~reverbBus,\group,~effctGrp,\dec1,~ps),
Pbind(\instrument,\reverb,  \dur,~ps,\roomsize, 50, \revtime,~ps+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),

Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,0.004, \gra,5.00.rand.postln,\out,~reverbBus,\group, ~micGrp),

Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.2,\maxRoomsize,80,\in,~reverbBus,\out,0,\group, ~revGrp)],1),


].scramble,inf)

],1).play(t);


//9.6727405929565        3.73355448246
// 16.377023048401       2.9488724470139
//7.4276504516602     4.4187152385712

)

(
Ppar([Pseq([Pseq([~specialHits[1],Ppar([~specialHits[2],     Ppar([
	Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.008,\out, ~reverbBus,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus,\group,~revGrp,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
)],1)      ],1),~specialHits[3],~specialHits[0]],1),~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]


,~index.(), Pseq([~ens],4) ,~index.()],1),






Pseq([

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


	],~dur.()),
		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


		],~dur.()),
	Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


],~dur.()),
	Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~bus5,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\freq, ~freq.(),\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,~pp+~revTail.(), \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




			],1)


		],~dur.())




	],inf)

],inf)



.play(t)







)
s.defaultGroups.freeAll
s.scope
s.plotTree