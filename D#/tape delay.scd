(
SynthDef(\tapedly, {
	|in=0, out=0,fb=0.6, fc=5000, dlytime=0.125, wet=0.5, pan=0.0|
	var local, sig, delayed, phi, phR, phP, freq;
	var tdbh; // time delay between heads (seconds)
	local = LocalBuf(SampleRate.ir * 3, 1);
	local.clear; // clear the buffer

	tdbh = 0.125;
	phi = (2 * tdbh) / BufDur.ir(local);
	freq = 1.0 / BufDur.ir(local); // frequency to playback the buffer at rate 1
	freq = (freq * tdbh) / VarLag.kr(dlytime, 2, warp:\linear);
	phR = LFSaw.ar( freq, phi, 0.5, 0.5)*BufFrames.kr( local );
	phP = LFSaw.ar( freq, 0.0, 0.5, 0.5)*BufFrames.kr( local );

	sig = Mix.ar(In.ar(in,2));
	delayed = BufRd.ar(1, local, phP, loop:1);
	delayed = delayed.tanh;
	BufWr.ar( LPF.ar( (sig + delayed), fc, mul:fb), local, phR, loop:1);
	pan = LFNoise1.ar(5);
	Out.ar(out, Pan2.ar(delayed*wet, pan));
}).add;
)



// instantiate the delay and eventually set some of its parameters
d = Synth(\tapedly, [\in, 0, \dlytime, 0.333, \fb, 0.5, \wet, 1.0]);
d.set(\dlytime, 0.25, \fb, 0.8,\wet, 1.0,\fc, 5000)

// define a test synth
(
SynthDef(\pulse, {
	|freq=440, fb=0.5, amp=1.0, atk=0.0, rel=0.1, out=0, pan=0.0|
	var env = EnvGen.ar(Env.perc(atk, rel), 1, doneAction:2);
	var sig = SinOscFB.ar(freq, fb) * env * amp;
	Out.ar(out, Pan2.ar(sig, pan));
}).add;
)

// and use it via a Pbindef
(
Pbindef(\testPulses,
	\instrument, \pulse,
	\scale, Scale.minor,
	\octave, Prand([4,5,6],inf),
	\degree, Prand([-1,0,2], inf),
	\fb, Pexprand(0.1, 0.7, inf),
	\atk, 0.01,
	\rel, Prand([0.125, 0.25, 0.5], inf),
	\dur, Prand([0.25,0.5],inf),
	\amp, 0.25,
	\out, 0,
	\pan, 0.0,
	\addAction, Pwrand([0,1],[3, 10].normalizeSum,inf)
).quant_(1).play;
)


MIDIClient.init;
MIDIIn.connectAll;


(
~ctrl_1.free;
~ctrl_1 = MIDIFunc.cc({
	arg ...args;
	args.postln;
	d.set(\dlytime,args[0].linlin(0, 127, 0.125, 1.0) );
},1);
)


(
~ctrl_2.free;
~ctrl_2 = MIDIFunc.cc({
	arg ...args;
	args.postln;
	d.set(\fb,args[0].linlin(0, 127, 0.0, 0.99) );
},2);
)

(
~ctrl_3.free;
~ctrl_3 = MIDIFunc.cc({
	arg ...args;
	args.postln;
	d.set(\fc,args[0].linexp(0, 127, 100.0, 5000) );
},3);
)