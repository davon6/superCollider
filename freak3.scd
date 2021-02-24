(
SynthDef(\lead, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.01, atk= 0.01  , rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875,  short = 0.3872,mid=0.7744,atkE =0,decE=0.1936, subsE=0, relE=0, sineRate = 0.0000000095262251, sineRangeHigh = 0, sineRangeLow=0, gate = 1, pitch = 0, sRteLPF = 1.3, timeSca= 0.25, dure= 1/1, which = 1, whichMod = 1, whichAmp =0,phRise= 0 , whichEnv = 0,timeSca2 =1, in=0, dec=0.645, mix=0.04, lpf1=2000, lpf2= 6000, predel=0.075,out=0,ftime1= 0, ftime2 =1.5488, ftime3 =1.5488,relNode =6, phLF =0,phLF2 =0,rteLF=1.2875, eFreq =0;


	var car, mod,modE,modE2, env, env2, env3, env4, iEnv, mod2, sig, bufpos, envVoice, filRte,lp,bp,hp,lp2,amp1,amp2,amp3, a1,a2,a3, b1, b2, b3,b4,dry, wet;
//dec=3.5        predel=0.025    mix=0.08
	//1.5488
	//2.575
	//1.2875
	//5.15


	env3 = EnvGen.kr(Env([0,1,1,0],[atkE,decE, 50,relE],-3),
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
	modE2 = SinOsc.ar(Lag.ar(  freq * mRatio + mod2 ,0.6)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;




	//extraMod    0.01005859375

/*
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(0.01005859375).range(-10.4,10.4), mul:freq * mRatio *iEnv);
*/

	// the secret *SinOsc.kr(0.01005859375).range(-10.4,10.4)




	//good good
                                                                               // HERE   filRte
	car = Osc.ar(0,   0.00502929687 +eFreq +MouseY.kr(0,1700)* cRatio + SelectX.ar(whichMod,[ mod,modE,modE2]) + pitch );




//	car = Saw.ar( 0.00502929687 +eFreq + freq+MouseY.kr(0,82.41)* cRatio + pitch );




//1.3


	//car = SinOsc.ar(freq * cRatio + mod) * amp;






	sig = Shaper.ar(~tfBuf,car);

	sig  = LeakDC.ar(sig);



	//lp = LPF.ar(sig ,SinOsc.ar(filRte ).range(82.41,22000));//82.41     //Varlag ?

	lp = BLowPass4.ar(sig ,SinOsc.ar(filRte,phLF ).range(82.41,22000),6);//82.41     //Varlag ?


	lp2 = BLowPass4.ar(sig, (SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)), rq: 0.3);//MouseX.kr(0,7.72500)

	//bp = BPF.ar(lp2,(SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)),0.1);


	bp = BPF.ar(sig,(SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)),0.1);

	hp = BHiPass4.ar(sig, e, 0.3);

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
)
