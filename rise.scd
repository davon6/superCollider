(








SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur   ;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],//middle was 10
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),doneAction:2
	);
	env = EnvGen.kr(Env.perc(atkE,50));
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 * iEnv);
	mod = SinOsc.ar(freq * f2 + mod2, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;



~fPo = { |x, y| sin(x) - (sin(y) * log(x * x + 1)) / 10 };

SynthDef(\trippyRise, {|out=0, ph=0,dur|
	var r = /*  MouseX.kr(0, 20.6); */  SinOsc.ar(0.075,ph).range(0, 20.6);
	// stereo expansion
	var phi = LFSaw.ar([50, 50.1], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
	Out.ar(out,Limiter.ar(~fPo.(x, y), 0.2)* EnvGen.kr(Env.step([1,1],[dur,0]),doneAction: 2));
}).add;








)


//DOnt forget that one// can be dowb shifter but only once in all project
Synth(\trippyRise,[\dur,90])




Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand})).play(t)

Pbind(\instrument,\rise,\dur,Pseq([16/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),

	\index,Pfunc({50.00.rrand(1)}),
	\mRatio,Pfunc({3.rrand(1).postln})
).play(t)

\out , LP
//start with lP slide in but all sequeunce en din the high filter , yee get high
//be nice to have little twise at the end
//down can be either dec or atk


//downshifter has no mRatio
Pbind(\instrument,\rise,\dur,Pseq([8/1],1),\dec,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),

	\index,Pfunc({50.00.rrand(1)}),

).play(t)



//simple one , up is better

Pbind(\instrument,\rise,\dur,Pseq([8/1],1),\dec,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand})).play(t)



~fPo = { |x, y| sin(x) - (sin(y) * log(x * x + 1)) / 10 };

// check the surface produced by the function with GeoGebra

// copy and paste this syntax into GeoGebra Input, it needs ln for the natural logarithm
// (sin(x) - (sin(y) * ln(x * x + 1))) / 10


// circular path through the terrain, mouse control for distance from origin

(
x = {
	var r = MouseX.kr(0, 20.6);
	// stereo expansion
	var phi = LFSaw.ar([50, 50.1], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
	Limiter.ar(~fPo.(x, y), 0.2)
}.play
)



(
SynthDef(\fm, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, atk=0.01, rel=3, pan=0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[index, index*iScale, index],
			[atk, rel],
			[ic_atk, ic_rel]
		)
	);
	env = EnvGen.kr(Env.perc(atk,rel),doneAction:2);
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);
	mod = SinOsc.ar(freq * mRatio + mod2, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)
Synth(\fm,[\rel, 3]);
