SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.00188,0.0002,0.1,0,0.2],
					[-6,-6,-4]
			)
		);

		env =EnvGen.ar(
	Env([0.8 , 0.1, 0.6,    0.6,0.6,0],
		[0.0087, 0.08, 0,0.006,0.22],[-12.2,-50,5,5,-5]),doneAction:2);



		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;


({EnvGen.ar(
	Env([0.8 , 0.2, 0.6,    0.6,0.6,0],
		[0.008, 0.08, 0,0.006,0.22],[-6.2,-50,5,5,-5]))}.plot(duration:0.2))



({EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.008,0.008,0.1,0,0.2],
					[-4,-6,-4]
			)
		)}.plot(duration:0.2))

//this one

SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,/*1539.47,*/165,26,0,0],
				[0.001,/*0.0002,*/0.1,0,0.2],
					[-4,-6,-4]
			)
		);

		env =EnvGen.ar(
	Env([0.8 , 0.2, 0.6,    0.6,0.6,0],
		[0.008, 0.08, 0,0.006,0.22],[-6.2,-50,5,5,-5]),doneAction:2);



		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;
