
s.scope

(o = {//Out.kr(~bus1, SinOsc.ar(1.2875).range(2637.02,0.1609375))  ;

	//Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));

	/*Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );



	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));
*/

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless

	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3



	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }.play;





/*


k = Pseq([/*~index.(), Pseq([~ens],2) ,~index.(),*/~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]/*,~index.(), Pseq([~ens],2) ,~index.()*/],1).play(t);

*/



Pdef(\melo,Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),
		//\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\rest,\rest,\rest,\rest],inf),
	\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,


		380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45



	],inf),
	\which,2,\whichMod,2,\whichAmp,4,\whichEnv,3,\wCar,1,	\decE, 0.1,\bus,~bus12,\bus2,34,\bus3,24,\bus4,~bus13,\amp,0.0006,\out,~reverbBus
));



Pdef(\r1,Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, 1.24, \damping, 0.30, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp//~micBus,\group, ~micGrp

));

~melo = Ppar([Pdef(\melo),Pdef(\r1)],1);

v = Pseq([~melo],inf).play(t)
)


{
	~fuzzyH.stop;v.stop;s.defaultGroup.deepFree;
}

s.scope
s.plotTree
{SinOsc.ar(432,mul:0.2)}.play