


(


MIDIdef.noteOn(\sec, {|vel, nn, chan, src|
	[nn].postln;
	t .free;
d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, 0,\amp,0.01],~synthGrp));
w.free;
q.free;
},noteNum: 63);

MIDIdef.noteOn(\thi, {|vel, nn, chan, src|
	[nn].postln;
	t.free;
d.free;
w = (Synth( \fm3, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, 0],~synthGrp));
q.free;

},noteNum: 64);

MIDIdef.noteOn(\fou, {|vel, nn, chan, src|
	[nn].postln;
	t.free;
d.free;
w.free;
q = (Synth( \fm4, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, 0],~synthGrp));

},noteNum: 65);


MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
t.free;
d.free;
w.free;
q.free;

},noteNum: 61);

MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
t = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, 0/*~outFil*/],~synthGrp));
d.free;
w.free;
q.free;

},noteNum: 62);

)

s.freeAll



(


MIDIdef.cc(\myModFreq, { |value, controlNumber|

	var modFreq = value.linlin(0, 127, 00.002, 3200);
	["CC", controlNumber, "VALUE", value, "modFreq", modFreq.round(0.001)].postln;
	~modFreqBus.set(modFreq);

	t.set(\freq2,modFreq.round(0.001));
	d.set(\freq2,modFreq.round(0.001));
	w.set(\freq2,modFreq.round(0.001));
	q.set(\freq2,modFreq.round(0.001));
	//~bus.set(modFreq);

/*	Pbindef( \a,

	\freq2, 1000/*~modFreqBus*//*Pseq([100], inf)*/,
	);
	*/
},
ccNum: 19// pick the slider or knob you want to use for this
);



MIDIdef.cc(\freqx, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	t.set(\freq,modFreq.round(0.001));
	d.set(\freq,modFreq.round(0.001));
	w.set(\freq,modFreq.round(0.001));
	q.set(\freq,modFreq.round(0.001));
},ccNum: 23 );




MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	t.set(\freq3,modFreq.round(0.001));
d.set(\freq3,modFreq.round(0.001));
w.set(\freq3,modFreq.round(0.001));
q.set(\freq3,modFreq.round(0.001));},ccNum: 18 );

MIDIdef.cc(\cv, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	t.set(\index2,modFreq.round(0.001));
d.set(\index2,modFreq.round(0.001));
w.set(\index2,modFreq.round(0.001));
q.set(\index2,modFreq.round(0.001));},ccNum: 20 );
MIDIdef.cc(\cv2, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	t.set(\index3,modFreq.round(0.001));
d.set(\index3,modFreq.round(0.001));
w.set(\index3,modFreq.round(0.001));
q.set(\index3,modFreq.round(0.001));},ccNum: 21 );


)

(
MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});

)

s.plotTree