MIDIClient.init

MIDIIn.connectAll;
~notes = Array.newClear(128);

MIDIdef.noteOn(\piana,{arg vel, nn;
	[ nn].postln;
	~notes[nn] = Synth(\tone, [\freq, nn.midicps, \gate, 1
		,\amp, vel.linexp(1,127,0.01,0.3)
	]);
});

~bend =8192;

MIDIdef.noteOff(\offPiana, {arg vel, nn;nn.postln;
	~notes[nn].set(\gate,0);
	~notes[nn] = nil;
});


MIDIdef.bend(\twi, { |val, chan, src|
	[val,chan, src].postln;
~bend = val;

	~notes.do{arg synth; synth.set(\bend, val.linlin(0,16383,-2,2))};

	//~notes.set(\mod,modFreq.round(1).postln);
}, chan:  0);

SynthDef(\tone, {arg freq= 440, amp=0.3, gate=0, bend=0;var sig, env;
	sig = LFTri.ar(freq* bend.midiratio)!2;
	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);
	sig = sig * env* amp;
	Out.ar(0, sig)}).add;








MIDIdef.cc(\twi2, { |value|var modFreq = value.linlin(0, 127, 0, -100);

p.set(\mod,modFreq.round(1).postln);
},ccNum: 14);




p =(Synth(\tone, [\freq, 43.midicps, \gate, 1, \mod,0]));


s.plotTree


Synth.free




MIDIdef.noteOff(\offPiana, {arg vel, nn;[nn].postln;

});
SynthDef(\tone, {arg freq= 440, amp=0.3, gate=0, mod=0;var sig, env;
	sig = LFTri.ar(freq+mod)!2;
	env = EnvGen.kr(
		Env.perc(releaseTime: 4)
	//	Env.adsr(sustainLevel: 1)
		,doneAction: 2);
	sig = sig * env* amp;
	Out.ar(0, sig)}).add;