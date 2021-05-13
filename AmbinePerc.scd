


(Ppar([\granLive],1).play(t))


~recGrp2=Group.new

Synth(\granLive,[\buf,~snare,\out,0,\amp,0.5])



Synth(\recLoop,[\buf,~ambPerc,\recording,1, \in,0],~recGrp2)


// ~part6=Synth( \pingD, [\in, ~downdel ,\bufnum,~delay3, \feedback,0.13 ,\out,0],~revGrp);


Synth(\granLive,[\buf,~k2])//gooooood




~ambPerc.play


(
Ppar([


	Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
 \carHz,41.2
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out,~micBus

	/*Prand([Pseq([~micBus],16),Pseq([ ~distoPercu],16)],inf)*/   , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\out,~micBus ,\dur, Pseq([

		Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp0,\dur,inf),

	Pseq([
	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k,\out,0/*~no4ToGate*/,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/4],16),\pitchRte,Pfunc({6.rrand(0.1)}),\impulse,0.03,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \busMod,~bus18 ),//16

		Pbind(\instrument,\gran,\dur,Pseq([1/1],4),\amp, 1,\buf, ~k,\out,0/*~no4ToGate*/,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],inf),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub),\pitchRte,Pfunc({8.rrand(0.1)}) ),],inf),

],1).play(t))