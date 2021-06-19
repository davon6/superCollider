(
s.waitForBoot {
	SynthDef(\fader, { |in, out, level = 1, pan = 0|
		var sig = In.ar(in, 2) * level;
		Out.ar(out, Balance2.ar(sig[0], sig[1], pan))
	}).add;
	SynthDef(\kick, { |out, freq = 55, aFreq = 300, aTime = 0.08,
		dec = 0.3, sus = 0.7, rel = 0.08, amp = 0.1, preamp = 3|
		var eg = EnvGen.ar(Env([0, 1, sus, 0], [0.005, dec, rel], -4), doneAction: 2);
		var feg = EnvGen.ar(Env([aFreq, freq], [aTime], \exp));
		var sig = amp * tanh(SinOsc.ar(feg) * preamp);
		Out.ar(out, (sig * eg).dup);
	}).add;
	SynthDef(\pad, { |out, gate = 1, freq = 440, detun = 1.008, amp = 0.1,
		ffreq = 8000,
		atk = 0.1, dec = 0.3, sus = 0.5, rel = 0.3|
		var n = 7;
		var freqs = freq * Array.fill(n, { detun ** Rand(-1, 1) });
		var sig = Splay.ar(Saw.ar(freqs));
		var eg = EnvGen.ar(Env.adsr(atk, dec, sus, rel), gate, doneAction: 2);
		sig = LPF.ar(LPF.ar(sig, ffreq), ffreq);
		Out.ar(out, sig * (amp * eg));
	}).add;
	SynthDef(\fakeSidechain, { |out, sideBus, thresh = 0.05,
		clamp = 0.05, clampLevel = 0.2, relax = 0.08|
		var sig = In.ar(out, 2);
		var side = In.ar(sideBus, 2).sum;
		var level = Amplitude.ar(side, 0.01, 0.1);
		var gate = level > thresh;
		var eg = EnvGen.ar(Env([1, clampLevel, 1], [clamp, relax], releaseNode: 1), gate);
		ReplaceOut.ar(out, sig * eg);
	}).add;

	s.sync;

	TempoClock.tempo = 128/60;

	~kickbus = Bus.audio(s, 2);
	~kickgroup1 = Group.new;
	~kickgroup = Group(~kickgroup1);
	~kickfader = Synth(\fader, [in: ~kickbus, out: 0], ~kickgroup1, \addToTail);

	~padbus = Bus.audio(s, 2);
	~padgroup1 = Group.after(~kickgroup1);
	~padgroup = Group(~padgroup1);
	~padfader = Synth(\fader, [in: ~padbus, out: 0], ~padgroup1, \addToTail);
	~fakeSidechain = Synth(\fakeSidechain, [
		out: ~padbus, sideBus: ~kickbus,
		relax: 0.1
	], ~padfader, \addBefore);

	~pad = (
		type: \on, instrument: \pad,
		out: ~padbus, group: ~padgroup,
		midinote: [52, 59, 62, 69, 73, 78],
		amp: 0.1
	).play;

	Pdef(\kick, Pbind(
		\instrument, \kick,
		\dur, 1,
		\amp, 0.2,
		\freq, 55,
		\aFreq, 200,
		\aTime, 0.05,
		\dec, 0.1,
		\out, ~kickbus,
		\group, ~kickgroup
	)).play;
};
)



// stop:
~pad.type_(\off).play;
Pdef(\kick).stop;

// clean up:
~kickgroup1.free; ~padgroup1.free;


////example number 2



(
{
var samp = WhiteNoise.ar(0.3);
var osc = SinOsc.ar([400,401]);

osc-Compander.ar(osc,samp,0.2,12,1)
}.play;
)



~sidechain = Bus.audio(s, 1);

(
a = {
	var sig = SinOsc.ar(440);
	var trig = Dust.kr(1.2);
	var ampLFO = ToggleFF.kr(trig) * 0.1 + 0.02;
	sig = sig * ampLFO;
	Out.ar(~sidechain, sig);
	Out.ar(0, sig.dup)
}.play;
)

(
b = {
	var sig = LFTri.ar(LFDNoise3.kr(3).exprange(200, 800));
	var ctl = In.ar(~sidechain, 1);

	sig = Compander.ar(sig, ctl,
		thresh: 0.05, slopeBelow: 1, slopeAbove: -50,
		clampTime: 0.05, relaxTime: 0.1
	);

	(sig * 0.1).dup
}.play(target: a, addAction: \addAfter);
)