(
SynthDef(\reverb, {
	arg in=0, dec=3.5, mix=0.08, lpf1=2000, lpf2= 6000, predel=0.025,out=0;
	var dry, wet, sig;
	dry = In.ar(in,2);
	wet = In.ar(in,2);
	wet = DelayN.ar(wet, 0.5, predel.clip(0.0001,0.5));
	wet = 16.collect{
		var temp;
		temp = CombL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
		temp = LPF.ar(temp, lpf1);
	}.sum * 0.25;
	8.do{
		wet = AllpassL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
	};
	wet = LeakDC.ar(wet);
	wet = LPF.ar(wet, lpf2, 0.5);
	sig = dry.blend(wet,mix);
	Out.ar(out, sig);
}).add;
)

i = Bus.audio(s,2);
r = Synth.new(\reverb,[\in, i]);

{Pulse.ar(432,mul:EnvGen.kr(Env([0,1,1,0],[0,0,0.4,0]))*0.1)}.play(i)