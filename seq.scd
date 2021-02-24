~short = Prand([  Pseq([1/4], 1), Pseq([1/4], 4) ,Pseq([1/4], 16) ,Pseq([1/4], 64), Pseq([1/1], 1),     ],1 );
~long = Prand([ Pseq([1/1],1), Pseq([4/1],1), Pseq([16/1],1) ],1);


~gate1 = Pbindf(~gate, \dur, Pseq([Pwrand([1,4,16,64],[64,16,4,1],1)/4],Prand([1,4,16,64],Prand([1,4,16,64],1))),
		\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\note,\note,\rest,\rest,\note,\rest,\note],64)],[16,1],inf), \group, ~gateGrp,
		\vlSub,0.2,\subsT,inf ,\in, ~gateBus2,\out,Prand([/*~gate2Bus,*/~reverbBus2],inf), \group, ~gateGrp ) ;




	~gate1b = Pbind(\instrument, \gate , \dur,Prand([ Pseq([1/1],1), Pseq([4/1],1)],Prand([1,4,16,64]), \group, ~gateGrp,
		\vlSub,0.2,\subsT,inf ,\in, ~gateBus2,\out,Prand([~micBus2,~reverbBus2],inf));



~gate2 = Pseq([Pbindf(~gate ,\vlSub,0.8,\vlDec,0.8, \relSu, 0.048, \relT, 0.048,
		\bus1,~bus8, \in, ~gateBus,\out,Prand([~micBus2,~reverbBus],Prand([1,4,16,64]))],inf);






~gate3 = Pseq([Pbindf(~gate , \dur, Pseq([Pwrand([1,4,16,64],[64,16,4,1],1)/4],Prand([1,4,16,64],Prand([1,4,16,64],1))),    \vlSub,0.8,\vlDec,0.8 , \in, ~gateBus,\out,Prand([~micBus2,~reverbBus],inf))],inf);


~gate4 =  Pseq([Pbindf(~gate , \dur, Pseq([Pwrand([1,4,16,64],[64,16,4,1],1)/4],Prand([1,4,16,64],Prand([1,4,16,64],1))),    \vlSub,0.8,\vlDec,0.8 , \in, ~gateBus,\out,Prand([~micBus2,~reverbBus],inf))],inf);



~gate1 =Pbind(\instrument, \gate, \dur, ~short,
		\group, ~gateGrp,
	\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus,\out, ~micBus3);

~gate2 = Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/ Prand([~short,~long],1) ,
		\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\note,\note,\rest,\rest,\note,\rest,\note],64)],[16,1],inf), \group, ~gateGrp,
		\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus2,\out,~micBus2/*Prand([/*~gate2Bus*/,~reverbBus2],inf) */);





