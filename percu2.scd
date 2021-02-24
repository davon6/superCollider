(
SynthDef.new(\cymb, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel,1,-1.4), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -2), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.05;



	car2 = WhiteNoise.ar(modAmp) * env2 ;

	sig = HPF.ar(car+car2!2,3000)* [amp+0.00555,amp];

	Out.ar(0, sig);
}).add;





SynthDef.new(\percu2, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=0.3872, amp=0.2, pan=0,rel2= 1.1616;
	var car, mod, env, car2, mod2, mod3,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, 0.0484, 1, -1), doneAction:2);

	mod = SinOsc.ar(exprand(20,10000), mul:rrand(0, 10000).postln);
	car = SinOsc.ar(exprand(20,10000) + mod) * env * 0.05;



car2 = WhiteNoise.ar(0.12875) * env2 ;

	sig = HPF.ar(car+car2,3000)!2* [amp,amp+0.007];


	Out.ar(0, sig );
}).add;


SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=1, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;

	env = EnvGen.kr(Env.perc(0, rel,curve:-3), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0, 2, 1, -0 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0,HPF.ar( car+car2!2* amp ,500));
}).add;



SynthDef.new(\hit, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * amp;
	car = HPF.ar(Pan2.ar(car, pan),100);
	Out.ar(0, car);
}).add;


SynthDef(\wNoise, {

	arg in=0, dec=1.5, mix=0.2, lpf1=2000, lpf2= 6000, predel=0.000003,out=0, maxdelaytime=0.000001, amp = 0.0042, sub =1,sub2 =3, valStart= 10000,valEnd =100, wFil=1;
	var env,dry, wet, sig,env2, ori;

	env = EnvGen.kr(Env([1,1,0],[0,sub,0]));

	env2 = EnvGen.kr(Env([1,1,0],[0,sub2,0]),doneAction:2);

	ori =  SelectX.ar(wFil,[LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3)),HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3))]);







	dry = ori;
	wet = ori;


	wet = DelayN.ar(wet, maxdelaytime, predel.clip(0.0001,0.5));
	wet = 16.collect{
		var temp;
		temp = CombL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,0.04)}!2).exprange(0.02,0.999),
			dec
		);
		temp = LPF.ar(temp, lpf1);
	}.sum * 0.25;
	8.do{
		wet = AllpassL.ar(
			wet,
			0.1,
			LFNoise1.kr({ExpRand(0.02,04)}!2).exprange(0.02,0.999),
			dec
		);
	};
	wet = LeakDC.ar(wet);
	wet = LPF.ar(wet, lpf2, 0.5);
	sig = dry.blend(wet,mix);



	Out.ar(out,HPF.ar(sig,100)* env2 *amp

    )
}).add;

)

Synth(\wNoise,[\wet,0,\sub, 0.3872,\valStart,1000,  \valEnd,300,\sub2,0.5,\wFil,0])


Synth(\cymb)
(





Synth(\hit, [
	\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
]);
)

~u = Ppar([Pseq([Pdef(\wNoise2),~cMon2b],1),~bar16,Pdef(\sn)],inf).play(t);






(
var freq = 525.12070612224, freq2 = 1899.3343179398, modAmp = 0.12875 ;

/*\type, Pseq([\rest,\rest,\rest,\rest,\note,\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\note,\rest,[\note,\note],\note,\rest,\rest,\rest], inf),*/
Pdef(\wNoise2,
	Pbind(
		\instrument, \wNoise,
	\dur, Pseq([1/4], 16),
		//\type, Pseq([\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest], inf),
		\type, Pseq([\rest,\rest,\rest,\rest,\note,\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\note,\rest,[\note,\note],\note,\rest,\rest,\rest], inf),
\wet,0,\sub, 0.3872,\valStart,1000,  \valEnd,300,\sub2,0.5,\wFil,0


));



Pdef(\wNoise,
	Pbind(
		\instrument, \wNoise,
	\dur, Pseq([1/1], 1),
		\amp,0.08



));




Pdef(\hit,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 2),
		\dur, Pseq([2/1], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, 0.006,//exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan,rand(-1.0, 1.0),
	)
);
Pdef(\hit2,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest,\rest,\rest ,\rest, \rest], 1),
		\dur, Pseq([1/1], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, 0.006,//exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);
Pdef(\hit3,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest], 7),
		\dur, Pseq([1/2], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);
Pdef(\hit4,
  Pbind(
	\instrument, \hit,
	\type, Pseq([\note,\rest ,\rest, \rest], 7),
		\dur, Pseq([1/2], inf),
		\carHz, exprand(20,10000).postln,
	\modHz, exprand(20,10000).postln,
	\modAmp, rrand(0, 10000).postln,
	\amp, exprand(0.1, 0.5),
	\atk, exprand(0.001, 0.05),
	\rel,exprand(0.05, 1.2),
	\pan, rrand(-1.0, 1.0),
)
);


Pdef(\e8,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],32 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.08
	);
);

Pdef(\sn8,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 4),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));



Pdef(\d8,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 32),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.08

	//\rel,2,

	));




Pdef(\e15,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],60 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.02
	);
);

Pdef(\sn15,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 7),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));



Pdef(\d15,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 60),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.062

	//\rel,2,

	));




Pdef(\e,
	   Pbind(
	\instrument, \cymb,
		\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),//\type, Pseq([\rest,\rest ,\note, \note,\rest,\note ,\note, \rest], inf),
	\dur,  Pseq([1/4],64 ),
	\rel, 0.3872,
	\rel2,0.0968,


	\carHz, 525.12070612224,
	\modHz,1899.3343179398,
	\modAmp, 0.12875 ,
		\amp,0.08
	);
);
Pdef(\d,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], 64),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420,
		\amp, 0.08

	//\rel,2,

	));
Pdef(\sn,
	Pbind(
		\instrument, \snare,
	\carHz, 41.2 ,

		\type, Pseq([\rest,\rest ,\note, \rest], 8),
	\atk, 0.00502929687,
	\rel, 0.0968,//0.04840
	\rel2,0.7744,//0.0968
		\dur, Pseq([1/2], inf),
		\amp,0.04

	));


)
s.plotTree
Safety(s).disable;
Safety(s).enabled;
	/*THIS WAY*/
(
q = Pdef(\p).play(t);
d = Pdef(\d).play(t);
c = Pdef(\sn).play(t);
~infPlayer = Pseq([~bassAndKick],inf).play(t);

)
~bar16.play(t)

/*START WITH THIS ONE*/
~ens = Ppar([Pdef(\d),Pdef(\e),Pdef(\sn),~bar15],inf).play(t);//lol atart ok THIS ONE
~ens15Cym = Pseq([Ppar([Pdef(\e15),~bar15],1),~bassRest],inf).play(t);//15 cymbal
~ens15Hat = Pseq([Ppar([Pdef(\d15),~bar15],1),~bassRest],inf).play(t);
~ens15Perc = Pseq([Ppar([Pdef(\d15),Pdef(\e15),Pdef(\sn15),~bar15],1),~bassRest],1).play(t);
~ens = Ppar([Pdef(\t),Pdef(\p),Pdef(\sn),~bar15],1).play(t);
//15 bar percu to come

//~bassRest can be used at start too
~ens = Ppar([Pdef(\t),Pdef(\sn),~bar15],inf).play(t);//lol atart ok
~seq = Ppar([Pdef(\c),Pdef(\b),Pdef(\a),~bar16],1).play(t);
~ens = Ppar([Pdef(\t),Pdef(\p),Pdef(\sn),~bar15,Pdef(\c),Pdef(\b),Pdef(\a)],inf).play(t);//lol atart ok
~ens = Ppar([Pdef(\d),~bar16,Pdef(\sn)],inf).play(t);

~infPlayer.stop
q.stop;d.stop;c.stop
