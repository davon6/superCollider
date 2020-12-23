s.boot;s.scope;
s.reboot;
s.quit

Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");


{SinOsc.ar(164.81)}.play;

Buffer.freeAll

~wt1 = Signal.sineFill(
	2048,
	[1]
);


s.defaultGroup.deepFree;

Signal.chebyFill(2048, [1]).play;


~b0 = Buffer.loadCollection(s, ~wt1);

c = Buffer.alloc(s, 2048);


c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


Buffer.freeAll;


{Osc.ar(2  ,164.81);}.play


{VOsc.ar(0.,164.81)!2;}.play

/* revelation !!*/

{SinOsc.ar(500 + SinOsc.ar(2000, mul:400)) * 0.2!2}.play;




(
SynthDef(\fm2, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.2, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875,  short = 0.3872,mid=0.7744;
	var car, mod, env, iEnv, mod2, sig, bufpos, envVoice;
	iEnv = EnvGen.kr(


		Env.new(
			[index, index * iScale, index * iScale],
			[atk,          50,      10 ],
			[cAtk, cRel]
		)
/*
		Env.new(
	[1.2875,2.575,0],
	[1,3.0976,0],
	[2,-2]
	)//.plot






		Env.new(
	[0,2.575,0],
	[0.321875,3.0976,0],
	[2,0]
	)
*/

		/*

		Env.new(
	[0,2.575,5.15],
	[0.2,3.0976,12],
	[2,0]
	)


		*/





/*

		Env.new(
	[1.2875,2.575,2.575],
	[1,3.0976,3,60],
	[2,-2]
	)

*/


	);


	env = EnvGen.kr(


		//Env.perc(atk,rel, curve:[cAtk,cRel]),
		//doneAction:2


	Env.new(
	[1,1,1,1],
	[2.5,2.5,10,3],
	[0,0,0,0]
	)//.plot


	);




	envVoice = EnvGen.kr(


/* ALIGNED*/




Env.new(
	[1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
    1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,

		1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
    1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
		1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
    1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,

		1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
    1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0.64375, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375 ,
	1.2875 ,1.2875 ,  0.64375,  0.64375  , 1.2875 ,1.2875 ,  0.64375,   0, 0 ,0 ,  1.2875,1.2875 , 0 ,0 ,  0.64375   ,   0.64375






	],

	[short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3s
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
	short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0    ,
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3s
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
	short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0   ,
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3s
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
	short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0    ,
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3s
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
		short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0     ,//3
	short  ,0      ,short    , 0         , short  ,0      ,mid      , 0, short,0     ,short    , 0     , short ,0     ,short  , 0




	],


	[0     ,0     ,     0,0   ,    0     ,   0 ,0      ,0     ,     0 ,0     ,    0,   0 ,     0,0]
	)




	);





// good one	mod2 = SinOsc.ar(freq/10, mul:MouseX.kr(1,freq/10 * iEnv));

	//mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);

mod2 = SinOsc.ar(MouseX.kr(freq/10,0.0201171875), mul:freq/10 * iEnv);

	// same good one     mod = SinOsc.ar(freq * mRatio + mod2 , mul:MouseX.kr( 1,freq * mRatio * iEnv));




	//GOOD LAST
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875), mul:freq * mRatio * iEnv);


/*
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(0.01005859375).range(-10.4,10.4), mul:freq * mRatio * iEnv);
*/

	// the secret *SinOsc.kr(0.01005859375).range(-10.4,10.4)

//MouseX.kr(100, 10000, 1)
	//VERY GOOD


	//car = SinOsc.ar(freq * cRatio + mod) * env * amp;



	//car = Osc.ar(c, SinOsc.ar(MouseX.kr(100, 10000, 1)));

	//car = VOsc.ar(SinOsc.kr(0.0201171875).exprange(0.00001,0.99999),   MouseX.kr(100, 10000, 1)    )*  LFNoise1.kr(0.08046875) ;






	//good good
	car = Osc.ar(0,   0.00502929687 * cRatio + mod   );






//	car = BPF.ar(Osc.ar(0,   0.00502929687 * cRatio + mod   ),MouseY.kr(10.3,10548.08),4);

	// low oscillation attempt// +SinOsc.kr(0.6).range(-10,10)



//car = VOsc.ar(0,   freq * cRatio + mod   );





	//car = VOsc.ar(0,   freq * cRatio + mod   )* Line.kr(0,8,3)* amp ;// LFNoise1.kr(0.0201171875)



	//car =VOsc.ar(SinOsc.kr(rateSound).exprange(0.00001,0.99999),   freq * cRatio + mod);








	// working  ot close or not reaaly car = VOsc.ar(0+ SinOsc.kr(1.2875 ).exprange(0.8,1.9999999),  freq * cRatio + mod)* Line.kr(1,23,100);//SinOsc.kr(1).range(1,44);





	//car = BPF.ar(VOsc.ar(0+ SinOsc.kr(0.08046875 ).exprange(0.8,0.9999999),  freq * cRatio + mod)* Line.kr(1,23,100),MouseY.kr(20.6,5274.04),2);




//car =VOsc.ar(SinOsc.kr(rateSound).exprange(0.00001,0.99999),   MouseX.kr(100, 10000, 1));


	//car = Osc.ar(0,   freq * cRatio + mod   )* Line.kr(0,8,3)* amp ;// LFNoise1.kr(0.0201171875)




	//SinOsc.kr(rateSound)

//.exprange(0.000001,0.999999)
sig  = LeakDC.ar(car);


	//car = Shaper.ar(~tfBuf, SinOsc.ar(freq * cRatio + mod) * env * amp);


		sig = Shaper.ar(~tfBuf,sig);



	sig = Pan2.ar(sig, pan);


	Out.ar(0, sig*0.07);
}).add;
)

Synth(\fm2, [\freq, 76.midicps, \rateSound, 0.0201171875   ]);//good   0.0201171875       0.08046875   0.040234375      0.321875 0.1609375


s.defaultGroup.deepFree;



Synth(\fm2, [\freq, 76.midicps,  \iScale, 10.5,\index, 2]);//??

Synth(\fm2, [\freq, 76.midicps,  \iScale, 10.5,\index, 2,\mRatio, 4]);//??

Synth(\fm2, [\freq, 52.midicps,  \iScale, 2,\index, 66,\mRatio, 0.2]);//??thisone

Synth(\fm2, [\freq, 52.midicps,  \iScale, 8,\index, 60,\mRatio,0.2]);//??




Synth(\fm2,[\freq, 76.midicps, \iScale, 5]);



Synth(\fm2,[\freq, 76.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 0.5]);



s.defaultGroup.deepFree;






(~sound = {





arg freq= 	659.26, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.2, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(


		Env.new(
			[index, index * iScale, index * iScale],
			[atk,          50,      10 ],
			[cAtk, cRel]
		)

	/*		Env.new(
	[0,3,3,1],
	[1,2.5,10,3],
	[0,0,0,0]
	)

*/

	);


	env = EnvGen.kr(


		//Env.perc(atk,rel, curve:[cAtk,cRel]),
		//doneAction:2


	Env.new(
	[1,1,1,1],
	[2.5,2.5,10,3],
	[0,0,0,0]
	)//.plot


	);








	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);


	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);


})


~wt = ~sound.asWavetable;

s.defaultGroup.deepFree;


