Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0).play(t)





Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur)).play(t)



Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(2),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2).play(t)

(
~justHit=
Ppar([

		Pseq([
		Pseq([

		Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([8/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\tS, 0.39550810372374,\out,~hitEq),
		Pbind(\instrument, \gateS,\dur, Pseq([48/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],1),





	Pseq([
	Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,Pkey(\dur),\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([14/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],4),
		Pseq([

Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
	Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),


Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
			Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.0968*2,\dA,2,\out,~hitEq),
				Pbind(\instrument, \gateS,\dur, Pseq([7/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)

	],2),



		Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		Pbind(\instrument, \wNoise,\dur, Pseq([2/1],1),\dec ,Pkey(\dur),\amp,(-5),\out,0,\wFil,0,\valStart,900,\valEnd,1000,\durF,0.3872,\out,~hitEq),
			Pbind(\instrument, \gateS,\dur, Pseq([6/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom)
	],1),


		Pbind(\instrument, \gateS,\dur, Pseq([64/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

				],2),

		Ppar([
		~part5,
		Pbind(\instrument, \gateS,\dur, Pseq([256/1],1), \tS,  0.39550810372374,\group, ~gateGrp11,\in,~tofinalRythm,\out,~toCom),

		],1)

],inf)
	,
	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],256), \tS,  0.39550810372374,\buf,~kb2),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~hitStereo  ,\spread,0.1,\out,~toCom,\tS, 0.39550810372374,\group, ~stereoGrp),


],1))