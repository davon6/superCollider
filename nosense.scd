
~num =~number[17.rand]  ;
~num2 =~number[17.rand]  ;
(
~pseqs =    [Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];
//~pseqs =    [Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([1 /1],16)];
~dure = [1,4,4,4,4,16];
~busFis = [~bus4,~bus4,~bus4,~bus4,~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];
~wFils = [0,2];

~pp;~ff;~dd;~bf;

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
/*
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~revGrp = Group.after(~granGrp);


*/

o = {

	/*Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );



	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
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


	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }.play;


/*
Pseq([


Ppar([

  Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, 657.9895,\bus, ~bus5,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
],1)

,

Ppar([

 Pbind(\instrument,\lead, \dur,~pseq.(),\freq, 657.9895,\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,2,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




],1)


],inf).play(t)

*/

Ppar([Pseq([/*~index.(), Pseq([~ens],2) ,~index.(),*/~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]/*,~index.(), Pseq([~ens],2) ,~index.()*/],1),






Pseq([
Pseq([


Ppar([

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
],1)

,

Ppar([

 Pbind(\instrument,\lead, \dur,~pseq.(),\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




],1)


	],~dur.()),
Pseq([


Ppar([

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
],1)

,

Ppar([

 Pbind(\instrument,\lead, \dur,~pseq.(),\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




],1)


],~dur.()),
	Pseq([


Ppar([

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
],1)

,

Ppar([

 Pbind(\instrument,\lead, \dur,~pseq.(),\freq, 657.9895,\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




],1)


],~dur.()),
	Pseq([


Ppar([

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, 657.9895,\bus, ~bus5,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)
],1)

,

Ppar([

 Pbind(\instrument,\lead, \dur,~pseq.(),\freq, 657.9895,\bus, ~bus4,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,~pp,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,0.0008,\out,~reverbBus,\group, ~micGrp),

	Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 41, \revtime,1.554, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp)




],1)


],~dur.())




],inf)

],inf)



.play(t)







)

s.scope
s.plotTree