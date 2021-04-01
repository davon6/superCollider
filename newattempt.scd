



Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.90.rand})).play(t)






Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.35.exprand(0.31)})/*Pfunc({0.90.rand})*/).play(t)





Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pseq([1/4],inf),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.35.exprand(0.31)})/*Pfunc({0.90.rand})*/).play(t)



Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.46.exprand(0.4)})).play(t)


Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],4),Pseq([1/1],1)],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pkey(\dur),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.46.exprand(0.4)})).play(t)


Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],4),Pseq([1/1],1)],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pkey(\dur),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pfunc({0.27.exprand(0.21)})).play(t)




Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,0.91).play(t)


//0.06 is best max
Ppar([~bassShap,Pbind(\instrument,\gran,\dur,Prand([Pseq([1/3],3), Pseq([1/2],2), Pseq([1/4],4),Pseq([1/1],1)],inf),\amp, 1,\buf, ~bufSnoopy,\out,0,\duration,Pkey(\dur),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374 ,\pos,Pseq([Pseq([ Pfunc({0.96.exprand(0.91)})],4),Pseq([ Pfunc({0.25.exprand(0.19)})],4)].scramble,inf),\amp,0.2,\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})


), Ppar([~kick, ~bass],inf)],1).play(t)



