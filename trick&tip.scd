
~filterGrp= Group.new;

~gateGrp= Group.after(~filterGrp);


Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~bouffon,\out,0/*~toEq*/,\impulse,0.03
	,\start,Pfunc({~bouffon.numFrames/256* (220.rand)})).play(t,quant:1)

Pseq([

Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/4],1)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~bouffon,\out,0/*~toEq*/,\impulse,0.03
	,\start,Pfunc({~ga=~bouffon.numFrames.rand})),


Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/4],7)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~bouffon,\out,0/*~toEq*/,\impulse,0.03
	,\start,Pfunc({~ga})),

	Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([10/1],1)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~bouffon,\out,0/*~toEq*/,\impulse,0.03
	,\start,Pfunc({~ga})),


],inf).play(t,quant:1)







Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([ Pseq([1/2],64) ,Pseq([1/8],256)  ,Pseq([1/16],512) ,    Pseq([1/32],1024)    ],1)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~buf,\out,~toEq,\impulse,0.03
	,\start, 3390650/*~buf.numFrames.rand.postln*/,\type,Pseq([\rest,\rest,\rest,\rest,\note,\rest,\note,\rest,].scramble,inf)).play(t,quant:1);


// 3390650

Synth(\filterG,[\in,~toEq,\which,2,\qf2,0.4,\freqFil,100],~filterGrp)

(
~filterGrp= Group.new;

~gateGrp= Group.after(~filterGrp);


Ppar([

Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([ /*Pseq([1/4],128),Pseq([1/2],64) ,*/ Pseq([16/1],2) ,      Pseq([4/1],8)  ,     Pseq([1/1],32)   ],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~buf,\out,~toEq,\impulse,0.03
	,\start, 3390650/*~buf.numFrames.rand.postln*/,\type,Pseq([\rest,\rest,\note,\note,\note,\rest,\note,\rest,].scramble,inf),),

	Pbind(\instrument,\gate,\vlSub,1,\vlSub2,1,\tS,t.beatDur, \in,~distoPercu,\group,~gateGrp,\dur,Pseq([ Pseq([1/8],128),  ],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note],inf))],1).play(t,quant:1);


// 3390650

Synth(\filterG,[\in,~toEq,\which,2,\qf2,0.4,\freqFil,100,\out,~distoPercu],~filterGrp)

(
~filterGrp= Group.new;

~gateGrp= Group.after(~filterGrp);

~delayGrp= Group.after(~gateGrp);


Ppar([

Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([ /*Pseq([1/4],128),Pseq([1/2],64) ,*/ Pseq([64/1],1) ,Pseq([32/1],2),Pseq([16/1],2) ,      Pseq([4/1],8)  ,     Pseq([1/1],32)   ],inf)	,\tS, 0.39550810372374,\vlDec,0.2,\vlSub,0.2,\vlSub2,0.2
		,\amp, 1,\buf,~bufSnoopy2/*~buf*/,\out,~distoPercu/*~toEq*/,\impulse,0.03
		,\start,Pfunc({ ~bufSnoopy2.numFrames.rand.postln}),/*\type,Pseq([\rest,\rest,\note,\note,\note,\rest,\note,\rest,].scramble,inf),*/),

	Prand([
	Pbind(\instrument,\gate,\vlSub,1,\vlSub2,1,\tS,t.beatDur, \in,~distoPercu,\group,~gateGrp,\dur,Pseq([1/8],8),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\out,~downEq),
		Pbind(\instrument,\gate,\vlSub,1,\vlSub2,1,\tS,t.beatDur, \in,~distoPercu,\group,~gateGrp,\dur,Pseq([8/1],1),\out,~downEq),
		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~distoPercu  ,\out, ~downEq,\group, ~gateGrp,
	\atckC,5.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),

		Pbind(\instrument, \gate ,\in,~distoPercu   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1/1],1) ],1) ,    \group,~gateGrp, \out,~downdel,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),



Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],6),/* Pseq([1/1],1) */ ],1),\group, ~gateGrp,\relSu,Pfunc({0.8.exprand(0.004)}),
\in, ~distoPercu,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~downdel),

	],inf)



],1).play(t,quant:1););

Synth( \pan2, [\in, ~downEq ],~delayGrp);

Synth( \pingD, [\in, ~downdel ,\bufnum,~delay2, \feedback,0.63 ,\out,0/*~downEq*/,\delayTime,0.4],~delayGrp);


// 3390650

Synth(\filterG,[\in,~toEq,\which,2,\qf2,0.4,\freqFil,100,\out,~distoPercu],~filterGrp)


~bufSnoopy2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src1F2.aiff");
~bufSnoopy.play


~bouffon.play

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bouffon2.aiff",numChannels:1,duration:t.beatDur*256);

~bouffon =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bouffon2.aiff")



PingPong