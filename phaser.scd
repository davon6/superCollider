

SynthDef(\phas,{|in, out, rate, dur maxDlT =0.0968,decT=1,amp=0.4| Out.ar(out, LFPulse.ar(432,mul: EnvGen.kr(Env.perc(releaseTime: dur)))+ AllpassN.ar(LFPulse.ar(432,mul: EnvGen.kr(Env.perc(releaseTime: dur),doneAction: 2))
		,maxDlT,SinOsc.kr(Lag.kr(MouseX.kr(1.2875,0.00000005)),0,0.01,0.01),decT)*amp);}).add;





SynthDef(\phas,{|in, out, rate, value, dur maxDlT =0.0968,decT=1,amp=0.4| Out.ar(out, LFPulse.ar(108,mul: EnvGen.kr(Env.perc(releaseTime: dur)))+ AllpassN.ar(LFPulse.ar(108,mul: EnvGen.kr(Env.perc(releaseTime: dur),doneAction: 2))
		,maxDlT,SinOsc.kr(value,0,0.01,0.01),decT)*amp);}).add;

Pbindef(\a, \instrument, \phas,\dur ,Pseq([1/1],inf),\value, Pfunc({1.2875.exprand(0.075)}),\amp,Pfunc({1.exprand(0.075)}),\decT,
	 Pfunc({0.7744.exprand(0.0424)})
).play(t)


SynthDef(\phaser,{|in, out, rate, value, dur maxDlT =0.0968,decT=1,amp=0.4| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1)
		,maxDlT,SinOsc.kr(value,0,0.01,0.01),decT)*amp);}).add;




Pbindef(\a, \dur ,Pseq([1/1],inf)).play(t)

(

MIDIdef.cc(\d, {|value|var modFreq = value.linlin(0, 127, 0.01, 1);


	//
Pbindef(\a,  \amp ,  modFreq.round(0.01).postln);


},ccNum: 17);  //13



MIDIdef.cc(\q, {|value|var modFreq = value.linlin(0, 127, 0.01, 4);



Pbindef(\a,  \maxDlT ,  modFreq.round(0.01).postln);


},ccNum: 72);  //16


MIDIdef.cc(\s, {|value|var modFreq = value.linlin(0, 127, 0.01, 4);


	Pbindef(\a,  \decT ,  modFreq.round(0.01).postln);


},ccNum: 18);  //10


)
s.plotTree



SynthDef(\phaser,{|in, out, rate, maxDlT =0.0968| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1)
		,maxDlT,SinOsc.kr(Lag.kr(MouseX.kr(1.2875,0.00000005)),0,0.01,0.01),0.1)*0.4);}).add;






