 ~granuGrp= Group.new ;
~revGrp= Group.after(~granuGrp);
~compGrp= Group.after(~revGrp);
~limitGrp = Group.after(~compGrp);
~stereoGrp= Group.after(~limitGrp);



 ~revGrp= Group.new ;
~compGrp= Group.after(~revGrp);
~limitGrp = Group.after(~compGrp);
~stereoGrp= Group.after(~limitGrp);
(
Ppar([

	Pseq([Pbindf(~kick,\out,~kbus)],inf),

	Ppar([

		Prand([

			Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		/*\group,~granuGrp,*/\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,~revSide,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand),

		/*Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-22),\out,~eqNoise),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~buf,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand}))*/],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([32/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
	],inf),




Pbindf(~rLong,\dur,inf, \in,~revSide , \revtime, 6,\out,~comSide,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitSide, \dur, inf,\gain,40.8,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereoS, \dur, Pseq([32/1],inf), \in, ~stereoSide  ,\spread,1,	\atkT,0.05,\crvA,22,  \decT,0.95,\out,0/*~no1*/,\tS, 0.39550810372374,\group, ~stereoGrp),


],1).play(t))





Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
	/*	\group,~granuGrp,*/\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,0/*~revSide*/,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.99999.rand).play(t)
