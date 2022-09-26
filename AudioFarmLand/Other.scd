SynthDef(\glitchy,{|out=0,frq,bit,rte,mul,frq2,mul2,dur,val,lagT|Out.ar(out,

	Splay.ar(CombN.ar(


	Decimator.ar(SinOsc.ar(frq+

	SinOsc.ar(frq2,mul: mul2),mul: mul



),rte),

		0.2, [0.1,0.11],0.3),Lag.kr(val,lagT))




	*

EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)

)}).add;






Pbind(\instrument,\glitchy,\dur,Pfunc({1.00.rrand(0.125)}),\frq,	Pfunc({500.rand}),\bit,	Pfunc({32.rand}),\rte,	Pfunc({500000.rand}),\mul,	Pfunc({1.00.rrand(0.125)}),\frq2,	Pfunc({500000.rrand(500)}),\mul2,	Pfunc({500000.00.rand}),\val,Pfunc({1.00.rand}),\lagT,Pfunc({0.4.rrand(0.3)})).play(t)




({SinOsc.ar}.play)


({PlayBuf.ar(2, ~buffer, 0.6+LFTri.kr(0.04).range(0,-0.4),Impulse.kr(~hz1beat/8),0,1).round(2**(-16))}.play)




//line to expo



SynthDef(\bip,{|out=0,rT=0.25|Out.ar(out,Squine.ar(600,mul: EnvGen.kr(Env.perc(releaseTime: rT),timeScale: t.beatDur,doneAction: 2)))}).play







SynthDef(\bip,{|out=0,rT=0.25|Out.ar(out,Squine.ar(600,mul: EnvGen.kr(Env.perc(releaseTime: rT),timeScale: t.beatDur,doneAction: 2)))}).play



SynthDef(\gateI






	SynthDef(\bip,{|out=0,rT=0.25|Out.ar(out,Squine.ar(600,SinOsc.kr(0.5).range(0,1),
		SinOsc.kr(3).range(-10,1),SinOsc.kr(0.04).range(0,5)
	))}).play



	SynthDef(\bip,{|out=0,rT=0.25|Out.ar(out,	Splay.ar(Squine.ar(600,SinOsc.kr(0.5).range(0,1),
		SinOsc.kr(3).range(-10,1),SinOsc.kr(0.04).range(0,5)
	),

	0.4, [0.35,0.31],-0.1)
	)}).play





