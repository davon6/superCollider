SynthDef(\bloo,{|freq=216|Out.ar(0,LFPulse.ar(freq,mul: EnvGen.kr(Env.perc(releaseTime: 0.3))))}).add;






Pbind(\instrument, \bloo, \dur,Pseq([1/4],1)).play




Pbind(\instrument, \bloo, \dur,Pseq([1/4],inf),

	\freq,Pseq([216,216,216,216  ,216,216,432,   216  ,432,216,    216,864,     432,216,216 ,    432,432,        864,216,   1928 ],inf)).play