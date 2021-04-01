


(Ppar([

Pseq([Pbind( \instrument, \playBufS, \impulse, 0.3 ,
		\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({( ~buf.numFrames.rrand(100000)- 100000)}),\buf,~bufBg,\out, 0,\loopy,0),],inf),

	Ppar([~kick, ~bass],inf) ],1).play(t, quant:1))





~bufBg.play