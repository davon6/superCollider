SynthDef(\clock, {
	var setTime, tempo, time, sig, rateMax;


	setTime = \setTime.tr(0);
	tempo = \tempo.kr(1);
	rateMax = 1.05 * tempo;

	time = Phasor.ar(
		setTime,
		SampleDur.ir * tempo,
		0,
		inf,
		setTime
	).poll;

	time = Slew.ar(
		time,
		up:rateMax, dn:rateMax
	);

	sig = SinOsc.ar(0, time.mod(2pi));
	//sig = IEnvGen.ar(Env.adsr, time * 3)

	Out.ar(\out.kr, sig);
}).add;

Pdef(\lfoSync, Pmono(
	\clock,
	\out, ~someBus,
	\dur, 1,
	\tempo, 1,
	\setTime, Ptime() * Pfunc({ ~tempo })
));


/////////



~desync = 0.4 * Trig.ar(Dust.ar(0.1), 10).lag(4);
~lfo = SinOsc.ar(0, (~time + ~desync).mod(2pi))



The idea here:

Use a Phasor to drive your LFO or other periodic thing - example has either a SinOsc or an envelope.
Provide a trigger input, \setTime, which resets the phasor to a new time. This re-syncs your synth’s time to your pattern time if they drift.
Use Slew to rate-limit the phasor to a LITTLE BIT faster than your desired speed.
Drive the whole thing with a Pmono - so, every \dur beats you’re sending a setTime which tells the Synth what time it SHOULD be at.
The synth should be roughly in-sync with your pattern / sclang tempo - but of course it will not stay perfectly in sync forever (the language + server, as James has pointed out, are two slightly different clocks). \setTime will periodically re-sync the clock to the correct time - but probably you don’t want this re-sync to jump discontinuously to the new value, because it would cause a click etc. So, the Slew limits the rate-of-change of time to a little faster than the speed you expect, so it will catch up or slow down slightly when it’s out of sync.

Of course, if rateMax is low and your clocks are drifting a lot, it’s possible time will never catch up. And, if rateMax is high, then it might speed up quickly enough that it’s discontinuous in an audible way - this simply has to be tuned by ear.

The \dur of your pattern here is simply controlling how often you resync your clock - this can also simply be tuned to the context. It might be that you only need to re-sync once every 10 seconds and everything works fine - or maybe need very tight sync and 0.1 sounds better - again, probably tune by ear.

As an overall architectural concept, I’ll have a \clock synth output the time straight to a bus, and then have individual other synths read that time and drive their own LFO’s / envelopes / etc with it. Once you’ve got something that works, wrap it up as a Pdef and drop it in any patch or setup where you need a clock to drive other synths.

One final caveat: this example as it is MAY fun afoul of server latency - the language sends messages to the server expecting that they will be executed slightly in the future, so that timing is consistent. If this works but you’re hearing that “everything is slightly out of sync”, this is the likely culprit: just add a fixed offset to your time at the end, e.g. time = time + \latency.kr(0) - probably this will just need to be the server latency, but again something that should really just be done by ear in the end.




This is, incidentally, a cool way to implement a sort of “drifting in and out of sync” sound. For example, if you have a bank of LFO’s that you want to be perfectly synced but occasionally drift out: you can drive them all with one clock, and then offset the time to de-sync them. As an example:

desync = 0.4 * Trig.ar(Dust.ar(0.1), 10).lag(4);
lfo = SinOsc.ar(0, (time + desync).mod(2pi))
When the Dust fires, you get a slow ramp up to 0.4 and then back to 0, over 10 seconds - adding this to your time means de-syncing by 1/4 beat and then re-syncing again.




