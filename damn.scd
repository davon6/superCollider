s.boot;
s.scope;


//to run first
(
~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
~tf = ~tf.asWavetableNoWrap;
)


~tfBuf = Buffer.loadCollection(s, ~tf);

c = Buffer.alloc(s, 2048);




(
~tf = Env([-1,1],[1],[0]).asSignal(1025);
~tf = ~tf + (
	Signal.sineFill(
		1025,
		//(0!3) ++ [0,0,0,1,1,1].scramble,

[1, 1/4, 1/6, 1/2],
		{rrand(0,2pi)}!16
	) / 4
);
~tf = ~tf.normalize;
//~tf.plot;
~tfBuf.loadCollection(~tf.asWavetableNoWrap);
)



~tfBuf.plot


~tf.size;

({
	var sig, input;
	input = LFSaw.ar(250) * LFNoise1.kr(0.5).range(0.1,1);
	sig = Shaper.ar(~tfBuf, input);
	sig = sig * 0.3!2;
}.play;
)



(
SynthDef(\fm2, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.2, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0;
	var car, mod, env, iEnv, mod2, sig, input;
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

/*
	TO NOT USE
	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);
	*/




	car = SinOsc.ar(freq * cRatio + mod) * Line.kr(0,4,30);//LFNoise1.kr(0.5).range(0.1,1);
	sig = Shaper.ar(~tfBuf, car);


/*MAKE c a wavtable or take it from there*/
 /*	c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


	 mod = SinOsc.kr(MouseX.kr(100, 10000, 1),0.5);


	sig = Shaper.ar(~tfBuf,mod , mul:0.2);*/





//inspo to not use/ sig = Osc.ar(c,mod , mul:0.2);




sig = sig * 0.3!2;

	Out.ar(0, sig);
}).add;
)

({
	var sig, input,mod ;


		c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


	mod = SinOsc.kr(0.040234375,0.5, add:MouseX.kr(100, 10000, 1));


	sig = Shaper.ar(~tfBuf, Osc.ar(c, LFSaw.ar(mod) * LFNoise1.kr(0.5).range(0.1,1)););



	sig = sig * 1!2;
}.play;
)


// mod = SinOsc.kr(0.040234375,0.5, add:MouseX.kr(100, 10000, 1));


//{Osc.ar(c,  SinOsc.ar(125,add: LFNoise0.ar(25, 1400, 450)), mul:0.2!2)}.play;//working

Synth(\fm2, [\freq, 76.midicps]);//good


s.defaultGroup.deepFree;
s.freeAll;
Buffer.freeAll;

