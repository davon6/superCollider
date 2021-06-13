

SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.024,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.51 ,   0.04  ,  0.8 ,0,0],
		[ 0.0096,  0.0096,   0.02  , 0.1 , 0.1  ],[1,-17.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
	sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;














SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.024,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.51 ,   0.04  ,  1 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[1,-17.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
	sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;




SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.01,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.41 ,   0.14  ,  0.8 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[-2,1.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;





SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.01,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.31 ,   0.04  ,  0.8 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[2,-17.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
	sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).play;








SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.01,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.31 ,   0.04  ,  0.8 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[2,-17.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
	sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;




SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,440,114,26,0,0],
				[0.016,0.01,0.167,0,0.4],
					[-6.8,-3,-2]
			)
		);

		env =

	EnvGen.ar(
	Env([ 0.076 , 0.41 ,   0.14  ,  0.8 ,0,0],
		[ 0.0048,  0.0048,   0.08  , 0.1 , 0.1  ],[-2,1.6,-3,2,-1]),doneAction:2);


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  ;
	sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;
