({})

INSERT A RELEASE MAYBE 2 FM


	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=6, rel=3, pan=0, f1=1,f2=1,f3=1, vlAtk=0,atk=2, dec=5,atkE=0  ,dur=10 ,out =0 ,tS=1 ,moduR,moduS,fS=3, fR=0,atk2=0.05 ,dec2   =1,ph, val = (~hzQbeat), rL=1,rH=0.4 ;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,rel*dur,dur*0],[4,0,-16]),timeScale: t.beatDur,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))

			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod+


		// (In.kr(~bus1/*moduS*/,1)/* * EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS )*/)


	LFTri.ar(val,1/*ph*/).range(rL,rH)


	)).round(2**(-16)))* env * amp;
	car = Pan2.ar(car, pan);



	Out.ar(out, car);
}).add;

Pbind(\instrument, \rise, \dur,Pfunc({/*exprand(8, 32.0) */exprand(32, 128.0)   }),
	\vlAtk,Pfunc({exprand(0.001, 4)}), \index,Pfunc({exprand(0.001, 80)}),\iScale,Pfunc({exprand(0.001, 4)}),
			\atk,Pfunc({exprand(0.1, 16.0)}) ,\dec,Pfunc({exprand(0.1, 16.0)}),
			\ic_atk, Pfunc({rrand(-3, 4.0)}),\ic_rel,Pfunc({rrand(-3, 4.0)}),


	\f2,Pfunc({rrand(0, 4.0)}),\f1,Pfunc({rrand(0, 4.0)}),\f3,Pfunc({rrand(0, 4.0)}),

	\atk2,Pfunc({rrand(0.1, 2.0)}),

	\val,0.03/*Pfunc({rrand(0.0001,~hz1beat)})*/,\rL,Pfunc({rrand(0,-800)}),\rH,Pfunc({rrand(0,800)}),\ph,Pfunc({6.rand}),

	\rel,Pfunc({exprand(0.01, 2)}),\freq,Pfunc({1200.rand})
).play(t);

	SynthDef(\lfo2, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


Pbind(\instrument, \lfo2,\out,~bus1,\val,Pfunc({rrand(0.0001,~hz1beat)}),\rL,Pfunc({rrand(0,-1560)}),\rH,Pfunc({rrand(0,1560)}),\ph,Pfunc({6.rand}),\dur,Pfunc({exprand(8, 32.0)})).play(t)


( {EnvGen.kr(Env([0,1,1,0],[1,1,4,0],[16,0,-16]),timeScale: t.beatDur,doneAction: 2)}.plot(duration:4))

env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,0,dur*0],[16,0,0-16]),timeScale: t.beatDur,doneAction: 2);



(
SynthDef(\bubbles, {

	var sig, trig, gainEnv, freqEnv, freq, noise;

	trig = Maths2.ar(\rise.kr(0.1), \fall.kr(0.005), \linExp.kr(0.5))[1];

	gainEnv = EnvGen.ar(Env([0, 1, 0], [\atk.kr(0.001), \rel.kr(0.4)], [4.0, -2.0]), doneAction: Done.freeSelf);
	freqEnv = Maths2.ar(0.1, 0.005, 0.9, 0, 1, trig)[0];

	noise = WhiteNoise.ar(1).range(1, \freqEnvAmount.kr(25));
	noise = Latch.ar(noise, trig);
	freqEnv = noise * freqEnv * PinkNoise.ar(1!2).range(0.1, 1.0).lag(0.1);
	freq = \freq.kr(440) * freqEnv;

	sig = Squine.ar(freq

		+ Line.kr(0,3600,32)

		, clip:0.0, skew: 0.0);

	sig = BPF.ar(sig, \ffreq.kr(70), \rq.kr(0.1));
	sig = HPF.ar(sig, 500);

	sig = sig * 40.dbamp;

	sig = sig * gainEnv * \amp.kr(0.25);

	sig = Splay.ar(sig);

	//sig = DelayC.ar([sig], SinOsc.ar(0.3, [0, 1, 2] * 2pi / 3).linlin(-1, 1, 0, 5e-3)).sum;

	sig = LeakDC.ar(sig);
	// sig = SafetyLimiter.ar(sig);
	Out.ar(\out.kr(0), sig);
}).add;
)

(
Pdef(\bubbles,
	Pbind(
		\instrument, \bubbles,

		\legato,4 ,//0.8,
		\dur, Pfunc { 2 + bilinrand(0.6) },

		\rise,6, /*0.1,*/
		\fall, Pexprand(1,8),/*0.005, 0.01),*/
		\linExp, Pwhite(1,15),/*0.1, 0.4),*/

		\atk, 0.001,
		\rel, 91.2,

		\fAtk, 0.1,
		\fRel, 0.3,
		\freqEnvAmount,145,/* 25,*/

		\freq, 40,
		\ffreq, Pfunc { 30 + bilinrand(12) },//Pfunc { 70 + bilinrand(20) },
		\rq, 0.1,

		\amp, 0.25,
		\out, 0,
	);
).play;
)