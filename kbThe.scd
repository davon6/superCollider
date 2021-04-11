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
		\dur, Pseq([1/4],3),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.98,
		\rel2, t.beatDur/4 * 0.0012,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4
		,\amp,(-14.6)/*(-13)*/,\out,~bassEq
	);




(
Ppar([

	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),


	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	~bassShap, Ppar([~hat2,~kick,/*~bassZ*/],1),

],1).play(t);
x = Synth(\recLoop,[buf:~k2,\recording,1, \in,0/*~toRecord*/],~recGrp2);
)


Pseq([~k2,~b3],inf).play

~k2.play
~b3.play

Ppar([
Ppar([

	Pbind( \instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,8400),
Pseq([
				Pbind(\instrument, \wNoise,\dur,Pseq([1/4],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  ),
		Pbind( \instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([3/4],1), \tS,  0.39550810372374,\buf,~b3,\out, ~kbToPan2,\loopy,0,\start,8400)],1)],inf),
Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf)
],1).play(t)


~eqGrp=Group.new;
~recGrp2=Group.after(~eqGrp);

Ppar([~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30))],1).play(t) ;/*Pbindf(~kick,\out,~toRecord).play(t);*/
