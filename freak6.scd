s.options.memSize = 1048576;



(
s.waitForBoot({


		var numSegs;

	"init buff".postln;


	t = TempoClock.new(151.703592/60).permanent_(true);

	~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);


	s.sync;



	//numSegs= rrand(4,20);
	numSegs= rrand(1,4);


	~tf = Env(
		(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20)}!numSegs,
		{rrand(-20,20)}!numSegs
	).asSignal(1025);



	~tf = ~tf + (
		Signal.sineFill(
			1025,
			//(0!3) ++ [0,0,0,1,1,1].scramble,

			[1, 1/4, 1/6, 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);


	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);





SynthDef(\lead, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.01, atk= 0.01  , rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875,  short = 0.3872,mid=0.7744,atkE =0,decE=0.1936, subsE=50, relE=0, sineRate = 0.0000000095262251, sineRangeHigh = 0, sineRangeLow=0, gate = 1, pitch = 0, sRteLPF = 1.3, timeSca= 0.25, dure= 1/1, which = 1, whichMod = 1, whichAmp =0,phRise= 0 , whichEnv = 0,timeSca2 =1, in=0, dec=0.645, mix=0.04, lpf1=2000, lpf2= 6000, predel=0.075,out=0,ftime1= 0, ftime2 =1.5488, ftime3 =1.5488,relNode =6, phLF =0,phLF2 =0,rteLF=1.2875, eFreq =0 , phFm=8,decEC=0,filF=200, bus = 0,bus2 =0,bus3 =0;


	var car, mod,modE,modE2, env, env2, env3, env4, iEnv, mod2, sig, bufpos, envVoice, filRte,lp,bp,hp,lp2,amp1,amp2,amp3, a1,a2,a3, b1, b2, b3,b4,dry, wet;
//dec=3.5        predel=0.025    mix=0.08
	//1.5488
	//2.575
	//1.2875
	//5.15

//dont forget 2nd zero used to be 1
	env3 = EnvGen.kr(Env([0,1,0,0],[atkE,decE, subsE,relE],[-2,-3,0,0]),
	//	gate: Trig.kr( 1,dur:dure),timeScale:timeSca2,
		doneAction:2);

	filRte =
EnvGen.kr(Env.new(
		[0     , rteLF,rteLF     ,10.3    ,10.3  , rteLF,rteLF,10.3,10.3],
		[ftime1,ftime2 ,ftime1     ,ftime3  ,ftime1, ftime2,0     ,ftime3  ,ftime1,ftime2  ,ftime1,ftime2,ftime1],
		releaseNode:5,loopNode:1,offset:(1/16)//-1.5488 ) //(1/16)//  here!!!





	),gate: Trig.kr( 1,dur:dure),doneAction:2
	);



	iEnv = EnvGen.kr(


			Env.new(
			[1, 1 * 5, 1 * 5],
			[0.000000000001,        (dure  ),      0.0000000001],	//[atk was  0.01,          450,      10 ],   was 0.01   -1.6   -0.8
			[4, (-4)]
		),doneAction:2
);//- 1.604003    here!!!




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





		env2 = EnvGen.kr(Env([0,1,1   ,1,0     ,0   ,1     ,1   ,0 ,0],
		          [0,0,1/32,0,1/32,0,1/32,0     ,1/32,0 ,1/32],releaseNode:relNode ,loopNode:1),
	gate: Trig.kr( 1,dur:dure),timeScale:timeSca2,doneAction:2);






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







// good one	mod2 = SinOsc.ar(freq/10, mul:MouseX.kr(1,freq/10 * iEnv));

	//mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);

	//mod2 = SinOsc.ar(MouseX.kr(freq/10,0.0201171875), mul:freq/10 * iEnv);

	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);


	// same good one     mod = SinOsc.ar(freq * mRatio + mod2 , mul:MouseX.kr( 1,freq * mRatio * iEnv));



	//GOOD LAST                                                                                HERE
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

	modE = SinOsc.ar(freq * mRatio + mod2*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

	/*modE2 = SinOsc.ar( LFTri.ar(1).range(SinOsc.ar(0.000001).range( freq * mRatio + mod2,0.0201171875),0.0201171875)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

		modE2 = SinOsc.ar(VarLag.ar(LFNoise0.kr(0.0000000003).range( freq * mRatio + mod2,0.0201171875),0.000000001,-1,5)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;



	*/
//0.0201171875
	modE2 = SinOsc.ar(Lag.ar(  freq * mRatio + mod2 ,0.06)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;




	//extraMod    0.01005859375

/*
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(0.01005859375).range(-10.4,10.4), mul:freq * mRatio *iEnv);
*/

	// the secret *SinOsc.kr(0.01005859375).range(-10.4,10.4)




	//good good
                                                                               // HERE   filRte
	car =SinOsc.ar(  0.00502929687+eFreq * cRatio + SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),SelectX.ar(whichMod,[ mod,modE,modE2])]) + pitch );




//	car = Saw.ar( 0.00502929687 +eFreq + freq+MouseY.kr(0,82.41)* cRatio + pitch );




//1.3


	//car = SinOsc.ar(freq * cRatio + mod) * amp;






	sig = Shaper.ar(~tfBuf,car);

	sig  = LeakDC.ar(sig);



	//lp = LPF.ar(sig ,SinOsc.ar(filRte ).range(82.41,22000));//82.41     //Varlag ?

	lp = BLowPass4.ar(sig , /*In.kr(bus, 1)+*/In.kr(bus2, 1).poll+ In.kr(bus3, 1)   //LFNoise1.kr(2.575).range(0.2,20.3)

		,MouseY.kr(1,0.2,1));//82.41     //Varlag ?   0.4
//MouseX.kr(1800+ filF,100)

	lp2 = BLowPass4.ar(sig, (SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)), rq: 0.3);//MouseX.kr(0,7.72500)

	//bp = BPF.ar(lp2,(SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)),0.1);


	bp = BPF.ar(sig,(SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)),0.1);

	hp = BHiPass4.ar(sig, In.kr(bus, 1)+In.kr(bus2, 1)+ In.kr(bus3, 1)  ,MouseY.kr(1,0.4,0));
//MouseX.kr(100,5000+ filF)
//slcFil
	sig =SelectX.ar(which, [lp, bp,hp,sig]);//* env* amp;




	a1 = sig * amp1;
	a2 = sig * amp2;
	a3 = sig* amp3;

	b1 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env;
	b2 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env2;
	b3 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env3;
	//b4 =  SelectX.ar(whichAmp, [a1, a2,a3, sig]) * env4;





	//tttaaataaaa env env !!! make another row to leave open for options and formula variery


	sig = Pan2.ar( HPF.ar(SelectX.ar(whichEnv, [SelectX.ar(whichAmp, [a1, a2,a3, sig]),b1,b2,b3]),100) , pan)* amp;


	dry = sig;
	wet = sig;
	wet = DelayN.ar(wet, 0.5, predel.clip(0.0001,0.5));
	wet = 16.collect{
		var temp;
		temp = CombL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
		temp = LPF.ar(temp, lpf1);
	}.sum * 0.25;
	8.do{
		wet = AllpassL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
	};
	wet = LeakDC.ar(wet);
	wet = LPF.ar(wet, lpf2, 0.5);
	sig = dry.blend(wet,mix);








	Out.ar(0, sig);
}).add;



	"init lead".postln;

	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100;
		var sig, env;


		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel],
				[atkcrv,relcrv]
			),
			doneAction:2
		);
		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);
		sig = LPF.ar(sig, lpf);

		//sig = BLowPass4.ar(sig,MouseX.kr(1,5000, \exponential),5);

		sig = sig * amp!2;
		sig = sig * env;

		Out.ar(0, sig);
	}).add;

	SynthDef(\kick, {
		arg amp=0.2;
		var sig, env, envF;
		envF = EnvGen.ar(
			Env(
				[1700,1319,165,26,0,0],
				[0.001,0.028,0.1,0,0.4],
				\exp
			),doneAction:2
		);
"init KB".postln;
	/*

		//3322
		env = EnvGen.ar(Env(
			[0,1     ,0.16 ,0.95 ,0.93],
			[0,0.0135,0.005,0.02 ,0.0065],
			[0,-4    ,-3   ,1    ,4]

*/


			env = EnvGen.ar(
			Env.perc(0.0121, 0.40),doneAction:2

		);

/*
			[0,1     ,0.16 ,0.95 ,0.93],
			[0,0.0135,0.005,0.02 ,0.0065,0],
			[0,-4    ,-3   ,1    ,4]

		)//,doneAction:2
	);*/
		sig = SinOsc.ar(envF, mul: env);


		//sig = BLowPass4.ar(sig,MouseX.kr(1,5000, \exponential),5);

		sig = sig * amp!2;

		Out.ar(0, sig);
	}).add;

	s.sync;

	~bassPat = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.24,
	);

	~kickPat = Pbind(
		\instrument, \kick,
		\dur, Pseq([1],1),
		\amp, 0.028,
	);

	~bassAndKick = Ppar([~bassPat, ~kickPat], 1);



	s.sync;

~bassRest = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \rest, \rest, \rest], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.8,
	);

	SynthDef.new(\cymb, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel,1,-1.4), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -2), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.05;



	car2 = WhiteNoise.ar(modAmp) * env2 ;

	sig = HPF.ar(car+car2!2,3000)* [amp+0.00555,amp];

	Out.ar(0, sig);
}).add;





SynthDef.new(\percu2, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=0.3872, amp=0.2, pan=0,rel2= 1.1616;
	var car, mod, env, car2, mod2, mod3,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, 0.0484, 1, -1), doneAction:2);

	mod = SinOsc.ar(exprand(20,10000), mul:rrand(0, 10000).postln);
	car = SinOsc.ar(exprand(20,10000) + mod) * env * 0.05;



car2 = WhiteNoise.ar(0.12875) * env2 ;

	sig = HPF.ar(car+car2,3000)!2* [amp,amp+0.007];


	Out.ar(0, sig );
}).add;


SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=1, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;

	env = EnvGen.kr(Env.perc(0, rel,curve:-3), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0, 2, 1, -0 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0,HPF.ar( car+car2!2* amp ,500));
}).add;

"init percu".postln;

SynthDef.new(\hit, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * amp;
	car = HPF.ar(Pan2.ar(car, pan),100);
	Out.ar(0, car);
}).add;


SynthDef(\wNoise, {

	arg in=0, dec=1.5, mix=0.2, lpf1=2000, lpf2= 6000, predel=0.000003,out=0, maxdelaytime=0.000001, amp = 0.0042, sub =1,sub2 =3, valStart= 10000,valEnd =100, wFil=1;
	var env,dry, wet, sig,env2, ori;

	env = EnvGen.kr(Env([1,1,0],[0,sub,0]));

	env2 = EnvGen.kr(Env([1,1,0],[0,sub2,0]),doneAction:2);

	ori =  SelectX.ar(wFil,[LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3)),HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3))]);







	dry = ori;
	wet = ori;


	wet = DelayN.ar(wet, maxdelaytime, predel.clip(0.0001,0.5));
	wet = 16.collect{
		var temp;
		temp = CombL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
		temp = LPF.ar(temp, lpf1);
	}.sum * 0.25;
	8.do{
		wet = AllpassL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,04)}!2).exprange(0.02,0.999),
			dec
		);
	};
	wet = LeakDC.ar(wet);
	wet = LPF.ar(wet, lpf2, 0.5);
	sig = dry.blend(wet,mix);



	Out.ar(out,HPF.ar(sig,100)* env2 *amp

    )
}).add;
"init side events".postln;

	});
)
