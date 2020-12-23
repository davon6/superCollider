(
s.meter;
s.boot;
//s.plotTree;
//.freqscope;
s.scope;
)


{SinOsc.ar(500 + SinOsc.ar(2000, mul:400)) * 0.2!2}.play;



//self tuned fm
(
SynthDef(\fm, {
	arg freq= 500, mRatio=1, cRatio=1, modAmp=200, amp=0.2, atk= 0.01, rel=3, pan =0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk,rel),doneAction:2);
	mod = SinOsc.ar(freq * mRatio, mul:modAmp);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm,[\freq, 64.midicps, \cRatio, 2]).freqscope;





(
SynthDef(\fm2, {
	arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.2, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(


		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)



	);


	env = EnvGen.kr(
		Env.perc(atk,rel, curve:[cAtk,cRel]),
		doneAction:2);



	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);


	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);


	Out.ar(0, car);
}).add;
)

Synth(\fm2, [\index,1,\freq, 76.midicps]);


Synth(\fm2, [\rel, 3,\freq, 76.midicps]);





Synth(\fm2,[\freq, 76.midicps, \rel, 4, \index, 20, \iScale, 0.05, \mRatio, 0.5]);












