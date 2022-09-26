SinOsc.kr


({SoundIn.ar(0).poll}.play )


0.837722

-0.000898704



SynthDef(\melo,{|out=0|Out.ar(out,Saw.ar(In.kr(~busC4)+SoundIn.ar(0).linlin(-0.000898704,0.837722,50,850).poll))}).add;



SynthDef(\melo,{|out=0|Out.ar(out,Saw.ar(In.kr(~busC4)/*+SoundIn.ar(0).linlin(-0.000898704,0.837722,50,850)*/))}).add;




SynthDef(\melo,{|out=0|Out.ar(out,Saw.ar(In.kr(~busC4))*



	EnvGen.kr(Env.perc,timeScale: t.beatDur,doneAction: 2)
)}).add;






SynthDef(\melo,{|out=0|Out.ar(out,


	FreqShift.ar(
	Saw.ar(
	[
	In.kr(~busC4)
				*EnvGen.kr(Env.perc(curve: -7),timeScale: t.beatDur,doneAction: 2).range(1,MouseX.kr(4,0.9)),
		(In.kr(~busC4)-30)
				*EnvGen.kr(Env.perc(curve: -7),timeScale: t.beatDur,doneAction: 2).range(1,MouseX.kr(4,0.9))

	]

			+   Lag.kr(LFDNoise0.kr(7).range(-880,180) ,0.4)  /* MouseY.kr(-880,1080) */        )
	,

	/*	LFTri.kr(0.5°.range(-50,300)+*/ LFDNoise0.kr(0.5).range(100,999))


	*



	EnvGen.kr(Env.perc(releaseTime: MouseX.kr(0.2,3)),timeScale: t.beatDur,doneAction: 2)
)}).add;


SynthDef(\lfoStepMelo, {|out, dur, midinote| Out.kr(out,EnvGen.kr(Env.step([midinote.midicps,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

(
a = (60..71);
b = (75..86);

/*a = (30..41);
b = (45..56);*/




// randomly exchange one pitch of array
p = PSrecur({ |x|
	x[0][(0..2).choose] = (a.asSet - x[0].asSet).choose;
	x[0]
	// random start
}, 1, start: [a.scramble[0..2]]);

q = PSrecur({ |x|
	x[0][(0..4).choose] = (b.asSet - x[0].asSet).choose;
	x[0]
}, 1, start: [b.scramble[0..4]]);

x = Prand([


Pbind(\instrument,
	\lfoStepMelo, \dur,0.25 ,\group,~g2,\out,~busC4,
		\midinote,	/*Pfunc({Scale.minor(\just).degreeToFreq(7.rand, 73.midicps, -3).cpsmidi}),Scale.minor(\just).degreeToFreq(7.rand, 73.midicps, -2).cpsmidi,Scale.minor(\just).degreeToFreq(7.rand, 73.midicps, -3).cpsmidi*//*],inf) ,
*/



Pseq([p.flatten, q.flatten], inf),\legato, Pseq([0.25, 1.0,0.75].scramble, inf)
)
,

	/*Pbind(\instrument,
	\lfoStepMelo, \dur,0.33,\group,~g1,\out,~busC4,
	\midinote, Pn(Pshuf(~chords+60))/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
),



Pbind(\instrument,
		\lfoStepMelo, \dur,Pseq([0.25],inf) ,\group,~g1,\out,~busC4,
	\midinote, Pseq([p.flatten, q.flatten], inf)/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
)
,

	Pbind(\instrument,
		\lfoStepMelo, \dur,Pseq([0.25],inf) ,\group,~g1,\out,~busC4,
	\midinote, Pn(Pshuf(~chords+60))/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
)*/


],inf).play(t)
);

 ~chords =[[0,1,3,4],[0,1,3,7], [0,2,3,4], [0,5,1,4]];
~busC4= Bus.control(s);
~bus10A=Bus.audio(s)
;
~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g4=Group.after(~g3);


Pbind(\instrument,\melo,\dur,0.25,\group,~g1).play(t)


Synth(\melo,[\out:0],target: ~g1)


	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/3],3),   Pseq([1/1],8), Pseq([2/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],inf) ,    \group,~g3, \out,0/*~bus4A*/,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pfunc({0.7.exprand(0.4,1)})/*Pkey(\vlSub)*/,\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
	\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})).play(t)






