(
a = { |freq = 220, amp = 0.1, center = 0, spread = 1,
	chorusDelay = 0.01, chorusPct = 0.7|
	var n = 11;
	var osc = Saw.ar(freq);  // one channel source

	// chorus effect: multiple delay lines
	// with lfo on delay time
	// delay + (delay * pct * lfo) = delay * (1 + (pct * lfo))
	var lfos = Array.fill(n, { SinOsc.kr(Rand(0.08, 0.11)) * chorusPct + 1 });
	var delays = DelayC.ar(osc, 0.2, chorusDelay * lfos);

	// now you have 11 signals with different delays/lfos
	// so these are not phase correlated
	// and it's meaningful to Splay them
	Splay.ar(delays, spread, amp, center)
}.play;
)


// use XY plot for an imaging meter
// if there is no stereo image, the plot will be a vertical line
b = Bus.audio(s, 2);

(
c = {
	var sig = In.ar(0, 2);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(a, outbus: b, addAction: \addAfter);
)

z = s.scope(2, index: b.index).style_(2).yZoom_(16);