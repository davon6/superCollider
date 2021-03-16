(
o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
	[  5.15 ,0.321875	]
) ).range((-300),300));}.play;


SynthDef(\fm, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=1,  amp=1.5, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/,gate,pan=0, modu,modu2, multi;

	var car, mod, mod2, iEnv, sig, filRte;



	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*decE*/ /*dur*/30000   ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(659.26/10, mul:659.26/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( MouseX.kr( 659.26 * mRatio + mod2 )*

		/*	SinOsc.kr(In.kr(~bus2, 1),In.kr(~bus3, 1)).range([In.kr(~bus11, 1)]), mul:*/

			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			/*(*/        MouseY.kr(   659.26 * mRatio *iEnv) /*In.kr( gra, 1) */  /*) *   In.kr( gra, 1)*/

		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar( [0.00502929687, 0.00502929687+20, 0.00502929687 +50]* cRatio + (In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+

			//remove this line as shwon to decrease sound quality so I left it / HERE CHNAGE THE SOUND
			/*SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])*/
			SelectX.ar(SinOsc.kr((0.00502929687/2/2),phFm).range(0,1),[SinOsc.ar(0),mod])

			//pitch envelope
			/*+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)*/
			//extra pitch modulation
			/*+ pitch +  (In.kr(bus4, 1)/factor)  */         ,mul: [1,
			multi
			,multi  ]   );

	//transform signal through the shaper

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);




	//sig = BLowPass4.ar(   BHiPass4.ar(   sig,  500+In.kr(~bus4), 0.822379), 700+In.kr(~bus4),0.504212 );
	sig = BLowPass4.ar(   BHiPass4.ar(   sig,  500+MouseX.kr(-300,2000), 0.822379), 700+MouseX.kr(-100,2000),0.504212 );


//sig = BHiPass4.ar(   sig, 700+In.kr(~bus4),0.504212 );

//sig = BLowPass4.ar(     sig,  500+In.kr(~bus4), 0.822379);
	// sig = Splay.arFill(2,sig,spread: 0);
	Out.ar(out, sig /* !*/   );
}).play;

)
