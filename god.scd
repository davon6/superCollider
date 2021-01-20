

(


o = {

	/*Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );



	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));

*/

	Out.kr(~bus1, MouseY.kr(0.2,0.05)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

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
)

//~vari = 16;
SynthDef.new(\nnnn,{ SinOsc.ar(836,mul:0.2) * EnvGen.kr(Env.perc(0,0.2),doneAction:2);}).add;


Synth(\nnnn)
w.play;
s.scope

(






/*

k = Pseq([/*~index.(), Pseq([~ens],2) ,~index.(),*/~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]/*,~index.(), Pseq([~ens],2) ,~index.()*/],1).play(t);

*/

/*
v = Ppar([



Pdef(\fuzzy11122,
	Pbind(\instrument,\lead, \dur,Pseq([1/32],512),\freq, 657.9895,\bus, ~bus4,\bus2, 44,\bus3, 44,\which,0,\whichMod,2,\whichEnv,1,\amp,0.0025,\decE,0.0986,\subsE,0,\out,~reverbBus,\group, ~micGrp)),

		Pdef(\refuzzy11122,Pbind(\instrument,\reverb, \dur,Pseq([1/16],(512/2)),\roomsize, 46, \revtime, 1.5488, \damping, 0.2, \inputbw, 2, \drylevel, -30, \earlylevel, -7, \taillevel, -14,\maxRoomsize,70,\wet,0.2,\in,~reverbBus,\out,0,\group,~revGrp));

],1).play(t);


*/

//o = {	Out.kr(~bus1, MouseY.kr(0.0986,0.05)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);}.play();






//var jojo=10;


//~varia = 4;




//v = ~fuzzyL.(1024).play(t);

//w ~fuzzyHunGran.();

//h = ~fuzzyHunGran.();
/*
v =       Pseq([ ~fuzzyHunGran.(~number[17.rand.postln];)
	,~fuzzyHunGran.(~number[17.rand.postln;])
	,~fuzzyHunGran.(~number[17.rand.postln;]),
	~fuzzyHunGran.(~number[17.rand.postln;]),

	~fuzzyHunGran.(~number[17.rand.postln];)
	,~fuzzyHunGran.(~number[17.rand.postln;])
	,~fuzzyHunGran.(~number[17.rand.postln;]),
	~fuzzyHunGran.(~number[17.rand.postln;]),

	~fuzzyHunGran.(~number[17.rand.postln];)
	,~fuzzyHunGran.(~number[17.rand.postln;])
	,~fuzzyHunGran.(~number[17.rand.postln;]),
	~fuzzyHunGran.(~number[17.rand.postln;]),

	~fuzzyHunGran.(~number[17.rand.postln];)
	,~fuzzyHunGran.(~number[17.rand.postln;])
	,~fuzzyHunGran.(~number[17.rand.postln;]),
	~fuzzyHunGran.(~number[17.rand.postln;])

],1).play(t);*/


//w = {SinOsc.ar(836,mul:0.02) * EnvGen.kr(Env.perc(0,0.2),doneAction:2);};//~fuzzyHunGran.(~number[1]);
/*
w = Pbind(\instrument,\nnnn).play();

h = ~fuzzyHunGran.(~number[10]);





v = Pseq([w,h],1).play(t)*/

//10.rand.postln;
//10.rand.postln;


//v = ~fuzzyHunGran.(Pseq([~number[17.rand].postln/16],4),~bus4,dec:~number[17.rand].postln/16 ).play(t)

//v = ~fuzzyHunGran.(~dure[3.rand].postln,~number[4.rand].postln,~busFilter[5.rand].postln,~revTail[2.rand].postln ).play(t)

//v =       Pseq([~fuzzyHunGran.().postln,~fuzzyHunGran.().postln,~fuzzyHunGran.().postln,~fuzzyHunGran.().postln],1).play(t);
//v =       Pseq([ ~fuzzyHunGran.(),~fuzzyHunGran.(),~fuzzyHunGran.(),~fuzzyHunGran.()],1).play(t);




//10.do({"yo".postln;});




//1.do({ ~fuzzyHunGran.().play(t)  })

//v =       Pseq([10.({ ~fuzzyHunGran.()})],1).play(t);



//v =      Pseq([~fuzzyHunGran.()],4).play(t);
//v = Pseq([  Pseq([ ~fuzzyHunGran.()],1),Pseq([ ~fuzzyHunGran.()],1),Pseq([ ~fuzzyHunGran.()],1),Pseq([ ~fuzzyHunGran.()],1)],1).play(t);

//v =  ~fuzzyHunGran.().play(t);

/*
	var dure, number;

	dure = ~dure[37.rand].postln;
	number = ~number[17.rand].postln;

v = 	Pseq([
//10.do({
Ppar([


//Pseq([~number[17.rand].postln/16],~dure[37.rand].postln)      ~number[17.rand]/16

Pdef(\fuzzyhIGH2,
			Pbind(\instrument,\lead, \dur,Pseq([number/16],dure),\freq, 657.9895,\bus, ~busFilter[6.rand].postln,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\decE,[number/16],\subsE,0,\which,~wFil[3.rand].postln,\whichMod,2,\whichEnv,1,\amp,0.030,\out,~reverbBus,\group, ~micGrp)),


		Pdef(\revfuzzyhIGH2,Pbind(\instrument,\reverb,  \dur,Pseq([number/16],dure),\roomsize, 41, \revtime,[number/16]+~revTail[2.rand].postln/16, \damping, 0.022, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,100,\wet,0.4,\maxRoomsize,70,\in,~reverbBus,\out,0,\group, ~revGrp))






			],1) //+ ", ";

//	}).postln;
],4).play(t);
*/
)
v.stop
3.rand
{
	~fuzzyH.stop;v.stop;s.defaultGroup.deepFree;
}

s.scope
s.plotTree
{SinOsc.ar(432,mul:0.2)}.play







10.do({4.rand.postln;});


100.do({"Print this line over and over...".scramble.postln});