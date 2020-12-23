s.boot;

//lfo

(
y={

	var sig, env,lfo;


	env = EnvGen.ar(
		Env.new(
	[0,0.5,0,0,0.1],
	[1,2,2,1],
	[0,0,0,-5]
	),doneAction:2);


	//e.g. vib = SinOsc.ar(10,0,200,300);

	lfo = SinOsc.ar(10,0,200,300);


	//sig = SinOsc.ar(lfo,0,1);

	sig = SinOsc.ar(600,0,1);


	sig = LPF.ar(sig, lfo);


}.play;

)




//filtr
(

x={
	var sig, env, frequenv;

	frequenv = EnvGen.kr(
		Env.new(
			[15000, 500],
			[4],
			[-12]
		));





	env = EnvGen.kr(
		Env.new(
			[0,2,0],
			[0,1],
			[0,0]
		),
		doneAction:2);
	sig = Saw.ar(80);
	sig = LPF.ar(sig, frequenv);
	sig = sig * 0.2;
	sig = sig!2;
}.play;
)