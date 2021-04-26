

~pSub =0.5.rrand(0.2,1);~pAtkT=0.10.rrand(0.01);~pDecT =  0.3.rrand(0.8,0.3);~pSubT = 0.3.rrand(0.2);~pRelT=0.22.rrand(0.1,1);~pAtkC=6.rrand(1,1);~pDecC=(-4).rrand(-0.1);~pRelC=(-8).rrand(-2,1);
~pvlAtk =0.1.rrand(0.01);
~pSub2 =0.5.rrand(0.2,1);~pAtkT2=0.10.rrand(0.01);~pDecT2 =  0.3.rrand(0.8,0.3);~pSubT2 = 0.3.rrand(0.2);~pRelT2=0.22.rrand(0.1,1);~pAtkC2=6.rrand(1,1);~pDecC2=(-4).rrand(-0.1);~pRelC2=(-8).rrand(-2,1);
~pvlAtk2 =0.1.rrand(0.01);
~pSub3 =0.5.rrand(0.2,1);~pAtkT3=0.10.rrand(0.01);~pDecT3 =  0.3.rrand(0.8,0.3);~pSubT3 = 0.3.rrand(0.2);~pRelT3=0.22.rrand(0.1,1);~pAtkC3=6.rrand(1,1);~pDecC3=(-4).rrand(-0.1);~pRelC3=(-8).rrand(-2,1);
~pvlAtk3 =0.1.rrand(0.01);
~pSub4 =0.5.rrand(0.2,1);~pAtkT4=0.10.rrand(0.01);~pDecT4 =  0.3.rrand(0.8,0.3);~pSubT4 = 0.3.rrand(0.2);~pRelT4=0.22.rrand(0.1,1);~pAtkC4=6.rrand(1,1);~pDecC4=(-4).rrand(-0.1);~pRelC4=(-8).rrand(-2,1);
~pvlAtk4 =0.1.rrand(0.01);
~pSub5 =0.5.rrand(0.2,1);~pAtkT5=0.10.rrand(0.01);~pDecT5 =  0.3.rrand(0.8,0.3);~pSubT5 = 0.3.rrand(0.2);~pRelT5=0.22.rrand(0.1,1);~pAtkC5=6.rrand(1,1);~pDecC5=(-4).rrand(-0.1);~pRelC5=(-8).rrand(-2,1);
~pvlAtk5 =0.1.rrand(0.01);
~pSub6 =0.5.rrand(0.2,1);~pAtkT6=0.10.rrand(0.01);~pDecT6 =  0.3.rrand(0.8,0.3);~pSubT6 = 0.3.rrand(0.2);~pRelT6=0.22.rrand(0.1,1);~pAtkC6=6.rrand(1,1);~pDecC6=(-4).rrand(-0.1);~pRelC6=(-8).rrand(-2,1);
~pvlAtk6 =0.1.rrand(0.01);
~pSub7 =0.5.rrand(0.2,1);~pAtkT7=0.10.rrand(0.01);~pDecT7 =  0.3.rrand(0.8,0.3);~pSubT7 = 0.3.rrand(0.2);~pRelT7=0.22.rrand(0.1,1);~pAtkC7=6.rrand(1,1);~pDecC7=(-4).rrand(-0.1);~pRelC7=(-8).rrand(-2,1);
~pvlAtk7 =0.1.rrand(0.01);
~pSub8 =0.5.rrand(0.2,1);~pAtkT8=0.10.rrand(0.01);~pDecT8 =  0.3.rrand(0.8,0.3);~pSubT8 = 0.3.rrand(0.2);~pRelT8=0.22.rrand(0.1,1);~pAtkC8=6.rrand(1,1);~pDecC8=(-4).rrand(-0.1);~pRelC8=(-8).rrand(-2,1);
~pvlAtk8 =0.1.rrand(0.01);



	Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc1, \tS, 0.39550810372374 ,
\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc2, \tS, 0.39550810372374 ,
\vlSub,  ~pSub2 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT2,\decT, ~pDecT2 ,	\subsT, ~pSubT2 , \relT,~pRelT2,\atckC,~pAtkC2,\decC,~pDecC2,\relC,~pRelC2,\vlAtk , ~pvlAtk2 ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus3,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc3, \tS, 0.39550810372374 ,
\vlSub,  ~pSub3 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT3,\decT, ~pDecT3 ,	\subsT, ~pSubT3 , \relT,~pRelT3,\atckC,~pAtkC3,\decC,~pDecC3,\relC,~pRelC3,\vlAtk , ~pvlAtk3 ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus4,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc4, \tS, 0.39550810372374 ,
\vlSub,  ~pSub4 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT4,\decT, ~pDecT4 ,	\subsT, ~pSubT4 , \relT,~pRelT4,\atckC,~pAtkC4,\decC,~pDecC4,\relC,~pRelC4,\vlAtk , ~pvlAtk4 ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus5,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc5, \tS, 0.39550810372374 ,
\vlSub,  ~pSub5 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT5,\decT, ~pDecT5 ,	\subsT, ~pSubT5 , \relT,~pRelT5,\atckC,~pAtkC5,\decC,~pDecC5,\relC,~pRelC5,\vlAtk , ~pvlAtk5,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus6,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc6, \tS, 0.39550810372374 ,
\vlSub,  ~pSub6 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT6,\decT, ~pDecT6 ,	\subsT, ~pSubT6 , \relT,~pRelT6,\atckC,~pAtkC6,\decC,~pDecC6,\relC,~pRelC6,\vlAtk , ~pvlAtk6 ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus7,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc7, \tS, 0.39550810372374 ,
\vlSub,  ~pSub7 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT7,\decT, ~pDecT7 ,	\subsT, ~pSubT7 , \relT,~pRelT7,\atckC,~pAtkC7,\decC,~pDecC7,\relC,~pRelC7,\vlAtk , ~pvlAtk7 ,  \vlRel,  Pkey(\vlAtk)),

Pbind(\instrument,\gran,\dur,Pseq([ Pseq([1/4],24)  ,   Pseq([1/2],24)   ].scramble,inf)  ,\amp, 1,\buf,~buf,\out,~phaseBus8,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos, ~perc8, \tS, 0.39550810372374 ,
\vlSub,  ~pSub8 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT8,\decT, ~pDecT8 ,	\subsT, ~pSubT8 , \relT,~pRelT8,\atckC,~pAtkC8,\decC,~pDecC8,\relC,~pRelC8,\vlAtk , ~pvlAtk8 ,  \vlRel,  Pkey(\vlAtk)),






.play(t)





Pxrand([

	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],24)  ,   Pseq([1/1],24)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

			\pos,Pxrand([ Pseq([  ~perc1],24),  Pseq([~perc2],24) , Pseq([~perc3],24), Pseq([~perc4],24) ,
			Pseq([~perc5],24),  Pseq([~perc6],24) , Pseq([~perc7],24), Pseq([~perc8],24)],inf),

\tS, 0.39550810372374 ,

\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],24) , Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1) ],24) ,
		Pseq([  1.00.rrand(0.2,1)   ],24) , Pseq([  1.00.rrand(0.2,1) ],24), Pseq([  1.00.rrand(0.2,1) ],24) , Pseq([  1.00.rrand(0.2,1)   ],24)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Prand([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],24)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24)],inf),
	),



	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],12)  ,   Pseq([1/1],12)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
			\amp, 1,\buf,~buf,\out,Pxrand([ Pseq([~phaseBus],12),Pseq([~distoPerch],12)],inf),\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

		\pos,Prand([ Pseq([~perc1],12),  Pseq([~perc2],12) , Pseq([~perc3],12), Pseq([~perc4],12) ,
			Pseq([~perc5],12),  Pseq([~perc6],12) , Pseq([~perc7],12), Pseq([~perc8],12)],inf),

\tS, 0.39550810372374 ,

\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],12) , Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1) ],12) ,
		Pseq([  1.00.rrand(0.2,1)   ],12) , Pseq([  1.00.rrand(0.2,1) ],12), Pseq([  1.00.rrand(0.2,1) ],12) , Pseq([  1.00.rrand(0.2,1)   ],12)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],12)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12)],inf),
	),

	],inf),//was 10