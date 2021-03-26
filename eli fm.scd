(
SynthDef(\fm, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, atk=0.01, rel=3, pan=0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[index, index*iScale, index],
			[atk, rel],
			[ic_atk, ic_rel]
		)
	);
	env = EnvGen.kr(Env.perc(atk,rel),doneAction:2);
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);
	mod = SinOsc.ar(freq * mRatio + mod2, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

Synth(\fm,[\rel, 3,\mRatio,30,\cRatio,31, \iScale,60 ]);



Synth(\fm,[\rel, 3]);

