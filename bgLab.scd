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
		,\amp, vel.linexp(1,127,0.01,0.3),\out,~bgFil
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
		,multi]);
	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);



/*sig = Shaper.ar(~tfBuf2,   sig);

	sig  = LeakDC.ar(sig);*/




	sig = sig * env;//* amp;
	Out.ar(out, sig)}).add;

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	~notes.do{arg synth; synth.set(\factor,1,)};

},noteNum: 40);






MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.08, 8);

	k.set(\qf, modFreq.round(0.01));

},ccNum: 18 );

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

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


MIDIdef.cc(\rateLF, { |value|var modFreq = value.linlin(0, 127,0.01 ,5.15);

	o.set(\val, modFreq.round(0.01).postln);

},ccNum:71  );

MIDIdef.cc(\wiF, { |value|var modFreq = value.linlin(0, 127,0.00 ,0.99);

	k.set(\which, modFreq.round(0.01).postln);

},ccNum:74  );

MIDIdef.cc(\fil, { |value|var modFreq = value.linlin(0, 127, 60, 4000);

	/* if(modFreq.round(1)<100,{k.set(\which,0);"yo".postln},{});
		if(modFreq.round(1)>3510,{k.set(\which,1);"yo2".postln},{});*/


	k.set(\filMod, modFreq.round(1).postln);

},ccNum: 1 );

MIDIdef.cc(\revT, { |value|var modFreq = value.linlin(0, 127, 0.3, 5);



	c.set(\revtime, modFreq.round(0.1).postln);

},ccNum: 75);

MIDIdef.cc(\damp, { |value|var modFreq = value.linlin(0, 127, 0.03, 1);



	c.set(\damping, modFreq.round(0.01).postln);


},ccNum: 73);


)
s.plotTree
~distoGrp =Group.new;
~filterGrp= Group.after(~distoGrp);
~delayGrp= Group.after(~filterGrp);
~limitGrp= Group.after(~delayGrp);
~filterGrp2= Group.after(~limitGrp);

~eqGrp= Group.after(~filterGrp2);
~distoGrp2= Group.after(~eqGrp);
~reverbGrp= Group.after(~distoGrp2);

~delayGrp2= Group.after(~reverbGrp);
~recGrp= Group.after(~delayGrp2);

// o = Synth(\lfo13, [\out,~bus7 ,\dur,9999,\ph,0, \rL,200,\rH,4000]);

p ={ Out.kr(~bus6, SinOsc.ar(0.42916666666667).range(1,0.4))}.play;
//v = (Synth( \disto, [\in,~distoBg, \out,~bgFil],~distoGrp));
k = (Synth( \filterModu, [\in,~bgFil, \out,~bgDelay],~filterGrp));
d = (Synth( \comb, [\in,~bgDelay,\out,~bgLimit],~delayGrp));
q = Synth( \limiter,[\in,~bgLimit,\gain, 40,\out,~eqBg],~limitGrp);

// k = (Synth( \filter, [\in,~bgFil2,  \busMod,~bus7, \qf, ~bus6,\which,0,\out,0/*~eqBg*/],~filterGrp2));

n = (Synth( \EQHP, [\in,~eqBg, \val, 3400.00.rrand(300,0.001),\quant, 16.rrand(4,1), \gain,(-8).rrand((-1),1),\val2, 3400.00.rrand(300,0.001),\quant2, 16.rrand(4,1), \gain2,(-8).rrand((-1),1),\frq, 100, \out,~distoBg2,\vol,2],~eqGrp)  );
w = (Synth( \disto, [\in,~distoBg2, \out,~bgBus],~distoGrp2));

c = (Synth( \reverb, [\in,~bgBus, \out,0/*~bgDelayS*/,\roomsize, 80,  \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -11 ],~reverbGrp));


z = (Synth( \pingDS, [\bufnum, ~delay,\in,~bgDelayS, \out,0/*~toRecord*/],~delayGrp2));


x = Synth(\recLoopS,[buf:~bufBg,\recording,1],~recGrp);

s.meter
to disto, toFilter, toDelay,

~tofilter with lfo ? toEq, toReverb,         ""toStereo,with lfo               toEq2 , toSnaCom