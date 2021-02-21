
(
s.waitForBoot({


	var numSegs;

	t = TempoClock.new(151.703592/60).permanent_(true);

	~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);

	s.sync;

	//this section initialize the shaper
	numSegs= rrand(1,4);

	~tf = Env(
		(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20)}!numSegs,
		{rrand(-20,20)}!numSegs
	).asSignal(1025);

	~tf = ~tf + (
		Signal.sineFill(
			1025,
			[1, 1/4, 1/6, 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);

	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);

	d = Buffer.alloc(s, s.sampleRate *0.3872,1);
	e = Buffer.alloc(s, s.sampleRate *0.3872,1);
	~delay = Buffer.alloc(s, 48000 * 3, 2);

	~remyAudio = Buffer.read(s, "/Users/MisterGadou/Collider/remy.wav");

"Shaper init".postln;

	s.sync;

~toFm = Bus.audio(s, 1);
~toFm2 = Bus.audio(s, 1);


SynthDef(\mod, {
		arg freq= 659.26, freq2 =220, mRatio=1, cRatio=1, sineRate = 0.0000000095262251,  sineRangeLow=0, phRise= 0 ,out=0, dur, out2;

	var mod, mod2, iEnv;

	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (dur   ),      0.0000000001],
			[4, 4,(-4)]
		));

	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )*

	SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul: freq * mRatio * iEnv);

	Out.ar(out, mod);

		Out.ar(out2, SinOsc.ar(freq2     , mul:MouseX.kr(0,2000.6)));
}).add;


SynthDef(\carrier, {|freq= 0.00502929687, cRatio=1, out=0, mod, phFm=8, wavform=0 |

	var car;

		car = /*Select.ar(wavform,[*/

			SinOsc.ar( freq * cRatio +SelectX.ar(SinOsc.kr((0.00502929687/2/2),phFm).range(0,1),[SinOsc.ar(0),In.ar(mod,1)]))/*,

			/*Saw.ar( freq * cRatio +SelectX.ar(SinOsc.kr((0.00502929687/2/2),phFm).range(0,1),[SinOsc.ar(0),In.ar(mod,1)]))*/


			Saw.ar( freq * cRatio + In.ar(mod,1))
		])*/;

	Out.ar(out, LeakDC.ar(Shaper.ar(~tfBuf,   car)));

}).add;

});)

(
~modGrp =Group.new;
~carGrp = Group.after(~modGrp);
)





(Ppar([
	Pbind(\instrument, \mod, \dur, Pseq([inf/1],1), \freq, 659.26, \out, ~toFm,  \out2, ~toFm2, \group, ~modGrp),
	Pbind(\instrument, \carrier, \dur, Pseq([inf/1],1), \mod, ~toFm, \wavform,0, \group, ~carGrp)
	/*Pbind(\instrument, \carrier, \dur, Pseq([inf/1],1), \mod, ~toFm2, \wavform,1,\freq, 164.815, \group, ~carGrp)*/
],inf).play)





s.plotTree