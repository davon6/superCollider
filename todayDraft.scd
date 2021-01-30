(/*~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~effctGrp2 = Group.after(~effctGrp);



~revGrp = Group.after(~effctGrp2);
~revGrp2 = Group.after(~revGrp);

~compGrp = Group.after(~revGrp2);

~limitGrp = Group.after(~compGrp);*/
o = {

	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless

	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3

	Out.kr(~bus6, SinOsc.ar(2.575).range(5274.04,0.0201171875));//c3
	Out.kr(~bus7, SinOsc.ar(5.15).range(5274.04,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(5274.04,0.0201171875));

	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41));

	Out.kr(~bus10,  Lag.kr(LFNoise0.kr(1.2875).range(41.2,1318.51),0.2)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,0.321875])).range(5274.04,20.6));

	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.42916666666).range(20.6,41.20));

	Out.kr(~bus14, MouseY.kr(0,70));


}.play();


//~busFi.()    INSTEAD OF 50










)
Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-23),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch),

	Pbind(\instrument,\reverb,\dur,~trans.(~pm),\roomsize, 46, \revtime,~trans.(~pm)+~revTail.() , \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t, quant:1)




/*
Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-23),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 329.63,\dcPE,~revTails.(),\out,0),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t, quant:1)*/


//s.plotTree



)



Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.0005,\factor,~factor.(),\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+~revTail.() , \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1),


//   cool rythm   Pseq([1/24],72)         Pseq([1/6],18)
//s.plotTree

//    Pseq([Pseq([1/24],72),  (Pseq([1/24],72)/1.5)  , (Pseq([1/24],72)/3)   ],1)
v =

Pseq([
	Ppar([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 3.01518518519,\decC,60,\which,2,\whichEnv,1, \gra,0.0002,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-23)	,\subsE,0,\lvlDec,0  ,\out,~comMelo),

	Pbind(\instrument,\reverb,\dur,~trans.(~tpp),\roomsize, 16, \revtime, ~trans.(~tpp)+(~revTails.()/3), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbBus , \out,0,\group, ~revGrp)],1)


],1).play(t, quant:1);



)

v.stop
















v =
Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],72),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],72),\bus,~bus12,\bus3,24,\bus4,34,\amp,(-23)	,\subsE,0,\out,~reverbBus),

	Pbind(\instrument,\reverb,\dur,Pseq([72/12],1),\roomsize, 36, \revtime, Pseq([72/12],1)+~revTails.(), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t, quant:1);



)

v.stop

s.plotTree

{SinOsc.kr(3).range(Pseq([1/24],72),Pseq([1/12],72))}.play




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



(
{
	SinOsc.ar(LFNoise1.kr(5.15).range(41.2,1318.51)   +

		SinOsc.kr(SelectX.kr(LFNoise0.kr(2.575).range(0,2).round(1),[1.2875,2.575,5.15])


		).range(5274.04,20.6)




		).poll

}.play()

)
