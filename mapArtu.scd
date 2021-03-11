(
//Pseq([~toUse2],inf).play(t);
Ppar([
 Ppar([Pbindf(~kick,\amp, 3),Pbindf(~bass,\amp, 3 ),],inf) ,
Pbind(\instrument, \dispatch2 ,\in,~dipatchKB, \out,0 ,\group,~dispatchGrp, \dur, Pseq([16/1],inf))
],1).play(t);
x = Synth(\recLoop,[buf:~buf,\recording,1],~recGrp);
)
x.free;
~buf.play

s.plotTree
MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;
//MIDI ALLOC
(
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~filterGrp = Group.after(~synthGrp);
~shapGrp= Group.after(~filterGrp);
~recGrp= Group.after(~shapGrp);

)
//no2 doesnt not go tottsly tru filter at least low
// phaser
//CANT HEAR DELAY IN ARRANGEMENT
(

d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\amp, 0.08,\cRatio, 1,\index, 1,\atkE, 0.1,\out,~outFil],~synthGrp));

 v = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,0.5,\out, ~outFil],~synthGrp));

z=(Synth(\sinModul,[\modu,0.3]));
n= (Synth(\sawModul,[\modu,0.3]));
c =(Synth(\pulModul,[\modu,0.3]));
m =(Synth(\ranModul,[\modu,0.3]));


k = (Synth( \filterModu, [\dur, inf,\in,~outFil, \out,~toRecord],~filterGrp));

//Pdef(\aaa, Pbind(\instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,1)).play(t);

Pbindef(\aaa, \instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,Pseq([4/1],inf),\in,~toRecord,\group,~shapGrp).play(t);


MIDIdef.noteOn(\res, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([4/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

},noteNum: 72);



MIDIdef.noteOn(\rlong, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([16/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

},noteNum: 42);





MIDIdef.cc(\shoc, {|vel, nn, chan, src|[nn];
	v.set(\factor2,1);
d.set(\factor2,1);
Pbindef(\aaa,\dur,Pseq([1/1],inf),


	\vlSub,0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub), \atkT,0.00.rrand(0.2,1).postln,
	\decT,0.4.rrand(0.6,0.3).postln,
	\subsT,0.2.rrand(0.3,0.1).postln,
	\relT,0.12.rrand(0.8,1).postln,
	\atckC,6.rrand(0,1).postln,
	\decC,-10.rrand(-2,1).postln,
	\relC,-8.rrand(-2,1) .postln);

},ccNum: 113);






MIDIdef.noteOn(\sec, {|vel, nn, chan, src|
	[nn].postln;
	v.set(\gate,0);

		Pbindef(\aaa,\dur,Pseq([4/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);
d.set(\gate,1,\factor,0,\factor2,0,\multi,0);
},noteNum: 37);





MIDIdef.noteOn(\first, {|vel, nn, chan, src|
	[nn].postln;
v.set(\gate,1,\factor,0,\factor2,0);
d.set(\gate,0);
	Pbindef(\aaa,	\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,Pseq([4/1],inf));


},noteNum: 36);


MIDIdef.noteOn(\modLfo, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod1);
	d.set(\factor,1,\modu, ~mod1 );

},noteNum: 38);

MIDIdef.noteOn(\modLfo2, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod2);
	d.set(\factor,1,\modu, ~mod2 );

},noteNum: 39);

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod3);
	d.set(\factor,1,\modu, ~mod3 );

},noteNum: 40);

MIDIdef.noteOn(\modLfo4, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod4);
	d.set(\factor,1,\modu, ~mod4 );

},noteNum: 41);







MIDIdef.noteOn(\oFF, {|vel, nn, chan, src|
	[nn].postln;
v.set(\gate,0);
d.set(\gate,0);

},noteNum: 43);





MIDIdef.cc(\mVo, { |value|var modFreq = value.linlin(0, 127, 0, 1);



v.set(\multi, modFreq.round(0.01));
	d.set(\multi, modFreq.round(0.01));

},ccNum: 19 );

/*~wFi = { if(~fi==0,{~fi=1;~fi;},{~fi=0;~fi;});    };

MIDIdef.cc(\wfil, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	k.set(\which, ~wFi.().postln);

},ccNum: 115 );*/

MIDIdef.cc(\fil, { |value|var modFreq = value.linlin(0, 127, 60, 4000);

	 if(modFreq.round(1).postln <100,{k.set(\which,0);"yo".postln},{});
		if(modFreq.round(1).postln >3510,{k.set(\which,1);"yo2".postln},{});

	// if(modFreq.round(1).postln >1500,{k.set(\which,0);"yo".postln},{k.set(\which,1)});
		// if(modFreq.round(1).postln 1510,{);"yo2".postln},{});

	k.set(\filMod, modFreq.round(1));

},ccNum: 1 );


/*MIDIdef.cc(\fil2, { |value|var modFreq = value.linlin(0, 127, 60, 4200);


	// if(modFreq.round(1).postln >1500,{k.set(\which,0);"yo".postln},{k.set(\which,1)});
		// if(modFreq.round(1).postln 1510,{);"yo2".postln},{});

	k.set(\filMod2, modFreq.round(1));

},ccNum: 1 );*/

MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.08, 8);

	k.set(\qf, modFreq.round(0.01));

},ccNum: 114 );

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 1, 0.3);

	k.set(\qf2, modFreq.round(0.01));

},ccNum: 18 );

MIDIdef.cc(\c, { |value|var modFreq = value.linlin(61, 67, 1, 10);

	//if(modFreq.round(1).postln ==1,{Pbindef(\aaa, \dur,Pseq([16/1],inf));},{});
	if(modFreq.round(1).postln ==3,{Pbindef(\aaa, \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==5,{Pbindef(\aaa, \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==7,{Pbindef(\aaa, \dur,Pseq([1/4],inf));},{});


/*switch (modFreq,
		1, "gosh".postln;,
        20,"gosh2".postln;,

		"goshDefa".postln;);*/

},ccNum: 112 );

MIDIdef.cc(\modLF, { |value|var modFreq = value.linlin(0, 127, 00.002, 20);

	z.set(\modu,modFreq.round(0.0001));
	n.set(\modu,modFreq.round(0.0001));
	c.set(\modu,modFreq.round(0.0001));
	m.set(\modu,modFreq.round(1));
},ccNum: 77);


MIDIdef.cc(\myModFreq, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);
	//
	/*v.set(\freq2,modFreq.round(0.001).postln);*/
	d.set(\freq2,modFreq.round(0.001));
},ccNum: 73);


MIDIdef.bend(\twi, { |val, chan, src|


	v.set(\freq2, val.linlin(0,16383,0,1200).postln);


}, chan:  11);

/*MIDIdef.cc(\freqx, { |value|var modFreq = value.linlin(0, 127, 00.002, 1200);

	v.set(\freq,modFreq.round(0.001));

},ccNum: 93 );*/

MIDIdef.cc(\freqx2, { |value|var modFreq = value.linlin(0, 127, 0.01, 2000);


	d.set(\freq,modFreq.round(0.01).postln);
},ccNum: 93 );

MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 320);

	v.set(\freq3,modFreq.round(0.001));

},ccNum: 75 );

MIDIdef.cc(\cv, { |value|var modFreq = value.linlin(0, 127, 00.002, 160);

	/*v.set(\index3,modFreq.round(0.001));*/
	d.set(\index3,modFreq.round(0.001));
},ccNum: 72 );

)

(
MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});

)

s.plotTree