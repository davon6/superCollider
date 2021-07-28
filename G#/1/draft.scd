
p=({Out.ar(0,SinOsc.ar(SinOsc.kr(0.3).range(10,300),SinOsc.kr(200,mul: MouseX.kr(0,100)).range(0.00,100.00)).round(2**(-16))
	*0.1)
}.play)




a= ({
  |mxDel, dlt1=0.3,dlt2=0.4, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:p,addAction:\addAfter))



a.set(\dlt1,0.5)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/squelch.aiff");


s.meter

s.plotTree




				SynthDef(\bug,{|out=0,rte=3000/*(~hz1beat*8)*/,val,dur,bts=4,fdb|Out.ar(out,Decimator.ar( SinOscFB.ar(
					// LFNoise0.kr(rte).range(140,3600)
					EnvGen.kr(Env.step([val,0],[dur,0]),timeScale: t.beatDur,doneAction: 2),fdb
					/*val,EnvGen.kr(Env([1,0],[dur,0],[dur, */
				),rte,bts)*0.05)}).add;



				Pbind(\instrument, \bug,\dur,Pfunc({0.5.rrand(0.01)}) ,\val,Pfunc({3600.00.exprand(140)}) ,
				\fdb,Pfunc({2.00.rand}),
					\rte,Pfunc({18000.rrand(100)}),\bts,Pfunc({30.rrand(1)})
				).play(t)
