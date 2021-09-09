
MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});




MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play
~buf=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src2.aiff")

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/src.aiff");

(
~notes = Array.newClear(128);
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shiftGrp = Group.after(~combGrp);
~shapGrp= Group.after(~shiftGrp);
~limitGrp= Group.after(~shapGrp);


~distoGrp= Group.after(~limitGrp);

~gateGrp= Group.after(~distoGrp);
~panGrp= Group.after(~gateGrp);

// ~recGrp= Group.after(~distoGrp);



v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~record1,\freq,78.midicps],~synthGrp);

~v =  Synth(\comb1,[ \in, ~record1,\out,~record2   /*~outDisto*/,\amp,1,\maxDel,0.7744,\decT,-0.2 /*was -0*/,\busMod,~seqBus],~combGrp);

Pbindef(\seq,\instrument, \sequ,\out, ~seqBus, \value,Pseq([
/*Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20)*/

	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20)

].scramble,inf),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\legato, 2,\group,~shapGrp,\tS, 0.39550810372374,).play(t);


 ~h1 = Synth(\shiftX,[\in,~record2,\out ,~record3,\freq,0],~shiftGrp);

// ~del1= Synth(/*\pingD*/ \del,[\bufnum,~delay ,\in,~record3 ,\out,~record5],~delayGrp);



~l1 = Synth(\lim,[\in,~record3 ,\out,~record4],~limitGrp);




h = Synth(\disto,[\in,  ~record4 , \out,~record6,\gain,1],~distoGrp);


Pbindef(\gato,\instrument, \gate ,\in,~record5   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1/1],1) ],1)*/Pseq([1/4],inf) ,    \group,~gateGrp, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
	\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)).play(t,quant:1);




x = Synth(\pan2,[\in,  ~record6 , \out,0/*~outTolimit*/,\gain,1],~panGrp);
/*
// l = Synth(\limiter,[\in, ~outTolimit,\out,0, \gain, 140],~limitGrp);*/

MIDIdef.noteOn(\gating, {|vel, nn, chan, src|
	[nn].postln;
h.set(\out,~record5);
	Pbindef(\gato, \out,~record6);
},noteNum: 36); //button 1



MIDIdef.noteOn(\gatingOff, {|vel, nn, chan, src|
	[nn].postln;
	h.set(\out,~record6);
	Pbindef(\gato, \out,0);
},noteNum: 37); //button 2


/*MIDIdef.noteOn(\rcordOn, {|vel, nn, chan, src|

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/src"+~count+".aiff",numChannels:1);

},noteNum: 42);


MIDIdef.noteOn(\rcordOff, {|vel, nn, chan, src|
	// [nn].postln;

	// x = Synth(\recLoop,[buf:~buf,\recording,1, \in,0],~recGrp);
	// s.record;


	Routine({



		s.stopRecording;
	v.free;~v.free;  ~h1.free;  ~l1.free;  h.free;  x.free;Pbindef(\seq).clear;

		wait(0.5);

		~buf = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/src"+~count+".aiff");

		wait(0.5);

		~count=~count+1;


		a=({Out.ar(~record1,PlayBuf.ar(1,~buf,loop: 1))}.play);


		wait(0.5);


		k=Synth(\filterG,[ \in,~record1],a,addAction:\addAfter);

		v=Synth(\stereoO,[\dlt1,0.3,\dlt2,0.4],k,addAction:\addAfter);


		wait(0.5);

		MIDIdef.cc(\filWhich ,{ |value|var modFreq = value.linlin(61, 67,0, 3);


			k.set(\which, modFreq.round(0.1).postln);
},ccNum: 114 ); //is 9


		MIDIdef.noteOn(\rcordOn, {|vel, nn, chan, src|


			"yo".postln

			// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/src1.aiff",numChannels:1);

},noteNum: 42);



	}).play
	// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/src1.aiff",numChannels:1)

},noteNum: 43);//is 8*/




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


//USELESS

MIDIdef.cc(\fmCt ,{ |value|var modFreq = value.linlin(0, 127,0, 0.8);

	// ~notes.do{arg synth; synth.set(/*\fmCtrl*/\cRatio, modFreq.round(0.01))};
v.set(\cRatio, modFreq.round(0.01).postln);
},ccNum: 74 ); //is2




MIDIdef.cc(\delayDelT ,{ |value|var modFreq = value.linlin(61, 67,0, /*0.8*/3);


~del1.set(/*\delayTime*/ \delT, modFreq.round(0.01).postln);
},ccNum: 112 ); //is2


MIDIdef.cc(\delayFeedback ,{ |value|var modFreq = value.linlin(61, 67,0, 4/*0.9*/);

~del1.set(/*\feedback*/ \decT, modFreq.round(0.01).postln);
},ccNum: 114 ); //is2



/*MIDIdef.cc(\fmCt2 ,{ |value|var modFreq = value.linlin(61, 67, 0.8, 0);

	v.set(\fmCtrl, modFreq.round(0.01).postln);
	~notes.do{arg synth; synth.set(\fmCtrl, modFreq.round(0.01))};

},ccNum: 114 ); //is 9.*/


MIDIdef.cc(\fmCtrl, { |value|var modFreq = value.linlin(0, 127,0.8, 0.01);

	v.set(\fmCtrl, modFreq.round(0.01));},ccNum: 19 );//is 11




MIDIdef.cc(\rteShit, { |value|var modFreq = value.linlin(0, 127, 1, 0);

	~h1.set(\rte, modFreq.round(0.01).postln);

},ccNum: 75 ); //is 8





/*MIDIdef.noteOn(\start, {|vel, nn, chan, src|
	[nn].postln;
/*v.set(\gate,1);*/
 v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,],~synthGrp);

},noteNum: 36); //button 1*/





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



MIDIdef.cc(\lpF2x, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,12000);

	k.set(\lFrq,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 18 );


MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, /*310*/600,22000);

	k.set(\lFrq2,"lp: ".postln;modFreq.round(1).post;);


	// k.set(\lFrq,"lp: ".postln;modFreq.round(1).post;)

},ccNum: 18 );




MIDIdef.cc(\hpF, { |value|var modFreq = value.linlin(0, 127, 70, 3200/*18000*/);

k.set(\hFrq, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16


MIDIdef.cc(\hpF2, { |value|var modFreq = value.linlin(0, 127, 70, 2400);

k.set(\hFrq2, "hp: ".postln;modFreq.round(1).post);},ccNum: 72 );// is 16




MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

	// x = Synth(\recLoop,[buf:~bufSnoopy,\recording,1, \in,0],~recGrp);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/src1F2.aiff",numChannels:1)

},noteNum: 43);// is 43



MIDIdef.cc(\filRez, { |value|var modFreq = value.linlin(0, 127, 0.3, 8);

	k.set(\qlL, modFreq.round(0.1));},ccNum: 19 );// is 11

/*MIDIdef.cc(\filRez2, { |value|var modFreq = value.linlin(0, 127, 0.3, 1);

	k.set(\qfH, modFreq.round(0.1));},ccNum: 19 );*/
)
~bufSnoopy.play



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\vl,1).play(t)
~kb.stop
//select
(Ppar([

Pbind(\instrument,\playBufXG,\rte,2,\dur,Pseq([1/16],inf)
,\buf,~buf,\out,0,\impulse,0.003,\start,~st=SAVE VALUE
,\tS, 0.39550810372374 ,\vlSub,  0.5 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk)


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))


// close     ~st=3856011

~st=1416566.6640023                 //~st=2201750.7150731

(~buf.numFrames.rrand(1400000)- 1400000).postln

//build

(o= {Out.kr(~bus1, LFTri.ar(0.084,4.7).range(1,1.2))}.play)


(o= {Out.kr(~bus1, SinOsc.ar(1.2875,4.7).range(1,1.1))}.play)

(o= {Out.kr(~bus1, SinOsc.ar(0.084,4.7).range(1,3.1))}.play)




(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~recGrp=Group.after(~distoGrp);

Ppar([Pbind(\instrument, \lfo13, \val,3.5,\dur,Pseq([64/1],inf), \out,  ~bus7,\tS, 0.39550810372374,\rL,-30,\rH,5000),

	// \playBufXGMod
	Pbind(\instrument,\playBufXGMod,\rte,0.75,\dur, Pseq([1/16],inf),\amp, 1,\buf,~buf,\out,~phaseBus,\gate, 0.5,\duration,Pkey(\dur),\impulse,0.003,\start,~st, \tS, 0.39550810372374 ,
	\vlSub, 0.38 /*0.01*/, \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 1,	\subsT,0.05 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,0,\decC,-1,\relC,0,\vlAtk , 0 ,  \vlRel,  Pkey(\vlAtk),\loopy,0,\busMod,~bus1,),


	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value,0.82 /*0.64375*/ ,\amp,1,\decT,0.8,\ph,4.4,\out,~gateMelo, \group,~phaserGrp),

	// 0.64375
Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.4, \qf2,0.8,\freqFil,15,/*\busMod,~bus7,*/
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec2,\recording,1, \in,0],~recGrp);

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/LPL.aiff",numChannels:1)

~lpPrec2 =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/LPL.aiff")


~lpPrec2.play



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)
~kb.stop

//again
256222
(~buf.numFrames.rrand(800000)- 800000).postln
//2660344.3627629   561638.15412434
(
~filterGrp= Group.new   ;
~recGrp= Group.after(~filterGrp);

Pbind(\instrument,\playBufXG,\rte,0.5,\dur,Pseq([ /* Pseq([1/1],inf)*/ Pseq([1/1],12) ,Pseq([4/1],1) ],inf)  ,\amp, 1,\buf,~buf ,\out,~eqBus2x,\impulse,0.003,\start,
193909
,\tS, 0.39550810372374 ,/*\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, 1 ,	\subsT, 0 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),*/\loopy,0).play(t);

// 636658.85969102

Synth(\filterG, [\in,~eqBus2x , \which,1,\qf2,0.3],~filterGrp))

// x = Synth(\recLoop,[buf:~lpPrec3,\recording,1, \in,0],~recGrp);

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/BPL.aiff",numChannels:1)

 ~lpPrec3= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/BPL.aiff");


~lpPrec3.play
(~buf.numFrames.rrand(1400000)- 1400000).postln

642438.18770068
//choose here
(Pbind(\instrument,\playBufXG,\dur, Pseq([4.75],1) /*Pseq([1/4],24)*/,\amp, 1,\buf,~lpPrec,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2 = 668438.18770068 /*(~lpPrec.numFrames.rrand(5000)-5000).postln*/ ,\tS, 0.39550810372374 ,
	\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0).play(t))


(
~filterGrp = Group.new;
~delGrp =Group.after(~filterGrp);
~combGrp=Group.after(~delGrp);
~recGrp2=Group.after(~combGrp););
(
Ppar([

	Pbind(\instrument, \playBuf,\dur,1/16, \rte,Pfunc({4.rrand(0.1)}), \tS,  0.39550810372374,\buf,~snare,\out,1,\dA,0.1,
		\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
			\note,\note,\note,\note,
			\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
					\note,\note,\note,\note,\rest,\rest,\rest,\rest,
		],inf)
	)
	,
	Pbind(\instrument, \filterGS,\which,1, \in,1/*~percuStereo*/ ,\out,2/*~part2SRev*/, \group, ~filterGrp,\qf2,0.08,\dur ,inf),


	Pbind(\instrument,\pingD, \in,2,  \bufnum,~delay, \feedback,0.65 ,\group, ~delGrp,\dur, inf,\out,3/*~limitBus1*/),
	Pbind(\instrument, \comb,\which,1, \in,3/*~limitBus1*/,\group, ~combGrp,\qf2,0.1,\dur ,inf),

	// Pbind(\instrument,\recLoopS,\buf,~fkAr,\recording,1, \in,0,\group,~recGrp2,\dur,inf),

],1).play(t)
)

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/fkAr.aiff",numChannels:1)

 ~fkAr= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/fkAr.aiff");
~fkAr.play
52.midicps
//idea
(SynthDef(\idea, {Out.ar(0,CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/52.midicps/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-0.2)!2)}).play;)


// Pbind(\instrument,\recLoopS,\buf,~kb2Test,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/idea.aiff",numChannels:1)

 ~kb2Test= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/idea.aiff");


~kb2Test.play

(

~extraDelay = Group.new;
~revGrp = Group.after(~extraDelay);
~recGrp2= Group.after(~revGrp);


(
SynthDef(\chord,{

	Out.ar(~delayToLimit,
		BHiPass4.ar((Saw.ar(64.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
		Saw.ar(67.midicps+EnvGen.kr(Env([50,0],[20],-5)))+
			Saw.ar(63.midicps+EnvGen.kr(Env([50,0],[20],-5)))),MouseY.kr(30,12000),0.8)*0.2)
}).play;




Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay).play(t);




~rev2= Synth( \reverbMad,~churcx,    ~revGrp );
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,-4,\revtime, 14.85, \damping, 0.01,\roomsize, 46,\inputbw,0.02)
)
)


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pad.aiff",numChannels:1)

 ~pad= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad.aiff");
~pad.play



a= Synth( \reverbMad,~churcx,    ~extraDelay );
a.set( \in,~delayToLimit  , \out,0 /*~delayBus2*/,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)


Pbind(\instrument,\recLoopS,\buf,~pad,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)
~pad.play

(
c = {
	var sig = In.ar(0, 12);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(0, outbus: 0, addAction: \addAfter);
)

z = s.scope(2, index: 0).style_(2).yZoom_(16);


~mont =0
//sick pad and kiasmo
Pbind(\instrument, \percussion, \dur,Pseq([1/4],512),\carHz, Pfunc({50.12070612224.rrand(150)+(~mont=~mont+40)}),\modHz,Pfunc({34.3179398.rrand(0.1)+(~mont=~mont+40)}),\modAmp,Pfunc({ 0.00875.rrand(0.001)}) ,\amp,1,\rel,Pfunc({0.3872.rand}),\rel2,Pfunc({0.3872.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod,Pfunc({1500.rand})/*901*/,\out,0,\latch,Pfunc({18900.rand}),\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)







Pbind(\instrument, \percussion, \dur,Pseq([1/1],inf),\carHz, Pfunc({1050.12070612224.rrand(150)+(~mont=~mont+400)}),\modHz,Pfunc({9334.3179398.rrand(0.1)+(~mont=~mont+400)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,Pfunc({4.05544.rand}),\rel2,Pfunc({4.0242.rand}),\stereoL, 0.00555, \crv1, Pfunc({ (-7.4).rand}), \crv1b,Pfunc({(-42).rand}), \mulMod, 901,\out,0,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)

/*//original
Pbind(\instrument, \percussion, \dur,Pseq([1/4],inf),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,0,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})).play(t)*/


//new percu dance



~stereoGrp=Group.new;
~recGrp2=Group.after(~stereoGrp);

(
Routine({


a=Prand([

Pbind(\instrument, \percussion ,\dur,Pseq([1/4],4 ),\carHz, Pfunc({525.12070612224.rrand(0.01)}),\modHz,Pfunc({11899.3343179398.rrand(0.001)}),\modAmp, Pfunc({0.12875.rrand(0.000001)}) ,\amp,3,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({ (-14.4).rrand(-1)}), \crv1b,(-4).rand, \mulMod, 1691,\out,   ~record1),


		Pbind(\instrument,\percussion,\dur,Pseq([1/2], 1),\atk, 0,\rel,t.beatDur/2,\rel2,t.beatDur/4,\amp,-1, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,~record2),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-1, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,~record3)
],inf).play(t);

	wait(0.16);

	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/funkPercX.aiff",numChannels:2,duration:t.beatDur*16)

}).play

)
// Pbind(\instrument,\recLoopS,\buf,~funkPerc,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t,quant:1)

~ste1=Synth(\stereoO,[\in,~record1],~stereoGrp);
~ste1.set(\spread,1, \level,1, \center,0,\dlt1,0.01,\dlt2,0,\decT,0.0968, \mxDel,0);

~ste2=Synth(\stereoO,[\in,~record2],~stereoGrp);
~ste2.set(\spread,0, \level,1, \center,0.0,\dlt1,0,\dlt2,0,\decT,0.1, \mxDel,1);

~ste3=Synth(\stereoO,[\in,~record3],~stereoGrp);
~ste3.set(\spread,0, \level,1, \center,0.0,\dlt1,0.1,\dlt2,0.2,\decT,1.5544, \mxDel,1)



~ste2.free


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1funkPerc.aiff",numChannels:2,duration:t.beatDur*16)


 ~funkPerc= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/funkPerc.aiff");
~funkPerc.play

({ReplaceOut.ar(0,In.ar(0)!10)}.play)


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-12, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,0).play(t)


b = Bus.audio(s, 2);

(
c = {
	var sig = In.ar(0, 2);
	var mid = sig[0] + sig[1];
	var side = sig[1] - sig[0];
	[side, mid] * 0.5
}.play(a, outbus: b, addAction: \addAfter);
)

z = s.scope(2, index: b.index).style_(2).yZoom_(16);
//or

z = s.scope(2, index: 0).style_(2).yZoom_(16);


Routine({


{LFTri.ar(28.midicps*(432/440),mul: EnvGen.kr(Env.perc(releaseTime: t.beatDur,curve: -7)))!2}.play;


{BLowPass4.ar(

	// PinkNoise.ar(0.6)

		SinOsc.ar(78.midicps*(432/440)*   SinOsc.kr(52.midicps*(432/440), mul:6.midicps*(432/440)+ SinOsc.kr(mul:6.midicps*(432/440)/10)))

	,EnvGen.kr(Env([3400,500,120],[ t.beatDur/32, t.beatDur,6],[-5,-4,1]),doneAction: 0),0.3)!2}.play;





	wait(0.16);

	 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/HPL.aiff",numChannels:1)

Pbind(\instrument,\recLoopS,\buf,~conga,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


~conga.play
Pbind(\instrument, \playBufS,\dur, Pseq([1/4],inf),\buf,~conga,\tS,0.39550810372374/*\rte,    Pfunc({2.6.rrand(0)})*/,\start,58600).play(t)
~conga.plot


~recGrp2=Group.new;


//voltingo

Synth(\granLive,[\buf,~snare,\out,0,\amp,0.05])


Synth(\recLoop,[\buf,~ambPerc,\recording,1, \in,0],~recGrp2)


({ReplaceOut.ar(0,In.ar(0)!2)}.play)



(~buf.numFrames.rrand(1400000)- 1400000).postln

(
~phaserGrp =Group.new;
~distoGrp=Group.after(~phaserGrp);
~gateGrp=Group.after(~distoGrp);
~eqGrp0=Group.after(~gateGrp);
~recGrp=Group.after(~eqGrp0);

Ppar([
	Pbind(\instrument, \lfo13, \val,1.55,\dur,Pseq([64/1],inf), \out,  ~bus7,\tS, 0.39550810372374,\rL,30,\rH,5000),

Pbind(\instrument,\playBufXG,\rte,4,\dur,/*Pseq([1/2],inf)*/Pseq([1/16],inf)
		,\amp, 1,\buf,~buf,\out,~gateMelo,\impulse,0.3
	/*	Pseq([ Pseq([ 82],8) /* ,20.6,20.6,10.3*/],inf)*/
		,\start, ~st
		,\tS, 0.39550810372374 ,\vlSub, /*0.3*/ 1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk/*,\gateSub,Pfunc({0.8.exprand(0.001)})*/,\dA,2,\loo,1),



	Pbind(\instrument, \filter, \dur, inf,\in,~gateMelo, \which,2,\out,~gateSeqBus,\group,~distoGrp,\busMod,~bus7,\freqFil,40
		,\qf ,0.4, \qf2,0.8,\freqFil,15
	),

	Pbind(\instrument,\gate,\in,~gateSeqBus , \out,0, \group,~gateGrp,\vlSub ,1,\vlSub2,Pkey(\vlSub),\relSu,Pfunc({0.8.exprand(0.001)}),\tS, 0.39550810372374,\dur,Pseq([1/4],inf))


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)


],1).play(t);
);
/*~eq3=Synth(\EQHP96, [\frq, 100, \out, 0/*~revBus1*/],~eqGrp0);

~eq3.set(\in, ~toEq , /*\out,~gateBus3,*/\val, ~val=0,\quant, ~quant=0, \gain,~gain=0,\val2,~val2=0,\quant2,~quant2=0, \gain2,~gain2=(-0),\val3,~val3=0,\quant3,~quant3=0, \gain3,~gain3= (-0),/*\val4,~val4=0,\shelf,~shelf=0, \gain4,~gain4=0,*/\val4,1200,\shelf,1, \gain4,(-3),\vol,12);*/


// x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);
~eq3.free

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/F/HPL.aiff",numChannels:1)

~lpPrec =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/HPL.aiff")
~lpPrec.play


Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03
	,\start,Pfunc({~lpPrec.numFrames.rand})).play(t)


//weird
Ppar([
	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([64/1],inf), \out,  ~bus6,\tS, 0.39550810372374,\rL,-0.06,\rH,0.08),

Pbind(\instrument,\playBufXGMod,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03,\busMod,~bus6
		,\start,Pfunc({~lpPrec.numFrames.rand}))],1).play(t)





Pbind(\instrument,\playBufXG,\rte,0.5,\dur,/*Pseq([1/2],inf)*/Pseq([1/16],inf)
		,\amp, 1,\buf,~buf,\out,0,\impulse,164
	/*	Pseq([ Pseq([ 82],8) /* ,20.6,20.6,10.3*/],inf)*/
		,\start, ~st
	,\tS, 0.39550810372374 ,\vlSub, /*0.3*/ 1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk/*,\gateSub,Pfunc({0.8.exprand(0.001)})*/,\dA,2,\loo,1).play(t)


//aleeee




MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});

Pbindef(\choo,\dur,Pseq([ 1/4],inf))
Pbindef(\choo,\dur,Pseq([ 1/1],inf))
Pbindef(\choo,\dur,Pseq([ 4/1],inf))
Pbindef(\choo,\dur,Pseq([ 16/1],inf))
Pbindef(\choo,\tS,1.8)

MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play
~buf=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src1.aiff")


(
~notes = Array.newClear(128);
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shiftGrp = Group.after(~combGrp);
~shapGrp= Group.after(~shiftGrp);
~limitGrp= Group.after(~shapGrp);
~distoGrp= Group.after(~limitGrp);
~revGrp= Group.after(~distoGrp);

~recGrp= Group.after(~revGrp);



/*v =*/ /*Pbindef(\choo,\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [ Pseq(  ~rog ,1) , Pseq(  ~rog.reverse  ,1)         ],inf),\freq,1,\out,~outFil).play(t);*/
Pbindef(\choo,\instrument,\learn,\dur,Pseq([ 1/4],inf),\n1,Pseq( [
	61, 69,  64, 69,       74, 83, 78,83,    88, 97, 92, 97,   102,110, 105, 110],inf),\out,~outFil).play(t);

~v =  Synth(\comb1,[ \in, ~outFil,\out,~toShifter   /*~outDisto*/,\amp,1,\maxDel,0.7744,\decT,-0,\busMod,~seqBus],~combGrp);

	Pbind(\instrument, \sequ,\out, ~seqBus, \value,Pseq([
/*Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -20)*/

	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20)

].scramble,inf),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\legato, 2,\group,~shapGrp,\tS, 0.39550810372374,).play(t);



 ~h1 = Synth(\shiftX,[\in,~toShifter,\out ,~outTolimit,\freq,0],~shiftGrp);

~l1 = Synth(\lim,[\in, ~outTolimit,\out,~outDisto],~limitGrp);



h = Synth(\disto3,[\in,  ~outDisto , \out,~bigRiToRev2/*~outTolimit*/,\gain,1],~distoGrp);

~rev44= Synth( \reverb, ~rShor, ~revGrp);
~rev44.set(\in,~bigRiToRev2  /*,\mix, 0.8,\room, 1,\damp,1*/);

/*~rev44.set(\in,~bigRiToRev2  ,\mix, 0.8,\room, 1,\damp,1);
~rev44.set(\in,~bigRiToRev2  ,\mix, 0.3,\room, 0.2,\damp,0.1);*/

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


MIDIdef.cc(\fmCt ,{ |value|var modFreq = value.linlin(0, 127,0, 0.8);

	// ~notes.do{arg synth; synth.set(/*\fmCtrl*/\cRatio, modFreq.round(0.01))};
	// v.set(\cRatio, modFreq.round(0.01).postln);

	Pbindef(\choo,\cRatio, modFreq.round(0.01))
},ccNum: 74 ); //is2


MIDIdef.cc(\rateGate, { |value|var modFreq = value.linlin(61, 67, 40, 20);

	// if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([64/1],inf));},{});
	if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([16/1],inf));},{});
	if(modFreq.round(1).postln ==20,{Pbindef(\choo,   \dur,Pseq([4/1],inf));},{});
	if(modFreq.round(1).postln ==30,{Pbindef(\choo,  \dur,Pseq([1/1],inf));},{});
	if(modFreq.round(1).postln ==40,{Pbindef(\choo,  \dur,Pseq([4/4],inf));},{});



},ccNum: 114 );




MIDIdef.cc(\raett, { |value|var modFreq = value.linlin(61, 67, -200, 1200);

	~h1.set(\frq,modFreq.round(1).postln );



},ccNum: 112 );



/*MIDIdef.cc(\fmCt2 ,{ |value|var modFreq = value.linlin(61, 67, 0.8, 0);

	v.set(\fmCtrl, modFreq.round(0.01).postln);
	~notes.do{arg synth; synth.set(\fmCtrl, modFreq.round(0.01))};

},ccNum: 114 ); //is 9.*/


MIDIdef.cc(\fmCtrl, { |value|var modFreq = value.linlin(0, 127,0.8, 0.01);

	Pbindef(\choo,\fmCtrl, modFreq.round(0.01));},ccNum: 19 );//is 11




MIDIdef.cc(\rteShit, { |value|var modFreq = value.linlin(0, 127, 1, 0);

	~h1.set(\rte, modFreq.round(0.01).postln);

},ccNum: 75 ); //is 8





/*MIDIdef.noteOn(\start, {|vel, nn, chan, src|
	[nn].postln;
/*v.set(\gate,1);*/
/* v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,],~synthGrp);*/

		~h1.set(\frq,0);

},noteNum: 36); //button 1*/


MIDIdef.noteOn(\rcord, {|vel, nn, chan, src|
	[nn].postln;

	// x = Synth(\recLoop,[buf:~buf,\recording,1, \in,0],~recGrp);
	// s.record;


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bg.aiff",numChannels:1)

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


2/12*2


(
SynthDef(\chord2,{|bu=1,dur,out=0|

	Out.ar(out,
		(Saw.ar(64.midicps*In.kr(bu)+EnvGen.kr(Env([50],[dur]), timeScale:t.beatDur*1.5),EnvGen.kr(Env([0,1,1],[1.23,dur]),timeScale: t.beatDur*1,doneAction: 2))
			+		Saw.ar(69.midicps*In.kr(bu)+EnvGen.kr(Env([50],[dur]), timeScale:t.beatDur*1.5), EnvGen.kr(Env([0,1,1],[1.23,dur]),timeScale: t.beatDur*1,doneAction: 2))+
			Saw.ar(61.midicps*In.kr(bu)+EnvGen.kr(Env([50],[dur]), timeScale:t.beatDur*1.5),EnvGen.kr(Env([0,1,1],[1.23,dur]),timeScale: t.beatDur*1,doneAction: 2))).round(2**(-16))*0.07)
}).add;



/*
~extraDelay =Group.new;
Ppar([
Pbind(\instrument, \chord2, \bu, /*Pseq([1,1.33333333333333,1.5,1.33333333333333,0.16666666666667,1.33333333333333],1),*/
	Pseq([1,1.083333333333335,1.16666666666 667,1.083333333333335,1.041666666666667,1.16666666666667],inf),
	\dur,Pseq([  Pseq([2/1],1),Pseq([2/1],1)  ,Pseq([1/1],1),Pseq([2/1],1),Pseq([1],1),Pseq([1/1],1)],inf)),

	Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,0/*~delayBus2*/,\group,  ~extraDelay)],1).play(t);*/



~extraDelay =Group.new;
~revGrp=Group.after(~extraDelay);
Ppar([
Pbind(\instrument, \chord2, \bu, /*Pseq([1,1.33333333333333,1.5,1.33333333333333,0.16666666666667,1.33333333333333],1),*/
	Pseq([1,1.083333333333335,1.16666666666667,1.083333333333335,1.041666666666667,1.083333333333335,
			1,1.083333333333335,1.16666666666667,1.23333333333334 ,1.33333333333334,1.4

		],inf),
	\dur,Pseq([  Pseq([4/1],1),Pseq([3/1],1)  ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([2/1],1),
	 Pseq([4/1],1),Pseq([3/1],1)  ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([2/1],1)
	],inf)),

	Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay)],1).play(t);


//preferred
Routine({
~extraDelay =Group.new;
~revGrp=Group.after(~extraDelay);
Ppar([



	Pbind(\instrument, \lfoStep,\out,~bus1, \val,	Pseq([1,1.083333333333335,1.16666666666667,1.083333333333335,1.041666666666667,1.083333333333335,
			1,1.083333333333335,1.16666666666667,1.23333333333334 ,1.33333333333334,/*1.4*/

		],inf),\tS,t.beatDur,\dur,Pseq([  Pseq([4/1],1),Pseq([3/1],1)  ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([2/1],1),
		Pseq([5/1],1)/*,Pseq([3/1],1) */ ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([4/1],1)	],inf)),


	Pbind(\instrument, \chord2,\bu,~bus1,\dur,Pseq([ 64/1],1),\out, ~delayToLimit/* \bu,
	Pseq([1,1.083333333333335,1.16666666666667,1.083333333333335,1.041666666666667,1.083333333333335,
			1,1.083333333333335,1.16666666666667,1.23333333333334 ,1.33333333333334,1.4

		],inf),
	\dur,Pseq([  Pseq([6/1],1),Pseq([3/1],1)  ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([2/1],1),
	 Pseq([2/1],1),Pseq([3/1],1)  ,Pseq([2/1],1),Pseq([3/1],1),Pseq([2/1],1),Pseq([2/1],1)
	],inf)*/),

	Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay,\delayTime,0.3)],1).play(t);

/*Pbind(\instrument, \del, \in,~delayToLimit  ,\bufnum, ~delay6, \decT,1.5544,\delT,0.6 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay,\delayTime,0.25)],1).play(t);*/

~rev2= Synth( \reverbS,~rLon,    ~revGrp );
~rev2.set(\in,~delayBus2 , \mix,0.8,\room,0.6);
/*~rev2= Synth( \reverbMad,~churcx,    ~revGrp );
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8);
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,-4,\revtime, 14.85, \damping, 0.01,\roomsize, 46,\inputbw,0.02);*/


wait(0.16);


 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pad2.aiff",numChannels:1);

}).play(t)


 ~pad2= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad2.aiff");
~pad2.play