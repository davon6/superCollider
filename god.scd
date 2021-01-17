


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




/*
~ptr = Pbind(\instrument,\ptr, \buf, b, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],inf)).play;
~rec =Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b,\group,~recGrp,\dur,Pseq([1024/1],inf)).play;
*/




//k = Pseq([~ens15PercR],4).play(t);

//k = Pseq([~kick4],4).play(t);
//~kickGran.play(t)

//k = Pseq([~kickPat,~~reversedGrain],1).play(t);

//PlayBuf.ar(1,


//Pseq([~fuzzyH],inf).play(t);

//,Pdef(\revfuzzyhIGH2)      Pdef(\granHighFuzz),
/*
~snewww= Pseq([~lpFuzz,~hpFuzz2,~hpFuzz,~lpFuzz2,~melo,
	~hpFuzz,~lpFuzz2,~pr,~pre,~lpFuzz2,~proo,~proot
],1);*/



//~ee3 = Ppar([       Pseq([~ens15Perc],2),           Pseq([v,~noise,v,~noise2  ],2)    ],inf).play(t);

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

//Pseq([~arrSpecialKB[8.rand], ~ens,~ens ,~arrSpecialKB[8.rand]],2).play(t)

/*
k = Pseq([~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln,~index.().postln, Pseq([~ens],2) ,~index.().postln],1).play(t);*/




/*
k = Pseq([/*~index.(), Pseq([~ens],2) ,~index.(),*/~index.(), Pseq([~ens],2) ,~index.(),~index.(), Pseq([~ens],2) ,~index.(),~index.(), Pseq([~ens],2) ,~index.(),~index.(), Pseq([~ens],2) ,~index.(),~index.(), Pseq([~ens],2) ,~index.(),~index.(), Pseq([~ens],2) ,~index.()/*,~index.(), Pseq([~ens],2) ,~index.()*/],1).play(t);*/





k = Pseq([/*~index.(), Pseq([~ens],2) ,~index.(),*/~arrSpecialKB[~boo[~ind]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~ens],2) ,~arrSpecialKB[~boo[~ind+11]]/*,~index.(), Pseq([~ens],2) ,~index.()*/],1).play(t);


)
// = Pseq([~kickPat
~infkick.stop;
{
	o.stop;~kickGrain.stop;k.stop;s.defaultGroup.deepFree;
}
~reverb2Bus
1+1
~index.()
s.scope
s.plotTree
{SinOsc.ar(432,mul:0.2)}.play