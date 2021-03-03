
//MIDI ALLOC

(

d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0,\amp,0.01],~synthGrp));

t = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0,/*~outFil*/],~synthGrp));

z=(Synth(\sinModul,[\modu,4]));
x= (Synth(\sawModul,[\modu,4]));
c =(Synth(\pulModul,[\modu,4]));
m =(Synth(\ranModul,[\modu,4]));
)

(


MIDIdef.noteOn(\sec, {|vel, nn, chan, src|
	[nn].postln;
	t .set(\gate,0);

d.set(\gate,1,\factor,0,);
/*w.set(\gate,0);
q.set(\gate,0);*/
},noteNum: 63);


MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
t.set(\gate,1,\factor,0,);
d.set(\gate,0);
/*w.set(\gate,0);
q.set(\gate,0);*/

},noteNum: 62);
//,\factor,0

MIDIdef.noteOn(\modLfo, {|vel, nn, chan, src|[nn].postln;
	t.set(\factor,1,\modu, ~mod1);
	d.set(\factor,1,\modu, ~mod1 );

},noteNum: 58);

MIDIdef.noteOn(\modLfo2, {|vel, nn, chan, src|[nn].postln;
	t.set(\factor,1,\modu, ~mod2);
	d.set(\factor,1,\modu, ~mod2 );

},noteNum: 59);

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	t.set(\factor,1,\modu, ~mod3);
	d.set(\factor,1,\modu, ~mod3 );

},noteNum: 60);

MIDIdef.noteOn(\modLfo4, {|vel, nn, chan, src|[nn].postln;
	t.set(\factor,1,\modu, ~mod4);
	d.set(\factor,1,\modu, ~mod4 );

},noteNum: 61);







MIDIdef.noteOn(\oFF, {|vel, nn, chan, src|
	[nn].postln;
t.set(\gate,0);
d.set(\gate,0);

},noteNum: 65);



)

t.set(\gate,0);



s.freeAll

t.set(\amp,0)


(

MIDIdef.cc(\modLF, { |value|var modFreq = value.linlin(0, 127, 00.02, 20);

	z.set(\modu,modFreq.round(0.001));
	x.set(\modu,modFreq.round(0.001));
	c.set(\modu,modFreq.round(0.001));
	m.set(\modu,modFreq.round(1));
},ccNum: 48);


MIDIdef.cc(\myModFreq, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);
	//
	t.set(\freq2,modFreq.round(0.001));
	d.set(\freq2,modFreq.round(0.001));
},ccNum: 19);

MIDIdef.cc(\freqx, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	t.set(\freq,modFreq.round(0.001));
	d.set(\freq,modFreq.round(0.001));
},ccNum: 23 );

MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	t.set(\freq3,modFreq.round(0.001));
	d.set(\freq3,modFreq.round(0.001));
},ccNum: 18 );

MIDIdef.cc(\cv, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	t.set(\index2,modFreq.round(0.001));
	d.set(\index2,modFreq.round(0.001));
},ccNum: 20 );

MIDIdef.cc(\cv2, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	t.set(\index3,modFreq.round(0.001));
	d.set(\index3,modFreq.round(0.001));
},ccNum: 21 );

)

(
MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});

)

s.plotTree