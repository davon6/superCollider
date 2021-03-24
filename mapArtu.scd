(
//Pseq([~toUse2],inf).play(t);

	Ppar([~bassShap,Ppar([Pbindf(~kick,\amp, 2),Pbindf(~bass,\amp, 2 ),],inf)],1).play(t);
x = Synth(\recLoop,[buf:~buf,\recording,1, \in,~toRecord],~recGrp);
)
x.free;
~buf.play
Pbindef.free
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

d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\amp, 0.16,\cRatio, 1,\index, 1,\atkE, 0.1,\out,~outFil],~synthGrp));

 v = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,0.5,\out,~outFil],~synthGrp));

z=(Synth(\sinModul,[\modu,0.3]));
n= (Synth(\sawModul,[\modu,0.3]));
c =(Synth(\pulModul,[\modu,0.3]));
m =(Synth(\ranModul,[\modu,0.3]));


 k = (Synth( \filterModu, [\dur, inf,\in,~outFil, \out,~toRecord/*~gateBus*/,\qf, 0.4, \qf2,0.4,\filMod,100],~filterGrp));



Ppar([

Pbindef(\aaa, \instrument, \sequ, \value,Pseq([1200.rand,1200.rand,1200.rand],inf),\dur,Pseq([4/1],inf),\in, ~outFil/*~toRecord*/,\group,~shapGrp),


	/*Pbindef(\ga,*/

	/*Pxrand([
	Pbind(\instrument, \gate ,\in,~gateBus   ,\vlDec,1.8,\vlSub,1.8, \vlSub2,Pkey(\vlSub),
		\dur,Pxrand([ Pseq([16/1],1), Pseq([4/1],1) ],1),    \group,~shapGrp, \out,~toRecord ,\tS, 0.39550810372374 ,\relSu,0,\atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,\vlAtk,0,\vlRel,Pkey(\vlAtk)),

		Pbind(\instrument, \gate ,\in,~gateBus   ,\vlDec,1.8,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~shapGrp, \out,~toRecord,\tS, 0.39550810372374,
		\vlSub,Pfunc({1.7.exprand(1.1,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.03,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-28.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pkey(\vlAtk)
	)
	],inf)*/










],1).play(t);




MIDIdef.cc(\rateGate, { |value|var modFreq = value.linlin(0, 127, 10, 40);


	if(modFreq.round(1).postln ==20,{Pbindef(\ga,   \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==30,{Pbindef(\ga,  \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==40,{Pbindef(\ga,  \dur,Pseq([1/4],inf));},{});



},ccNum: 18 );//is 10






MIDIdef.noteOn(\res, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([4/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

},noteNum: 72);



MIDIdef.noteOn(\rlong, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([16/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

/*Pbindef(\ga,  \dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],inf),    \group,~shapGrp, \out,0 /*~toRecord*/,\vlDec,1.8,
		\vlDec,1.8,
	\vlSub,Pfunc({1.7.exprand(1.1,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.03,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-28.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pkey(\vlAtk));*/


},noteNum: 42);





MIDIdef.cc(\shoc, {|vel, nn, chan, src|[nn];
	v.set(\factor2,1);
d.set(\factor2,1);
Pbindef(\aaa,\dur,Pseq([1/1],inf),);

},ccNum: 113);

MIDIdef.cc(\shoc, {|vel, nn, chan, src|[nn];
	v.set(\factor2,1);
d.set(\factor2,1);
Pbindef(\aaa,\dur,Pseq([1/1],inf),

\vlDec,1.8,
	\vlSub,Pfunc({1.6.exprand(1.0,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1) }),\relSu,Pfunc({0.20.exprand(0.01)}));

},ccNum: 115);






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
	Pbindef(\ga   ,\vlDec,1.8,\vlSub,1.8, \vlSub2,Pkey(\vlSub), \dur,Pseq([4/1],inf) ,  \relSu,0,\atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,\vlAtk,0,\vlRel,Pkey(\vlAtk));

},noteNum: 36); //button 1


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


//filter here



MIDIdef.bend(\ben, { |val, chan, src|


	k.set(\filMod,  val.linlin(0,16383,50,1400).postln);


	 if( val.linlin(0,16383,50,1400) <60,{k.set(\which,0);"yo".postln},{});
		if( val.linlin(0,16383,50,1400) >1350,{k.set(\which,1);"yo2".postln},{});

	//~notes.set(\mod,modFreq.round(1).postln);
}, chan:  0);

/*MIDIdef.cc(\fil, { |value|var modFreq = value.linlin(0, 127, 30, 3500);

	 if(modFreq.round(1).postln <50,{k.set(\which,0);"yo".postln},{});
		if(modFreq.round(1).postln >3410,{k.set(\which,1);"yo2".postln},{});

	// if(modFreq.round(1).postln >1500,{k.set(\which,0);"yo".postln},{k.set(\which,1)});
		// if(modFreq.round(1).postln 1510,{);"yo2".postln},{});

	k.set(\filMod, modFreq.round(1));

},ccNum: 1 );*/






/*MIDIdef.cc(\fil2, { |value|var modFreq = value.linlin(0, 127, 60, 4200);


	// if(modFreq.round(1).postln >1500,{k.set(\which,0);"yo".postln},{k.set(\which,1)});
		// if(modFreq.round(1).postln 1510,{);"yo2".postln},{});

	k.set(\filMod2, modFreq.round(1));

},ccNum: 1 );*/

MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.08, 8);

	k.set(\qf, modFreq.round(0.01));},ccNum: 19 );

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

	k.set(\qf2, modFreq.round(0.01));},ccNum: 19 );

MIDIdef.cc(\c, { |value|var modFreq = value.linlin(61, 67, 1, 10);

	if(modFreq.round(1).postln ==1,{Pbindef(\aaa, \dur,Pseq([16/1],inf));},{});
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

MIDIdef.cc(\freqx2, { |value|var modFreq = value.linlin(0, 127, 0.01, 659.255);


	d.set(\freq,modFreq.round(0.01).postln);
},ccNum: 93 );

MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 320);

	v.set(\freq3,modFreq.round(0.001));

},ccNum: 75 );

MIDIdef.cc(\cv, { |value|var modFreq = value.linlin(0, 127, 00.002, 40);

	/*v.set(\index3,modFreq.round(0.001));*/
	d.set(\index3,modFreq.round(0.001));
},ccNum: 72 );

)

(
MIDIdef.cc(\hey,{| func, ccNum, chan, srcID, argTemplate, dispatcher|

	[func, ccNum, chan, srcID, argTemplate, dispatcher].postln;
});

)

/*s.plotTree*/