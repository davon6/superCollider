MIDIClient.init


MIDIIn.connectAll;



~notes = Array.newClear(128);

	~tf2 = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf2 = ~tf2.asWavetableNoWrap;

	s.sync;

	~tfBuf2 = Buffer.loadCollection(s, ~tf2);


	s.sync;


	(
	var numSegs2= rrand(1,2).postln;


	~tf2 = Env(
		(({rrand(0.0,1.0).postln}!(numSegs2+1)) * [1,-1]).scramble,
		{exprand(1,20).postln}!numSegs2,
		{rrand(-20,20).postln}!numSegs2
	).asSignal(1025);


	~tf2 = ~tf2 + (
		Signal.sineFill(
			1025,
			[1, 1/4, 1/6, 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);


	~tf2 = ~tf2.normalize;

	~tfBuf2.loadCollection(~tf2.asWavetableNoWrap);
)

(
MIDIdef.noteOn(\piana,{arg vel, nn;
	[ nn].postln;
	~notes[nn] = Synth(\atmos, [\freq, nn.midicps, \gate, 1
		,\amp, vel.linexp(1,127,0.01,0.3),\out,~distoBg
	]);
});

~bend =8192;

MIDIdef.noteOff(\offPiana, {arg vel, nn;nn.postln;
	~notes[nn].set(\gate,0);
	~notes[nn] = nil;
});


MIDIdef.bend(\ben, { |val, chan, src|
~bend = val;

	~notes.do{arg synth; synth.set(\bend, val.linlin(0,16383,-2,2))};

	//~notes.set(\mod,modFreq.round(1).postln);
}, chan:  0);

SynthDef(\atmos, {arg freq= 659.255, amp=0.3, gate=0,factor=0, bend=0, multi =0,lfo=0.0121,out=0;var sig, env, mod, mod2;


	mod = SinOsc.ar(MouseX.kr(freq)

		+	(SelectX.ar(SinOsc.kr((0.00502929687/2/2)).range(0,1),[SinOsc.ar(0),LFTri.ar(lfo).range(-100, 1200)])* factor)
		,mul:MouseY.kr(5).range(1,400));
	sig = LFTri.ar(freq* bend.midiratio+ mod
	/*	+ LFTri.ar(lfo).range(-100, 1000)*/

	/*+	SelectX.ar(SinOsc.kr((0.00502929687/2/2)).range(0,1),[SinOsc.ar(0),LFTri.ar(lfo).range(-100, 100)])*/




		/*,mod.wrap(0, 16pi)*/,mul:[1,multi
		,multi])!2;
	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);



/*sig = Shaper.ar(~tfBuf2,   sig);

	sig  = LeakDC.ar(sig);*/




	sig = sig * env* amp;
	Out.ar(out, sig)}).add;

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	~notes.do{arg synth; synth.set(\factor,1,)};

},noteNum: 40);


MIDIdef.cc(\fil, { |value|var modFreq = value.linlin(0, 127, 60, 4000);

	 if(modFreq.round(1)<100,{k.set(\which,0);"yo".postln},{});
		if(modFreq.round(1)>3510,{k.set(\which,1);"yo2".postln},{});


	k.set(\filMod, modFreq.round(1).postln);

},ccNum: 1 );



MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.08, 8);

	k.set(\qf, modFreq.round(0.01));

},ccNum: 114 );

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 1, 0.3);

	k.set(\qf2, modFreq.round(0.01));

},ccNum: 18 );


MIDIdef.cc(\fdb, { |value|var modFreq = value.linlin(0, 127, 0.01, 1);

	z.set(\feedback, modFreq.round(0.01).postln);

},ccNum: 16 );



MIDIdef.cc(\delT, { |value|var modFreq = value.linlin(0, 127, 0.01,2);

	d.set(\delayT, modFreq.round(0.01).postln);

},ccNum: 91 );


MIDIdef.cc(\maxD, { |value|var modFreq = value.linlin(0, 127, 0.01,2);

	d.set(\maxDel, modFreq.round(0.01).postln);
},ccNum: 79 );

MIDIdef.cc(\deT, { |value|var modFreq = value.linlin(0, 127, 0.01,659.255);

	//d.set(\decT, modFreq.round(0.01).postln);

	~notes.do{arg synth; synth.set(\freq, modFreq.round(0.01))};

},ccNum: 72 );


)
s.plotTree
~distoGrp =Group.new;
~filterGrp= Group.after(~distoGrp);
~delayGrp= Group.after(~filterGrp);
~limitGrp= Group.after(~delayGrp);
~filterGrp2= Group.after(~limitGrp);
~eqGrp= Group.after(~filterGrp2);
~reverbGrp= Group.after(~eqGrp);

~delayGrp2= Group.after(~reverbGrp);
~recGrp= Group.after(~delayGrp2);

v = (Synth( \disto, [\dur, inf,\in,~distoBg, \out,~bgFil],~distoGrp));
k = (Synth( \filterModu, [\dur, inf,\in,~bgFil, \out,~bgDelay],~filterGrp));
d = (Synth( \comb, [\dur, inf,\in,~bgDelay,\out,~bgLimit],~delayGrp));
q = Synth( \limiter,[\dur, inf,\in,~bgLimit,\gain, 20,\out,0/*~bgFil2*/],~limitGrp);

k = (Synth( \filterModu, [\dur, inf,\in,~bgFil2, \out,~eqBg],~filterGrp2));
n = (Synth( \EQHPS, [\dur, inf,\in,~eqBg, \out,~bgBus],~eqGrp));
c = (Synth( \reverbS, [\dur, inf,\in,~bgBus, \out,~toRecord],~reverbGrp));
z = (Synth( \pingDS, [\bufnum, ~delay,\dur, inf,\in,~bgDelayS, \out,0/*~bgFil2*/],~delayGrp2));


x = Synth(\recLoopS,[buf:~bufBg,\recording,1],~recGrp);

to disto, toFilter, toDelay,

~tofilter with lfo ? toEq, toReverb,         ""toStereo,with lfo               toEq2 , toSnaCom