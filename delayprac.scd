Server.default.options.outDevice_("Audient iD14");
s.boot;

~delay.free

~delayBus = Bus.audio(s,2);
~delay = Buffer.alloc(s, 48000 * 3, 2);

SynthDef(\bla, {|out| Out.ar(out, LFPulse.ar(216,mul: EnvGen.kr(Env.perc(releaseTime: 0.3),doneAction: 2))!2);}).add;




SynthDef(\pingD, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in, stereoL =0.00555, stereoR =0, dec=0.5, amp =1 |
    var left, right, src,sig3;

		left =	In.ar(in,2);

    Out.ar(out ,/*left +*/ (PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
		* [amp+stereoL,amp+stereoR]*2 * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) )
	}).add;



	"delay init".postln;



SynthDef(\delay,{|in, out, rate, maxDlT =0.0968| Out.ar(out, /*In.ar(in,1)+ */AllpassN.ar(In.ar(in,1)
		,maxDlT,rate,0,0.01,0.01),0.1*0.4);}).add;




Ppar([
Pbind(\instrument, \bla, \dur, Pseq([1/4],4) , \out, ~delayBus  ),

	Pbind(\instrument, \delay, \in, ~delayBus ,\rate, 1.3, \maxDlT,0.3, \dur, Pseq([64/4],4) )

],1).play(quant:1);


Ppar([
Pbind(\instrument, \bla, \dur, Pseq([1/4],16) , \out, ~delayBus  ),

	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, ~delay, \dur, Pseq([6400/4],1)/* ,\delayTime,3  ,\feedback, 1.5*/)

],1).play(quant:1);


