
(
Ppar([

	~base,

	Pbind( \instrument, \playBuf, \impulse, 20.6,
	\dur,9999, \tS,  0.39550810372374,\start,Pfunc({( ~bufSnoopy.numFrames.rrand(1400000)- 1400000)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~delayBus,\loopy,1),



	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum,~delay, \feedback,0.38 ,\dur, inf,\out,~delayToEq,\group,~revGrp),

	Pbind(\instrument,\EQHP2, \in, ~delayToEq , \out, ~revDelay ,\frq, 100, \dur,inf, \group, ~eqGrpplus, \val,3600, \quant,8, \gain,(-6),\val2,14800,\quant2,1, \gain2,(-38).rrand(-8)),

Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

	Pbind(\instrument, \limiterStoMixer,\c18,1,\in,~limitDelay, \dur,inf, \gain,43,\group,~limitGrp,\out ,~stereoBus3),


	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374),




],1).play(t))





