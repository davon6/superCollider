
//lfo == random, pulse, triangle , saw , sine
//note and melo
//multi voic



(

~outFil =Bus.audio(s,2);

)
(
~mod1= Bus.control(s,1);
~mod2= Bus.control(s,1);
~mod3= Bus.control(s,1);
~mod4= Bus.control(s,1);

~seqBus= Bus.control(s,1);
)
(

SynthDef(\sinModul,{|modu|Out.kr(~mod1, SinOsc.kr(modu).range(-40,2200))}).add;
SynthDef(\sawModul,{|modu|Out.kr(~mod2, Saw.kr(modu).range(-40,2200))}).add;
SynthDef(\pulModul,{|modu|Out.kr(~mod3, LFTri.kr(modu).range(-40,2200))}).add;
SynthDef(\ranModul,{|modu|Out.kr(~mod4,LFDNoise0.kr(modu).range(0,2200) )}).add;

SynthDef(\fm, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=1,  amp=0.008, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/,gate,pan=0, modu,modu2;

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

		car =SinOsc.ar( freq+eFreq * cRatio + (In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(modu2,1)* factor2)+

			//remove this line as shwon to decrease sound quality so I left it / HERE CHNAGE THE SOUND
			/*SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])*/
			SelectX.ar(SinOsc.kr((0.00502929687/2/2),phFm).range(0,1),[SinOsc.ar(0),mod])

			//pitch envelope
			/*+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)*/
			//extra pitch modulation
			/*+ pitch +  (In.kr(bus4, 1)/factor)  */              );

	//transform signal through the shaper

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	// sig = Splay.arFill(2,sig,spread: 0);
		Out.ar(out, sig!2* EnvGen.kr(Env.adsr(0.1), gate));
}).add;


/*SynthDef(\fm, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1, multi, out=0, gate;
	var car, mod2, env, iEnv, mod, sig;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv/** index2*/);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio+mod2, mul:/* freq2 **/ iEnv/** index3*//*MouseX.kr(0,iEnv)*/);

	car = SinOsc.ar(
		[freq, freq+10, freq -5]

		/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio+ mod,mul:[1,multi,multi]) * env * amp;


	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);


	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig * EnvGen.kr(Env.adsr(0.1), gate));
}).add;*/






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
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
/*	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);*/

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,/*mod2.wrap(0, 16pi),*/ mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = Saw.ar([freq, freq+20, freq -40] + (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)
		/*+ LFNoise0.kr(10.3).range(-40,1200) */ * cRatio,
		mod.wrap(0, 16pi)*[1,multi
			,multi


		]

		) * env * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

/*sig = Splay.arFill(2,sig,spread: 0);*/
	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig!2 * EnvGen.kr(Env.adsr(0.1), gate));
}).add;


SynthDef(\filterModu,{|out=0, in, filMod,qf, which |

		var lp,hp, sig;

		sig = In.ar(in,2);

		lp = BLowPass4.ar(sig ,  filMod ,qf);
/*
		hp = BHiPass4.ar(sig, filMod,qf);

		sig = SelectX.ar(which, [lp, hp]);*/

		Out.ar(out, lp);
	}).add;

SynthDef(\sequ,{|value, dur, in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2|

	/*	ReplaceOut.ar(in,  In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT  -In.kr(bus1, 1)  , dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)



	doneAction:2));*/


	Out.kr(~seqBus,EnvGen.kr(Env.step([value],[dur]),doneAction: 2))}).add;

// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([1/1],inf, \in,~outFil))
// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([1/4],inf))
// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([4/1],inf))

)


Pbindef(\a, \instrument , \sequ, \value,60, \dur,9999).play
Pdef('a').play()

Pdef(\aa,Pbind(\instrument , \sequ, \value,60, \dur,9999)).play

Pdef(\aqqa,Pbind(\instrument , \sequ, \value,60, \dur,9999)).play


Bus.free
~synthGrp = Group.new;
~filterGrp = Group.after(~synthGrp);



s.plotTree


