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


(
s.waitForBoot({


	var numSegs;

	"buff init".postln;

// tempo wanted

	t = TempoClock.new(151.703592/60).permanent_(true);


	s.meter;
	s.plotTree;

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



	e = Buffer.alloc(s, s.sampleRate *0.3872,1);


"Shaper init".postln;

	s.sync;


	~dispatchBus = Bus.audio(s,1);

	~gateBus = Bus.audio(s,1);
	~gateBus2 = Bus.audio(s,1);
	~gateRnd = Bus.audio(s,1);
	~gateSquelch = Bus.audio(s,1);
	~gateMelo = Bus.audio(s,1);



	~filterBus = Bus.audio(s,1);
	~filterBus2 = Bus.audio(s,1);
	~filterRnd = Bus.audio(s,1);
	~filterSquelch = Bus.audio(s,1);
	~filterMelo = Bus.audio(s,1);


	~reverbBus = Bus.audio(s,1);
	~reverbBus2 = Bus.audio(s,1);
	~reverbRnd = Bus.audio(s,1);
	~reverbSquelch = Bus.audio(s,1);
	~reverbMelo = Bus.audio(s,1);


	~comRnd = Bus.audio(s,2);
	~comMelo = Bus.audio(s,2);
	~comSquelch = Bus.audio(s,2);
	~comFuzz = Bus.audio(s,2);
	~comFuzz2 = Bus.audio(s,2);
	~comBusHat = Bus.audio(s,2);
	~comBusCymb = Bus.audio(s,2);

	~comSnaGrpBus = Bus.audio(s,2);


	~limitFuzz = Bus.audio(s,2);
	~limitFuzz2 = Bus.audio(s,2);
	~limitRnd = Bus.audio(s,2);
	~limitSquelch = Bus.audio(s,2);
	~limitMelo = Bus.audio(s,2);


	~kbus = Bus.audio(s,1);


	s.sync;

	~bus1 = Bus.control(s,1);


	~bus4 = Bus.control(s,1);
	~bus5 = Bus.control(s,1);
	~bus6 = Bus.control(s,1);
	~bus7 = Bus.control(s,1);
	~bus8 = Bus.control(s,1);

	s.sync;


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


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  !2;

		Out.ar(out, sig);
	}).add;

	SynthDef(\lead, {
		arg freq= 659.26, mRatio=1, cRatio=1,  amp=0.01, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=1,lvlDec=1,factor=1, factor2 =0, vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, crvEP = (-2);

	var car, mod, mod2, iEnv, sig, filRte;



	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*decE*/ dur   ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )*

/*sineRate phRise sineRangeLow*/
			/*SinOsc.kr(In.kr(busSR, 1),In.kr(busSP, 1)).range([In.kr(busSS, 1)]), mul:*/

			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			(freq * mRatio * iEnv) *gra

		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar( 0.00502929687+eFreq * cRatio +

			//remove this line as shwon to decrease sound quality so I left it
			SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])

			//pitch envelope
			+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)
			//extra pitch modulation
			+ pitch +  (In.kr(bus4, 1)/factor));

	//transform signal through the shaper

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig);
}).add;


	SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([1,0],[dur,0],60),doneAction:2))}).add;

	SynthDef(\filter,{|out=0, in, busLP, busBP, busHP, bus7, which, factor3=1, rqLPF=0.5 |

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , In.kr(busLP, 1) ,In.kr(rqLPF));

		bp = BPF.ar(sig,In.kr(busBP, 1) *factor3  ,0.26);

		hp = BHiPass4.ar(sig, In.kr(busHP, 1),In.kr(bus7, 1));

		sig =SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;


	SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=0, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur|
	var env;


		env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel],
			[atkT ,dur /*decT*/-In.kr(bus1, 1), subsT,relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		doneAction:2);

		Out.ar(out, env);
}).add;


	//GVerb + Splay in one synth

	SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|

	var a ,input;

		//trim freq below 100hz before to 16 bits the sound
		input = HPF.ar( In.ar(in,1),81.41).round(2**(-16));

		a = Resonz.ar(

		input
			,
      659.25 *   [8,16,32],

			wet
		).sum * 10;


		//apply reverb , splay stereo and another 100hz trim
    Out.ar(    out,  Splay.ar(BHiPass4.ar(
            (GVerb.ar(
            a,
            roomsize,
            revtime,
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
				maxRoomsize, amp,)
		+ input

		),81.41),spread2,level,center))

	}).add;

	"reverb init".postln;


	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		// I just started using gain at the end to boost signal following jamshark70 example

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );

	}).add;


	"compression init".postln;

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		/*the best but crashes*/
		Out.ar(out , CompanderD.ar(In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;

"limiter init".postln;

	s.sync;

	~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,( -4.5),\out,0);


});)