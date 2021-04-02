


Pbind(\instrument,\gran,\dur,Prand([Pseq([1/3],3), Pseq([1/2],2), Pseq([1/4],4),Pseq([1/1],1)],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pkey(\dur),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.47.exprand(0.41)})).play(t)





Pbind( \instrument, \playBuf, \impulse, 0.3 ,
	\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,~main3,\buf,~bufSnoopy,\out, 0,\loopy,0).play(t)





Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur,Pseq([1/4],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+60000).exprand(~main3)}),\buf,~bufSnoopy,\out, 0,\loopy,0)],inf).play(t)

s.plotTree

~gateGrp = Group.new;

(
Ppar([
Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+60000).exprand(~main1)}),\buf,~bufSnoopy,\out, ~gateBus23,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+60000).exprand(~main2)}),\buf,~bufSnoopy,\out, ~gateBus23,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+60000).exprand(~main3)}),\buf,~bufSnoopy,\out, ~gateBus23,\loopy,0)],4)].scramble,inf),


	Pxrand([

		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,0),

Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,~gateBus23  ,\out, 0,\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,0),

	],inf),



~bassShap,Ppar([~kick,~bass ],inf)],1).play(t);
)




.play(t)







Pbind( \instrument, \playBufS, \impulse, 0.3 ,
	\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({( ~buf.numFrames.rrand(100000)- 100000)}),\buf,~bufBg,\out, 0,\loopy,0).play(t)



