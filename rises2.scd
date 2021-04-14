

(
~lfoGrp= Group.new;
~filterGrp = Group.after(~lfoGrp);

)




(
~up =

Ppar([
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([32/1],inf),\rL,40,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,40,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([8/1],inf),\rL,40,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

	Pseq([


Pbind(\instrument,\rise,\dur,Pseq([16/1],4), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


Pbind(\instrument,\rise,\dur,Pseq([4/1],16), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


Pbind(\instrument,\rise,\dur,Pseq([1/1],64), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riToDisto,\tS, 0.39550810372374,

	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),


],inf),


	Pbind(\instrument, \distoS, \dur, inf, \in, ~riToDisto , \out,~riToEnv ,\group, ~distoGrp),

	Pbind(\instrument,\filterS, \in,~riToEnv,\out,0 , \group,~filterGrp,\dur, inf,\tS, 0.39550810372374,\busMod,~bus20, \which, 0,\qf,0.4)  ,


	Pbind(\instrument,\EQHP2, \in, ~riToEq , \out, ~riToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8).rrand(-0.1)),
	Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~riToRev  , \out,~riToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp ,\ctrl, ~kbus, \out,~riToLimit, \group, ~compGrp),

	Pbind( \instrument, \limiterStoMixer,\c11,1,\in, ~riToLimit, \dur, inf,\gain,39,\group,~limitGrp,\out,~riToStereo),
	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo  ,\spread,Pfunc({1.00.rrand(0.2)}),\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


],1);





)


