/*Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comReverbBus2 ,\ctrl, ~kbus, \out,~limitReverbBus, \group, ~compGrp),

	Pbind( \instrument, \limiter,\in,~limitReverbBus, \dur,inf, \gain,40,\group,~limitGrp,\out ,~stereoReverbBus),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbBus, \spread,1,\group, ~stereoGrp),*/




Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,/*(70.3)*/1,\in, ~comReverbBus2 ,\ctrl, ~kbus, \out,~limitReverbBus2, \group, ~compGrp),


	Pbind( \instrument, \limiter,\in,~limitReverbBus2, \dur,inf, \gain,42,\group,~limitGrp,\out ,~stereoReverbBus2),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbBus2, \spread,1,\group, ~stereoGrp),


/*Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~comFuzzse  , \out,~comReverbBus1 ,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comReverbBus1 ,\ctrl, ~kbus, \out,~limitReverbBus, \group, ~compGrp),


Pbind( \instrument, \limiter,\in,~limitReverbSquelch, \dur,inf, \gain,36,\group,~limitGrp,\out ,~stereoReverbSquelch),
	Pbind( \instrument, \stereo, \dur, inf,\in, ~stereoReverbSquelch, \spread,0,\group, ~stereoGrp),*/