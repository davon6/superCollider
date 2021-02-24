(

~dispatchGrp = Group.new;

~shiftGrp =  Group.after(~dispatchGrp);

~filterGrp =  Group.after(~shiftGrp);

~phaserGrp =  Group.after(~filterGrp);

~gateGrp =  Group.after(~phaserGrp);

~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~revGrp = Group.after(~granGrp);

~delayGrp = Group.after(~revGrp);

~compGrp = Group.after(~delayGrp);

~limitGrp = Group.after(~compGrp);

~compGrp2 = Group.after(~limitGrp);

o = {
	Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

	Out.kr(~bus2, SinOsc.kr(LFPulse.kr(Select.kr(0.321875,[1.2875, 0.321875,0.08046875 ])).range(0.321875,0.08046875) ).range(659.255, 2637.02));


	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[  1.2875,  1.2875/*, 5.15*/,0.321875	]
	)    *  SinOsc.kr(0.64375).range(0.01005859375,1.2875)).range(10.3,2637.02),);

	Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-5.15),2.575)).range(5274.04,82.41),);


	Out.kr(~bus6, SinOsc.ar(1.2875).range(0.8,0.4));
	Out.kr(~bus7, SinOsc.ar(0.321875).range(1,0.4));

	Out.kr(~bus8,  Lag.kr(LFNoise0.kr(1.2875).range(0.10,0.0),0.05)
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.06,0.00));


	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));




}.play



)


(

Ppar([

	Pbind(\instrument,\ptr, \buf, d, \out, ~ptrBus2,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, d,\group,~recGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, d,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf)),

Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~filterBus2),


Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out, ~gateBus2, \group,~filterGrp),

	Pbind(\instrument, \gate, \dur, /*Pseq([4/1],inf)*//*~short*/~long ,
		\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\note,\note,\rest,\rest,\note,\rest,\note],64)],[16,1],inf), \group, ~gateGrp,
		\vlSub,0.2,\subsT,inf ,\bus1,~bus8,\in, ~gateBus2,\out,~micBus2/*Prand([~micBus2/*~gate2Bus*//*,~reverbBus2*/],inf)*/ ) ;


	/* Pbind(\instrument,\gran,\dur,Pseq([1024/1],inf),\amp, 1,\buf, d,\out,0,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf)),*/
,

	~toUse

],1).play(t, quant:1)



)





s.plotTree
