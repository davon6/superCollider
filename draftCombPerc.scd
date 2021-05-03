({CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/216/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-0.2)}.play)





({Saw.ar(MouseY.kr(0.3,432))}.play)





({CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/216/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(5.2875).range(0.0000001,0.0001)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-4)}.play)




(
~filterGrp = Group.new;
~delGrp =Group.after(~filterGrp);
~combGrp=Group.after(~delGrp);
~recGrp2=Group.after(~combGrp);)
(
Ppar([

	Pbind(\instrument, \playBuf,\dur,1/16, \rte,Pfunc({4.rrand(0.1)}), \tS,  0.39550810372374,\buf,~snare,\out,~percuStereo,\dA,0.1,
		\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
					\note,\note,\note,\note,\rest,\rest,\rest,\rest,
		],inf)
	)
	,
	Pbind(\instrument, \filterGS,\which,1, \in,~percuStereo ,\out,~part2SRev, \group, ~filterGrp,\qf2,0.08,\dur ,inf),


	Pbind(\instrument,\pingD, \in,~part2SRev,  \bufnum,~delay, \feedback,0.45 ,\group, ~delGrp,\dur, inf,\out,~limitBus1),
	Pbind(\instrument, \comb,\which,1, \in,~limitBus1,\group, ~combGrp,\qf2,0.1,\dur ,inf),

	Pbind(\instrument,\recLoopS,\buf,~fkAr,\recording,1, \in,0,\group,~recGrp2,\dur,inf),

],1).play(t)
)

~fkAr.play

~combGrp= Group.new
(
Ppar([
	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],inf),\buf,~fkAr,\tS,  0.39550810372374,\start,( ~fkAr.numFrames.rrand(140000)-14000).postln,\out, ~limitBus1),

	~daKb,

Pbind(\instrument, \shiftEx, \dur, inf, \in,~limitBus1,\group ,~combGrp)
],1).play(t)
)

Pbind(\instrument, \playBuf,\dur,1/16, \rte,1, \tS,  0.39550810372374,\buf,~snare,\out,0,\dA,0.25,
		\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
					\note,\note,\note,\note,\rest,\rest,\rest,\rest,
		],inf)
).play(t)

