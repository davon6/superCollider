SynthDef(\lfoSi, {|out, val, val2, sca, sca2, low, high, fac|Out.ar(out,
	SinOsc.kr(val* ((SinOsc.kr(val2).range(sca, sca2))*fac)).range(low, high)
)}).add;


SynthDef(\lfoSi, {|out, val, val2, sca, sca2, low, high, fac|Out.ar(out,
	SinOsc.kr(val* ((SinOsc.kr(val2).range(sca, sca2))*fac)).range(low, high)
)}).add;



/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(5274.04,82.41),);*/



//attemot multi lfo

SynthDef(\lfoSi, {|out, val, val2, val3, low2, high2, sca, sca2, low, high, fac, fac2|Out.kr(out,
		((LFNoise1.kr(val3).range(low2,high2))*fac2) +
	SinOsc.kr(val* ((SinOsc.kr(val2).range(sca, sca2))*fac)).range(low, high)
)}).add;

({EnvGen.kr(Env.step([1,0],[1,0]))}.plot(duration:2))

