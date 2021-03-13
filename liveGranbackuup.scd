Pbind(\instrument,\gran,\dur,Prand([Pseq([1/4],16),Pseq([16/1],1),Pseq([1/64],256) ],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus1,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.9999999999.rand),




Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),
		\amp, 1,\buf, ~buf,\out,~distoBus3,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,Pfunc({0.9999999999.rand})),




Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,~snoopy),





Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus43,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,~snoopy),