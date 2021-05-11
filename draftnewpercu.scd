Pbind(\instrument, \percussion, \dur,Pseq([1/4],inf),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,0,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)


~stereoGrp=Group.new;


(a=Prand([

Pbind(\instrument, \percussion ,\dur,Pseq([1/4],4 ),\carHz, Pfunc({525.12070612224.rrand(0.01)}),\modHz,Pfunc({11899.3343179398.rrand(0.001)}),\modAmp, Pfunc({0.12875.rrand(0.000001)}) ,\amp,2,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({ (-14.4).rrand(-1)}), \crv1b,(-4).rand, \mulMod, 1691,\out,   ~delayToLimit),

Pbind(\instrument, \playBufS,\dur, Pseq([1/4],1),\buf,~conga,\tS,0.39550810372374,\rte,    Pfunc({1.6.rrand(0)}),\start,64600,\out,~delayToEq),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-3, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,~toKbGate)
],inf).play(t))



~ste1=Synth(\stereoO,[\in,~delayToLimit],~stereoGrp);
~ste1.set(\spread,1, \level,1, \center,0,\dlt1,0.01,\dlt2,0,\decT,0.0968, \mxDel,0);

~ste2=Synth(\stereoO,[\in,~delayToEq],~stereoGrp);
~ste2.set(\spread,0, \level,1, \center,0.0,\dlt1,0,\dlt2,0,\decT,0.1, \mxDel,1);

~ste3=Synth(\stereoO,[\in,~toKbGate],~stereoGrp);
~ste3.set(\spread,0, \level,1, \center,0.0,\dlt1,0.1,\dlt2,0.2,\decT,1.5544, \mxDel,1)


~ste2.free



Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-12, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,0).play(t)


(
c = {
	var sig = In.ar(0, 2);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(~ste1, outbus: b, addAction: \addAfter);
)



(


{SinOsc.ar(110,mul: EnvGen.kr(Env.perc(releaseTime: 0.2,curve: -3)))!2}.play;


{BLowPass4.ar(PinkNoise.ar(0.6),EnvGen.kr(Env([1400,500,120],[0.1,0.4,1],[-30,-4,1]),doneAction: 2),Line.kr(0.6,1,1))!2}.play;


Pbind(\instrument,\recLoopS,\buf,~conga,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


~conga.play
Pbind(\instrument, \playBufS,\dur, Pseq([1/4],inf),\buf,~conga,\tS,0.39550810372374,\rte,    Pfunc({2.6.rrand(0)}),\start,64600).play(t)
~conga.plot
~conga = Buffer.alloc(s, s.sampleRate *8,2);

~recGrp2=Group.new;
