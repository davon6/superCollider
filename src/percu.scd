s.boot;

(
SynthDef.new(\percu, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(0, car);
}).add;
)

(
Synth(\percu, [
	\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
]);
)



(
SynthDef.new(\cymb, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;
	env = EnvGen.kr(Env.perc(atk, rel,1,-1.4), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -2), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.05;



	car2 = WhiteNoise.ar(modAmp) * env2 ;



	Out.ar(0, HPF.ar([car,car2]!2,3000));
}).add;





SynthDef.new(\percu2, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2, mod3,env2;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, 0.0968, 1, -1), doneAction:2);

	mod = SinOsc.ar(exprand(20,10000), mul:rrand(0, 10000).postln);
	car = SinOsc.ar(exprand(20,10000) + mod) * env * 0.05;



car2 = WhiteNoise.ar(0.12875) * env2 ;




	Out.ar(0, HPF.ar([car,car2]!2,3000));
}).add;


SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=1, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;

	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -3 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0,HPF.ar( [car,car2]!2* modAmp ,500));
}).add;



)


(
Synth(\percu2, [
	\carHz, 164.81,
	\modHz, 164.81,
	\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
	//\rel,2,
]);
)



{SinOsc.ar(555) }.play


s.defaultGroup.deepFree;


Env.perc(0, 0.04840).plot





(
Pdef(
	\rhytm,
	Pbind(
		\instrument, \percu2,
	\carHz, 659.25,
	\modHz, 2637.02 ,
	\modAmp, 10500,
	\atk, 0,
	\rel,0.0968,//0.0484,//0.02420,
	\rel2,0.3872,//193.6,//96.8,
		\dur, Pseq([1/16], inf),
			\stretch, 1.6456277727114


	);
).play;
)





Env.perc(0.00502929687, 0.1936,1,-2).plot

Env.perc(0.001, 0.0968, 1, -1).plot



{WhiteNoise.ar(0.25)}.play;

(
Pdef(
	\rhytm,
	Pbind(
		\instrument, \cymb,
	\carHz, 525.12070612224,
	\modHz, 1899.3343179398 ,
	\modAmp, 0.12875,//3727,
	\atk, 0.00502929687,
	\rel, 0.3872, //0.1936,//0.04840
	\rel2,0.0968,//0.0968
		\dur, Pseq([1/4], inf),
			\stretch, 1.6456277727114


	);
).play;
)






t = TempoClock.new(151.703592/60).permanent_(true);





(
var freq = 525.12070612224, freq2 = 1899.3343179398, modAmp = 0.12875 ;








Pdef(\p,



	   Pbind(
	\instrument, \cymb,
	\dur,  Pseq([1/2], inf),
	\rel, 0.3872,
	\rel2,0.0968,
	\carHz, Pseq([0,0,freq,freq,0,freq,freq,0],inf),
	\modHz,Pseq([0,0,freq2,freq2,0,freq2,freq2,0],inf),
	\modAmp, Pseq([0,0,modAmp,modAmp,0,modAmp,modAmp,0],inf),
	)
);
Pdef(\d,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], inf),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420
	//\rel,2,

	));
Pdef(\c,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,
		\modHz, Pseq([0,164.81 ],inf) ,
		\modAmp,Pseq([0, 0.6],inf),//3727,
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([4/2], inf),

	));
Pdef(\b,
	Pbind(
		\instrument, \bass,
		//\dur, Pseq([16/1], inf),

	)
	)

)

s.freeAll


	/*THIS WAY*/
(
q = Pdef(\p).play(t);
d = Pdef(\d).play(t);
c = Pdef(\c).play(t);
b = Pdef(\b).play(t);
k = Pdef(\k).play(t);

)
(
Pdef(\b,
	Pbind(
		\instrument, \bass,
		\freq, 41.2,
		\dur, Pseq([64/1], 1),
		\dure, 64

	)
	)


)


(
Pdef(\k,
	Pbind(
		\instrument, \kick,
		\dur, Pseq([1/1], 1024),

	)
	)


)


	q.stop;d.stop;c.stop

/*
SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -3 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0, [car,car2]!2);
}).add;
)
*/



q.stop



t.beats











Env.perc(0.001, 0.7744, 1, -2).plot



(
SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=8, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -3 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0, [car,car2]!2 );
}).add;
)
{WhiteNoise.ar(0.25)}.play;

(
Pdef(
	\rhytm,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2,
	\modHz, 164.81 ,
	\modAmp, 1691,//3727,
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
			\stretch, 1.6456277727114


	);
).play;
)
Mono