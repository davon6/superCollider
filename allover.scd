/*~c=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,40.77,\duration,2.8
	,\pos,0.35,\out, ~distoBus4] /*,~granuGrp*/ );*/



~c=Synth(\gran,[\amp, 1,\buf, ~buf,\dur,99999,\gate, 1,\impulse,0.01,\duration,40
	,\pos,0,\out, ~distoBus4] /*,~granuGrp*/ );

~bufSnoopy.play

Synth(\recLoop,[\buf,~bufSnoopy,\recording,1,\group, ~compGrp,\in,0],~recGrp)

(
Ppar([
Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),


	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),



Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~filterBus2 ,\group, ~distoGrp),





	Pbind(\instrument, \filter, \dur,inf, \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~eqBus2, \group,~filterGrp),



	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~gateBus2,/*~toRecord*//*~gateBus2*/
		\val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),
		\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0,\vol,4),


	Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],4),Pseq([4/1],1)    ],inf),\group, ~gateGrp,/*\relSu,Pfunc({0.12.exprand(0.04)}),*/
\in, ~gateBus2,

			\vlSub,Pfunc({0.8.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-10.exprand(-2,1)}),
		\relC,Pfunc({-8.exprand(-2,1) }),\out, 0  /*~toRecord*/)




	// ~bufSnoopy.play




],1).play(t)


)
(
~lfoGrp  = Group.new;
~distoGrp = Group.after(~lfoGrp);
~filterGrp = Group.after(~distoGrp);

~eqGrp0 = Group.after(~filterGrp);

~gateGrp= Group.after(~eqGrp0);

~recGrp = Group.after(~gateGrp);

)


(

MIDIdef.cc(\o, { |value|var modFreq = value.linlin(0, 127, 0.01, 42.1);

	~c.set(\impulse, "imp".postln;modFreq.round(0.01).postln);

},ccNum: 18 );
MIDIdef.cc(\t, { |value|var modFreq = value.linlin(0, 127, 0.01, 0.99);


	~c.set(\pos, "pos".postln;modFreq.round(0.01).postln);

},ccNum: 19 );



MIDIdef.cc(\p, { |value|var modFreq = value.linlin(0, 127, 0.1, 40);


	~c.set(\duration, "dur".postln;modFreq.round(0.1).postln);


},ccNum: 72 );


)



	Prand([
//Pxrand
		Pbind(\instrument, \gate, \dur, Pseq([4/1],1),	\vlSub,Pfunc({0.8.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-10.exprand(-2,1)}),
		\relC,Pfunc({-8.exprand(-2,1) })/*,\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,*/,\in, ~gateBus2,\out,

		0/*Pwrand([/*~micBus23,*/~micBus33,~reverbBus23],[1,4].normalizeSum,inf)*/),


	Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*/Pwrand([ /*Prand([*/~short,Pseq([1/4 ],64)],[4,1].normalizeSum,1) /*inf)*/,\group, ~gateGrp,\relSu,\relSu,Pfunc({0.12.exprand(0.04)}),/*\vlSub,~vl11,\vlSub2,Pkey(\vlSub),\atkT,~vl21,\decT,~vl31,\subsT,~vl41,
	\relT,~vl51,\atckC,~vl61,\decC,~vl71,\relC,~vl81,\bus1,~bus8,\in, ~gateBus2,\out,*/


			\vlSub,Pfunc({0.8.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-10.exprand(-2,1)}),
		\relC,Pfunc({-8.exprand(-2,1) }),

			0/*~reverbBus23*/),



	Pbind(\instrument, \gate, \dur,Pxrand([ Pseq([1/4],16),Pseq([1/4],64)],1),


			\type, Pxrand([ /*Pseq([\note],256) , */Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),

				Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,
				\relSu,Pfunc({0.12.exprand(0.04)}),
				/*\vlSub,~vl11,\vlSub2,Pkey(\vlSub),
				\atkT,~vl21,
	\decT,~vl31,
	\subsT,~vl41,
	\relT,~vl51,
	\atckC,~vl61,
		\decC,~vl71,
		\relC,~vl81*/


			\vlSub,Pfunc({0.8.exprand(0.2,1)}),\vlSub2,Pkey(\vlSub), \atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.4.exprand(0.6,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(0,1)}),
	\decC,Pfunc({-10.exprand(-2,1)}),
		\relC,Pfunc({-8.exprand(-2,1) }),

				/*,\bus1,~bus8,*/\in, ~gateBus2,\out,
		0/*	Pwrand([~micBus23,/*~micBus33,*/~reverbBus23],[1,1].normalizeSum,inf)  */ ),

	],inf),