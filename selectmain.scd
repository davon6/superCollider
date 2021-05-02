(Ppar([

Pbind(\instrument,\playBufXG,\dur,Prand([Pseq([3/1],1)
/*Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 )*/].scramble,inf) ,\amp, 1,\buf,~buf,\out,0,\impulse,0.003,\start,~main1,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))



~main1= (~bufSnoopy.numFrames.rrand(1400000)- 1400000).postln


~main1=2825670.221807
 2725670.221807


~main1 = 2020133.0789026 -15000


~main1=422543.55263745-20000


~lpPrec



Pbind(\instrument,\playBufXG,\dur,Prand([Pseq([3/1],1)
/*Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 )*/].scramble,inf) ,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.003,\start,110000,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t)






Pbind(\instrument,\playBufXG,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start, ~perc2, \tS, 0.39550810372374 ).play(t)



(
Ppar([
	Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */Pseq([4.75],1)
	],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~buf,\out,0/*~phaseBus*/,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,
~main1= (~bufSnoopy.numFrames.rrand(1400000)- 1400000).postln /*~perc1*/, \tS, 0.39550810372374 ,
\vlSub,  ~pSub*1.4 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT, ~pSubT , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),
	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0)],1).play(t))



~distoGrp =Group.new;
~recGrp=Group.after(~distoGrp);

(
Ppar([

	Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */Pseq([4.75],1)
	],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~buf,\out,~gateMelo,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,2036289.728513 /*~perc1*/, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.5, \qf2,0.2
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec2,\recording,1, \in,0],~recGrp);




Pbind(\instrument,\playBufXG,\dur,    Pseq([   /*   Pseq([1/16],224) ,    Pseq([2/1],1),

		 Pseq([1/16],896) ,    Pseq([8/1],1)*/

/* Pseq([1/4],24) ,*//*Pseq([3/1],1) */Pseq([4.75],1)
],inf)          /*Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf) */ ,\amp, 1,\buf,~lpPrec,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,784344.24425935/*(~lpPrec.numFrames.rrand(5000)-5000).postln*/ /*~perc1*/, \tS, 0.39550810372374 ,
\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t)


