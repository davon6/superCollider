








Pbind(\instrument,\gran,\dur,Pseq([4/1],inf),
\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),

\vlSub, 0,\vlSub2,Pkey(\vlSub),
	\decC,Pseq([Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32),Pseq([(-10).rrand(2,1)],32)],inf),

	\pos,Pseq([ Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),Pseq([0.99999.rand],8),  ],inf)).play(t)
