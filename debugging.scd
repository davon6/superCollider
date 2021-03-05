
(~synthGrp = Group.new;
~filterGrp = Group.after(~synthGrp);
~shapGrp= Group.after(~filterGrp);
~recGrp= Group.after(~shapGrp);)


(
d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\amp, 0.12,\cRatio, 1,\index, 1,\atkE, 0.1,


\out,0,],~synthGrp));

v = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp, 2,\out,0],~synthGrp));

z=(Synth(\sinModul,[\modu,0.3]));
n= (Synth(\sawModul,[\modu,0.3]));
c =(Synth(\pulModul,[\modu,0.3]));
m =(Synth(\ranModul,[\modu,0.3]));


k = (Synth( \filterModu, [\dur, inf,\in,~outFil, \out,~toRecord],~filterGrp));

//Pdef(\aaa, Pbind(\instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,1)).play(t);

Pbindef(\aaa, \instrument, \sequ, \value,Pseq([104,500,200],inf),\dur,Pseq([1/1],inf),


	/*\vlDec,Prand([1,0.8,0.4],1),\vlSub,Prand([0,0.4],1), \atkT,Pfuncn({0.00.rrand(0.2,1)}),
	\decT,Pfuncn({0.02.rrand(0.8,1)}),
	\subsT,Pfuncn({0.02.rrand(0.4,1)}),
	\relT,Pfuncn({0.02.rrand(0.6,1)}),
	\atckC,Pfuncn({-30.rrand(30,1)}),
	\decC,Pfuncn({-30.rrand(30,1)}),
	\relC,Pfuncn({-30.rrand(0,1)}),*/


\group,~shapGrp).play(t);



)
d.set(\gate,1)

d.set(\factor2,1  )

d.set(\factor2,0,)

Pbindef(\aaa,	\vlAtk,0,\vlDec,1,\vlSub,1, \vlSub2,1,\vlRel,0, \atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,);

Pbindef(\aaa,\dur,Pseq([1/4],inf),


	\vlSub,0.8.rrand(0.2,1),\vlSub2,Pkey(\vlSub), \atkT,0.00.rrand(0.2,1).postln,
	\decT,0.4.rrand(0.6,0.3).postln,
	\subsT,0.2.rrand(0.3,0.1).postln,
	\relT,0.12.rrand(0.8,1).postln,
	\atckC,6.rrand(0,1).postln,
	\decC,-10.rrand(-2,1).postln,
	\relC,-8.rrand(-2,1) .postln);




	/*\vlSub,0.8.rand.postln, \atkT,0.00.rrand(0.02,1).postln,
	\decT,0.2.rrand(0.8,0.3).postln,
	\subsT,0.02.rrand(0.4,0.1).postln,
	\relT,0.12.rrand(0.6,1).postln,
	\atckC,-30.rrand(0,1).postln,
	\decC,-10.rrand(15,1).postln,
	\relC,-10.rrand(-2,1) .postln);*/

d.set(\multi,1)
v.set(\gate,1,\freq, 100, \freq2, 1, \freq3,0)

v.set(\factor2,1)
v.set(\freq, 100, \freq2, 1, \freq3,0)

v.set(\multi,1)


Pbindef(\aaa).do(_.clear);






(

SynthDef(\fm2, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1,multi=0, out=0, gate, factor =0,modu,modu2, factor2=0,melo;
	var car, mod2, env, iEnv, mod, sig;
iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(Env.adsr(0.1), gate);



	/*EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);*/
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,/*mod2.wrap(0, 16pi),*/ mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = Saw.ar([freq, freq+20, freq -40] + (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)
		/*+ LFNoise0.kr(10.3).range(-40,1200) */ * cRatio,
		/*mod.wrap(0, 16pi)**/[1,multi  /*MouseX.kr(0,1)*/
			,multi


		]

		)  * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

/*sig = Splay.arFill(2,sig,spread: 0);*/
	//sig = Pan2.ar(sig, pan);
	Out.ar(out, sig /* !2*/ * env);
}).add;

)

~tes=( Synth(\fm2, \gate, 1))

~tes.set(\gate, 1)

~tes.set(\multi,1)

({SinOsc.ar}.play)










(
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
	mod2 = SinOsc.ar(freq3/10, mul:freq3/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( freq2 * mRatio + mod2 *

		/*	SinOsc.kr(In.kr(~bus2, 1),In.kr(~bus3, 1)).range([In.kr(~bus11, 1)]), mul:*/

			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			/*(*/freq2 * mRatio *iEnv /*In.kr( gra, 1) */  /*) *   In.kr( gra, 1)*/

		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar( [freq, freq+20, freq -40]* cRatio + (In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+

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

	// sig = Splay.arFill(2,sig,spread: 0);
		Out.ar(out, sig /* !*/   * amp* EnvGen.kr(Env.adsr(0.1), gate));
}).add;)

v = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\atkE, 0.1,\amp, 2,\out, 0]));

v.set(\gate,1)
v.set(\freq, 100, \freq2, 10, \freq3,0)

v.set(\multi,1)
