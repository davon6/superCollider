SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,114,26,0,0],
				[0.00188,0.008,0.132,0,0.4],
					[-3,-6,-2]
			)
		);

		env =EnvGen.ar(
	Env([0.8 , 0.2, 0.4,    0.4,0.4,0],
		[0.0087, 0.01, 0,0.1,0.02],[-6,-20,5,5,-1]),doneAction:2);



		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;



//previsou

SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.00188,0.008,0.08,0,0.2],
					[-3,-6,-2]
			)
		);

		env =EnvGen.ar(
	Env([0.8 , 0.4, 0.6,    0.6,0.6,0],
		[0.0087, 0.08, 0,0.6,0.22],[-12.2,-50,5,5,-5]),doneAction:2);



		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;
