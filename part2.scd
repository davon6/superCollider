








Pbind(\instrument,\gran,\dur,Pseq([4/1],inf),
\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),

\vlSub, 0,\vlSub2,Pkey(\vlSub),
	\decC,Pseq([Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32)],inf),

	\pos,Pseq([ Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),  ],inf)).play(t)





Pbind(\instrument,\gran,\dur,Pseq([4/1],1),\amp, 1,\buf, ~buf,\out,~reverbBus3,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
\vlSub, 0,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.99999.rand}))

Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz3, \dur, Pseq([1024/1],1),\gain,9,\group,~limitGrp,\out,~stereoBus4),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out,~stetoSnaCom1, \group, ~stereoGrp),
