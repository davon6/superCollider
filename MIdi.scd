

MIDIdef.bend(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});




MIDIClient.init


MIDIIn.connectAll;


MIDIdef.noteOn(\onTest, {"keydown".postln});

MIDIdef(\onTest).free



MIDIdef.noteOn(\onTest, {"keydown".postln}).permanent_(true);


MIDIdef(\onTest).permanent_(false;)

MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});

MIDIdef(\hey).free

MIDIdef.activeSense(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});

MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});
MIDIFunc.bend({|func, chan, srcID, argTemplate, dispatcher|[func, chan, srcID, argTemplate, dispatcher].postln});

MIDIdef.activeSense(\onTest2, {|vel, nn, chan, src|[vel, nn, chan, src].postln});

(
MIDIdef.cc(\myModFreq, { |value, controlNumber|

	var modFreq = value.linlin(0, 127, 1, 50);
	["CC", controlNumber, "VALUE", value, "modFreq", modFreq.round(0.1)].postln;
	~modFreqBus.set(modFreq);
},
ccNum: 53 // pick the slider or knob you want to use for this
);)