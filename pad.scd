

~extraDelay = Group.new;
~revGrp = Group.after(~extraDelay);
~recGrp2= Group.after(~revGrp);


(
SynthDef(\chord,{

	Out.ar(~delayToLimit,
		BHiPass4.ar((Saw.ar(64.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
		Saw.ar(67.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
			Saw.ar(63.midicps+EnvGen.kr(Env([50,0],[20],-5)))),MouseY.kr(100,12000),0.8)*0.06)
}).play)




Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay).play(t)




~rev2= Synth( \reverbMad,~churcx,    ~revGrp );
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,2,\revtime, 10.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)



a= Synth( \reverbMad,~churcx,    ~extraDelay );
a.set( \in,~delayToLimit  , \out,0 /*~delayBus2*/,\taillevel,2,\revtime, 10.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)


Pbind(\instrument,\recLoopS,\buf,~pad,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)
~pad.play

(
c = {
	var sig = In.ar(0, 12);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(~rev2, outbus: 0, addAction: \addAfter);
)

z = s.scope(2, index: 0).style_(2).yZoom_(16);

SinOsc

~rev2=Synth( \reverbS ,~revRnd[2],~revGrp);

~rev2.set( \in, ~delayToLimit , \out, 0,\room, 0.33, \mix,1, \damp, 0.03);

FreeVerb



({FreeVerb.ar(Saw.ar(216,EnvGen.kr(Env.perc(releaseTime: 0.3))),
	mix: 0.33,room:1 ,damp: 0.03
)}.play)