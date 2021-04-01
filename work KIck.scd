SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[1728,1539.47,165,26,0,0],
				[0.001,0.08,0.1,0,0.1],
				\exp
			)
		);

		env =EnvGen.ar(
	Env([1 , 0.3, 0.4, 1,    1,0],
		[0.1, 0.001, 0.006, 0,0.10],[0,5,5,5,5]),doneAction:2);
	//EnvGen.ar(Env.perc(0, 0.40),doneAction:2);


		sig =
		BPeakEQ.ar(
		// BPeakEQ.ar(
		//BPeakEQ.ar(
			SinOsc.ar(envF, mul: env)
			// ,41.2, 4,4)
,1318.51,4, (-8));
		//,659.255,16, (-4));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;




({EnvGen.ar(
	Env([1 , 0.3, 0.4, 1,    1,0],
		[0.1, 0.001, 0.006, 0,0.10],[-2,5,5,5,5]))}.plot(duration:0.5))



({EnvGen.ar(
	Env([1 , 0.4, 0.4, 0.3,    0.3,0],
		[0.008, 0.001, 0.006, 0,0.10],[-2,5,5,5,5]))}.plot(duration:0.5))




({EnvGen.ar(
			Env(
				[1728,1539.47,165,26,0,0],
				[0.001,0.08,0.1,0,0.1],
				\exp
			)
		)}.plot(duration:2))



