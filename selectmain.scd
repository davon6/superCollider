(Ppar([

Pbind(\instrument,\playBufXG,\rte,0.5,\dur,Prand([

		Pseq([1/16],inf)
	/*	Pseq([3/1],1)*/
/*Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 )*/].scramble,inf) ,\amp, 1,\buf,~buf,\out,0,\impulse,0.003,\start,~st= 3170851.8922835,\tS, 0.39550810372374 ,\vlSub,  1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))



~main1= (~buf.numFrames.rrand(1400000)- 1400000).postln
/*Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0).play(t)*/


(o= {Out.kr(~bus1, SinOsc.ar(0.084,4.7).range(1,3.12))}.play)



(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~recGrp=Group.after(~distoGrp);
)
(
Ppar([
	// \playBufXGMod
	Pbind(\instrument,\playBufXGMod,\rte,4,\dur,    Pseq([
		Pseq([1/16],inf)
		/*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) *//*Pseq([4.75],1)*/
	],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 0.5,\duration,Pkey(\dur),\impulse,0.003,\start,~st /*~perc1*/, \tS, 0.39550810372374 ,
	\vlSub, 0.4 /*0.01*/, \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, /*0.6*/~pDecT ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,-1,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0,\busMod,~bus1),


	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value, 0.64375,\amp,1,\decT,(0.8),\ph,1.4,\out,~gateMelo, \group,~phaserGrp),

	// 0.64375
Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,2,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.55, \qf2,0.4,\freqFil,15
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);






~filterGrp= Group.new   ;
~recGrp= Group.after(~filterGrp)



	Synth(\filterG, [\in,~eqBus2x , \which,1,\qf2,0.2],~filterGrp)


x = Synth(\recLoop,[buf:~lpPrec3,\recording,1, \in,0],~recGrp);




~lpPrec2.play
//choose here
Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

	/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */ /*Pseq([4.75],1) */Pseq([1/4],24)
],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~lpPrec,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,

\start,~st2 = 621638.18770068/*(~lpPrec.numFrames.rrand(5000)-5000).postln*/ ,\tS, 0.39550810372374 ,
\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t)

s.scope





	Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */Pseq([4.75],1)
	],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,2036289.728513 /*~perc1*/, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t)

~lpPrec3.play





