

SynthDef(\expo,{|out=0,frq,mul,frq2,mul2|Out.ar(out,
Pan2.ar(
	BufCombN.ar(~b3.bufnum,
	SinOsc.ar(100+

		SinOsc.ar(23   /* +


			SinOsc.ar(5000000	,mul: SinOsc.kr(4).range(5,60))*/



			,mul: LFNoise1.kr(6).range(0.5,90000)*SinOsc.kr(0.5)),mul: SinOsc.kr(0.05).range(1,0.5)



)


	,LFDNoise0.kr(3).range(0.001,1)*LFTri.kr(0.006)
			,(-0.5) ,0.8),


		LFNoise1.ar(5)/*LFNoise1.kr(0.25).range(-1,1)*/)
)}).play;



// Synth(\expo,[\freq:500,\mul,1,frq2,mul2])



