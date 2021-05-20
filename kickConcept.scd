

Ppar([
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],128), \tS,  0.39550810370174,\buf,~k2,\out, ~kbToPan3,\loopy,0,\start,0,\rte,0.3),



		Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,999,\ph,4.4, \rL,600,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),


/*Pseq([*/
	Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([256/1],1),  \group, ~stereoGrp/*,\type, Pseq([\rest,\note,\note,\note,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)*/,\spread, 0.8,\tS,  0.39550810372374),



	//careful for doublon --below

	Pbind(\instrument, \pan2, \in,~kbToPan3,\out,0 ,\group,~recGrp3,\dur, inf),


		Pbind(\instrument,\gateS, \in,~percGate, \out,  ~toCom, \group,~dispatchGrp2,
			\tS,  0.39550810372374,\dur,Pseq([10.65/1],1),)

	/*],3),*/

],1).play(t)

)
Synth(\granLive,[\buf,~snare,\out,~snareFlang,\amp,0.005]);

~flangSna= Synth( \flanger1,[ \in,~snareFlang, \out,0, \flangefreq,0.01005859375,\fdback,0.8,\ph,4.4],~revGrp);


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

	Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([112/1],1), \tS,  0.39550810370174).play(t);


/*],1)
	*/





~flangSna.set(

 Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~audio3,\out, 0,\amp,1]);
~revGrp= Group.new;
~filGrp= Group.after(~revGrp);
~recGrp3= Group.after(~filGrp);





~revKick2.free



Pbindf(~kick,\out,  ~revKck2).play(t)

//advantage stereoize kick





				//from here


		~breakPart1.play(t)



~brkFil = Synth(\filter,[\freqFil,10, \which,2,\qf2,0.7,\busMod,~bus32,\in,~filKB],~filterGrp);

		~revKick2=Synth(\reverbMad, [\roomsize, 38, \revtime, 14.85, \damping, 0.1, \inputbw, 0.39, \drylevel, -8, \earlylevel, -9, \taillevel, 10 ,\in,~revKck2,\out,0 ],~revGrp);


~revKick=Synth(\reverbModu, [\mix,0,\room, 0, \damp, 0,\in,~kickRv,\out,~filKick,\mixMod,~mixM,\roomMod,~roomM,\dampMod,~dampM],~revGrp);

~flangSna= Synth( \flanger1,[ \in,~snareFlang, \out,~distoPercBg, \flangefreq,0.01005859375,\fdback,-0.8,\ph,5.6],~phaserGrp);

~fKick= Synth(\filter, [\which,0,\busMod, ~bus29, \in,~filKick,\out,~kbToPan3,\qf,0.7,\freqFil,100],~delayGrp);

~kbPan	=	Synth( \pan2, [\in,~kbToPan3,\out,0],~recGrp3);

(
	~breakPart1=		Ppar([
					//careful for doublon --below


			Pbind(\instrument,\envSli,\out, ~bus29,\dur,Pseq([128/1],1),\tS, 0.39550810372374,\val1,4600,\val2,1160,\crv,-2.2),
						Pbind(\instrument, \lfo13,\val,(~hzQbeat/32),\out,~bus24 ,\dur,Pseq([128/1],1),\ph,4.4, \rL,800,\rH,6000, \group, ~lfoGrp,\tS, 0.39550810372374),

				Pbind(\instrument, \lfo13T,  \val, 0.1609375, \ph, 2.9,  \out,~bus32, \dur,Pseq([32/1],1),\rL,50,\rH,1600,\tS, 0.39550810372374),

	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],8), \tS,  0.39550810370174,\buf,~kb2,\out, ~filKB,\loopy,0),



			Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999),


						Pbind(\instrument, \kiasmosPad,\scale, Scale.chromatic,\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1], \amp, 0.1,\atk, 32*t.beatDur, \rel, 1.5544,\legato, 2,\dur, Pseq([128/1],1),\tS,  0.39550810370174,\out,~kiasDisto),


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([58/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),

							Pbind(\instrument, \granLiveA,\buf,~snare,\out,~snareFlang,\amp,0.005,\dur, Pseq([70/1],1), \tS,  0.39550810370174)  ],1),



	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([30/1],1), \tS,  0.39550810370174,\buf,~k2,\type,\rest),


						Pbind(\instrument,\playBufXG2, \buf,~pad, \atckC,4, \relC,-8,\decT ,0.85, \atkT,0.05,\relT,0.1,  \vlSub, 0.6,  \vlDec,Pkey(\vlSub), \vlSub2,Pkey(\vlSub),
						\dur,  Pseq([36/1],1), \tS,  0.39550810370174,\start,0/*~pad.numFrames.rrand(180000)-180000*/),

				 ],1),


	Pseq([

		Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([16/1],1), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,\rest,\vl,1.2),

		Ppar([

	Pbind(\instrument,\lfo13, \val,0.01005859375,\dur,Pseq([112/1],1),\ph,4.4, \out,~mixM, \tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.01005859375,\dur,Pseq([112/1],1),\ph,4.4, \out,~roomM ,\tS, 0.39550810372374,\rL,0 ,\rH,0.8),
Pbind(\instrument,\lfo13, \val,0.01005859375,\dur,Pseq([112/1],1),\ph,4.4, \out, ~dampM,\tS, 0.39550810372374,\rL, 0.41,\rH,0.8),

	Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],109), \tS,  0.39550810370174,\buf,~k2,\out, ~kickRv,\loopy,0,\start,0,\rte,0.3,\type,Pseq([ Pseq([\note],107),\rest,\rest],1),\vl, 1.3),

],1)
					],1)

],1));





	Synth(\EQHP2,[ \in,~bassEq, \out,~kbToPan4,\frq, 20.6,\vol,1,	\val,659.255, \quant,1.1, \gain,(-16),
\val2,1318.51, \quant2,2, \gain2,(-8),\val3,2637.02, \quant3,1, \gain3,(-7),\val5,164.81375, \quant5,1, \gain5,(-14)],~eqGrp0);

		Synth( \pan2,[ \in,~kbToPan4,\out,~toFilRise ],~stereoGrp);

		Synth(\filterS, [\in, ~toFilRise, \out, ~toCom   ,\which,2, \qf2,0.4, \busMod,~bus30,/*\freqFil,60*/],~compGrp4);

	(~breakPart2=
			 Ppar([

				Pbind(\instrument, \envSli, \out,   ~bus30,  \dur,Pseq([128/1],1),\tS, 0.39550810372374,\val1,30,\val2,4000,\crv,56),

				  Pbind(\instrument, \shap, \dur,Pseq([1/1],128),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374),


Pbind(\instrument,\playBufXG, \buf,~kb2Test, \atckC,7, \relC,-18,\decT ,0.6, \atkT,0.15,\relT,0.25,  \vlSub, 0.2,\vlDec,Pkey(\vlSub) ,\vlSub2,Pkey(\vlSub), \dur,  Pseq([64/1],1), \tS,  0.39550810370174,\start,0),

				//need bassshap, must hp at the end
	Pbind(\instrument, \bass,\type, Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf),\dur,Pseq([1/4],508 /*512*/), \lpf,100,\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27],inf), \bus, ~bassShapB,\atk, 0,\rel, t.beatDur/4 , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-10),\out,~kbToPan4/*~bassEq*/),


Pseq([
				Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),
				Pbind(\instrument, \wNoise,\dur, Pseq([24/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest ,\tS, 0.39550810372374),

						/*Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),*/

					Pbindf(~kick,\out,  ~revKck2),

					Pbind(\instrument, \wNoise,\dur, Pseq([31/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),

					Pbind(\instrument, \wNoise,\dur, Pseq([30/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq,\type,\rest, \tS, 0.39550810372374),

				Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,1600,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq, \tS, 0.39550810372374),
				],1),

			Pseq([
				Pbind(\instrument,\wNoise,\dur,Pseq([64/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\tS,  0.39550810372374,\type,\rest),
Ppar([

						//here// need eq
Pbind(\instrument,\wNoise,\dur,Pseq([60/1],1) ,\dA2,2, \wFil,2,\dec,Pkey(\dur),\tS,  0.39550810372374,\out,~hitEq2/*~hitStereoX*/,   \amp,0.2  ,\amp2,0.2),



	Pseq([
		Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),
							/*Ppar([
								Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbus2),*/

Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],169),Pseq([\rest],2), Pseq([\note],2)],inf),\out,~kbToPan4)
/*],1)*/
					],1)],1)
],1),

				Pseq([

					Pbind(\instrument,\wNoise,\dur,Pseq([32/1],1) ,\dA2,2, \wFil,2,\amp2,1,\dec,Pkey(\dur),\type,\rest,\tS,  0.39550810372374),

				Pxrand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],4),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162,\start,Pfunc({(~vocal.numFrames-7000).rand})),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],8),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],24),

				],1),




				Pbind(\instrument,\gateS, \dur,Pseq([32/1],4),\vlSub, 1/*Pfunc({1.rand})*/, \vlSub2,Pkey(\vlSub),
					/*\decC,Pfunc({(-10).rrand(2)}),*/\in,~vocToDispatch,\out,~toFilRise,\group, ~gateGrp4,\tS, 0.39550810372374,\type,Pseq([\rest,\note],inf)),


//not reveiving beloq
				Pbind(\instrument,\stereo, \dur, Pseq([128/1],1), \in, ~hitStereoX  ,\spread,0.1,\out,~toFilRise,\tS, 0.39550810372374,\group, ~stereoGrp),




],1)

)




	~breakPart2.play(t)

		Pseq([~breakPart1,~breakPart2],inf).play(t)





		add noise downshifter, make compression to rise from kick rise, process all signals, add hat over kick rise




	({EnvGen.kr(Env([100,5000],[1],39))}.plot(duration:1))






~bg= Synth(\playBufX, [\impulse, 0.00001,\loo,1,\buf,~audio3,\out, 0,\amp,5]);
/*
~revKick=Synth(\reverbModu, ~quickFi,~revGrp);*/



~revKick.set(\in,~kickRv,\out,0,\mixMod,~mixM,\roomMod,~roomM,\dampMod,~dampM);



~revKick.set(\mix,0.4,\room, 0.115, \damp, 0.4)

~revKick.set(\mix,0.8,\room,0.4)

~revKick.set(\mix,0.8,\room,0.8,\damp,0.1)

~revGrp= Group.new
~recGrp3= Group.new

Pseq([~kick],inf).play(t)



(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.chromatic,
	\degree, Prand((0..12), inf) + [-31,-15,-11,-5,0,1],
	\amp, 0.002,
	\atk, 0.7744, \rel, 0.5,
	\legato, 2,
	\dur, 120
).play
)

(
SynthDef(\kiasmosPad, {arg freq = 440, out = 0, amp = 1, atk= 0.01, rel= 0.01,tS=1,dur;
    var carriers, modulators, mix, verb, filter, env, filterEnv;
    freq = freq + [0, Rand(1,4)];
    carriers = [SinOsc, Saw, Pulse].collect(_.ar(freq));
    modulators = carriers.collect {|c| SinOsc.kr(rrand(0.0322,1.0)*0.0647)};
    mix = Mix(carriers * modulators) * 0.15;
    verb = FreeVerb.ar(mix)/*+sig*/;

	filterEnv = EnvGen.kr(Env([3600, 220], dur, \exp), doneAction: Done.freeSelf);
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, dur - atk - rel, rel], [4,-4]));

	filter = LPF.ar(verb, filterEnv);
	Out.ar(out, filter * env * amp* EnvGen.kr(Env.step([1,1],[dur,0],4),timeScale: tS,doneAction:2));
}).add;
)




\\\

(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.chromatic,
	\degree, Prand((0..-8), inf) + [0,1,3,-13,23],
	\amp, 0.1,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)


//need bassshap
	Pbind(\instrument, \bass,\type, Pseq([\note, \rest, \note, \note,\rest,\note,\note,\note], inf),\dur,Pseq([1/4],512), /* Pseq([4/1],1),*/\lpf,100,
	\midinote,Pseq([ Pseq([28],7),29,28,33,Pseq([28],7),29,28,27

],inf), \bus, ~bassShapB,\atk, 0/*t.beatDur/4 * 0.01*/,\rel, t.beatDur/4/**4* 0.996*/ , \rel2, t.beatDur/4 * 0.0012,\atkcrv, -2,\relcrv, -2,\relcrv2, -4, \relcrv3, -6,\amp,(-3/*-1*/)/*(-13)*/,\out,0).play(t)





({BHiPass4.ar(LPF.ar(WhiteNoise.ar(0.3),EnvGen.kr(Env([0,10000],[3],3))),EnvGen.kr(Env([0,10000],[dur],3),timeScale: tS),0.5)}.play)

4,8,16, 4
Pbind(\instrument,\kick, \dur, Pseq([ Pseq([1/2],8),Pseq([1/4],32),Pseq([1/8],128), Pseq([1/1],3),Pseq([1/2],2)],1) ,\type,Pseq([Pseq([\note],33),Pseq([\rest],2), Pseq([\note],2)],inf)).play(t)




	HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF))]);dA



Pbind(\instrument, \wNoise,\dur, Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,1,\valStart,100,\valEnd,20000,\durF,Pkey(\dur),\out,0,  \tS,  0.39550810372374).play(t)




/*this
(
Pbind(
	\instrument, \kiasmosPad,
	\scale, Scale.major,
	\degree, Prand((0..0.1), inf) + [0,1,-1,-10,11],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20
).play
)*/
