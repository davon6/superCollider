~gou = Group.new;
~dispatchGrp1 = Group.after(~gou);


Ppar([
	~bassShap,
	Pbind(\instrument, \playBuf, \dur, inf,\buf, ~bufKick,\out, ~rollingK,\group,~gou),

	Pseq([~bar[3]/*   Pseq([~bassRest],4)*/,

		Pbind(\instrument, \dispatch, \dur, Pseq([4/1],1),\in,~rollingK,\out,0,\group,~dispatchGrp1)
	],inf)

],1).play(t)


Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,0,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.2),

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), Pseq([1/64],64),Pseq([1/64],256)   ],1),\amp, 1,\buf, ~k2,\out,0,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.17),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,0,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,0,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.22)

	],inf).play(t)




Pbind(\instrument, \playBuf, \dur, inf,\buf, ~bufKick).play(t)

~recGrp2=Group.new;
Pbindf(~kick,\out,~toRecord).play(t);
x = Synth(\recLoop,[buf:~k2,\recording,1],~recGrp2);

~k2.play

(
// Pbindef(\kou,\instrument,\kick2,\dur, Pseq([1/1],inf), \amp,( 5),\out,~outFil).play(t);

 x = Synth(\recLoop,[buf:~bufKick,\recording,1],~recGrp2);

Ppar([
	/*Pseq([Pbindf(~kick,\out,~micBus, \dur, Pseq([1/1],1))],inf),


Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~k,\group,~recGrp,\dur,inf),*/

Pbindef(\kou,\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~k2,\out,~outFil,\ptrBus, ~ptrBus,\pitchRte,(-1),\group,~granGrp,\duration,Pkey(\dur),\impulse,Pkey(\dur)),
],1).play(t);



// k = (Synth( \filter, [\dur, inf,\qf,0.8, \qf2,0.7,\in,~outFil/*,\out,~toRecord*/],~filterGrp));

 k = (Synth( \filterModu, [\dur, inf,\qf,0.8, \qf2,0.7,\in,~outFil,\out,~toRecord],~filterGrp))


)

MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

Pbind(\instrument,\kick,\dur, Pseq([1/1],inf)).play(t)
~bufKick.play
Pseq([Pbindf(~kick,\out,0)],inf).play(t)
s.plotTree
(


~ptrGrp =Group.new;
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~filterGrp = Group.after(~granGrp);
~recGrp2 = Group.after(~filterGrp);


MIDIdef.noteOn(\rev, {|vel, nn, chan, src|
	[nn].postln;

	Pbindef(\kou,\pitchRte,1)

},noteNum:36);



MIDIdef.noteOn(\revB, {|vel, nn, chan, src|
	[nn].postln;

	Pbindef(\kou,\pitchRte,(-1))

},noteNum:37);


MIDIdef.cc(\filKiMod, { |value|var modFreq = value.linlin(0, 127, 60, 4000);

	 if(modFreq.round(1).postln <100,{k.set(\which,0);},{});
		if(modFreq.round(1).postln >3510,{k.set(\which,1);},{});


	k.set(\filMod, modFreq.round(1));
//\freqFil
},ccNum: 1 );


MIDIdef.cc(\rateKick, { |value|var modFreq = value.linlin(0, 127, 1, 80);

	if(modFreq ==1,{Pbindef(\kou, \dur, Pseq([4/1],inf));},{});
	if(modFreq==10,{Pbindef(\kou, \dur, Pseq([3/1],inf));},{});

	if(modFreq ==20,{Pbindef(\kou, \dur, Pseq([1/1],inf));},{});
	// if(modFreq ==50,{Pbindef(\kou, \dur, Pseq([1/3],inf));},{});
	if(modFreq ==30,{Pbindef(\kou, \dur, Pseq([1/3],inf));},{});
	if(modFreq.postln ==40,{Pbindef(\kou, \dur, Pseq([1/4],inf));},{});
	if(modFreq==50,{Pbindef(\kou, \dur, Pseq([1/16],inf));},{});
	if(modFreq==60,{Pbindef(\kou, \dur, Pseq([1/64],inf));},{});
	//if(modFreq <80,{Pbindef(\kou, \dur, Pseq([128/1],inf));},{});



},ccNum: 72 );

MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.08, 8);

	k.set(\qf, modFreq.round(0.01));

},ccNum: 114 );

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 1, 0.3);

	k.set(\qf2, modFreq.round(0.01));


},ccNum: 18 );

)