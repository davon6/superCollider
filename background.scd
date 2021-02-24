(SynthDef(\background,{|out=0,spread=1, level=1, center=0|
	var sig;
	sig = SyncSaw.ar(82.41,[659.255/4,654.235/4,651.155/4] * [SinOsc.kr(0.10),SinOsc.kr(0.12),SinOsc.kr(0.08)],mul:0.2)* [1,MouseX.kr(0,0.8),MouseX.kr(0,0.8)];

	sig = FreqShift.ar(sig, LFNoise0.kr(5.15).range(400,1800)* SinOsc.kr(0.10) )!3;


	Out.ar(out, Splay.ar(HPF.ar(sig*0.05,800),spread,level,center));
}).add;);


~bg = Pbind(\instrument, \background, \dur, Pseq([1024/1],1));



~bg.play