//second level of modulation
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	//first level of modulation

	mod = SinOsc.ar(Lag.ar(  freq * mRatio + mod2 ,0.06)*


			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

		Lag.kr((freq * mRatio * iEnv),0.01)*gra

		);


	//my carrier is a mess but bring interesting outputs

	car =SinOsc.ar( 0.00502929687+eFreq  /* freq */    * cRatio +

			//remove this line as shwon to decrease sound quality so I left it
			SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])

			//pitch envelope
			+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)
			//extra pitch modulation
			+ pitch +  (In.kr(bus4, 1)/factor));
