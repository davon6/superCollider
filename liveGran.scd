



~g=Synth(\gran,[\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,0.1,\impulse,20.6
	,\pos,0.4,\dur,9999] /*,~granuGrp*/ )



(
~g=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,33.48,\duration,0.1
	,\pos,0.49,\out,~distoBus1] /*,~granuGrp*/ );

~b=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,0.67,\duration,1
	,\pos,0.84,\out, ~distoBus3 ] /*,~granuGrp*/ );

~c=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,41.2,\duration,0.8
	,\pos,0.35,\out, ~distoBus4] /*,~granuGrp*/ );

// ~bg =  Synth(\playBuf2,  [  \buf,~bufBg , \out, ~bgBus2    ]);

)


~buf.play

MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll

(

MIDIdef.cc(\o, { |value|var modFreq = value.linlin(0, 127, 0.01, 42.1);

~g.set(\impulse, modFreq.round(0.01).postln);
	~b.set(\impulse, modFreq.round(0.01).postln);
	~c.set(\impulse, modFreq.round(0.01).postln);

},ccNum: 18 );
MIDIdef.cc(\t, { |value|var modFreq = value.linlin(0, 127, 0.01, 0.99);

	~g.set(\pos, "pos".postln;modFreq.round(0.01).postln);
	~b.set(\pos, "pos".postln;modFreq.round(0.01).postln);
	~c.set(\pos, "pos".postln;modFreq.round(0.01).postln);

},ccNum: 19 );



MIDIdef.cc(\p, { |value|var modFreq = value.linlin(0, 127, 0.1, 4);

~g.set(\duration, modFreq.round(0.1).postln);
	~b.set(\duration, modFreq.round(0.1).postln);
	~c.set(\duration, modFreq.round(0.1).postln);


},ccNum: 72 );


)

/*\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)*/
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
/*	\group,~granuGrp,*/


Pbind(\instrument,\gran,\dur,Prand([Pseq([1/4],16),Pseq([16/1],1),Pseq([1/64],256) ],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus1,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.9999999999.rand),


~g=Synth(\gran2,[\amp, 1,\buf, ~buf,\out,0,\gate, 1,\impulse,39.78,\duration,0.1
	,\pos,0.45,\out,~distoBus1] /*,~granuGrp*/ );


Pbind(\instrument,\gran,\dur,Prand([Pseq([1/4],16),Pseq([16/1],1),Pseq([1/64],256) ],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,/*\group,~granuGrp,*/\duration,0.1,\impulse,39.78,\pos,0.45).play(t)



Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),
		\amp, 1,\buf, ~buf,\out,~distoBus3,\gate, 1,\group,~granuGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,Pfunc({0.9999999999.rand})),


~distoBus1 ~distoBus3 ~distoBus4

Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus4,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,~snoopy),

~c=Synth(\gran2,[\amp, 1,\buf, ~buf,\out,0,\gate, 1,\impulse,40.77,\duration,2.8
	,\pos,0.35,\out, ~distoBus4] /*,~granuGrp*/ );

Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
/*	\group,~granuGrp,*/
	\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,2.8,\impulse,40.77,\pos,0.35).play(t)


Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf)
	/*	Pwrand([ Pseq([1/64],256) ,Pseq([1/16],64),Pseq([4/1],1)],[4,16,1],inf)*/,
	\group,~granuGrp,
		\amp, 1,\buf, ~buf,\out,~distoBus43,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,~snoopy),