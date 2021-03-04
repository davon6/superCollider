
~notes = Array.newClear(128);

MIDIdef.noteOn(\piana,{arg vel, nn;
	[ nn].postln;
	~notes[nn] = p =(Synth(\tone, [\freq, nn.midicps, \gate, 1]));
});



MIDIdef.noteOff(\offPiana, {arg nn;nn.postln;
	~notes[nn].set(\gate,0);
	~notes[nn] = nil;
});

MIDIdef.cc(\twi, { |value|var modFreq = value.linlin(0, 127, 0, 1000);

	p.set(\mod,modFreq.round(1).postln);
},ccNum: 7);

MIDIdef.cc(\twi2, { |value|var modFreq = value.linlin(0, 127, 0, -100);

p.set(\mod,modFreq.round(1).postln);
},ccNum: 14);


SynthDef(\tone, {arg freq= 440, amp=0.3, gate=0, mod=0;var sig, env;
	sig = LFTri.ar(freq+mod)!2;
	env = EnvGen.kr(
		Env.perc(releaseTime: 4)
	//	Env.adsr(sustainLevel: 1)
		,doneAction: 2);
	sig = sig * env* amp;
	Out.ar(0, sig)}).add;

p =(Synth(\tone, [\freq, 43.midicps, \gate, 1, \mod,0]));


s.plotTree


Synth.free




MIDIdef.noteOff(\offPiana, {arg vel, nn;[nn].postln;

});


~notes[3] = 