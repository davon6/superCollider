//
// multi voices aie
// Ppar([~bassShap,Ppar([Pbindf(~kick,\amp, (-4)),Pbindf(~bass,\amp, (-7) ),],inf)],1).play(t);

/*(
k.set(\out,~toRecord);
x = Synth(\recLoop,[buf:~buf,\recording,1, \in,~toRecord],~recGrp);
)*/

1* t.beatDur

(Ppar([

	~bassShap, Ppar([~hat2,~kick, ~bass],inf),
	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~synthGrp, \frq, 20.6,\vol,1/*\val, 659.255, \quant,1, \gain ,(-20)*/),

],1).play(t))

~buf.free;
~buf2.play
Pbindef.free
s.plotTree
MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;
//MIDI ALLOC
(
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shapGrp= Group.after(~combGrp);

~recGrp= Group.after(~shapGrp);



~scl = [Pbindef(\aaa, \instrument, \sequ, \value,
		Pseq([Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -3),Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -2),Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -3)],inf),\dur,Pseq([4/1],inf),/*\in, ~outFil/*~toRecord*/,*/\group,~shapGrp),



Pbindef(\aaa, \instrument, \sequ, \value,
	Pseq([Scale.minor(\just).degreeToFreq(7.rand, 76.midicps, -3),Scale.minor(\just).degreeToFreq(7.rand, 76.midicps, -2),Scale.minor(\just).degreeToFreq(7.rand, 76.midicps, -3)],inf),\dur,Pseq([4/1],inf)/*,\in, ~outFil/*~toRecord*/*/,\group,~shapGrp)];


//no2 doesnt not go tottsly tru filter at least low
// phaser
//CANT HEAR DELAY IN ARRANGEMENT


d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\amp, 0.16,\cRatio, 1,\index, 1,\atkE, 0.1,\out,~outFil],~synthGrp));

 v = (Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,0.18,\out,~outFil3],~synthGrp));
/*~v = Synth(  \comb,[\in, ~outFil,\out,0],~combGrp,);*/

~v =  Synth(/* Pbind(\instrument, */\comb3,[ \dur, 9999/*Pseq([16/1],inf)*/,\in, ~outFil3,\out,~outDisto3/*~distoBg*/,/*\group,*/\delayT,0.01,\amp,0.8,

	/*Pfunc({9.00.rand.postln}),*/
	/*Pwhite(0.0121,6),*/\tS, 0.39550810372374],~combGrp);


h = Synth(\disto3,[\in,  ~outDisto3 /*~distoBg*/,\out,0],~shapGrp);


z=(Synth(\sinModul,[\modu,0.075,\busMod,~mod1]));
n= (Synth(\sawModul,[\modu,0.075,\busMod,~mod2]));
c =(Synth(\pulModul,[\modu,0.075,\busMod,~mod3]));
m =(Synth(\ranModul,[\modu,0.3,\busMod,~mod4]));


~z=(Synth(\sinModul,[\modu,0.075,\busMod,~mod1x]));
~n= (Synth(\sawModul,[\modu,0.075,\busMod,~mod2x]));
~c =(Synth(\pulModul,[\modu,0.075,\busMod,~mod3x]));
~m =(Synth(\ranModul,[\modu,0.3,\busMod,~mod4x]));


/*k = (Synth( \filterModu, [\dur, inf,\in,~outFil, \out,[0,1]/*~toRecord*//*~gateBus*/,\qf, 0.4, \qf2,0.4,\filMod,100, \filFreq, 100,\filFreq2, 1200, \which,0],~filterGrp));*/



~scl[~scale].play(t);




/*MIDIdef.cc(\rateGate, { |value|var modFreq = value.linlin(0, 127, 10, 40);


	if(modFreq.round(1).postln ==20,{Pbindef(\ga,   \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==30,{Pbindef(\ga,  \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==40,{Pbindef(\ga,  \dur,Pseq([1/4],inf));},{});



},ccNum: 18 );//is 10*/



MIDIdef.noteOn(\oFF, {|vel, nn, chan, src|
	[nn].postln;
/*v.set(\gate,0);
d.set(\gate,0);*/


	/*k.set(\out,~toRecord);*/
	/*d.set(\out,~toRecord);
	~v.set(\out,~toRecord);
*/
x = Synth(\recLoop,[buf:~buf2,\recording,1, \in,0/*~toRecord*/],~recGrp);

},noteNum: 43);







MIDIdef.noteOn(\res, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([4/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

},noteNum: 72);



MIDIdef.noteOn(\rlong, {|vel, nn, chan, src|[nn];

Pbindef(\aaa,\dur,Pseq([16/1],inf),
\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

},noteNum: 42);






MIDIdef.cc(\ro, { |value|var modFreq = value.linlin(0, 127, 0.01, 6.1952);



~v.set(\decT, modFreq.round(0.01).postln);


},ccNum: 91 ); //is 14



MIDIdef.cc(\shoc, {|vel, nn, chan, src|[nn];
	v.set(\factor2,1);
d.set(\factor2,1);
	~v.set(\factor2,1);

Pbindef(\aaa,\dur,Pseq([1/1],inf),);

},ccNum: 113);

MIDIdef.cc(\shoc, {|vel, nn, chan, src|[nn];
	v.set(\factor2,1);
d.set(\factor2,1);
	/*~v.set(\factor2,1);*/


Pbindef(\aaa,\dur,Pseq([1/1],inf),

/*\vlDec,1.8,
	\vlSub,Pfunc({1.6.exprand(1.0,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.20.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.3,0.1)}),
	\relT,Pfunc({0.12.exprand(0.8,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1) }),\relSu,Pfunc({0.20.exprand(0.01)})*/);

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
v.set(\gate,1,\factor,0,\factor2,0,\factorx,0,\factorx2,0);
d.set(\gate,0);
	Pbindef(\aaa,	\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,Pseq([4/1],inf));
	Pbindef(\ga   ,\vlDec,1.8,\vlSub,1.8, \vlSub2,Pkey(\vlSub), \dur,Pseq([4/1],inf) ,  \relSu,0,\atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,\vlAtk,0,\vlRel,Pkey(\vlAtk));

},noteNum: 36); //button 1


MIDIdef.noteOn(\modLfo, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod1);
	d.set(\factor,1,\modu, ~mod1 );
~v.set(\factor,1,\modu, ~mod1 );
},noteNum: 38);

MIDIdef.noteOn(\modLfo2, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod2);
	d.set(\factor,1,\modu, ~mod2 );
~v.set(\factor,1,\modu, ~mod2 );
},noteNum: 39);

MIDIdef.noteOn(\modLfo3, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod3);
	d.set(\factor,1,\modu, ~mod3 );
	~v.set(\factor,1,\modu, ~mod3 );
},noteNum: 40);

MIDIdef.noteOn(\modLfo4, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod4);
	d.set(\factor,1,\modu, ~mod4 );
~v.set(\factor,1,\modu, ~mod4 );
},noteNum: 41);




MIDIdef.noteOn(\modLfox, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod1x);

},noteNum: 72);

MIDIdef.noteOn(\modLfo2x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod2x);

},noteNum: 71);

MIDIdef.noteOn(\modLfo3x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod3x);

},noteNum: 69);

MIDIdef.noteOn(\modLfo4x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod4x);

},noteNum: 67);




MIDIdef.noteOn(\modLfox, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod1);
	/*d.set(\factorx,1,\modu, ~mod1 );
~v.set(\factorx,1,\modu, ~mod1 );*/
},noteNum: 72);

MIDIdef.noteOn(\modLfo2x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod2);
	/*d.set(\factorx,1,\modu, ~mod2 );
~v.set(\factorx,1,\modu, ~mod2 );*/
},noteNum: 71);

MIDIdef.noteOn(\modLfo3x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factor,1,\modu, ~mod3);
	/*d.set(\factorx,1,\modu, ~mod3 );
	~v.set(\factorx,1,\modu, ~mod3 );*/
},noteNum: 69);

MIDIdef.noteOn(\modLfo4x, {|vel, nn, chan, src|[nn].postln;
	v.set(\factorx,1,\modu, ~mod4);
	/*d.set(\factorx,1,\modu, ~mod4 );
~v.set(\factorx,1,\modu, ~mod4 );*/
},noteNum: 67);












MIDIdef.cc(\mVo, { |value|var modFreq = value.linlin(0, 127, 0, 1);



v.set(\multi, modFreq.round(0.01).postln);
	d.set(\multi, modFreq.round(0.01));

},ccNum: 19 ); //is 11






MIDIdef.cc(\rise, { |value|var modFreq = value.linlin(0, 127, 0.001, 1);

	v.set(\cRatio, modFreq.round(0.001).postln);

	// d.set(\cRatio, modFreq.round(0.001).postln);


},ccNum: 1 );


/*MIDIdef.cc(\riseS, { |value|var modFreq = value.linlin(0, 127, 0.0001, 4);

	d.set(\delayT, modFreq.round(0.0001).postln);


},ccNum: 1 );*/



MIDIdef.cc(\cRa, { |value|var modFreq = value.linlin(0, 127, 1, 0.1);

	d.set(\cRatio,modFreq.round(0.1));

},ccNum: 75 ); //i s8



MIDIdef.cc(\c, { |value|var modFreq = value.linlin(61, 67, 1, 10);

	//if(modFreq.round(1).postln ==1,{Pbindef(\aaa, \dur,Pseq([16/1],inf));},{});
	if(modFreq.round(1).postln ==3,{Pbindef(\aaa, \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==6,{Pbindef(\aaa, \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==10,{Pbindef(\aaa, \dur,Pseq([1/4],inf));},{});


/*switch (modFreq,
		1, "gosh".postln;,
        20,"gosh2".postln;,

		"goshDefa".postln;);*/

},ccNum: 112 );

MIDIdef.cc(\modLF, { |value|var modFreq = value.linlin(0, 127, 00.002, 1.2875);

	z.set(\modu,modFreq.round(0.001));
	n.set(\modu,modFreq.round(0.001));

},ccNum: 77);



MIDIdef.cc(\moRa, { |value|var modFreq = value.linlin(0, 127, 00.002, 20.6);


	m.set(\modu,modFreq.round(0.01));
},ccNum: 77);


MIDIdef.cc(\moduLF, { |value|var modFreq = value.linlin(0, 127, 00.002, 1.2875);


	c.set(\modu,modFreq.round(0.001));

},ccNum: 77);

//
MIDIdef.cc(\modLFx, { |value|var modFreq = value.linlin(0, 127, 00.002, 1.2875);

	~z.set(\modu,modFreq.round(0.001));
	~n.set(\modu,modFreq.round(0.001));

},ccNum: 76); // is 4



MIDIdef.cc(\moRax, { |value|var modFreq = value.linlin(0, 127, 00.002, 20.6);


	~m.set(\modu,modFreq.round(0.01));
},ccNum: 76);// is 4


MIDIdef.cc(\moduLFx, { |value|var modFreq = value.linlin(0, 127, 00.002, 1.2875);


	~c.set(\modu,modFreq.round(0.001));

},ccNum: 76);// is 4



MIDIdef.cc(\myModFreq, { |value|var modFreq = value.linlin(0, 127, 00.002, 3200);
	//
	/*v.set(\freq2,modFreq.round(0.001).postln);*/
	d.set(\freq2,modFreq.round(0.001));
},ccNum: 73);

//??
MIDIdef.bend(\twi, { |val, chan, src|


	v.set(\freq2, val.linlin(0,16383,0,1200).postln);


}, chan:  11);

/*MIDIdef.cc(\freqx, { |value|var modFreq = value.linlin(0, 127, 00.002, 1200);

	v.set(\freq,modFreq.round(0.001));

},ccNum: 93 );*/

MIDIdef.cc(\freqx2, { |value|var modFreq = value.linlin(0, 127, 0.01, 659.255);


	d.set(\freq,modFreq.round(0.01).postln);
},ccNum: 93 );
/*
MIDIdef.cc(\freqx3, { |value|var modFreq = value.linlin(0, 127, 00.002, 320);

	v.set(\freq3,modFreq.round(0.001));

},ccNum: 75 );*/

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





//SNOOPY
(
~filterGrp = Group.new;
~distoGrp= Group.after(~filterGrp);
~recGrp= Group.after(~distoGrp);

// Ppar([~bassShap,Ppar([Pbindf(~kick,\amp, (-5)),Pbindf(~bass,\amp, (-7) ),],inf)],1).play(t);
)

~buf.play
~bufSnoopy.play
(
g = Synth(  \playBufX,[ \impulse, 0.00001,\loo,1,\buf,~buf2,\out, ~bgFil]);



k = Synth(\filterU, [\out,0/*~distoBg*/,\in, ~bgFil, \lFrq,900,\hFrq,300,\qfH ,0.4, \qlL ,0.4 ], ~filterGrp);
/*d = Synth(\disto,[\in,~distoBg,\out,0],~distoGrp);*/



MIDIdef.cc(\lpF, { |value|var modFreq = value.linlin(0, 127, 500,22000);

	 k.set(\lFrq, "lp: ".postln;modFreq.round(1).post;)},ccNum: 18 );// is 10



MIDIdef.cc(\hpF, { |value|var modFreq = value.linlin(0, 127, 20, 2000);

k.set(\hFrq, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16



MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

x = Synth(\recLoop,[buf:~bufSnoopy,\recording,1, \in,0],~recGrp);

},noteNum: 43);// is 43



MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.3, 8);

	k.set(\qlL, modFreq.round(0.1));},ccNum: 19 );// is 11

MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

	k.set(\qfH, modFreq.round(0.1));},ccNum: 19 );
)

/*s.plotTree*/