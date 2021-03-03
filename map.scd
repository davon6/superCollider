
//MIDI ALLOC

(

d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0],~synthGrp));

v = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\out, 0,/*~outFil*/],~synthGrp));

z=(Synth(\sinModul,[\modu,4]));
x= (Synth(\sawModul,[\modu,4]));
c =(Synth(\pulModul,[\modu,4]));
m =(Synth(\ranModul,[\modu,4]));

k = (Synth( \filterModu, [\dur, inf,\in,~outFil],~filterGrp));

//Pdef(\aaa, Pbind(\instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,1)).play(t);

Pbindef(\aaa, \instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,1).play(t);
)

(


MIDIdef.noteOn(\shoc, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor2,1);
d.set(\factor2,1);


},noteNum: 98);


MIDIdef.noteOn(\sec, {|vel, nn, chan, src|
	[nn].postln;
	v.set(\gate,0);

d.set(\gate,1,\factor,0,\factor2,0);
},noteNum: 63);


MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
v.set(\gate,1,\factor,0,\factor2,0);
d.set(\gate,0);


},noteNum: 62);


MIDIdef.noteOn(\modLfo, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod1);
	d.set(\factor,1,\modu, ~mod1 );

},noteNum: 58);

MIDIdef.noteOn(\modLfo2, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod2);
	d.set(\factor,1,\modu, ~mod2 );

},noteNum: 59);

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod3);
	d.set(\factor,1,\modu, ~mod3 );

},noteNum: 60);

MIDIdef.noteOn(\modLfo4, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod4);
	d.set(\factor,1,\modu, ~mod4 );

},noteNum: 61);







MIDIdef.noteOn(\oFF, {|vel, nn, chan, src|
	[nn].postln;
v.set(\gate,0);
d.set(\gate,0);

},noteNum: 65);



)

v.set(\gate,0);



s.freeAll

v.set(\amp,0)


(

MIDIdef.cc(\c, { |value|var modFreq = value.linlin(0, 127, 1, 10);

	//if(modFreq.round(1).postln ==1,{Pbindef(\aaa, \dur,Pseq([16/1],inf));},{});
	if(modFreq.round(1).postln ==3,{Pbindef(\aaa, \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==5,{Pbindef(\aaa, \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==7,{Pbindef(\aaa, \dur,Pseq([1/4],inf));},{});


/*switch (modFreq,
		1, "gosh".postln;,
        20,"gosh2".postln;,

		"goshDefa".postln;);*/

},ccNum: 55 );

MIDIdef.cc(\modLF, { |value|var modFreq = value.linlin(0, 127, 00.002, 20);

	z.set(\modu,modFreq.round(0.001));
	x.set(\modu,modFreq.round(0.001));
	c.set(\modu,modFreq.round(0.001));
	m.set(\modu,modFreq.round(1));
},ccNum: 48);


MIDIdef.cc(\myModFreq, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);
	//
	v.set(\freq2,modFreq.round(0.001));
	d.set(\freq2,modFreq.round(0.001));
},ccNum: 19);

MIDIdef.cc(\freqx, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	v.set(\freq,modFreq.round(0.001));

},ccNum: 23 );

MIDIdef.cc(\freqx2, { |value|var modFreq = value.linlin(0, 127, 26.189, 3200);


	d.set(\freq,modFreq.round(0.001).postln);
},ccNum: 23 );

MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);

	v.set(\freq3,modFreq.round(0.001));
	d.set(\freq3,modFreq.round(0.001));
},ccNum: 18 );

MIDIdef.cc(\cv, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	v.set(\index2,modFreq.round(0.001));
	d.set(\index2,modFreq.round(0.001));
},ccNum: 20 );

MIDIdef.cc(\cv2, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	v.set(\index3,modFreq.round(0.001));
	d.set(\index3,modFreq.round(0.001));
},ccNum: 21 );

)

(
MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});

)

s.plotTree