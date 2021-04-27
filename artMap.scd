
MIDIdef.noteOn(\onTest, {|vel, nn, chan, src|[vel, nn, chan, src].postln});
MIDIdef.cc(\onTestT, {|vel, nn, chan, src|[vel, nn, chan, src].postln});





MIDIClient.init
MIDIIn.connectAll;
MIDIIn.disconnectAll;

FreqScope.new
s.meter
~buf.play


(
~dispatchGrp= Group.new;
~synthGrp = Group.after(~dispatchGrp);
~combGrp = Group.after(~synthGrp);
~shiftGrp = Group.after(~combGrp);
~shapGrp= Group.after(~shiftGrp);
~limitGrp= Group.after(~shapGrp);
~distoGrp= Group.after(~limitGrp);

~recGrp= Group.after(~distoGrp);



 v = Synth( \fmX, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp,1,\out,~outFil,],~synthGrp);

~v =  Synth(\comb1,[ \in, ~outFil,\out,~toShifter   /*~outDisto*/,\amp,1,\maxDel,0.7744,\decT,-0.2,\busMod,~seqBus],~combGrp);

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


h = Synth(\disto3,[\in,  ~outDisto , \out,0/*~outTolimit*/],~distoGrp);
/*
// l = Synth(\limiter,[\in, ~outTolimit,\out,0, \gain, 140],~limitGrp);*/






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


MIDIdef.cc(\mDel, { |value|var modFreq = value.linlin(0, 127, 0.42, -0.2);

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


MIDIdef.cc(\frCtrl, { |value|var modFreq = value.linlin(0, 127, 0.0075, 20.6);

	~v.set(\modR, modFreq.round(0.001).postln);
},ccNum:   76); //is 12

MIDIdef.cc(\f1, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f1, modFreq.round(0.001).postln);
},ccNum:   17); //is 13

MIDIdef.cc(\f1Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.0075, 20.6);

	~v.set(\modS, modFreq.round(0.001).postln);
},ccNum:   77); //is 5


MIDIdef.cc(\f2, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f2, modFreq.round(0.001).postln);
},ccNum:        91 );//is 14

MIDIdef.cc(\f2Ctrl, { |value|var modFreq = value.linlin(0, 127, 0.0075, 20.6);

	~v.set(\modT, modFreq.round(0.001).postln);
},ccNum:        93 );//is 6


MIDIdef.cc(\f3, { |value|var modFreq = value.linlin(0, 127, 0, 1);

	~v.set(\f3, modFreq.round(0.001).postln);
},ccNum: 79);//is 15


MIDIdef.cc(\f3Ctrl, { |value|var modFreq = value.linlin(0,127, 0.0075, 20.6);

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



MIDIdef.cc(\mVo, { |value|var modFreq = value.linlin(0, 127, 0, 1);



v.set(\multi, modFreq.round(0.01).postln);
	/*d.set(\multi, modFreq.round(0.01));*/

},ccNum: 75 ); //is 11

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



k = Synth(\filterU, [\out,0/*~distoBg*/,\in, ~bgFil, \lFrq,22000, \lFrq2,22000,\hFrq,50,\hFrq2,50,\qfH ,0.7, \qfH2, 0.9,\qlL ,0.6 ,\qlL2 ,0.55 ], ~filterGrp);
/*d = Synth(\disto,[\in,~distoBg,\out,0],~distoGrp);*/



/*MIDIdef.cc(\lpF, { |value|var modFreq = value.linlin(0, 127, 500,22000);

	 k.set(\lFrq, "lp: ".postln;modFreq.round(1).post;)},ccNum: 18 );// is 10*/



MIDIdef.cc(\lpF2x, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,18000);

	k.set(\lFrq,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );



MIDIdef.cc(\lpF2x2, { |value|var modFreq = value.linlin(0, 127, 710/*800*/,12000);

	k.set(\lFrqs,"lp: ".postln;modFreq.round(1).post;)


},ccNum: 1 );




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
/*s.plotTree*/