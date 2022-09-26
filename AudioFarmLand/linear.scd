SynthDef(\expo,{|out=0,frq,mul,frq2,mul2|Out.ar(out,
Pan2.ar(

	SinOsc.ar(500+

		SinOsc.ar(50+


				SinOsc.ar(50	,mul: 500)



				,mul: 50000),mul: SinOsc.kr(0.01).range(1,0.5))

			,LFNoise1.ar(2))

)
}).play;
