SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.001,0.008,0.1,0,0.08],
				\exp
			)
		);

		env =EnvGen.ar(
	Env([1 , 0.4, 1,    1,1,0],
		[0.008, 0.08, 0,0.006,0.09],[-2,-30,5,5,-5]),doneAction:2);
	//EnvGen.ar(Env.perc(0, 0.40),doneAction:2);


		sig =
		//BPeakEQ.ar(
		// BPeakEQ.ar(
		//BPeakEQ.ar(
			SinOsc.ar(envF, mul: env);
			// ,41.2, 4,4)
//,1318.51,4, (-8));
		//,659.255,16, (-4));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;


~bassZ = Pbindef(\bass,
		\instrument, \bass,
		\type, Pseq([\note, \note, \note, \note], inf),
		\cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([1/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur*4 * 0.996,/*\rel, t.beatDur/4 * 0.98,*/
		\rel2, t.beatDur/4 * 0.0012,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4
		,\amp,(-13)/*(-13)*/,\out,~bassEq
	);




(//BASS ALONE
Ppar([

	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	~bassShap, Ppar([/*~hat2,~kick,*/~bassZ],1),

],1).play(t);
x = Synth(\recLoop,[buf:~b3,\recording,1, \in,0/*~toRecord*/],~recGrp2);
)
~b3.play
(
Ppar([
	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

Pbindef( \kbRec, \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0,\loopy,0,\start,7980),

	Ppar([~snare,~cymbal,~hat],inf),


		Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareLimit),

	Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\group, ~stereoGrp),


	/*	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~hatEq,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~cymbalEq,\group, ~compGrp),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~compGrp2, \out , 0,\vol,4),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~compGrp2,\out , 0,\vol,4),*/
],1).play(t))


Pbindef( \kbRec,\start,7980);
s.plotTree
Pbindef( \kbRec,\vl,0.4)//Just for last night
Pseq([~k2,~b3],inf).play
~kb2.play
~k2.play
~b3.play
(
~eqGrp=Group.new;
~stereoGrp=Group.after(~eqGrp);
~recGrp2=Group.after(~stereoGrp);
)
// Ppar([
Pbindef( \kiki,\start,8220);
Pbindef(\baba, \subsT ,Pseq([0,0.03,0.05],inf))
Pbindef( \baba,\start,8760);


(
Ppar([
	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),


	Pbindef( \kiki,\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,8220),

Pseq([Pbind(\instrument, \wNoise,\dur,Pseq([1/4],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  ),
		Pbindef( \baba, \instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/4],3), \tS,  0.39550810372374,\buf,~b3,\out, ~kbToPan2,\loopy,0,\start,8760,  \decT,0.95,\subsT ,Pseq([0,0.03,0.05],inf))],inf),
Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

Ppar([~snare,~cymbal,~hat],inf),


		/*Pbind(\instrument , \EQHP96, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareLimit),

	Pbind(\instrument , \limiter,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp,\out,~toPan2),

	Pbind(\instrument, \pan2,\in, ~toPan2,\dur, inf,\group, ~limitGrp,\group, ~stereoGrp),



	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~hatEq,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~cymbalEq,\group, ~compGrp),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~compGrp2, \out , 0,\vol,4),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~compGrp2,\out , 0,\vol,4),*/


],1).play(t);
x = Synth(\recLoopS,[buf:~kb2,\recording,1, \in,0/*~toRecord*/],~recGrp2);
)
~eqGrp=Group.new;
~recGrp2=Group.after(~eqGrp);

Ppar([~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30))],1).play(t) ;/*Pbindf(~kick,\out,~toRecord).play(t);*/
