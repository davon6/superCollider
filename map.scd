
//MIDI ALLOC

(

d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0,\amp,0.01],~synthGrp));
w = (Synth( \fm3, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0],~synthGrp));
q = (Synth( \fm4, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0],~synthGrp));
t = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0,/*~outFil*/],~synthGrp));
)

(


MIDIdef.noteOn(\sec, {|vel, nn, chan, src|
	[nn].postln;
	t .set(\gate,0);
d.set(\gate,1);
w.set(\gate,0);
q.set(\gate,0);
},noteNum: 63);


MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
t.set(\gate,1);
d.set(\gate,0);
w.set(\gate,0);
q.set(\gate,0);

},noteNum: 62);

MIDIdef.noteOn(\thi, {|vel, nn, chan, src|
	[nn].postln;
	t.set(\gate,0);
d.set(\gate,0);
w.set(\gate,1);
q.set(\gate,0);

},noteNum: 64);

MIDIdef.noteOn(\fou, {|vel, nn, chan, src|
	[nn].postln;
	t.set(\gate,0);
d.set(\gate,0);
w.set(\gate,0);
q.set(\gate,1);

},noteNum: 65);




/*MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
t.set(\gate,0);
d.set(\gate,0);
w.set(\gate,0);
q.set(\gate,0);

},noteNum: 61);*/



)

t.set(\gate,0);



s.freeAll

t.set(\amp,0)


(


MIDIdef.cc(\myModFreq, { |value, controlNumber|

	var modFreq = value.linlin(0, 127, 00.002, 3200);
	/*["CC", controlNumber, "VALUE", value, "modFreq", modFreq.round(0.001)].postln;
	~modFreqBus.set(modFreq);*/

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