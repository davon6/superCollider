(
Server.killAll;
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);
Pbind.free;
Pbindf.free;
~melo1.free;
~bass.free;
Bus.free;

)

~remyAudio.play
s.options.memSize = 2097152;
Pseq([~remyAudio],inf).play

Server.default.options.sampleRate =  48000
Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");

~kick.play

(
s.waitForBoot({


	var numSegs;

	~bpm = 151.703592;

	~hz1beat = ~bpm * 16/60/32;

	~hz1Oct = ~bpm * 16/30;
	~hzQbeat = ~hz1beat/4;
	~hzHbeat = ~hzQbeat/4;
	~hz8Oct = ~hz1beat * 2048;


s.sync;
	"buff init".postln;

// tempo wanted

	t = TempoClock.new(~bpm/60).permanent_(true);


	/*s.meter;
	s.plotTree;*/

	//necessary for the buffer of the shaper to work
	~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);


	s.sync;


	//this section initialize the shaper
	numSegs= rrand(1,4);


	~tf = Env(
		(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20)}!numSegs,
		{rrand(-20,20)}!numSegs
	).asSignal(1025);


	~tf = ~tf + (
		Signal.sineFill(
			1025,
			[1, 1/4, 1/6, 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);


	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);


	d = Buffer.alloc(s, s.sampleRate *0.3872,1);
	e = Buffer.alloc(s, s.sampleRate *   t.beatDur/*0.3872*/,1);
	f = Buffer.alloc(s, s.sampleRate *    (t.beatDur*4)/*1.5488*/,1);
	~delay = Buffer.alloc(s, 48000 * 3, 2);

	~remyAudio = Buffer.read(s, "/Users/davidmignot/superCollider-master/remy.wav");



"Shaper init".postln;

	s.sync;

	~short = Prand([  Pseq([1/4], 1), Pseq([1/4], 4) ,Pseq([1/4], 16) ,Pseq([1/4], 64), Pseq([1/1], 1),     ],1 );
	~long = Prand([ Pseq([1/1],1), Pseq([4/1],1), Pseq([16/1],1) ],1);
	~short1 = Prand([ Pseq([1/4],1),Pseq([1/1],1),Pseq([4/1],1)],1);

	~long1 = Prand([ Pseq([16/1],1),Pseq([1/1],1),Pseq([4/1],1)],1);
	~long2 = Prand([ Pseq([16/1],1),Pseq([64/1],1),Pseq([4/1],1)],1);



	~quickFix =Pbind(\instrument,\reverb, \dur,inf,\roomsize, 40, \revtime, 4, \damping, 0.9, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -28);
	~rShort = Pbind(\instrument,\reverb, \dur,inf,\roomsize, 41, \revtime, Pseq([1/4],inf), \damping, 0.81, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -12);
	~rLong =	Pbind(\instrument,\reverb, \dur,inf,\roomsize, 41, \revtime, Pseq([1/1],inf), \damping, 0.31, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -9);
	~church =	Pbind(\instrument,\reverb, \dur,inf,\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -11 );




	~dispatchBus = Bus.audio(s,1);

	~micBus = Bus.audio(s,1);
	~ptrBus = Bus.audio(s,1);
	~micBus2 = Bus.audio(s,1);
	~ptrBus2 = Bus.audio(s,1);
	~micBus3 = Bus.audio(s,1);
	~ptrBus3 = Bus.audio(s,1);
	~micBus4 = Bus.audio(s,1);
	~ptrBus4 = Bus.audio(s,1);



	~gateBus = Bus.audio(s,1);
	~gateBus2 = Bus.audio(s,1);
	~gateRnd = Bus.audio(s,1);
	~gateSquelch = Bus.audio(s,1);
	~gateMelo = Bus.audio(s,1);

	~gateSeqBus = Bus.audio(s,1);
	~gateSeqBus2 = Bus.audio(s,1);
	~gateSeqRnd = Bus.audio(s,1);
	~gateSeqSquelch = Bus.audio(s,1);
	~gateSeqMelo = Bus.audio(s,1);

	~gate2Bus = Bus.audio(s,1);

	~stereoPhase = Bus.audio(s,1);
	~stetoSnaCom1 = Bus.audio(s,10);


	~phaseBus = Bus.audio(s,1);

	~bgBus = Bus.audio(s,1);
	~bgFil = Bus.audio(s,1);
	~bgCom = Bus.audio(s,1);
	~bgLimit = Bus.audio(s,1);
	~bgStereo = Bus.audio(s,1);
	~dispatchBg = Bus.audio(s,1);


	~filterBus = Bus.audio(s,1);
	~filterBus2 = Bus.audio(s,1);
	~filterRnd = Bus.audio(s,1);
	~filterSquelch = Bus.audio(s,1);
	~filterMelo = Bus.audio(s,1);

	~distoBus1 = Bus.audio(s,1);
	~distoBus2 = Bus.audio(s,1);
	~distoBus3 = Bus.audio(s,1);
	~distoBus4 = Bus.audio(s,1);

	~distoBg = Bus.audio(s,1);

	~eqBg = Bus.audio(s,1);

	~delayBus = Bus.audio(s,1);

	~reverbBus = Bus.audio(s,1);
	~reverbBus2 = Bus.audio(s,1);
	~reverbRnd = Bus.audio(s,1);
	~reverbSquelch = Bus.audio(s,1);
	~reverbMelo = Bus.audio(s,1);




	~revDelay= Bus.audio(s,2);
	~comDelay = Bus.audio(s,2);
	~limitDelay= Bus.audio(s,2);

	~stereoBus1 = Bus.audio(s,1);
	~stereoBus2 = Bus.audio(s,1);
	~stereoBus3 = Bus.audio(s,1);
	~stereoBus4 = Bus.audio(s,1);

	~stereoCymb = Bus.audio(s,1);
	~stereoHat = Bus.audio(s,1);
	~stereoRkick = Bus.audio(s,1);


	~comRnd = Bus.audio(s,2);
	~comMelo = Bus.audio(s,2);
	~comSquelch = Bus.audio(s,2);
	~comFuzz = Bus.audio(s,2);
	~comFuzz2 = Bus.audio(s,2);
	~comBusHat = Bus.audio(s,2);
	~comBusCymb = Bus.audio(s,2);

	~comSnaGrpBus = Bus.audio(s,2);
	~comSnaGrpBus2 = Bus.audio(s,2);

	~limitFuzz = Bus.audio(s,2);
	~limitFuzz2 = Bus.audio(s,2);
	~limitRnd = Bus.audio(s,2);
	~limitSquelch = Bus.audio(s,2);
	~limitMelo = Bus.audio(s,2);


	~limitRkick = Bus.audio(s,1);
	~gateShap = Bus.audio(s, 2);


	~kbus = Bus.audio(s,1);
	~snBus = Bus.audio(s,1);

	~bassShapB = Bus.audio(s,1);

	~noiseStereo1 =  Bus.audio(s,1);

	~noiseStereo2 =  Bus.audio(s,1);



	s.sync;

	~bus1 = Bus.control(s,1);

	~bus2 = Bus.control(s,1);
	~bus3 = Bus.control(s,1);

	~bus4 = Bus.control(s,1);
	~bus5 = Bus.control(s,1);
	~bus6 = Bus.control(s,1);
	~bus7 = Bus.control(s,1);
	~bus8 = Bus.control(s,1);
	~bus9 = Bus.control(s,1);

	~bus10 = Bus.control(s,1);
	~bus11 = Bus.control(s,1);

	~bus12 = Bus.control(s,1);

	~bus13 = Bus.control(s,1);

	s.sync;

	SynthDef(\playBuf ,{|out = 0,start, trig, dur|Out.ar(out,PlayBuf.ar(2,~remyAudio,trigger: Dust.kr(4.0),startPos: start,doneAction: 2));}).add;


	SynthDef(\shap,{|in, out, vl1=80, vl2=0,vl3=0, dA1 =0|
	var halfBeat, shap;

	halfBeat = t.beatDur * 0.5;

		shap = EnvGen.ar(Env([vl1,vl2],[halfBeat,halfBeat],9),doneAction:dA1);

	Out.ar(out, shap);

	}).add;

	SynthDef(\lfo1, {|out, val=1, dur|Out.kr(out,
	SinOsc.kr(Select.kr(val,
			[    ~hz1beat, ~hzHbeat/*,0.321875*/	])

			* SinOsc.kr(~hzHbeat*2).range(~hz1beat.neg, ~hz1beat)).range(~hz8Oct, ~hz1Oct)
		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;

	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,1).round(1),
		[    ~hz1beat, ~hzHbeat/*,0.321875*/	]
	)    *  SinOsc.kr(~hzHbeat*2).range((~hz1beat.neg),~hz1beat)).range(~hz8Oct,~hz1Oct),);*/


	SynthDef(\lfoSaw, {|out, val, dur|Out.kr(out,
		Saw.kr(val).range(~hz1beat*256, ~hz1beat*2048)* EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
	)}).add;

	SynthDef(\lfo2, {|out, val=1, dur|Out.kr(out,

		LFNoise1.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.06,0.00)

		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;


	/*Out.kr(~bus8,  /*Lag.kr(*/LFNoise1.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.06,0.00));*/


	SynthDef(\lfo,{|out, vl1, vl2, dur, tim = 0.0484, crv =(-12)|
		Out.kr(out,VarLag.kr( Line.kr(vl1, vl2, dur, doneAction: 2),tim,crv));}).add;

	SynthDef(\lfo3,{|out| Out.kr(out ,EnvGen.kr(Env([143,0],[0.4,0],-30),doneAction: 2))}).add;


	SynthDef(\lfo2,{|out, out2, out3, riseT, flatT, dur, vl=0.0000000095262251, vl2=0, vl3=0|

		var flat =  0.0000000095262251,acti = 0.01005859375, scaRi = (-10.4), phR = 15;

		riseT = t.beatDur* 16*4;
		flatT = t.beatDur* 48* 4;

		Out.kr(out,Line.kr(vl,vl,dur,doneAction: 2));
		Out.kr(out2,Line.kr(vl2,vl2,dur,doneAction: 2));
		Out.kr(out3,Line.kr(vl3,vl3,dur,doneAction: 2));


	}).add;



	SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[1700,1319,165,26,0,0],
				[0.001,0.028,0.1,0,0.4],
				\exp
			)
		);

		env = EnvGen.ar(
		Env.perc(0.0121, 0.40),doneAction:2);


		sig =
		BPeakEQ.ar(
			SinOsc.ar(envF, mul: env)
			,659.255,16, (-12));

		sig = sig * amp.dbamp  !2;

		Out.ar(out, sig);
	}).add;


	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus, dur;

		var sig, env, lvlBa;

		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel],
				[atkcrv,relcrv]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);
		sig = BLowPass.ar(sig, lpf - In.ar(bus, 1));

		sig = sig * amp.dbamp;

		sig = sig * env;

		Out.ar(out, sig!2);
	}).add;

	s.sync;

		SynthDef.new(\percussion, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1,out=0, latch = 6000, crv1, crv1b, mulMod, stereoL=0, stereoR=0;
	var car, mod, env, car2, mod2,env2,sig;

	env = EnvGen.kr(Env.perc(atk, rel,1,crv1), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, crv1b), doneAction:2);

	mod = SinOsc.ar(modHz, mul:mulMod);
	car = SinOsc.ar(carHz + mod) * env * 0.05;

	car2 = WhiteNoise.ar(modAmp) * env2 ;

	sig =  HPF.ar(Latch.ar(tanh(car+car2),Impulse.ar(latch)),3000);

		Out.ar(out, sig * amp.dbamp
		/** [amp.dbamp+stereoL,amp.dbamp+stereoR]*/);
}).add;

	SynthDef.new(\snare, {
		arg carHz=500, modHz=100, modAmp=1, atk=0.01, rel=1, amp=0.2, pan=0,rel2=2,out=0,latch=12000, da1=2, da2=2, crv1=(-3),crv2 = (-2);
	var car, mod, env, car2, mod2,env2, sig;

	env = EnvGen.kr(Env.perc(0, rel,curve:crv1), doneAction:da1);

	env2 = EnvGen.kr(Env.perc(0, rel2, 1, crv2), doneAction:da2);

	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;

	car2 = BrownNoise.ar(0.321875) * env2 ;

	sig = HPF.ar( car+car2,500);

		Out.ar(out, Latch.ar(sig,Impulse.ar(latch))!2
			* amp.dbamp);

}).add;




//filter broken
SynthDef(\multi, {|out=0| Out.ar(out,
	 //BLowPass4.ar(
	Saw.ar([432+SinOsc.kr(0.1).range(-125,430),
		435+ SinOsc.kr(0.1).range(-128,450),
		430+ SinOsc.kr(0.1).range(-122,444)]

+	SinOsc.kr(0.02).range(-6.58, 6.48)
	+ LFNoise0.kr(//10.3
			Select.kr( LFNoise0.kr(0.321875).range(0,2),

				[10.3, 1.2875, 0.321875])

		).range(-300, 300)

	, mul:[1,
			/*MouseX.kr(0,0.6)*/ SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(0,0.6)   ,
			/*MouseX.kr(0,0.6)*/SinOsc.kr(Select.kr(LFNoise2.ar(1.2875).range(0,2).round(1),
		[    1.2875, 0.08046875,0.321875	]
	)    *  SinOsc.kr(0.1609375).range((-1.2875),1.2875)).range(0,0.6)
		])

		//,  Saw.kr(10.3).range(400, 2100)  , 0.2)

		*0.08

);}).add;


SynthDef(\men,{|out = 0, dur|Out.ar(out,

		LFSaw.ar(164.82 + Saw.kr(1.2875).range(-329.64,0)
		+ EnvGen.kr(Env([41.2,0],[/*4*/dur,0],-3),doneAction: 2) ));}).add;


	SynthDef(\lead, {
		arg freq= 659.26, mRatio=1, cRatio=1,  amp=0.01, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=1, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/;

	var car, mod, mod2, iEnv, sig, filRte;



	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*decE*/ dur   ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(freq/10, mul:freq/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )*

		/*	SinOsc.kr(In.kr(~bus2, 1),In.kr(~bus3, 1)).range([In.kr(~bus11, 1)]), mul:*/

			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			/*(*/freq * mRatio *iEnv /*In.kr( gra, 1) */  /*) *   In.kr( gra, 1)*/

		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar( 0.00502929687+eFreq * cRatio +

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


		Out.ar(out, //CompanderD.ar(

			sig
			//, 0.001,1,0.05,0.01,0.8)*gain


		);
}).add;


SynthDef(\algo, {
		arg freq= 457/*659.26*/, mRatio=1, cRatio=1,  amp=0.01, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=1, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/,modu;

	var car, mod, mod2, iEnv, sig, filRte;

	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        ( dur   ),      0.0000000001],
			[4, 4,(-4)]
		));

/*	mod2 = SinOsc.ar(freq/10, mul:freq/10 *iEnv );*/

		mod = SinOsc.ar( freq/10 * mRatio /*+mod2 */*

			SinOsc.kr(~hz1beat/64,0).range([(-10.4)]), mul:SinOsc.kr(~hz1beat/16).range(0.12,  freq /** mRatio *iEnv*/));

		car =SinOsc.ar(In.kr(~bus2,1)+


			freq/*0.00502929687+eFreq */* cRatio    + mod/* +
			SelectX.ar(SinOsc.kr((0.00502929687/2/2),phFm).range(0,1),[SinOsc.ar(0),mod])*/);

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

		Out.ar(out, sig);
}).add;






	SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([1,0],[dur,0],60),doneAction:2))}).add;

//below dur can be factored to change mod
	SynthDef(\shift, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 1)/*.sign*/,

			/*freq:  freq2+    In.kr( boo, 1)  +   (EnvGen.kr(Env([vlPE,vlPE2],[dur/*dcPE*/,0],crvEP),doneAction: dA)*factor2)
*/
			freq:/*SinOsc.kr(0.3).range(10,-10)*/ 55
		   /** EnvGen.kr(Env.step([factor,0],[dur,0]),doneAction: dA3)*//*)*/
			/*+
			(EnvGen.kr(Env.step([vlPE3,vlPE33],[dur/*dcPE2*/,0],crvEP2),doneAction: dA2)*factor3)+

			*/            ));
	}).add;

	SynthDef(\filter,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 |

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig ,  In.kr(busMod, 1) ,In.kr(rqLPF));

		bp = BPF.ar(sig,In.kr(busMod, 1) *factor3  ,0.26);

		hp = BHiPass4.ar(sig, In.kr(busMod, 1),In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;

	SynthDef(\phaser,{|in, out, rate, maxDlT =0.0968| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1)
		,maxDlT,SinOsc.kr(Lag.kr(MouseX.kr(1.2875,0.00000005)),0,0.01,0.01),0.1)*0.4);}).add;


	SynthDef(\disto, {|out=0,in, hpf= 81.41|Out.ar(out, HPF.ar( In.ar(in,1),hpf).round(2**(-16)));}).add;


	SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

		env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT  -In.kr(bus1, 1)  -relSu, dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)



		doneAction:2);

		Out.ar(out, env);
}).add;

	SynthDef(\gateS,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

		env =   In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT  -In.kr(bus1, 1)  -relSu, dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)



		doneAction:2);

		Out.ar(out, env);
}).add;




	SynthDef.new(\ptr, {
		arg out=0, buf=0,dec=1 ;
		var sig;
		sig = Phasor.ar(0, BufRateScale.kr(buf), 0, BufFrames.kr(buf));
		Out.ar(out, sig);
	}).add;

	SynthDef.new(\rec, {
		arg ptrIn=0, micIn=0, buf=0, dec = 1;
		var ptr, sig;
		ptr = In.ar(ptrIn, 1);
		sig = In.ar(micIn, 1);
		BufWr.ar(sig, buf, ptr);
	}).add;

	SynthDef.new(\gran, {
		arg amp=1, buf =0, out=0, atk=1, rel=1, gate=1, sync=1, dens=40, baseDur=0.05, durRand=1, rate=1, rateRand=1, pan =0, panRand=0, grainEnv=(-1), ptrBus =0, ptrSampleDelay=20000, ptrRandSamples= 5000, minPtrDelay=1000,pitchRte=1,duration=8,impulse = 1.2875,pos=0,roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel, dur,
		taillevel,maxRoomsize,wet=0.4, crv= 12;

		var sig, env, densCtrl, durCtrl, rateCtrl, panCtrl, ptr, ptrRand, totalDelay, maxGrainDur;


		env = EnvGen.kr(Env([1,1,0],[dur,0,0],crv), gate, doneAction:2);

		/*densCtrl = Select.ar(sync, [Dust.ar(dens), Impulse.ar(dens)]);
		durCtrl= baseDur * LFNoise1.ar(100).exprange(1/durRand, durRand);
		rateCtrl = rate * LFNoise1.ar(100).exprange(1/rateRand, rateRand);
		panCtrl = pan + LFNoise1.kr(100).bipolar(panRand);

		ptrRand = LFNoise1.ar(100).bipolar(ptrRandSamples);
		totalDelay = max(ptrSampleDelay - ptrRand, minPtrDelay) ;

		ptr = In.ar(ptrBus,1);
		ptr = ptr - totalDelay;
		ptr = ptr / BufFrames.kr(buf);


		maxGrainDur = (totalDelay / rateCtrl) / SampleRate.ir;
		durCtrl = min(durCtrl, maxGrainDur);*/

		sig = GrainBuf.ar(
			1,
			Impulse.ar(impulse),//Impulse.ar(0.0968),//lenth of interval ///20.6 and 10.3 are funny was 1
			duration,//3.0976,//8,//length of the feedback
			buf,
			pitchRte,//pitch
			0//MouseX.kr(0,1)//pos
		);
		sig = sig * env * amp;

		Out.ar(out, sig);
	}).add;






	//GVerb + Splay in one synth

	SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|

	var a ,input;

		//trim freq below 100hz before to 16 bits the sound
		input =In.ar(in,1);

		a = Resonz.ar(

		input
			,
      659.25 *   [8,16,32],

			wet
		).sum * 10;


		//apply reverb , splay stereo and another 100hz trim
    Out.ar(    out,
			//Splay.ar(
				//BHiPass4.ar(
            GVerb.ar(
            a,
            roomsize,
            revtime,
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
				roomsize+1,0.6)
		+ input
			//,81.41)

			//,spread2,level,center)
		)

	}).add;

	"reverb init".postln;

	SynthDef(\pingD, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,1);

    Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;



	SynthDef(\reverbS, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|

	var a ,input;
		input =In.ar(in,2);

		a = Resonz.ar(	input, 659.25 *   [8,16,32],wet).sum * 10;
    Out.ar(    out, GVerb.ar( a,roomsize,revtime,damping,inputbw, spread,drylevel.dbamp,earlylevel.dbamp,taillevel.dbamp,roomsize+1,0.6))
}).add;

	"reverb init".postln;

	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,1) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;

	SynthDef(\compS, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;


		SynthDef(\EQ, {|out=0, in, val, quant, gain| Out.ar(out, BPeakEQ.ar(
		In.ar(in, 1),val,quant, gain))};).add;




	"compression init".postln;

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(BHiPass4.ar( In.ar(in,1),100),thr, sB ,sA, atk, rel)* gain;)
	}).add;

	"limiter init".postln;

	SynthDef(\limiterS, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(BHiPass4.ar( In.ar(in,2),100),thr, sB ,sA, atk, rel)* gain;)
	}).add;

	"limiter init".postln;



	SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dur|

		Out.ar(out,
			Splay.arFill(10,
				In.ar(in, 1)
				,spread,level,center)* EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\comp10, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;





//130.882809922
//8100
});)