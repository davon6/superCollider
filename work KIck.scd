SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.001,0.008,0.1,0,0.01],
				\exp
			)
		);

		env =EnvGen.ar(
	Env([1 , 0.4, 1,    1,1,0],
		[0.008, 0.08, 0,0.006,0.01],[0,-30,5,5,-5]),doneAction:2);
	//EnvGen.ar(Env.perc(0, 0.40),doneAction:2);


		sig =
		//BPeakEQ.ar(
		// BPeakEQ.ar(
		//BPeakEQ.ar(
			SinOsc.ar(envF, mul: env);
			// ,41.2, 4,4)
//,1318.51,4, (-8));
		//,659.255,16, (-4));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;
(Synth(\kick);

Synth(\percussion,[\rel,0.04840,\rel2,0.02420,\amp, -1.2, \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000), \mulMod, rrand(100, 500), \carHz, exprand(20,10000), \modAmp, 0.82875 ]);)

Pbind(\instrument,\percussion,\dur,Pseq([1/1], 1),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -17.2),( -16.2),( -18.2),( -17.2),( -17),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,0).play

({EnvGen.ar(
	Env([1 , 0.4, 1,    1,1,0],
		[0.008, 0.08, 0,0.006,0.03],[0,-30,5,5,-5]))}.plot(duration:0.5))



({EnvGen.ar(
	Env([1 , 0.4, 0.4, 0.3,    0.3,0],
		[0.008, 0.001, 0.006, 0,0.10],[-2,5,5,5,5]))}.plot(duration:0.5))




({EnvGen.ar(
			Env(
				[1728,1539.47,165,26,0,0],
				[0.001,0.008,0.1,0,0.1],
				\exp
			)
		)}.plot(duration:2))


~hat2 =Pbind(\instrument, \percussion,\rel,0.04840,\rel2,0.02420,\amp, -23.2, \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000), \mulMod, rrand(100, 500), \carHz, exprand(20,10000), \modAmp, 0.82875,\dur,Pseq([1/1],1) );

Ppar([~bassShap, Ppar([Pbindf(~kick,\amp,(-11)),~bass,~hat2],inf)],1).play(t)

