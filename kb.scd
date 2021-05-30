(Routine({

	~kick.play(t);



		wait(0.152);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/kick.aiff",numChannels:1,duration:t.beatDur);
}).play;)


~k2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kick.aiff")




(//BASS ALONE

~eqGrp=Group.new;
~compGrp=Group.after(~eqGrp);
~stereoGrp=Group.after(~compGrp);

~recGrp2=Group.after(~stereoGrp);
Routine({

Ppar([

	~bassShap,
	Pbind(\instrument, \bass,
		\dur, Pseq([4/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, 0,
		\rel, t.beatDur/**4*/* 0.996,
		\rel2, t.beatDur/4 * 0.0012,

		\vlDecFx,1800,/*\vlDecF,400,*/
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4, \relcrv3, -6
		,\amp,(-6/*-1*/)/*(-13)*/,\out,~bassEq
	),

	Pbind(\instrument ,\EQHP2/*	\EQHP2*/,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1,


			\val,659.255, \quant,1.1, \gain,(-14),
\val2,1318.51, \quant2,2, \gain2,(-8),
		\val3,2637.02, \quant3,1, \gain3,(-7),



		\val5,164.81375, \quant5,1, \gain5,(-14)


	),



],1).play(t);
	wait(0.152);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/bass.aiff",numChannels:1,duration:t.beatDur);
}).play;)

~b3=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bass.aiff")
~b3.play
~k2.plot

~kb1.plot
(


(
~compGrp=Group.new;
~limitGrp=Group.after(~compGrp);
~stereoGrp=Group.after(~limitGrp);
~recGrp2=Group.after(~stereoGrp);
Routine({

Ppar([
	Pseq([Pbindf(~kick,\out,~kbus)],inf),
Ppar([

			Pbind(\instrument, \playBuf, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~k2,\out,~limitKick),

	Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],inf), \tS,  0.39550810372374,
	\start,250,\type,Pseq([\rest,\note,\note,\note],inf),\buf,~b3,\out,~comFuzz ,\loopy,0, \decT,0.6,\vlDec,1,\vlSub,Pkey(\vlDec),\vlSub2,Pkey(\vlDec),\subsT ,Pseq([0,0.085,0.17,0.34],inf))

],1)


],1).play(t);
~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.7 ,\sB, 1.024,\sA, 1/2,\atk ,0.0484, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~limitBass);


~limK=Synth(\limitertoMixer,[\c45,1,\in, ~limitKick, \gain,58,\out,~kToPan],~limitGrp);
~limK.set(\gain,210);
~limB=Synth(\limitertoMixer,[\c46,1,\in, ~limitBass, \gain,68,\out,~kToPan],~limitGrp);
~limB.set(\gain,166);

~kbPan2 = Synth(\pan2,[ \in,~kToPan,\out,0],~stereoGrp);

	wait(0.164);

	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/kB.aiff",numChannels:2,duration:t.beatDur);
}).play;)


)

~kb1.plot

~kb1=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kB.aiff")



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb1,\loopy,0).play(t)


//back up


	~bassShap2 = Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374);
	~bassZ = Pbind(\instrument, \bass,
	// \type, Pseq([\note, \note, \note, \note], inf),
	// \cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([4/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, 0/*t.beatDur/4 * 0.01*/,
		\rel, t.beatDur*4 * 0.996,/*\rel, t.beatDur/4 * 0.98,*/
		\rel2, t.beatDur/4 * 0.0012,

		/*\vlDecFx,2000,\vlDecF,400,*/
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4, \relcrv3, -6
		,\amp,(-2/*-1*/)/*(-13)*/,\out,~bassEq
	);

		~bassC = Pbind(\instrument, \bass,
	// \type, Pseq([\note, \note, \note, \note], inf),
	// \cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([4/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, 0/*t.beatDur/4 * 0.01*/,
		\rel, t.beatDur*4 * 0.996,/*\rel, t.beatDur/4 * 0.98,*/
		\rel2, t.beatDur/4 * 0.0012,
		\vlDec,0.96,

		\vlDecF,400,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4, \relcrv3, -6
		,\amp,(-8.2/*-1*/)/*(-13)*/,\out,~bassEq
	);

	/*~hat2 =Pbind(\instrument, \percussion,\rel,0.04840,\rel2,0.02420,\amp, (-28.2), \crv1, (-4), \crv1b, (-5), \modHz, exprand(500,10000), \mulMod, rrand(100, 500), \carHz, exprand(20,10000), \modAmp, 1.10875.rrand(0.8) /*0.82875.rrand(0.4)*/,\dur,Pseq([1/1],1) ,\out, ~kickHatEq);*/

	//SO WRONG NO VOL ctrl at all
	~hit = Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,~bufSnoopy,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}));








~bassRest = Pbindf(~bass,  \type,Pseq([\rest],inf));

~kbassRest =Ppar([~kick, ~bassRest], 1);



	//OFF RN

	// Ppar([Pseq([~bass],inf),Pbindf(~snare,\da1,0)],1);//JEEEZ
~bassMel=[	Pbindf(~bass,\freq, Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -4)),
		Pbindf(~bass,\freq, Scale.minor(\just).degreeToFreq(7.rand, 76.midicps, -4))];



	/*s.sync;


~eqGrp=Group.new;
~stereoGrp=Group.after(~eqGrp);
~recGrp2=Group.after(~stereoGrp);
s.sync;

Ppar([

	/*	~bassShap,~bassZ  ,

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,~main1GToG,\group, ~eqGrp, \val, 659.255/2, \quant,1, \gain ,(-30)),
*/

			Pbind(\instrument, \percussion,\dur,Pseq([1/4],1 ),\carHz,Pfunc({ 525.12070612224.rrand(0.01)}),\modHz,Pfunc({ 11899.3343179398.rrand(0.001)}),\modAmp,Pfunc({  0.12875.rrand(0.000001)}) ,\amp,(-17.5),\rel,Pseq([1/1],inf),\rel2,Pseq([1/4],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({  (-14.4).rrand(-1)}), \crv1b,(-4), \mulMod, 1691,\out, ~hit2ToEq),

		Pbind(\instrument, \percussion, \dur,Pseq([8/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}),\tS, 0.39550810372374),

	Pbind(\instrument, \percussion, \dur,Pseq([3/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out,~flanToDisto,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),

Pbind(\instrument, \snare,\carHz, 41.2 ,\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.7744,\dur, Pseq([1/2], 1),\amp,1, \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),  \da1,0    ),


		Pbind(\instrument, \percussion ,\dur,Pseq([1/4],1 ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,1,\rel,0.3872/*Pseq([1/4],inf)*/,\rel2,0.0968
			/*Pseq([1/16],inf)*/,\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\dA1,0, \dA2,0,
			\out, ~comBusCymb),


		Pbind(\instrument,\percussion,\dur,Pseq([1/4], 1),\atk, 0,\rel,0.0968,\rel2,0.02420,\amp,1, \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\dA1,2, \dA2,0,\out,~comBusHat),



	Pbind(\instrument,\recLoop,\buf,~bell1,\recording,1, \in,~bellFlang,\group,~recGrp2,\dur,inf),

	Pbind(\instrument,\recLoop,\buf,~bell2,\recording,1, \in,~flanToDisto,\group,~recGrp2,\dur,inf),


Pbind(\instrument,\recLoop,\buf,~hit2,\recording,1, \in,~hit2ToEq,\group,~recGrp2,\dur,inf),

Pbind(\instrument,\recLoop,\buf,~cymb,\recording,1, \in,~comBusCymb,\group,~recGrp2,\dur,inf),
Pbind(\instrument,\recLoop,\buf,~hat,\recording,1, \in,~comBusHat,\group,~recGrp2,\dur,inf),
Pbind(\instrument,\recLoop,\buf,~snare,\recording,1, \in,~snareEQ,\group,~recGrp2,\dur,inf),


/*Pbind(\instrument,\recLoop,\buf,~k2,\recording,1, \in,~main1GToG,\group,~recGrp2,\dur,inf),
		Pbind(\instrument,\recLoop,\buf,~b3,\recording,1, \in,~bgFil,\group,~recGrp2,\dur,inf),*/
],1).play(t);*/



});



)



(
~eqGrp=Group.new;
~compGrp=Group.after(~eqGrp);
~stereoGrp=Group.after(~compGrp);

~recGrp2=Group.after(~stereoGrp);
)

(
Ppar([/*~hat2,*/~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,0.8, \gain ,(-27)),
	Pbind(\instrument,\recLoop,\buf,~k2,\recording,1, \in,0,\group,~recGrp2,\dur,inf)
],1).play(t) ;
)

~kick.play
~k2.play
~b3.play
~hat.plot

~hit2.play

(//BASS ALONE
Ppar([

	// Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),




	~bassShap,       /*~bassZ,*/
	Pbind(\instrument, \bass,
	// \type, Pseq([\note, \note, \note, \note], inf),
	// \cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([4/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, 0/*t.beatDur/4 * 0.01*/,
		\rel, t.beatDur/**4*/* 0.996,/*\rel, t.beatDur/4 * 0.98,*/
		\rel2, t.beatDur/4 * 0.0012,

		\vlDecFx,1800,/*\vlDecF,400,*/
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4, \relcrv3, -6
		,\amp,(-6/*-1*/)/*(-13)*/,\out,~bassEq
	),

	Pbind(\instrument ,\EQHP2/*	\EQHP2*/,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1,


			\val,659.255, \quant,1.1, \gain,(-14),
\val2,1318.51, \quant2,2, \gain2,(-8),
		\val3,2637.02, \quant3,1, \gain3,(-7),



		\val5,164.81375, \quant5,1, \gain5,(-14)


	),

	// Pbind(\instrument,\recLoop,\buf,~b3,\recording,1, \in,0,\group,~recGrp2,\dur,inf)

],1).play(t);

)
(//BASS ALONE
Ppar([

	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),




	~bassShap,       ~bassC,

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1,
		\val,659.255, \quant,0.8, \gain,(-35),
\val2,1318.51, \quant2,1.2, \gain2,(-20),
			\val3,2637.02, \quant3,1, \gain3,(-30),




	\val5,164.81375, \quant5,1, \gain5,(-8)

	),

	Pbind(\instrument,\recLoop,\buf,~bass,\recording,1, \in,0,\group,~recGrp2,\dur,inf)

],1).play(t);

)
~bass.play
~k2.play
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~k2,\out, 0,\loopy,0,\start,0,\tS, 0.39550810372374).play(t)
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out, 0,\loopy,0,\start,0,\tS, 0.39550810372374).play(t)

~kb2.play

~kb1.play

~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.42 ,\sB, 1.03,\sA, 1/8,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~kbToPan2);


(
Ppar([

	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10.2),\out,~kbus),

	Pbind(\instrument,\recLoopS,\buf,~kb1,\recording,1, \in,0,\group,~recGrp2,\dur,inf),
Pseq([
	Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/2],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),

		/*Pbindf(~kick ,\dur,    Pseq([1/2],1),\out,~kbToPan2),*/
		Pbind(\instrument, \wNoise,\dur,Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  )],inf),

Pseq([Pbind(\instrument, \wNoise,\dur,Pseq([1/4],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  ),

		Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],3), \tS,  0.39550810372374,
	\start,100,
			\buf,~bass,\out, ~comFuzz,\loopy,0, \decT,0.8,
			\subsT ,Pseq([0,0.09,0.18],inf)
	)
],inf),
Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1).play(t);



)
~kb1.plot

Pseq([~kick],10).play(t)

	/*~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.8 ,\sB, 1.024,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~kbToPan2);*/

~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.7 ,\sB, 1.024,\sA, 1/2,\atk ,0.0484, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~kbToPan2);

(
Ppar([


	// Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-5.2),\out,~kbus),

		Pseq([Pbindf(~kick,\out,~kbus)],inf),

	/*Pseq([Pbindf(~hat2,\out,~kickHatEq2)],inf),
		Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq2, \out,~kbus,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),*/

	Pseq([~kick],inf),



	Pbind(\instrument,\recLoopS,\buf,~kb2,\recording,1, \in,0,\group,~recGrp2,\dur,inf),


Pseq([Pbind(\instrument, \wNoise,\dur,Pseq([1/4],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  ),

		Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],3), \tS,  0.39550810372374,
	\start,100,
			\buf,~b3,\out,~comFuzz ,\loopy,0, \decT,0.6,\vlDec,7.7,\vlSub,Pkey(\vlDec),\vlSub2,Pkey(\vlDec),
			\subsT ,Pseq([0.085,0.17,0.34],inf)
	)
],inf),






Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

	Pbind(\instrument, \pan2, \in,~kToPan,\out,0 ,\group,~stereoGrp,\dur, inf),






],1).play(t);



)





Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],inf), \tS,  0.39550810372374,
	\start,1000,
			\buf,~b3,\out, 0,\loopy,0, \decT,0.8,


			/*\subsT ,Pseq([0,0.1,0.2],inf)*/
/* \decT,0.8,\subsT ,Pseq([0,0.05,0.1],inf)*/).play(t)

~b3.play




Pbind( \instrument, \gran, \impulse, 0.003 ,\dur, Pseq([1/4],3), \tS,  0.39550810372374,
	\start,0,
			\buf,~b3,\out, 0,\loo,0, \decT,0.6,\duration,Pseq([1/4],3)


			,\subsT ,Pseq([0,0.2,0.4],inf)
	/* \decT,0.8,\subsT ,Pseq([0,0.05,0.1],inf)*/).play(t)
Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf)



Synth(\playBuf2,[\buf,~elect,\start,4000000])
Synth(\playBuf2,[\buf,~elect,\start,5000000])

Synth(\playBuf2,[\buf,~elect,\start,10000000])
~elect= Buffer.read(s,"/Users/davidmignot/Downloads/10-Electrypnose_-_Give_Me_Some_Fun.wav");
~elect.play

(
~eqGrp= Group.new;
~compGrp= Group.after(~eqGrp);
~stereoGrp= Group.after(~compGrp);


~eq=Synth(\EQHP2, [\frq, 10.3,\vol,1, \in,~bassEq, \out,~comFuzz,],~eqGrp);


~eq.set(\val,659.255, \quant,1.1, \gain,(-10),
	\val2,1318.51, \quant2,2, \gain2,(-10),
	\val3,2637.02, \quant3,1, \gain3,(-25),
	\val5,164.81375, \quant5,1.5, \gain5,(-8));

~comp=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp.set(\thr,0.42 ,\sB, 1.03,\sA, 1/8,\atk ,0.0242, \rel ,0.0968, \gain,1,\in, ~comFuzz,\out,~kbToPan2);



(Ppar([


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-5.2),\out,~kbus),

	Pseq([~kick],inf),

~bassShap2,
	Pbind(\instrument, \bass,\type, Pseq([\note, \note, \note, \note], inf),\dur,Pseq([1/4],inf), /* Pseq([4/1],1),*/\lpf,100,
\midinote, 28, \bus, ~bassShapB,\atk, 0/*t.beatDur/4 * 0.01*/,\rel, t.beatDur/4/**4* 0.996*/ , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-3/*-1*/)/*(-13)*/,\out,~bassEq),


		/*Pbind(\instrument ,\EQHP2/*	\EQHP2*/,\dur, inf, \in,~bassEq, \out,~comFuzz,\group, ~eqGrp, \frq, 10.3,\vol,1,
\val,659.255, \quant,1.1, \gain,(-15),\val2,1318.51, \quant2,2, \gain2,(-18),\val3,2637.02, \quant3,1, \gain3,(-20), \val5,164.81375, \quant5,1.5, \gain5,(-18)),*/


Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),

],1).play(t))

)


Synth(\playBuf2,[\buf,~elect,\start,4000000])
Synth(\playBuf2,[\buf,~elect,\start,5000000])

Synth(\playBuf2,[\buf,~elect,\start,10000000])
~elect= Buffer.read(s,"/Users/davidmignot/Desktop/toSee.wav");



~zing.play

~zing= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/zing.aiff");






SynthDef(\zing,{Out.ar(~bigRiToEq,BLowPass4.ar(

	Saw.ar([ 329,329/2,329/4]*SinOsc.kr(~hz1beat/4)).lincurve(-1,1,-1,1,-7).round(2**(-16))

	,MouseY.kr(30,20000)));}).play;



~eq43= Synth( \EQHP96, [\frq, 220],~eqGrp0);
~eq43.set(\in, ~bigRiToEq, \out, 0,\val,0, \quant,0, \gain,0,\val2,0,\quant2,0, \gain2,0,\val4,0,\shelf,0, \gain4,0,\vol,1);
