
MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});





MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play


(
~notes = Array.newClear(128);
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shiftGrp = Group.after(~combGrp);
~shapGrp= Group.after(~shiftGrp);
~limitGrp= Group.after(~shapGrp);
~distoGrp= Group.after(~limitGrp);

~recGrp= Group.after(~distoGrp);



v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,\freq,76.midicps],~synthGrp);

~v =  Synth(\comb1,[ \in, ~outFil,\out,~toShifter   /*~outDisto*/,\amp,1,\maxDel,0.7744,\decT,-0,\busMod,~seqBus],~combGrp);

	Pbind(\instrument, \sequ,\out, ~seqBus, \value,Pseq([
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20)

].scramble,inf),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\legato, 2,\group,~shapGrp,\tS, 0.39550810372374,).play(t);



 ~h1 = Synth(\shiftX,[\in,~toShifter,\out ,~outTolimit,\freq,0],~shiftGrp);

~l1 = Synth(\lim,[\in, ~outTolimit,\out,~outDisto],~limitGrp);


h = Synth(\disto3,[\in,  ~outDisto , \out,0/*~outTolimit*/,\gain,1],~distoGrp);
/*
// l = Synth(\limiter,[\in, ~outTolimit,\out,0, \gain, 140],~limitGrp);*/




/*MIDIdef.noteOn(\piana,{arg vel, nn;
	[ nn].postln;
	~notes[nn] =  Synth( \fmX, [\freq, nn.midicps,\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,0/*~outFil*/
		,\amp, vel.linexp(1,127,0.12,0.14,\freq, nn.midicps)
	],~synthGrp);
});


MIDIdef.noteOff(\offPiana, {arg vel, nn;nn.postln;
	~notes[nn].set(\gate,0);
	~notes[nn] = nil;
});*/


MIDIdef.cc(\fmCt ,{ |value|var modFreq = value.linlin(0, 127,0.01, 0.8);

	// ~notes.do{arg synth; synth.set(/*\fmCtrl*/\cRatio, modFreq.round(0.01))};
v.set(\cRatio, modFreq.round(0.01).postln);
},ccNum: 74 ); //is2





MIDIdef.cc(\fmCt2 ,{ |value|var modFreq = value.linlin(61, 67, 0.8, 0);

	v.set(\fmCtrl, modFreq.round(0.01).postln);
	~notes.do{arg synth; synth.set(\fmCtrl, modFreq.round(0.01))};

},ccNum: 114 ); //is 9.

MIDIdef.cc(\rteShit, { |value|var modFreq = value.linlin(0, 127, 1, 0);

	~h1.set(\rte, modFreq.round(0.01).postln);

},ccNum: 75 ); //is 8





MIDIdef.noteOn(\start, {|vel, nn, chan, src|
	[nn].postln;
/*v.set(\gate,1);*/
 v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,],~synthGrp);

},noteNum: 36); //button 1


MIDIdef.noteOn(\rcord, {|vel, nn, chan, src|
	[nn].postln;

x = Synth(\recLoop,[buf:~buf,\recording,1, \in,0],~recGrp);

},noteNum: 43);//is 8



/*MIDIdef.cc(\ml, { |value|var modFreq = value.linlin(0, 127, 0, 0.8);

	~v.set(\multi, modFreq.round(0.01).postln);

},ccNum: 18 ); //is 10*/



MIDIdef.cc(\ml2, { |value|var modFreq = value.linlin(0, 127, 0, 0.8);

	~h1.set(\mult, modFreq.round(0.01).postln);

},ccNum: 18 ); //is 10


/*MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, 0.42, -0.2);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3*/



MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, 0.3872, -0.0968);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3


/*MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, -0.0, -0.5);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 71 );  //is 3

MIDIdef.cc(\mDelup, { |value|var modFreq = value.linlin(0, 127, 0.0, 1);

	~v.set(\decT, modFreq.round(0.001).postln);

},ccNum: 74 );  //is 2*/


MIDIdef.cc(\fr, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\fr, modFreq.round(0.001).postln);
},ccNum:   16); //is 12


MIDIdef.cc(\frCtrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modR, modFreq.round(0.001).postln);
},ccNum:   76); //is 12

MIDIdef.cc(\f1, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f1, modFreq.round(0.001).postln);
},ccNum:   17); //is 13

MIDIdef.cc(\f1Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modS, modFreq.round(0.001).postln);
},ccNum:   77); //is 5


MIDIdef.cc(\f2, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f2, modFreq.round(0.001).postln);
},ccNum:        91 );//is 14

MIDIdef.cc(\f2Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.075, 20.6);

	~v.set(\modT, modFreq.round(0.001).postln);
},ccNum:        93 );//is 6


MIDIdef.cc(\f3, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f3, modFreq.round(0.001).postln);
},ccNum: 79);//is 15


MIDIdef.cc(\f3Ctrl, { |value|var modFreq = value.linlin(0,127, 0.075, 20.6);

	~v.set(\modSa, modFreq.round(0.001).postln);
},ccNum: 73);//is 7



MIDIdef.cc(\fx, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\fx, modFreq.round(0.001).postln);
},ccNum:  72 );//is 16


/*MIDIdef.cc(\rise, { |value|var modFreq = value.linlin(0, 127, 0.001, 1);

	v.set(\cRatio, modFreq.round(0.001).postln);

},ccNum: 1 );*/


MIDIdef.cc(\riseShift, { |value|var modFreq = value.linlin(0, 127, 0, 5000);

	~h1.set(\frq, modFreq.round(0.1).postln);

},ccNum: 1 );



/*MIDIdef.cc(\mVo, { |value|var modFreq = value.linlin(0, 127, 0, 1);

v.set(\multi, modFreq.round(0.01).postln);
	/*d.set(\multi, modFreq.round(0.01));*/

},ccNum: 75 ); //is 11*/

)




FreqScope.new
~buf.play
~bufSnoopy.play


(
~filterGrp = Group.new;
~distoGrp= Group.after(~filterGrp);
~recGrp= Group.after(~distoGrp);

// Ppar([~bassShap,Ppar([Pbindf(~kick,\amp, (-5)),Pbindf(~bass,\amp, (-7) ),],inf)],1).play(t);

g = Synth(  \playBufX,[ \impulse, 0.00001,\loo,1,\buf,~buf,\out, ~bgFil]);



k = Synth(\filterU, [\out,0/*~distoBg*/,\in, ~bgFil, \lFrq,22000, \lFrq2,22000,\hFrq,50,\hFrq2,50,\qfH ,0.7, \qfH2, 0.2,\qlL ,0.6 ,\qlL2 ,0.55 ], ~filterGrp);
/*d = Synth(\disto,[\in,~distoBg,\out,0],~distoGrp);*/



/*MIDIdef.cc(\lpF, { |value|var modFreq = value.linlin(0, 127, 500,22000);

	 k.set(\lFrq, "lp: ".postln;modFreq.round(1).post;)},ccNum: 18 );// is 10*/



MIDIdef.cc(\lpF2x, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,24000/*18000*/);

	k.set(\lFrq,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );



/*MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,12000);

	k.set(\lFrq2,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );*/


MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, 310/*800*/,24000);

	k.set(\lFrq2,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 18 );




MIDIdef.cc(\hpF, { |value|var modFreq = value.linlin(0, 127, 70, 18000);

k.set(\hFrq, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16


MIDIdef.cc(\hpF2, { |value|var modFreq = value.linlin(0, 127, 70, 2400);

k.set(\hFrq2, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16




MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

x = Synth(\recLoop,[buf:~bufSnoopy,\recording,1, \in,0],~recGrp);

},noteNum: 43);// is 43



MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.3, 8);

	k.set(\qlL, modFreq.round(0.1));},ccNum: 19 );// is 11

/*MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

	k.set(\qfH, modFreq.round(0.1));},ccNum: 19 );*/
)
~bufSnoopy.play





//select
(Ppar([

Pbind(\instrument,\playBufXG,\rte,32,\dur,Prand([

		Pseq([1/16],inf)
	/*	Pseq([3/1],1)*/
/*Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 )*/].scramble,inf) ,\amp, 1,\buf,~buf,\out,0,\impulse,0.003,\start,3276308.3583556,\tS, 0.39550810372374 ,\vlSub,  0.61 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))

~st=3276308.3583556

(~buf.numFrames.rrand(1400000)- 1400000).postln

//build

(o= {Out.kr(~bus1, SinOsc.ar(0.084,4.7).range(1,0.82))}.play)



(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~recGrp=Group.after(~distoGrp);
)
(
Ppar([
	// \playBufXGMod
	Pbind(\instrument,\playBufXGMod,\rte,4,\dur, Pseq([1/16],inf),\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 0.5,\duration,Pkey(\dur),\impulse,0.003,\start,~st, \tS, 0.39550810372374 ,
	\vlSub, 1 /*0.01*/, \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, /*0.6*/~pDecT ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,-1,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0,\busMod,~bus1),


	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value, 0.64375,\amp,1,\decT,(0.02),\ph,4.4,\out,~gateMelo, \group,~phaserGrp),

	// 0.64375
Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,2,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.6, \qf2,0.4,\freqFil,15
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);

//again

(~buf.numFrames.rrand(1400000)- 1400000).postln

(
~filterGrp= Group.new   ;
~recGrp= Group.after(~filterGrp)
)

Pbind(\instrument,\playBufXG,\dur,Pseq([3/1],inf),\amp, 1,\buf,~buf ,\out,~eqBus2x,\impulse,0.003,\start,749451.00811287,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, 1 ,	\subsT, 0 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t)



	Synth(\filterG, [\in,~eqBus2x , \which,1,\qf2,0.4],~filterGrp)

x = Synth(\recLoop,[buf:~lpPrec3,\recording,1, \in,0],~recGrp);


~lpPrec2.play

642438.18770068
//choose here
(Pbind(\instrument,\playBufXG,\dur,  Pseq([4.75],1) /*Pseq([1/4],24)*/,\amp, 1,\buf,~lpPrec,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2 = 650438.18770068 /*(~lpPrec.numFrames.rrand(5000)-5000).postln*/ ,\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t))