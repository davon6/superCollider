
Ppar([

Pbind(\instrument,\gran,\dur,Pseq([16/1],inf),
/*\type, Pseq([\rest, \note,\rest,\note, \note,\note,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~distoBus12,\gate, 1,\duration,Pkey(\dur),\impulse,0.002,

		\pos,  Pfunc({0.99999.rand.postln })              ),



	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus12 , \out,~reverbBus12 ,\group, ~distoGrp),


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus12  , \out,~limitFuzz12/*~comFuzz12*/ ,\group,~revGrp),

/*~buf.play*/

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comFuzz12 ,\ctrl, ~kbus, \out,/*~limitFuzz12*/0, \group, ~compGrp),

	Pbind(\instrument, \limiter,\in, ~limitFuzz12, \dur, inf,\gain,46,\group,~limitGrp,\out,~stereoBus12),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus12   ,\out,0/*~no2*/, \group, ~stereoGrp)],1).play(t)