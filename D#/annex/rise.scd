SynthDef(\rise,






Out.ar(0, car);).play




{ LeakDC.ar(Shaper.ar(~tfBuf, SinOsc.ar(Saw.ar(MouseY.kr(0.3,30),-1,0.2).range(100,500))))}.play





	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1=1,f2=1,f3=1, vlAtk=0,atk=2, dec=5,atkE=0  ,dur=10 ,out =0 ,tS=1 ,moduR,moduS,fS=3, fR=0,atk2=0.05 ,dec2   =1;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,0,dur*0],[16,0,0-16]),timeScale: t.beatDur,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))

			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod + (In.kr(~bus1/*moduS*/,1)/** EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS )*/))))* env * amp;
	/*car = Pan2.ar(car, pan);*/
	Out.ar(out, car);
}).add;

Pbind(\instrument, \rise, \dur,Pfunc({exprand(8, 32.0)}),
	\vlAtk,Pfunc({exprand(0.001, 4)}), \index,Pfunc({exprand(0.001, 8)}),\iScale,Pfunc({exprand(0.001, 4)}),
			\atk,Pfunc({exprand(0.1, 16.0)}) ,\dec,Pfunc({exprand(0.1, 16.0)}),
			\ic_atk, Pfunc({rrand(-3, 4.0)}),\ic_rel,Pfunc({rrand(-3, 4.0)}),


	\f2,Pfunc({rrand(0, 4.0)}),\f1,Pfunc({rrand(0, 4.0)}),\f3,Pfunc({rrand(0, 4.0)}),

	\atk2,Pfunc({rrand(0.1, 2.0)}),
).play(t)

	SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


Pbind(\instrument, \lfo,\out,~bus1,\val,Pfunc({rrand(0.0001,~hz1beat)}),\rL,Pfunc({rrand(0,-560)}),\rH,Pfunc({rrand(0,560)}),\ph,Pfunc({6.rand}),\dur,Pfunc({exprand(8, 32.0)})).play(t)



({})


	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1=1,f2=1,f3=1, vlAtk=0,atk=2, dec=5,atkE=0  ,dur=10 ,out =0 ,tS=1 ,moduR,moduS,fS=3, fR=0,atk2=0.05 ,dec2   =1,ph, val = (~hzQbeat), rL=1,rH=0.4 ;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,0,dur*0],[16,0,0-16]),timeScale: t.beatDur,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))

			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod +


		// (In.kr(~bus1/*moduS*/,1)/** EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS )*/)


	LFTri.ar(val,ph).range(rL,rH)


	)))* env * amp;
	car = Pan2.ar(car, pan);



	Out.ar(out, car);
}).add;

Pbind(\instrument, \rise, \dur,Pfunc({exprand(8, 32.0)}),
	\vlAtk,Pfunc({exprand(0.001, 4)}), \index,Pfunc({exprand(0.001, 8)}),\iScale,Pfunc({exprand(0.001, 4)}),
			\atk,Pfunc({exprand(0.1, 16.0)}) ,\dec,Pfunc({exprand(0.1, 16.0)}),
			\ic_atk, Pfunc({rrand(-3, 4.0)}),\ic_rel,Pfunc({rrand(-3, 4.0)}),


	\f2,Pfunc({rrand(0, 4.0)}),\f1,Pfunc({rrand(0, 4.0)}),\f3,Pfunc({rrand(0, 4.0)}),

	\atk2,Pfunc({rrand(0.1, 2.0)}),

	\val,Pfunc({rrand(0.0001,~hz1beat)}),\rL,Pfunc({rrand(0,-800)}),\rH,Pfunc({rrand(0,800)}),\ph,Pfunc({6.rand})




).play(t)

	SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


Pbind(\instrument, \lfo,\out,~bus1,\val,Pfunc({rrand(0.0001,~hz1beat)}),\rL,Pfunc({rrand(0,-560)}),\rH,Pfunc({rrand(0,560)}),\ph,Pfunc({6.rand}),\dur,Pfunc({exprand(8, 32.0)})).play(t)


