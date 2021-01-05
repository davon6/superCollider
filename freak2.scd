s.boot;s.scope;
s.reboot;
s.quit

Server.default.options.outDevice_("Audient iD14");
Server.killAll

Server.default.options.outDevice_("Built-in Output");


s.plotTree
Buffer.freeAll;


(
SynthDef(\lead, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.01, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875,  short = 0.3872,mid=0.7744,atkE =0.3872,decE=0.1936, subsE=0, relE=0, sineRate = 0.0000000095262251, sineRangeHigh = 0, sineRangeLow=0, gate = 1, pitch = 0, sRteLPF = 1.3, timeSca= 0.25, dure= 1/1, which = 1, whichMod = 1, whichAmp =0,phRise= 0 , whichEnv = 0,timeSca2 =1;
	var car, mod,modE, env, env2, env3, env4, iEnv, mod2, sig, bufpos, envVoice, filRte,lp,bp,hp,lp2,amp1,amp2,amp3, a1,a2,a3, b1, b2, b3,b4;

	//1.5488
	//2.575
	//1.2875
	//5.15
	filRte =
EnvGen.kr(Env.new(
		[0, 1.2875 ,1.2875 ,10.3   ,10.3   , 1.2875,1.2875,10.3,10.3],
		[0,1.5488 ,0     ,1.5488  ,0       ,    1.5488,0,1.5488  ,0,1.5488  ,0,1.5488,0],
		releaseNode:5,loopNode:1,offset:(1/16)//-1.5488 ) //(1/16)//  here!!!




	),gate: Trig.kr( 1,dur:dure),doneAction:2
	);



	iEnv = EnvGen.kr(


			Env.new(
			[1, 1 * 5, 1 * 5],
			[0.000000000001,        (dure  ),      0.0000000001],	//[atk,          450,      10 ],   was 0.01   -1.6   -0.8
			[4, (-4)]
		),doneAction:2
);//- 1.604003    here!!!


		/*MUST BE KEPT       Env.new(
			[index, index * iScale, index * iScale],
		[atk,          4/1,      2/16 ],	//[atk,          450,      10 ],
			[cAtk, cRel]
		),doneAction:2
);


	Env.new(	[1, 1 * 5, 1 * 5],
		    [0.01,        3/1,      1],	//[atk,          450,      10 ],
			//[4, (-4)]
		),doneAction:2
);


*/



                             //HERE 1.2875
	b = SinOsc.kr(	LFNoise1.kr(2.575).range(0.3,1.0)).range(0,1.0);


 c = SinOsc.kr(	LFNoise0.kr(0.64375).range(0.01,0.3872)).range(0,1.0);
//c can be changed for LFNOISE

/*dure /4 coz of timescale*/
	env =EnvGen.kr(
        Env(
		levels:[0,1, 1 ,b,0,0               ],
			times: [0,(0+c),(0.3872-c),0,0,0             ],
			curve: LFNoise0.kr(1/4).range(-2,3),releaseNode:4,loopNode:1
			//CHANGE CURVE TO OSICALLATION -+    +3 is nice
        ),
/*dury /4 coz of timescale*/
		gate: Trig.kr( 1,dur:dure),doneAction:2
		,timeScale:timeSca);


	e=	EnvGen.kr(
       Env(
			//[0, 1, 0, 0.2, 0, 0.5, 0.8, 0],
		levels:[0,3000,100     , 100    ,100,3000,3000 ,   3000,100     , 100    ,100,3000,3000],

			times: [0,0.1936,0.1936,0.0968,0.0968,0,0,0.0968,0.04840,0.04840,0.04840,0,0
			//	times: [0, 1/8,1/8   ,1/16  ,1/16  ,0,0,1/16,1/32,1/32,1/32,0,0

			],
			curve:[0,0,3,-3,0,3,-3,0,3,-3,0,3,-3,0,3,-3],
			//curve: -3
			//LFNoise1.kr(1/4).range(-3,3)
			releaseNode:5,loopNode:1
        ),

		gate: Trig.kr( 1,dur:dure),doneAction:2,timeScale:SinOsc.kr(1.2875).range(0.25,2));


  amp1 = EnvGen.kr(Env([0,0,0,1     ,1,0     ,0,0     ,0,0],
		          [0,0,0,0.3872,0,0.7744],releaseNode:7,loopNode:1),
	gate: Trig.kr( 1,dur:dure),doneAction:2);


	amp2 = EnvGen.kr(Env([0,0,0,0     ,0,1     ,1,0   ,0  ,1,1,0,0,1],
		          [0,0,0,0.3872,0,0.3872,0,0.7744,0,0.3872,0,0.3872,0],releaseNode:12,loopNode:1),
	gate: Trig.kr( 1,dur:dure),doneAction:2);

	amp3 = EnvGen.kr(Env([0,0,0,0     ,0,1     ,1,0     ,0,0],
		          [0,0,0,0.7744,0,0.3872],releaseNode:7,loopNode:1),
	gate: Trig.kr( 1,dur:dure),doneAction:2);

	env2 = EnvGen.kr(Env([0,1,1   ,1,0     ,0   ,1     ,1   ,0 ,0],
		          [0,0,1/32,0,1/32,0,1/32,0     ,1/32,0 ,1/32],releaseNode:6 ,loopNode:1),
	gate: Trig.kr( 1,dur:dure),timeScale:timeSca2,doneAction:2);







// good one	mod2 = SinOsc.ar(freq/10, mul:MouseX.kr(1,freq/10 * iEnv));

	//mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);

	//mod2 = SinOsc.ar(MouseX.kr(freq/10,0.0201171875), mul:freq/10 * iEnv);

	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);


	// same good one     mod = SinOsc.ar(freq * mRatio + mod2 , mul:MouseX.kr( 1,freq * mRatio * iEnv));




	//GOOD LAST                                                                                HERE
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

	modE = SinOsc.ar(freq * mRatio + mod2*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;


	//extraMod    0.01005859375

/*
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(0.01005859375).range(-10.4,10.4), mul:freq * mRatio *iEnv);
*/

	// the secret *SinOsc.kr(0.01005859375).range(-10.4,10.4)




	//good good
                                                                               // HERE   filRte
	car = Osc.ar(0,   0.00502929687 * cRatio + SelectX.ar(whichMod,[ mod,modE]) + pitch  );









//1.3


	//car = SinOsc.ar(freq * cRatio + mod) * amp;






	sig = Shaper.ar(~tfBuf,car);

	sig  = LeakDC.ar(sig);



	//lp = LPF.ar(sig ,SinOsc.ar(filRte ).range(82.41,22000));//82.41     //Varlag ?

	lp = BLowPass4.ar(sig ,SinOsc.ar(filRte ).range(82.41,22000),6);//82.41     //Varlag ?


	lp2 = BLowPass4.ar(sig, (SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)), rq: 0.3);//MouseX.kr(0,7.72500)

	bp = BPF.ar(lp2,(SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)),1);

	hp = BHiPass4.ar(sig, e, 0.3);

//slcFil
	sig = HPF.ar(SelectX.ar(which, [lp, bp,hp,sig]),100) ;//* env* amp;




	a1 = sig * amp1;
	a2 = sig * amp2;
	a3 = sig* amp3;

	b1 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env;
	b2 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env2;
	//b3 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env3;
	//b4 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env4;




	//tttaaataaaa env env !!! make another row to leave open for options and formula variery


	sig = Pan2.ar(SelectX.ar(whichEnv, [SelectX.ar(whichAmp, [a1, a2,a3, sig]),b1,b2 ]), pan)* amp;


	Out.ar(0, sig);
}).add;
)

FreqScope.new
s.plotTree

{ RLPF.ar(Saw.ar([100,250],0.05), XLine.kr(400,8000,5), 0.05) }.play;


Synth(\lead, [\freq, 76.midicps]);
(

Pdef(\b,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 4, \dure,4/1,\amp,0.3,\which,2,\whichMod,1));
Pdef(\c,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 76.midicps, \dure,4/1,\amp,0.07,\which,0,\whichMod,0));
Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,4/1,\amp,0.07,\which,1,\whichMod,1));
)
~song = Pseq([ Pdef(\c),Pdef(\b),Pdef(\a)],inf).play(t);
~song.stop


Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,4/1,\amp,0.07,\which,1,\whichMod,1,\whichAmp,3)).play;

(

Pdef(\b,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 4, \dure,(8/1-1.70),\amp,0.003,\which,2,\whichMod,1,\whichAmp,0));
Pdef(\c,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 76.midicps, \dure,(8/1-1.70),\amp,0.002,\which,0,\whichMod,0,\whichAmp,1));
Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,(8/1-1.70),\amp,0.003,\which,1,\whichMod,1,\whichAmp,2));
//Pdef(\e,Pbind(\instrument,\lead, \dur,Pseq([16/1],inf ),\freq, rrand(0,88.midicps), \dure,16/1,\amp,0.07,\which,1,\whichMod,1,\whichAmp,2));
Pdef(\aR,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,(8/1-1.70),\amp,0.003,\which,1,\whichMod,1,\whichAmp,2,\sineRangeLow,(-10.4),\sineRate,0.0201171875,\phRise,(15)));
Pdef(\bR,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 4, \dure,(8/1-1.70),\amp,0.003,\which,2,\whichMod,1,\whichAmp,0,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(15)));
Pdef(\cD,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 76.midicps, \dure,(8/1-1.70),\amp,0.002,\which,0,\whichMod,0,\whichAmp,1,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0)));

Pdef(\w,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps, \dure,(8/1-1.7),\amp,0.002,\which,3,\whichMod,0,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(15)));


Pdef(\cD2,Pbind(\instrument,\lead, \dur,Pseq([15/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*15),\amp,0.002,\which,3,\whichMod,0,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0)));
Pdef(\cD3,Pbind(\instrument,\lead, \dur,Pseq([1/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*1),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0)));
)
(15/1)-8.70
//,\type, Pseq([\rest, \note, \note, \note], inf)

~seq = Ppar([Pdef(\c),Pdef(\b),Pdef(\a),~barwithBre],1);
~seqRising = Ppar([~barwithBre, Pdef(\w)],1);
~bar16  = Pseq([~bassAndKick],16);
~bar15 = Ppar([~bassPat, ~kickPat], 15);
~bar8 = Ppar([~bassPat, ~kickPat], 8);
~kbassRest = Ppar([~kickPat, ~bassRest], 1);
~half16  = Pseq([Ppar([Pseq([~bassAndKick],8),Pdef(\d8),Pdef(\e8),Pdef(\sn8)],1),Pseq([~bassRest],8)],1);
~barwithBre= Pseq([~bar15, ~bassRest], 1).play(t);//HERE
~ens = Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar16],1);//must include percu
~ens2 = Pseq([Ppar([Pdef(\e),Pdef(\d),Pdef(\sn),~bar15],1),~bassRest],1);//must include percu
~seqPartRising =  Ppar([~ens, Pdef(\aR),Pdef(\bR),Pdef(\cD)],1);
~ens15Perc = Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),~kbassRest],1);
~broken  = Pseq([Pdef(\cD2),Pdef(\cD3)],1);
~bwww = Ppar([~ens, ~broken], 1);

~ens.play(t)


//play with ticmescal
Pdef(\cD4,Pbind(\instrument,\lead, \dur,Pseq([1/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*1),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,2));
Pdef(\cD5,Pbind(\instrument,\lead, \dur,Pseq([1/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*1),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,1));
Pdef(\cD6,Pbind(\instrument,\lead, \dur,Pseq([1/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*1),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,4));
Pdef(\cD6b,Pbind(\instrument,\lead, \dur,Pseq([1/1],1 ),\freq, 76.midicps, \dure,(60/151.703592*1),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,8));
Pdef(\cD7,Pbind(\instrument,\lead, \dur,Pseq([1/2],1 ),\freq, 76.midicps, \dure,(60/151.703592*1/2),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,1));
Pdef(\cD8,Pbind(\instrument,\lead, \dur,Pseq([1/2],1 ),\freq, 76.midicps, \dure,(60/151.703592*1/2),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,2));
Pdef(\cD8b,Pbind(\instrument,\lead, \dur,Pseq([1/2],1 ),\freq, 76.midicps, \dure,(60/151.703592*1/2),\amp,0.002,\which,3,\whichMod,0,\whichEnv,2,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0),\timeSca2,4));

~broken2  = Pseq([Pdef(\cD4),Pdef(\cD5),Pdef(\cD6b),Pdef(\cD7),Pdef(\cD8),Pdef(\cD4),Pdef(\cD5),Pdef(\cD6),Pdef(\cD7),Pdef(\cD8),
Pdef(\cD4),Pdef(\cD5),Pdef(\cD6b),Pdef(\cD7),Pdef(\cD8),Pdef(\cD4),Pdef(\cD5),Pdef(\cD6),Pdef(\cD7),Pdef(\cD8b)],1);
~bwww2= Ppar([~ens15Perc, ~broken2], 1).play(t);

~bwww3= Pseq([~bwww, ~bwww2], 1);

//~seqPartRising.play(t)


s.plotTree


~seqRising.play(t)
;

~show = Pseq([~seq,~seqRising, ~seq,~seqPartRising],inf).play(t);


	//\sineRate,0.01005859375,
		//\sineRangeLow, [-10.4,10.4]        (16/1-3.476)   phase - 5 is nice   1.738
Pdef(\w,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps, \dure,(8/1-1.7),\amp,0.002,\which,3,\whichMod,0,\whichAmp,3,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(15)));


(
Pdef(\aR,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,(8/1-1.70),\amp,0.003,\which,1,\whichMod,1,\whichAmp,2,\sineRangeLow,(-10.4),\sineRate,0.0201171875,\phRise,(15)));
Pdef(\bR,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 4, \dure,(8/1-1.70),\amp,0.003,\which,2,\whichMod,1,\whichAmp,0,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(15)));
Pdef(\cD,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, 76.midicps, \dure,(8/1-1.70),\amp,0.003,\which,0,\whichMod,0,\whichAmp,1,\sineRangeLow, (-10.4),\sineRate,0.01005859375,\phRise,(0)));
)




Pdef(\aR,Pbind(\instrument,\lead, \dur,Pseq([8/1],1 ),\freq, rrand(0,88.midicps), \dure,(8/1-1.70),\amp,0.07,\which,1,\whichMod,1,\whichAmp,2,\sineRangeLow,(-10.4),\sineRate,0.01005859375,\phRise,(15))).play();






~seq = Ppar([Pdef(\c),Pdef(\b),Pdef(\a),~infPlayer],1).play(t);


//testing
Pdef(\t4,Pbind(\instrument,\lead, \dur,Pseq([8/1],inf ),\freq, 4, \dure,(8/1-1.70),\amp,0.1,\which,2,\whichMod,1,\whichAmp,1)).play(t);

s.options.memSize = 1048576;

s.reboot;


//now ~seqRising


~seq.stop;




Synth(\lead, [\freq, 76.midicps, \sRteLPF,  0.65  ]);//good   0.0201171875       0.08046875   0.040234375      0.321875 0.1609375

// 0.0201171875
s.defaultGroup.deepFree;

s.plotTree









Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps,\dure,8/1,\amp,0.07,\which,0));//0.5
Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, (76.midicps), \dure,8/1,\amp,0.07,\which,1));//1
Pdef(\b,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, (76.midicps), \dure,8/1,\amp,0.07,\which,2));
//Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 88.midicps, \dure,8/1));//1

~song = Pseq([  Pdef(\y),Pdef(\a),Pdef(\b)],inf).play(t);
~song.stop








Synth(\fm2, [\freq, 76.midicps,  \iScale, 10.5,\index, 2]);//??

Synth(\fm2, [\freq, 76.midicps,  \iScale, 10.5,\index, 2,\mRatio, 4]);//??

Synth(\fm2, [\freq, 52.midicps,  \iScale, 2,\index, 66,\mRatio, 0.2]);//??thisone

Synth(\fm2, [\freq, 52.midicps,  \iScale, 8,\index, 60,\mRatio,0.2]);//??




Synth(\fm2,[\freq, 76.midicps, \iScale, 5]);



Synth(\fm2,[\freq, 76.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 0.5]);



s.defaultGroup.deepFree;




