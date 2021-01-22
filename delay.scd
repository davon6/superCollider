(
s = Server.local;
s.waitForBoot({








b = Buffer.alloc(s, 44100 * 4, 2);

SynthDef("help-PingPong", { |out = 0, bufnum = 0, feedback = 0.5, delayTime = 2|
    var left, right, src;

		//src = SinOsc.ar(864,mul:EnvGen.kr(Env([0.04,0],[0.3872,0],-3),doneAction:2));


 /*   left = Decay2.ar(Impulse.ar(0.7, 0.25), 0.01, 0.25,
        SinOsc.ar(SinOsc.kr(3.7,0,200,500)));*/

	 left =	SinOsc.ar(864,mul:EnvGen.kr(Env([0.04,0],[0.3872,0],-3)));

   /* right = Decay2.ar(Impulse.ar(0.5, 0.25), 0.01, 0.25,
        Resonz.ar(PinkNoise.ar(4), SinOsc.kr(2.7,0,1000,2500), 0.2));*/

    Out.ar(out ,
			PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
    )
}).play(s, [\out, 0, \bufnum, b.bufnum, \feedback, 0.5, \delayTime,0.3]);

})
)


{Impulse.ar(0.7, 0.25)}.play

{ Decay2.ar(Impulse.ar(0.5, 0.25), 0.01, 0.25,
        Resonz.ar(PinkNoise.ar(4), SinOsc.kr(2.7,0,1000,2500), 0.2));}.play


{Decay2.ar(Impulse.ar(0.7, 0.25), 0.01, 0.25,
        SinOsc.ar(SinOsc.kr(3.7,0,200,500)));}.play