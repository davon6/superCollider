
//maybe eq kick a littl to free bass
//stereo percu weird
//percu cutting the 1/2 for progression
//slider aka minirise
//delayfo random melor
// multi valu  freq shifter or single pxrand
//STEREO IS BROKEN FOR PERCUSSIONS
//ALSO LONG SNARE GLTICH WITH BASS
//bus rq for all filter bg
s.plotTree
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

~compGrp = Group.after(~revGrp);

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
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(5274.04,82.41),);


	Out.kr(~bus6, SinOsc.ar(1.2875).range(0.8,0.4));
	Out.kr(~bus7, SinOsc.ar(0.321875).range(1,0.4));

	Out.kr(~bus8,  Lag.kr(LFNoise0.kr(1.2875).range(0.10,0.0),0.05)
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.06,0.00));


	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));




}.play



)

(
~gate.free;
~gate = Pbind(\instrument,\gate, \dur,Pwrand([/*Pseq([4/1],1),*/Pseq([1/4],Pwrand([1,4,16,64],[1,4,16,16],1)),Pseq([1/1],Prand([1,4],1)),Pseq([1/3],Prand([1,3,12],1)) ],[4,1,1],Prand([1,4,16],1))
	,\in, 0, \atkT,0,\bus1,~bus1,\out,0,\group, ~gateGrp);
)

(Ppar([Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1))],1).play(t, quant:1))

(

Ppar([



	~bassShap,

	/*Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf), \vl,Pseq([0.0000000095262251,0.0000000095262251,0.0000000095262251, 0.01005859375],inf),
		\vl3, Pseq([0,0,0, (-10.4)],inf), \vl2, Pseq([0,0,0, 15],inf),
		\out, ~bus2,  \out2, ~bus11,  \out3, ~bus3),*/

	Pbind(\instrument, \lfo, \dur,Pseq([1/ Prand([4,16,1],inf) ], Prand([1,4,16,64],inf)  ), \vl1,Prand([5, (-0.25)],inf)   ,\vl2,Prand([5, (-0.25)],inf) ,  \out, ~bus10),

	Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],4096),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,0,\group, ~compGrp),
	Pbind(\instrument,\comp,\dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,0,\group, ~compGrp),

	Pbind(\instrument,\lead,\dur,Pseq([16384/1],1), \gra,~bus10 , \sineRate, (0.0000000095262251/2/2/2/2), \freq,659.255,\out,~dispatchBus/*~phaseBus*/),

	Pseq([
	Pbind(\instrument,\dispatch,\dur,

	Pwrand([ Pseq([1/4],Pxrand([1,4,16],1)), Pseq([4/4],Pxrand([1,4],1)), Pseq([16/4],1), Pseq([64/4],1)],[64,16,4,1],1)


	,\in,~dispatchBus, \out,Prand([~filterBus2, ~filterBus,/*~shiftMelo,*/~filterSquelch,~phaseBus],1),\group,~dispatchGrp),

	],Prand([1,4,16,64],inf)),


	Pbind(\instrument, \shift, \dur, Pseq([1/3],inf),
		\freq2, [329.63 ,326.63 ], \vlPE, 2.575, \dA, 2, \factor2,1, \type,Pseq([\note,\rest,\rest,\note],inf),
		\boo, ~bus13, \dA3, 2,

		\in,~shiftMelo, \out,Prand([~filterBus2, ~filterBus,~filterSquelch],1), \group, ~shiftGrp),


	/*Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterRnd,\which,Prand([0,2],inf),\busMod, ~bus2, \out, ~phaseBus, \group,~filterGrp),*/



Pbind(\instrument, \phaser, \dur,Pseq([4096/1],1),\maxDlT,0.0242, \rate, 0.00502929687 , \in,~phaseBus, \out, ~filterRnd, \group,~phaserGrp),


Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 0.2, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,80,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\in,~filterRnd , \out,~comRnd,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.02,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,20,\in, ~comRnd,\ctrl, ~kbus, \out,~limitRnd, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitRnd, \dur, Pseq([1024/1],1),\gain,60,\group,~limitGrp,\out,~comSnaGrpBus),


	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterSquelch,\which,1,\busMod, ~bus9, \out, ~reverbSquelch, \group,~filterGrp),

	Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 0.2, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 24,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

Pbind(\instrument, \limiter,\in, ~limitSquelch, \dur, Pseq([1024/1],1),\gain,95,\group,~limitGrp,\out,~comSnaGrpBus),




	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out, ~gateBus2, \group,~filterGrp),

	Pbind(\instrument, \gate , \dur, Pseq([Pwrand([1,4,16,64],[64,16,4,1],1)/4],Prand([1,4,16,64],inf)),
		\type, Pwrand([ Pseq([\note],64) , Pseq([\note,\note,\note,\rest,\rest,\note,\rest,\note],64)],[16,1],inf), \group, ~gateGrp,
		\vlSub,0.2,\subsT,inf ,\in, ~gateBus2,\out,~reverbBus2) ,

	Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 51, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 0.5, \drylevel, -20, \earlylevel, -22, \taillevel, -22,\amp,1,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp ),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.020,\sA, 1/2,\atk ,0.0121, \rel ,0.0484,\gain,/*(70.3)*/1
		,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([1024/1],1),\gain,49,\group,~limitGrp,\out,~comSnaGrpBus),



	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1),\which,0, \in,~filterBus,\busMod, ~bus4,\rqLPF,~bus6, \out, ~gateBus, \group,~filterGrp ),

	Pseq([Pbindf(~gate ,\vlSub,0.8,\vlDec,0.8, \relSu, 0.048, \relT, 0.048,
		\bus1,~bus8, \in, ~gateBus,\out,~reverbBus)],inf),
	Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 1, \drylevel, -20, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp ),
	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/
,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\gain,87,\group,~limitGrp,\out,~comSnaGrpBus),


	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus ,\ctrl, ~snBus, \group, ~compGrp2,\out,0),

	/*~toUse,*/




],1).play(t, quant:1)



)

