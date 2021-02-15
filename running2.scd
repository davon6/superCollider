

(

~gateGrp = Group.new;

~filterGrp =  Group.after(~gateGrp);

~revGrp = Group.after(~filterGrp);

~compGrp = Group.after(~revGrp);

~limitGrp = Group.after(~compGrp);

o = {
		Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));



	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 5.15,0.321875	]
	)    *  SinOsc.kr(0.64375).range(0.01005859375,1.2875)).range(2637.02,10.3),);

	Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.64375).range(0.01005859375,1.2875)).range(5274.04,82.41),);


	Out.kr(~bus6, SinOsc.ar(1.2875).range(0.8,0.4));
	Out.kr(~bus7, SinOsc.ar(0.321875).range(1,0.4));



}.play


)

(
~gate.free;
~gate = Pbind(\instrument,\gate, \dur,Pwrand([Pseq([1/4],Prand([1,4,16,64],1)),Pseq([1/1],Prand([1,4],1)),Pseq([1/3],Prand([1,3,12],1)) ],[4,1,1],Prand([1,4,16],1))
	,\in, ~gateBus, \atkT,0,\bus1,~bus1,\out,~filterBus2,\group, ~gateGrp);
)

(

Ppar([

	// Pseq([~kick],inf),

	Pseq([Pbindf(~kick,\out,~kbus)],4096),

Pbind(\instrument,\lead,\dur,Pseq([4096/1],1), \freq,659.255,\out,~gateBus),

	Pseq([~gate],inf),

	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus2,\which,2,\busHP, ~bus5,\bus7,~bus7, \out, 0, \group,~filterGrp ),







	Pbind(\instrument, \filter, \dur,Pseq([4096/1],1), \in,~filterBus,\busLP, ~bus4,\rqLPF,~bus6, \out, ~reverbBus, \group,~filterGrp ),
	Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,Pxrand([Pseq([1/4],4096),  Pseq([1/1],4096)],1), \damping,Pxrand([0.22,0.8,0.4 ],1), \inputbw, 1, \drylevel, -20, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,Pwrand([1,10,40],[4,16,1],1),\wet,Pxrand([0.05,0.1],1),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp ),
	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/
,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\gain,124,\group,~limitGrp,\out,0),


],1).play(t)



)