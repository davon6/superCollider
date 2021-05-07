

~extraDelay = Group.new;
~revGrp = Group.after(~extraDelay);


(
SynthDef(\chord,{

	Out.ar(~delayToLimit,
		BHiPass4.ar((Saw.ar(64.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
		Saw.ar(67.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
			Saw.ar(63.midicps+EnvGen.kr(Env([50,0],[20],-5)))),MouseY.kr(100,12000),0.8)*0.06)
}).play)




Pbind(\instrument, \pingD, \in, ~delayBus2 ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,0,\group,~revGrp).play(t)




~rev2= Synth( \reverbMad,~churcx,    ~extraDelay );
~rev2.set( \in,~delayToLimit  , \out, ~delayBus2,\taillevel,8,\revtime, 30.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)





~rev2=Synth( \reverbS ,~revRnd[2],~revGrp);

~rev2.set( \in, ~delayToLimit , \out, 0,\room, 0.33, \mix,1, \damp, 0.03);

FreeVerb



({FreeVerb.ar(Saw.ar(216,EnvGen.kr(Env.perc(releaseTime: 0.3))),
	mix: 0.33,room:1 ,damp: 0.03
)}.play)