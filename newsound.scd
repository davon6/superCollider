(
SynthDef(\sound, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.01, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875,  short = 0.3872,mid=0.7744,atkE =0.3872,decE=0.1936, subsE=0, relE=0, sineRate = 0.0000000095262251, sineRangeHigh = 0, sineRangeLow=0, gate = 1, pitch = 0, sRteLPF = 1.3, timeSca= 0.25, dure= 1/1;
	var car, mod, env, iEnv, mod2, sig, bufpos, envVoice, filRte;

	//1.5488
	//2.575
	//1.2875
	//5.15
	filRte =
EnvGen.kr(Env.new(
		[0, 1.2875 ,1.2875 ,10.3   ,10.3   , 1.2875,1.2875,10.3,10.3],
		[0,1.5488 ,0     ,1.5488  ,0       ,    1.5488,0,1.5488  ,0,1.5488  ,0,1.5488,0],
		releaseNode:5,loopNode:1,offset:(-1.5488 ) //(1/16)//  here!!!




	),gate: Trig.kr( 1,dur:dure),doneAction:2
	);



	iEnv = EnvGen.kr(


			Env.new(
			[1, 1 * 5, 1 * 5],
			[0.000000000001,        (dure -1.6   ),      0.0000000001],	//[atk,          450,      10 ],   was 0.01
			[4, (-4)]
		),doneAction:2
);//- 1.604003    here!!!




                             //HERE 1.2875
	b = SinOsc.kr(	LFNoise1.kr(2.575).range(0.3,1.0)).range(0,1.0);


 c = SinOsc.kr(	LFNoise0.kr(0.64375).range(0.01,0.3872)).range(0,1.0);


	env =EnvGen.kr(
        Env(
		levels:[0,1, 1 ,b,0,0               ],
			times: [0,(0+c),(0.3872-c),0,0,0             ],
            curve: 0,releaseNode:4,loopNode:1
        ),
/*dury /4 coz of timescale*/
		gate: Trig.kr( 1,dur:dure),doneAction:2
		,timeScale:timeSca);


	mod2 = SinOsc.ar(MouseX.kr(freq/10,0.0201171875), mul:freq/10 * iEnv);

	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(sineRate).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

                                                                                // HERE   filRte
	car = LPF.ar(Osc.ar(0,   0.00502929687 * cRatio + mod + pitch  )* amp,SinOsc.ar(filRte ).range(82.41,22000));

	sig = Shaper.ar(~tfBuf,sig);

	sig  = LeakDC.ar(car);

	sig = HPF.ar(sig,100)* env;



	sig = Pan2.ar(sig, pan);


	Out.ar(0, sig);
}).add;
)



Pdef(\y,Pbind(\instrument,\sound, \dur,Pseq([16/1],1 ),\freq, 76.midicps,\dure,8/1,\amp,0.03)).play;
