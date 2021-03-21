1.00.exprand(0.2)






SynthDef(\bla,{  |dur,vlAtk,vlDec=1,vlSub,vlSub2,vlRel,atkT,decT,subsT,relT,atckC,decC,relC| Out.ar(0,Saw.ar(108+ MouseX.kr((-40),300),mul:   EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
	[dur * atkT ,dur * decT /*-relSu - In.kr(bus1, 1)*/  , dur * subsT/*-relSu*/,dur* relT],
	[atckC,decC ,0     ,relC]),doneAction: 2))!2)}).add;





Pbindef(\eee, \instrument, \bla,).play(t, quant:1)
//good one like this and that bring it back to static can be random value or classic square
Pbindef(\eee,  \dur, Pseq([1/4],inf),
	\vlSub,Pfunc({0.8.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.00,0.01).postln}),
	\decT,Pfunc({0.4.exprand(0.6,0.3).postln}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1).postln}),
	\relT,Pfunc({0.12.exprand(0.8,1).postln}),
	\atckC,Pfunc({6.exprand(0,1).postln}),
	\decC,Pfunc({-10.exprand(-2,1).postln}),
	\relC,Pfunc({-8.exprand(-2,1) .postln})).play(t ,quant:1);




Pbind(\instrument, \bla, \dur, Pseq([1/4],inf),
	\vlSub,Pfunc({1.00.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.00,0.01).postln}),
	\decT,Pfunc({0.4.exprand(0.6,0.3).postln}),
	\subsT,Pfunc({0.2.exprand(0.4,0.1).postln}),
	\relT,Pfunc({0.12.exprand(0.8,1).postln}),
	\atckC,Pfunc({6.exprand(0,1).postln}),
	\decC,Pfunc({-10.exprand(-2,1).postln}),
	\relC,Pfunc({-8.exprand(-2,1) .postln})).play(t);