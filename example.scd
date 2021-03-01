~toFilter = Bus.audio(s,1);
~modFil = Bus.control(s,1);


SynthDef(\lfo1, {|out,ph, dur|Out.kr(~modFil,

	SinOsc.kr(Select.kr(LFNoise2.ar(1).range(0,1).round(1),
		[    1, 4 ]
	)    *  SinOsc.kr(0.5).range((-1),1)).range(10,2400)
*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;



SynthDef(\toGran,{Out.ar(0, LPF.ar(Saw.ar(432),

	In.kr(~modFil)))}).add;

(
Ppar([

	Pbind(\instrument,\lfo1, \dur,10)
		,
		Pbind(\instrument,\toGran,\dur,inf)
],1).play

)


