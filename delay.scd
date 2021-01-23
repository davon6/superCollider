


//HUUUGE use while
	Pseq([1/4],1).asCompileString.compare(Pseq([1/4],1).asCompileString)













~delay = Buffer.alloc(s, 44100 * 4, 2);
//~delayBus = Bus.ar(

SynthDef(\pingD, { |out = 0, bufnum = 0, feedback = 0.5, delayTime = 0.3|
    var left, right, src,sig3;


	 left =	SinOsc.ar(864,mul:EnvGen.kr(Env([0.04,0],[0.3872,0],-3),doneAction:2));


		//In.ar(in,1);

		sig3 = PingPong.ar(bufnum, [left,left], delayTime, feedback, 1);

    Out.ar(out ,sig3)
}).add;


	/*.play(s, [  */


	Synth(\ping, [ \out, 0, \bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3]);




{Impulse.ar(0.7, 0.25)}.play

{ Decay2.ar(Impulse.ar(0.5, 0.25), 0.01, 0.25,
        Resonz.ar(PinkNoise.ar(4), SinOsc.kr(2.7,0,1000,2500), 0.2));}.play


{Decay2.ar(Impulse.ar(0.7, 0.25), 0.01, 0.25,
        SinOsc.ar(SinOsc.kr(3.7,0,200,500)));}.play