
MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});




MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play
~buf=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/SC_210514_091332.aiff")

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


MIDIdef.cc(\fmCt ,{ |value|var modFreq = value.linlin(0, 127,0, 0.8);

	// ~notes.do{arg synth; synth.set(/*\fmCtrl*/\cRatio, modFreq.round(0.01))};
v.set(\cRatio, modFreq.round(0.01).postln);
},ccNum: 74 ); //is2





/*MIDIdef.cc(\fmCt2 ,{ |value|var modFreq = value.linlin(61, 67, 0.8, 0);

	v.set(\fmCtrl, modFreq.round(0.01).postln);
	~notes.do{arg synth; synth.set(\fmCtrl, modFreq.round(0.01))};

},ccNum: 114 ); //is 9.*/


MIDIdef.cc(\fmCtrl, { |value|var modFreq = value.linlin(0, 127,0.8, 0.01);

	v.set(\fmCtrl, modFreq.round(0.01));},ccNum: 19 );//is 11




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
	// s.record;

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

Pbind(\instrument,\playBufXG,\rte,0.5,\dur,Pseq([1/16],inf)
,\amp, 1,\buf,~buf,\out,0,\impulse,0.003,\start,~st=1755963.1341456
,\tS, 0.39550810372374 ,\vlSub,  0.61 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk)


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0),

],1).play(t))

~st=1416566.6640023                 //2201750.7150731

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
	Pbind(\instrument,\playBufXGMod,\rte,2,\dur, Pseq([1/16],inf),\amp, 1,\buf,~buf,\out,~gateMelo,\gate, 0.5,\duration,Pkey(\dur),\impulse,0.003,\start,~st, \tS, 0.39550810372374 ,
	\vlSub, 0.38 /*0.01*/, \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 1,	\subsT,0.05 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,0,\decC,-1,\relC,0,\vlAtk , 0 ,  \vlRel,  Pkey(\vlAtk),\loopy,0,\busMod,~bus1,),


	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,9999,\value, 0.64375/16,\amp,1,\decT,0.8,\ph,4.4,\out,~gateMelo, \group,~phaserGrp),

	// 0.64375
Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0/*~eqPerch*/,\group,~distoGrp
		,\qf ,0.4, \qf2,0.8,\freqFil,15,/*\busMod,~bus7,*/
	),

],1).play(t))

x = Synth(\recLoop,[buf:~lpPrec2,\recording,1, \in,0],~recGrp);
~lpPrec2.play



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)
~kb.stop

//again

(~buf.numFrames.rrand(1400000)- 1400000).postln
//2660344.3627629   561638.15412434
(
~filterGrp= Group.new   ;
~recGrp= Group.after(~filterGrp);

Pbind(\instrument,\playBufXG,\rte,0.5,\dur,Pseq([  Pseq([1/1],inf)/* Pseq([1/1],12) ,Pseq([4/1],1) */],inf)  ,\amp, 1,\buf,~buf ,\out,~eqBus2x,\impulse,0.003,\start,
2371110.7291986
,\tS, 0.39550810372374 ,/*\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, 1 ,	\subsT, 0 , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),*/\loopy,0).play(t);

// 636658.85969102

Synth(\filterG, [\in,~eqBus2x , \which,1,\qf2,0.4],~filterGrp))

// x = Synth(\recLoop,[buf:~lpPrec3,\recording,1, \in,0],~recGrp);


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
~recGrp2=Group.after(~combGrp);)
(
Ppar([

	Pbind(\instrument, \playBuf,\dur,1/16, \rte,Pfunc({4.rrand(0.1)}), \tS,  0.39550810372374,\buf,~snare,\out,~percuStereo,\dA,0.1,
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
	Pbind(\instrument, \filterGS,\which,1, \in,~percuStereo ,\out,~part2SRev, \group, ~filterGrp,\qf2,0.08,\dur ,inf),


	Pbind(\instrument,\pingD, \in,~part2SRev,  \bufnum,~delay, \feedback,0.65 ,\group, ~delGrp,\dur, inf,\out,~limitBus1),
	Pbind(\instrument, \comb,\which,1, \in,~limitBus1,\group, ~combGrp,\qf2,0.1,\dur ,inf),

	Pbind(\instrument,\recLoopS,\buf,~fkAr,\recording,1, \in,0,\group,~recGrp2,\dur,inf),

],1).play(t)
)

//idea
(SynthDef(\idea, {Out.ar(0,CombN.ar(Saw.ar(/*LFNoise.kr(1.2875).range(0.3,432)*/216/*MouseY.kr(100,432)*/),delaytime:
	LFNoise1.kr(2.575).range(0.00001,0.01)

	/*MouseX.kr(0.01,0.2)*/ ,decaytime: /*LFNoise0.kr(5.2875).range(-0.1,0.4)*/-0.2)!2)}).play;)


Pbind(\instrument,\recLoopS,\buf,~kb2Test,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


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
			Saw.ar(63.midicps+EnvGen.kr(Env([50,0],[20],-5)))),MouseY.kr(30,12000),0.8)*0.06)
}).play;




Pbind(\instrument, \pingD, \in,~delayToLimit  ,\bufnum, ~delay6, \feedback,0.33 ,\dur, inf,\out,~delayBus2,\group,  ~extraDelay).play(t);




~rev2= Synth( \reverbMad,~churcx,    ~revGrp );
~rev2.set( \in,~delayBus2  , \out, 0,\taillevel,2,\revtime, 14.85, \damping, 0.1,\roomsize, 16,\inputbw,0.8)

)
)

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


(
~stereoGrp=Group.new;
~recGrp2=Group.after(~stereoGrp);
)

(a=Prand([

Pbind(\instrument, \percussion ,\dur,Pseq([1/4],4 ),\carHz, Pfunc({525.12070612224.rrand(0.01)}),\modHz,Pfunc({11899.3343179398.rrand(0.001)}),\modAmp, Pfunc({0.12875.rrand(0.000001)}) ,\amp,3,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({ (-14.4).rrand(-1)}), \crv1b,(-4).rand, \mulMod, 1691,\out,   ~delayToLimit),


	Pbind(\instrument, \playBufS,\dur, Pseq([1/4],1),\buf,~conga,\tS,0.39550810372374,\rte,    Pfunc({1.6.rrand(0.4)}),\start,61600,\out,~delayToEq,\vl,0.92),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 2),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,-1, \crv1, Pfunc({(-3).rand}), \crv1b,Pfunc({ (-5).rand}), \modHz, Pfunc({exprand(500,10000)}), \mulMod, Pfunc({rrand(100, 500)}), \carHz, Pfunc({exprand(20,10000)}), \modAmp, Pfunc({0.12875.rand}), \latch, 18500, \stereoR, 0.007,\out,~toKbGate)
],inf).play(t))



~ste1=Synth(\stereoO,[\in,~delayToLimit],~stereoGrp);
~ste1.set(\spread,1, \level,1, \center,0,\dlt1,0.01,\dlt2,0,\decT,0.0968, \mxDel,0);

~ste2=Synth(\stereoO,[\in,~delayToEq],~stereoGrp);
~ste2.set(\spread,0, \level,1, \center,0.0,\dlt1,0,\dlt2,0,\decT,0.1, \mxDel,1);

~ste3=Synth(\stereoO,[\in,~toKbGate],~stereoGrp);
~ste3.set(\spread,0, \level,1, \center,0.0,\dlt1,0.1,\dlt2,0.2,\decT,1.5544, \mxDel,1)

Pbind(\instrument,\recLoopS,\buf,~funkPerc,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t,quant:1)


~ste2.free
~funkPerc.play




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


(


{SinOsc.ar(110,mul: EnvGen.kr(Env.perc(releaseTime: 0.2,curve: -3)))!2}.play;


{BLowPass4.ar(PinkNoise.ar(0.6),EnvGen.kr(Env([1400,500,120],[0.1,0.4,1],[-30,-4,1]),doneAction: 2),Line.kr(0.6,1,1))!2}.play;


Pbind(\instrument,\recLoopS,\buf,~conga,\recording,1, \in,0,\group,~recGrp2,\dur,inf).play(t)


~conga.play
Pbind(\instrument, \playBufS,\dur, Pseq([1/4],1),\buf,~conga,\tS,0.39550810372374/*\rte,    Pfunc({2.6.rrand(0)})*/,\start,61600).play(t)
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
~eqGrp0=Group.after(~distoGrp);
~recGrp=Group.after(~eqGrp0);

Ppar([
	Pbind(\instrument, \lfo13, \val,1.55,\dur,Pseq([64/1],inf), \out,  ~bus7,\tS, 0.39550810372374,\rL,30,\rH,5000),

Pbind(\instrument,\playBufXG,\rte,2,\dur,/*Pseq([1/2],inf)*/Pseq([1/16],inf)
		,\amp, 1,\buf,~buf,\out,~gateMelo,\impulse,
		Pseq([ Pseq([ 82],8)  ,20.6,20.6,10.3],inf)
		,\start, 1755963.1341456
		,\tS, 0.39550810372374 ,\vlSub, /*0.3*/ 1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \atckC,~pAtkC,\decC,~pDecC,\vlAtk , ~pvlAtk,\gateSub,Pfunc({0.8.exprand(0.001)}),\dA,2,\loo,1),



	Pbind(\instrument, \filter, \dur, inf,\in,~gateMelo, \which,2,\out,~toEq,\group,~distoGrp,\busMod,~bus7,\freqFil,40
		,\qf ,0.4, \qf2,0.2,\freqFil,15
	),
	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)


],1).play(t))

~eq3=Synth(\EQHP96, [\frq, 100, \out, 0/*~revBus1*/],~eqGrp0);
~eq3.set(\in, ~toEq , /*\out,~gateBus3,*/\val, ~val=0,\quant, ~quant=0, \gain,~gain=0,\val2,~val2=0,\quant2,~quant2=0, \gain2,~gain2=(-0),\val3,~val3=0,\quant3,~quant3=0, \gain3,~gain3= (-0),\val4,~val4=0,\shelf,~shelf=0, \gain4,~gain4=0,\val5,0,\quant5, 1,\gain6,(-0),\vol,1, \val6,10200,\shelf2,1.3, \gain6,(-9));


x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);





Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03
	,\start,Pfunc({~lpPrec.numFrames.rand})).play(t)


//weird
Ppar([
	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([64/1],inf), \out,  ~bus6,\tS, 0.39550810372374,\rL,-0.06,\rH,0.08),

Pbind(\instrument,\playBufXGMod,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,0,\impulse,0.03,\busMod,~bus6
		,\start,Pfunc({~lpPrec.numFrames.rand}))],1).play(t)



