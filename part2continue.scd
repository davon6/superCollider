


(Ppar([

Pseq([Pbind( \instrument, \playBufS, \impulse, 0.6 ,
		\dur,Pseq([1/2],8), \tS,  0.39550810372374,\start,( ~buf.numFrames.rrand(100000)- 100000),\buf,~bufBg,\out, 0,\loopy,0
		,\type, Pseq([\rest,\note,\rest,\rest],inf)
	),],inf),

	Ppar([~kick, ~bass],inf) ],1).play(t, quant:1))





~bufBg.play




(Ppar([

Pseq([Pbind( \instrument, \playBufS, \impulse, 0.3 ,
		\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,( ~buf.numFrames.rrand(100000)- 100000),\buf,~bufBg,\out, 0,\loopy,0),],inf),

	Ppar([~kick, ~bass],inf) ],1).play(t, quant:1))


Pbind( \instrument, \playBufS, \impulse,0.6 ,
	\dur,Pseq([1/2],8), \tS,  0.39550810372374,\start,~rythm,\buf,~bufBg,\out, 0,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf)).play(t,quant:1)