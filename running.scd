(
Server.killAll;
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);
Pbind.free;
Pbindf.free;

~bass.free;
Bus.free;

)
s.plotTree
~remyAudio.play
s.options.memSize = 2097152;


Server.default.options.sampleRate =  48000;
Server.default.options.outDevice_("Audient iD14");
Server.default.options.outDevice_("External Headphones");
Server.default.options.outDevice_("Built-in Output");

~kick.play
ServerOptions.outDevices
(
s.waitForBoot({


	var numSegs;
	// ~bpm = 171.703592;
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
	"no of seg".postln;
	numSegs= rrand(1,2).postln;


	~tf = Env(
		(({rrand(0.0,0.01).postln}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20).postln}!numSegs,
		{rrand(-20,20).postln}!numSegs
	).asSignal(1025);


	~tf = ~tf + (
		Signal.sineFill(
			1025,
			[1,/* 1/4, 1/6,*/ 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);

	// ~tf.plot
	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);


	~k = Buffer.alloc(s, s.sampleRate *0.3872,1);
	~k2 = Buffer.alloc(s, s.sampleRate *1,1);
	~e = Buffer.alloc(s, s.sampleRate *   t.beatDur*4 /*0.3872*/,1);
	~f = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);//  (t.beatDur*4)/*1.5488*/,1);
	~e2 = Buffer.alloc(s, s.sampleRate *   t.beatDur*4 /*0.3872*/,1);
	~f2 = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);//  (t.beatDur*4)/*1.5488*/,1);
	~delay = Buffer.alloc(s, 48000 * 3, 2);
	b = Buffer.alloc(s, 44100 * 2, 2);

	~buf = Buffer.alloc(s,s.sampleRate*90 );
	~bufBg = Buffer.alloc(s,s.sampleRate*60,2 );
	~bufSnoopy = Buffer.alloc(s,s.sampleRate*20 );


	~remyAudio = Buffer.read(s, "/Users/davidmignot/superCollider-master/remy.wav");

"Shaper init".postln;

	s.sync;

	~short = Prand([ Pseq([1/4], 4) ,Pseq([1/4], 16) , Pseq([1/1], 1),     ],1 );
	~long = Prand([ Pseq([1/1],1), Pseq([4/1],1), Pseq([1/4],1) ],64);
	~short1 = Prand([ Pseq([1/4],1),Pseq([1/1],1),Pseq([4/1],1)],1);

	~long1 = Prand([ Pseq([16/1],1),Pseq([1/1],1),Pseq([4/1],1)],1);
	~long2 = Prand([ Pseq([16/1],1),Pseq([64/1],1),Pseq([4/1],1)],1);

	~fPo = { |x, y| sin(x) - (sin(y) * log(x * x + 1)) / 10 };


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
	~eqBus10= Bus.audio(s,10);


	~phaseBus = Bus.audio(s,1);

	~bgBus = Bus.audio(s,2);

	~bgFil = Bus.audio(s,1);
	~bgFil2= Bus.audio(s,1);
	~bgDelay= Bus.audio(s,1);
	~bgDelay2= Bus.audio(s,1);
	~bgCom = Bus.audio(s,1);
	~bgLimit = Bus.audio(s,1);
	~bgStereo = Bus.audio(s,1);
	~dispatchBg = Bus.audio(s,2);


	~bgFil22= Bus.audio(s,2);
	~bgCom2 = Bus.audio(s,2);
	~bgLimit2 = Bus.audio(s,10);
	~bgBus2= Bus.audio(s,10);
	~bgStereo2 = Bus.audio(s,2);
	~bgStereo2 = Bus.audio(s,2);
	~eqBg10 = Bus.audio(s,10);


	~distoBg = Bus.audio(s,1);
~distoBg2= Bus.audio(s,1);
	~eqBg = Bus.audio(s,1);





	~filterBus = Bus.audio(s,1);
	~filterBus2 = Bus.audio(s,1);
	~filterRnd = Bus.audio(s,1);
	~filterSquelch = Bus.audio(s,1);
	~filterMelo = Bus.audio(s,1);

	~distoBus1 = Bus.audio(s,1);
	~distoBus2 = Bus.audio(s,1);
	~distoBus3 = Bus.audio(s,1);
	~distoBus4 = Bus.audio(s,1);
	~distoBass = Bus.audio(s,2);
	~eqBass = Bus.audio(s,2);


	~delayBus = Bus.audio(s,1);

	~reverbBus = Bus.audio(s,1);
	~reverbBus2 = Bus.audio(s,1);
	~reverbBus3 = Bus.audio(s,1);
	~reverbRnd = Bus.audio(s,1);
	~reverbSquelch = Bus.audio(s,1);
	~reverbMelo = Bus.audio(s,1);




	~revDelay= Bus.audio(s,2);
	~comDelay = Bus.audio(s,2);
	~limitDelay= Bus.audio(s,2);

	~stereoBus1 = Bus.audio(s,1);
	~stereoBus2 = Bus.audio(s,2);
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
	~comFuzz3 = Bus.audio(s,2);
	~comBusHat = Bus.audio(s,2);
	~comBusCymb = Bus.audio(s,2);

	~comSnaGrpBus = Bus.audio(s,2);
	~comSnaGrpBus2 = Bus.audio(s,2);

	~limitFuzz = Bus.audio(s,2);
	~limitFuzz2 = Bus.audio(s,2);
	~limitFuzz3 = Bus.audio(s,2);
	~limitRnd = Bus.audio(s,2);
	~limitSquelch = Bus.audio(s,2);
	~limitMelo = Bus.audio(s,2);


	~limitRkick = Bus.audio(s,1);
	~gateShap = Bus.audio(s, 2);


	~kbus = Bus.audio(s,1);
	~snBus = Bus.audio(s,1);

	~bassShapB = Bus.audio(s,1);

	~noiseRev =  Bus.audio(s,2);

	~noiseStereo2 =  Bus.audio(s,1);

	~lpSide=  Bus.audio(s,1);
	~gateSide=  Bus.audio(s,1);
	~comSide =  Bus.audio(s,2);
	~limitSide =  Bus.audio(s,2);
	~stereoSide =  Bus.audio(s,2);
	~revSide=  Bus.audio(s,1);


	~eqPerch =  Bus.audio(s,1);
	~distoPerch =  Bus.audio(s,1);
	~revPerch =  Bus.audio(s,1);
	~comPerch=  Bus.audio(s,2);
	~limitPerch=  Bus.audio(s,2);
	~stereoPerch=  Bus.audio(s,2);

	~eqBus1=  Bus.audio(s,1);
	~eqBus2=  Bus.audio(s,1);
	~eqBus3=  Bus.audio(s,1);
	~eqBus4=  Bus.audio(s,1);
	~eqNoise =  Bus.audio(s,1);
	 ~eqDs =  Bus.audio(s,1);

	~outFil =Bus.audio(s,1);
	~toRecord=Bus.audio(s,1);
	~toRecord2=Bus.audio(s,2);
	~dead=Bus.audio(s,1);

	~deadS=Bus.audio(s,2);

	~no1 = Bus.audio(s,10);
	~no2 = Bus.audio(s,10);
	~dipatchKB = Bus.audio(s,2);
	~stereoK= Bus.audio(s,1);
	~rollingK = Bus.audio(s,10);

	~lpK=Bus.audio(s,1);
	~hpK=Bus.audio(s,1);
	~bpK=Bus.audio(s,1);

~new10 =Bus.audio(s,10);
~again =Bus.audio(s,10);
	~distoBou=Bus.audio(s,1);
	~filterBou=Bus.audio(s,1);

	~newCOn=Bus.audio(s,10);

	~comBusHat2=  Bus.audio(s,2);~comBusCymb2=  Bus.audio(s,2);~limitRkick2=  Bus.audio(s,1);~stereoRkick2=  Bus.audio(s,1);~revSide2=  Bus.audio(s,1);~eqNoise2==  Bus.audio(s,1);~eqDs2=  Bus.audio(s,1);~comSide2=  Bus.audio(s,2);~limitSide2=  Bus.audio(s,2);~stereoSide2=  Bus.audio(s,2);~eqNoise2=  Bus.audio(s,1);~noiseRev2=  Bus.audio(s,2);~reverbBus32=  Bus.audio(s,1);~comFuzz32=  Bus.audio(s,2);~limitFuzz32=  Bus.audio(s,2);~stereoBus42=  Bus.audio(s,1);~stetoSnaCom12=  Bus.audio(s,10);~distoBus12=  Bus.audio(s,1);~distoBus42=  Bus.audio(s,1);~distoBus12=  Bus.audio(s,1);~filterBus12=  Bus.audio(s,1);~eqBus12=  Bus.audio(s,1);~reverbBus12=  Bus.audio(s,1);~comFuzz12=  Bus.audio(s,2);~limitFuzz12=  Bus.audio(s,2);~stereoBus12=  Bus.audio(s,2);~filterBus22=  Bus.audio(s,1);~reverbBus22=  Bus.audio(s,1);~comFuzz22=  Bus.audio(s,2);~limitFuzz22=  Bus.audio(s,2);~stereoBus22=  Bus.audio(s,2);~eqBus102=  Bus.audio(s,10);
~toLimitlast = Bus.audio(s,10);



	~distoBus43 =  Bus.audio(s,1);~filterBus23=  Bus.audio(s,1);  ~eqBus23=  Bus.audio(s,1); ~gateBus23=  Bus.audio(s,1); ~reverbBus23=  Bus.audio(s,1); ~micBus23=  Bus.audio(s,1); ~micBus33=  Bus.audio(s,1);  ~comFuzz23=  Bus.audio(s,2);
~limitFuzz23=  Bus.audio(s,2); ~stereoBus23=  Bus.audio(s,2); ~no3=  Bus.audio(s,10);
	~ptrBus23=Bus.audio(s,1); ~ptrBus33=Bus.audio(s,1);




	~stereoBus14=  Bus.audio(s,2);   ~limitFuzz4=  Bus.audio(s,2);~limitFuzz4=  Bus.audio(s,2);~comFuzz4=  Bus.audio(s,2);~reverbBus4=  Bus.audio(s,1);

	~slideBus=  Bus.audio(s,2);  ~slideBusToLimit=  Bus.audio(s,2);

~riFil=  Bus.audio(s,2);
	~riFil2=  Bus.audio(s,2);
	 ~riEq=  Bus.audio(s,2);
	~riDisto=  Bus.audio(s,2);
	~riRev=  Bus.audio(s,2);
	~riComp=  Bus.audio(s,2);
	~riLimit=  Bus.audio(s,2);   /* ===>random ~flanger would be awe*/
~riStereo=  Bus.audio(s,2);


	~snareEQ=  Bus.audio(s,2);
	~gateBou=  Bus.audio(s,2);
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

	~bus14 = Bus.control(s,1);

	~bus15 = Bus.control(s,1);

	~mod1= Bus.control(s,1);
~mod2= Bus.control(s,1);
~mod3= Bus.control(s,1);
~mod4= Bus.control(s,1);

~seqBus= Bus.control(s,1);
	s.sync;

	SynthDef(\playBuf ,{|out = 0,start, trig, dur, buf, dA=2, tS=1|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		0.002/*Dust.kr(4.0)*/,startPos: start,loop: 1/*,doneAction: dA*/)* EnvGen.kr(Env([0,1,1,0],[0,dur,0]),timeScale: tS,doneAction: 2));}).add;



	SynthDef(\playBufX ,{|out = 0,start, trig, dur, buf, dA=2, tS=1,impulse=0.001|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse* (60/~bpm)),startPos: start,loop: 0,doneAction: 2));}).add;


	SynthDef(\playBuf2 ,{|out = 0,start, trig, dur, buf, dA=2|Out.ar(out,PlayBuf.ar(2, buf,trigger:
		0.002/*Dust.kr(4.0)*/,startPos: start,loop: 1/*,doneAction: dA*/)/** EnvGen.kr(Env([0,1,1,0],[0,dur,0]))*/);}).add;


	SynthDef(\shap,{|in, out, vl1=80, vl2=0,vl3=0, dA1 =0|
	var halfBeat, shap;

	halfBeat = t.beatDur * 0.5;

		shap = EnvGen.ar(Env([vl1,vl2],[halfBeat,halfBeat],6),doneAction:dA1);

	Out.ar(out, shap);

	}).add;



	SynthDef(\lfo1, {|out,ph, val=1, dur|Out.kr(out,
/*	SinOsc.kr(Select.kr(val,
			[    ~hz1beat, ~hzHbeat/*,0.321875*/	])

			* SinOsc.kr(~hzHbeat*2).range(~hz1beat.neg, ~hz1beat)).range(~hz8Oct, ~hz1Oct)*/


	SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,3).round(1),
		[    ~hz1beat/4,~hz1beat,~hz1beat,~hzHbeat,/*~hz1beat *4*/ /*,~hzHbeat*4   */  /*,0.321875*/	]
		)    *  SinOsc.kr(~hzHbeat*4).range((~hz1beat.neg),~hz1beat),ph).range(~hz8Oct/16,~hz1Oct/4)


		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;






	/*SynthDef(\lfo1, {|out,ph, val=1, dur|Out.kr(out,
/*	SinOsc.kr(Select.kr(val,
			[    ~hz1beat, ~hzHbeat/*,0.321875*/	])

			* SinOsc.kr(~hzHbeat*2).range(~hz1beat.neg, ~hz1beat)).range(~hz8Oct, ~hz1Oct)*/


	SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,4).round(1),
		[    ~hz1beat/4,~hz1beat,~hz1beat,~hzHbeat,~hz1beat *4 /*,~hzHbeat*4   */  /*,0.321875*/	]
		)    *  SinOsc.kr(~hzHbeat*4).range((~hz1beat.neg),~hz1beat*4),ph).range((-340),1500)


		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;*/




	SynthDef(\lfo12, {|out, val=1,ph, dur|Out.kr(out,
LFNoise0.kr(~hz1beat).range(0.1,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16]),ph).range(0.2,0.00)
*EnvGen.kr(Env.step([0.08,0],[dur,0]),doneAction: 2))}).add;




	SynthDef(\lfo13, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;



	SynthDef(\lfo14, {|out, val, dur| Out.kr(out, EnvGen.kr(Env.step([val,0],[dur,0]),doneAction: 2))}).add;

	SynthDef(\lfo15, {|out, val, dur|Out.kr(out,  SinOsc.kr( ~hz1beat/4).range(~hz1beat*64, ~hz1beat*1024)
		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;

	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,1).round(1),
		[    ~hz1beat, ~hzHbeat/*,0.321875*/	]
	)    *  SinOsc.kr(~hzHbeat*2).range((~hz1beat.neg),~hz1beat)).range(~hz8Oct,~hz1Oct),);*/


	SynthDef(\lfoSaw, {|out, val, dur|Out.kr(out,
		//Saw.kr(val).range(~hz1beat*256, ~hz1beat*2048)* EnvGen.kr(Env.step([1],[dur]),doneAction: 2)


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

	SynthDef(\kick2, {
		arg amp=0.2,out=0,dur;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[1700,1319,165,26,0,0],
				[0.001,0.028,0.1,0,0.4],
				\exp
			)
		);

		env = EnvGen.ar(
		Env.perc(0.0121, dur),doneAction:2);


		sig =
		BPeakEQ.ar(
			SinOsc.ar(envF, mul: env)
			,659.255,16, (-22));

		sig = sig * amp.dbamp ;

		Out.ar(out, sig);
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
			,659.255,6, (-32));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;


	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus, dur,cho=0;

		var sig, env, lvlBa;

		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel-cho],
				[atkcrv,relcrv]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);


		sig =   BPeakEQ.ar(
			BPeakEQ.ar(

			LPF.ar(LPF.ar(LPF.ar(sig, lpf - In.ar(bus, 1)),lpf - In.ar(bus, 1)),lpf - In.ar(bus, 1)).round(2**(-16));

			,659.255,12, (4))
			,164.81375,12, (12));

	//sig = LPF.ar(LPF.ar LPF.ar(LPF.ar(sig, lpf - In.ar(bus, 1)).round(2**(-16)

		sig = sig * amp.dbamp;

		sig = sig * env;

		Out.ar(out, Pan2.ar(sig));
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

		Out.ar(out, sig/*.dup * amp.dbamp*/
		* [amp.dbamp+stereoL,amp.dbamp+stereoR]);
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

		Out.ar(out,Pan2.ar( Latch.ar(sig,Impulse.ar(latch)))
			* amp.dbamp);

}).add;

	SynthDef(\wNoise, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([0,amp.dbamp,0],[atk,dec,0],[3,-2]),doneAction:2);

	sig =  SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF)),

			HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF))]);

/*sig = Pan2.ar( sig , pan);*///0 was pan

	Out.ar(out,HPF.ar(sig.dup,100)*amp.dbamp;//* env2 //

    )
}).add;
"side events init".postln;


	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur ,out =0 ,tS=1 ;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],//middle was 10
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),doneAction:2
	);
		env =  EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 * iEnv);
	mod = SinOsc.ar(freq * f2 + mod2, mul:freq * mRatio * iEnv);
	car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(out, car);
}).add;





SynthDef(\trippyRise, {|out=0, ph=0,dur,tS=1|
	var r = /*  MouseX.kr(0, 20.6); */  SinOsc.ar(0.075,ph).range(0, 20.6);
	// stereo expansion
	var phi = LFSaw.ar([42.1, 42.2], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
	Out.ar(out,Limiter.ar(~fPo.(x, y), 0.2)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2));
}).add;




//filter broken
SynthDef(\multi, {|out=0| Out.ar(out,
	 //BLowPass4.ar(
	Saw.ar([432+SinOsc.kr(0.1).range(-125,430),
		435+ SinOsc.kr(0.1).range(-128,450),
		430+ SinOsc.kr(0.1).range(-122,444)]

+	SinOsc.kr(0.02).range(-6.58, 6.48)
	+ LFNoise0.kr(//10.3
			Select.kr( LFNoise0.kr(0.321875).range(0,3),

				[10.3, 1.2875, 0.321875,0.08046875])

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
		arg freq= 659.26, mRatio=1, cRatio=1,  amp=0.01, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=1, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50,atk=0.000000000001,vlAtk=1;

	var car, mod, mod2, iEnv, sig, filRte;



	iEnv = EnvGen.kr(
			Env.new(
			[vlAtk, 1 * 5, 1 * 5,4.8],
			[atk,        (/*decE*/ dur   ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(freq/10, mul:freq/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )*

		//mod = SinOsc.ar(freq * mRatio + mod2 *


		/*	SinOsc.kr(In.kr(~bus2, 1),In.kr(~bus3, 1)).range([In.kr(~bus11, 1)]), mul:*/

			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			/*(*/  MouseY.kr(freq * mRatio *iEnv) /*In.kr( gra, 1) */  /*) *   In.kr( gra, 1)*/

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


		Out.ar(out,
sig);
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






/*	SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

	//ReplaceOut works
SynthDef(\dispatch2,{|in, out, dur,tS=1|Out.ar(out, In.ar(in,2)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),timeScale: tS,doneAction:2))}).add;

	SynthDef(\dispatchS,{|in, out, dur|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;


	SynthDef(\dispatchS102,{|in, out, dur|ReplaceOut.ar(out, In.ar(in,10)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;


	SynthDef(\dispatchS10,{|in, out, dur|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;*/



	SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

SynthDef(\dispatch2,{|in, out, dur,tS=1|Out.ar(out, In.ar(in,2)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),timeScale: tS,doneAction:2))}).add;

	SynthDef(\dispatchS,{|in, out, dur|ReplaceOut.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;


	SynthDef(\dispatchS10,{|in, out, dur,tS=1|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),timeScale: tS,doneAction:2))}).add;





	///GITHUB VERSION


	/*SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

SynthDef(\dispatch2,{|in, out, dur|Out.ar(out, In.ar(in,2)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

	SynthDef(\dispatchS,{|in, out, dur|ReplaceOut.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;


	SynthDef(\dispatchS10,{|in, out, dur|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;*/






//below dur can be factored to change mod
	SynthDef(\shift, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 1)/*.sign*/,

			/*freq:  freq2+    In.kr( boo, 1)  +   (EnvGen.kr(Env([vlPE,vlPE2],[dur/*dcPE*/,0],crvEP),doneAction: dA)*factor2)
*/
			freq:SinOsc.ar(0.3).range(-100,100)




			/*SinOsc.kr(0.3).range(10,-10)*/
		   /** EnvGen.kr(Env.step([factor,0],[dur,0]),doneAction: dA3)*//*)*/
			/*+
			(EnvGen.kr(Env.step([vlPE3,vlPE33],[dur/*dcPE2*/,0],crvEP2),doneAction: dA2)*factor3)+

			*/            ));
	}).add;

	SynthDef(\filter,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 freqFil=0, qf =0, qf2=0|

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+ In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;

	SynthDef(\filterS,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5, freqFil=0, qf =0, qf2=0 |

		var lp, bp, hp, sig;

		sig = In.ar(in,2);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;

	SynthDef(\filterU, {|out=0,in, busMod, busMod2, qfH = 0.822379, qlL = 0.504212|Out.ar(out,  BHiPass4.ar(  In.ar(in,1) , In.kr(busMod) +  500+In.kr(busMod2), qfH)) }).add;




/*
	SynthDef(\filterU, {|out=0,in, busMod, busMod2, qfH = 0.822379, qlL = 0.504212|Out.ar(out, BLowPass4.ar(   BHiPass4.ar(  In.ar(in,1) , In.kr(busMod) +  500+In.kr(busMod2), qfH),In.kr(busMod) +  700+In.kr(busMod2),qlL )) }).add;*/

	SynthDef(\phaser,{|in, out, rate, value, dur maxDlT =0.0968,decT=1,amp=0.4| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1) ,maxDlT,SinOsc.kr(value,0,0.01,0.01),decT)*amp* EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2)   );}).add;


	SynthDef(\disto, {|out=0,in, hpf= 81.41|Out.ar(out, In.ar(in,1).round(2**(-16)));}).add;


	SynthDef(\distoS, {|out=0,in|Out.ar(out, In.ar(in,2).round(2**(-16)));}).add;

	SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0,tS =1|
	var env;

		/*env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT -  In.kr(bus1, 1) /*- -relSu*/, dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)*/

env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

timeScale: tS,	doneAction:2);


			/*[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  /*-In.kr(bus1, 1)*/  , dur * subsT,dur* relT],
			[atckC,decC,0     ,relC]),*/



		Out.ar(out, env);
}).add;

	SynthDef(\gateS,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,tS =1|
	var env;

		env =   In.ar(in, 10) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT  , dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)


timeScale: tS,
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
		taillevel,maxRoomsize,wet=0.4, crv= 12,vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0,tS=1;

		var sig, env, densCtrl, durCtrl, rateCtrl, panCtrl, ptr, ptrRand, totalDelay, maxGrainDur;


		env = EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atckC,decC,0,relC]),timeScale: tS, doneAction:2);

//env = EnvGen.kr(Env([0,1,1,1,0],[0,dur,0,0],[0,0,0,0]), gate, doneAction:2);

			/*vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0
		vlAtk must be zero

		[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  /*-In.kr(bus1, 1)*/  , dur * subsT,dur* relT],
			[atckC,decC,0     ,relC]),*/



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
			pos,//MouseX.kr(0,20)//pos
			mul: amp
		);
		sig = sig * env /** amp*/;

		Out.ar(out, sig);
	}).add;


	SynthDef(\gran2,{|out=0,impulse=1,duration=8,buf=0,pitchRte=1,pos=0,amp=1, dur,gate=1|

		//var env = EnvGen.kr(Env([1,1,0],[dur,0,0]),gate, doneAction:2);
Out.ar(out,
	GrainBuf.ar(
		1,
		Impulse.ar(impulse     ),
			duration,
			buf,
			pitchRte,
			pos,
			mul: amp
		)//* env
	);}).add;

SynthDef("TriggerBufferGranular", {arg out=0, bufnum=0, in=0, thresh = 0.004, ampScaler = 1, duration =
1.5544, pan=0,centerPosition=0.1, interp=1, incrementBy = 200, dur;

	var trig, amp, gatedAmp, triggerBool, outamp, bufferFrames, bufRateScale;
	var bufPointer, trigs, env, envGens, outArray, grNum;

	grNum = 4; // the number of granulators in the synthdef   4
	bufferFrames = BufFrames.kr(bufnum);
	bufRateScale = BufRateScale.kr(bufnum);
	amp = Amplitude.kr (SoundIn.ar(in));
	triggerBool = (SoundIn.ar(in) >= thresh);
	gatedAmp = Latch.kr(amp, triggerBool);
	outamp = (gatedAmp * ampScaler);

	trig = Trig.kr(triggerBool, duration/4);  //makes a trigger if triggerBool goes over the threshold
	env = Env([0,1,0],[duration/2,duration/2],'sine');

	bufPointer = PulseCount.kr(trig);  //a counter that counts the number of triggers triggered

	//each trigger below triggers once for every four times trig (above) triggers (if a trig trig could trig trig)

	trigs = Array.fill(grNum, {|i| PulseDivider.kr(trig, 4, i )});//4
	envGens = Array.fill(grNum, {|i| EnvGen.kr(env, trigs[i] ) });

	//trigs correspond to and trigger a PlayBuf below - the pointer slowly moves through the file
	outArray = Array.fill(grNum, {|i| PlayBuf.ar(1, bufnum, bufRateScale, trigs[i], (bufPointer*incrementBy)%bufferFrames)*envGens[i]});

	Out.ar(out, Pan2.ar(Mix(outArray))*EnvGen.kr(Env.step([1],[dur]),doneAction: 2)    );

}).add;




	//GVerb + Splay in one synth

	SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2, mod|

	var a ,input;

		input =In.ar(in,1);

		a = Resonz.ar(

		input
			,
      1294.5373184/*659.25*/     *   [8,16,32],

			wet
		).sum * 10;


    Out.ar(    out,
            GVerb.ar(
            a,
            roomsize,
				revtime + In.kr(mod),
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
				roomsize+1,0.32)
		+ a	)

	}).add;

	"reverb init".postln;



	SynthDef(\pingD, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,1);

    Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;



	SynthDef(\pingDS, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,2);

    Out.ar(out ,PingPong.ar(bufnum, left, delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;


/*	SynthDef(\comb, {|out=0, in ,maxDel, delayT,decT|
		Out.ar(out, CombN.ar(In.ar(in,1),maxDel, delayT,decT))}).add;*/

SynthDef(\comb, {|out=0, in ,maxDel, delayT,decT|
		Out.ar(out, CombN.ar(In.ar(in,1),MouseX.kr(0.01,2),MouseY.kr(0.01,2),3))}).add;

	SynthDef(\reverbS, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|

	var a ,input;
		input =In.ar(in,2);

		a = Resonz.ar(	input, 1294.5373184 *   [8,16,32],wet).sum * 10;
    Out.ar(    out, GVerb.ar( a,roomsize,revtime,damping,inputbw, spread,drylevel.dbamp,earlylevel.dbamp,taillevel.dbamp,roomsize+1,0.32)+a)
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



	SynthDef(\EQHP2, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(
		BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;





	SynthDef(\EQHP, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(
			BPeakEQ.ar(	BPeakEQ.ar(Mix.ar(In.ar(in, 1)),val,quant, gain),val2,quant2, gain2)

			,frq),frq),frq),frq),frq),frq)* vol)};).add;


SynthDef(\EQHP10, {|out=0, in, val, quant, gain,frq=100, vol =1| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BPeakEQ.ar(In.ar(in, 10),val,quant, gain),frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;

	"compression init".postln;

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(In.ar(in,1),thr, sB ,sA, atk, rel)* gain;)
	}).add;


	SynthDef(\limiterS, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar( In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;

	SynthDef(\limiter10, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar( In.ar(in,10),thr, sB ,sA, atk, rel)* gain;)
	}).add;


	"limiter init".postln;



	SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				In.ar(in, 1)
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoS,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				Mix.ar(In.ar(in, 2))
				,spread,level,center/*+ In.kr(modPan)*/)
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoX,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				Mix.ar(In.ar(in, 2))
				,spread,level,center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;




	SynthDef(\stereoS2,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,crvA=0|

		Out.ar(out,
			Splay.arFill(10,
				Mix.ar(In.ar(in, 2))
				,spread,level, center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;




	SynthDef(\comp10, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain* EnvGen.kr(Env([1,1],[dur,0]),timeScale: tS,doneAction: 2 ));
	}).add;














SynthDef(\sinModul,{|modu|Out.kr(~mod1, SinOsc.kr(modu).range(-40,2200))}).add;
SynthDef(\sawModul,{|modu|Out.kr(~mod2, Saw.kr(modu).range(-40,2200))}).add;
SynthDef(\pulModul,{|modu|Out.kr(~mod3, LFTri.kr(modu).range(-40,2200))}).add;
SynthDef(\ranModul,{|modu|Out.kr(~mod4,LFDNoise0.kr(modu).range(0,2200) )}).add;


SynthDef(\fm, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=1,  amp=1.5, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/,gate,pan=0, modu,modu2, multi;

	var car, mod, mod2, iEnv, sig, filRte;



	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*decE*/ dur/*30000*/   ),      0.0000000001],
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

	// sig = Splay.arFill(2,sig,spread: 0);
	Out.ar(out, sig /* !*/   * amp* EnvGen.kr(Env.adsr(0.1), gate));
}).add;



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
	env =EnvGen.kr(Env.adsr(0.1), gate);


	/*EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);*/
/*	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);*/

		mod = SinOsc.ar( freq2  /*In.kr(~bus.postln,1) */   * mRatio,/*mod2.wrap(0, 16pi),*/ mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

		car = Saw.ar(  MouseX.kr([659.26/4, 659.26/4+20, 659.26/4 -40]) + (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)
		/*+ LFNoise0.kr(10.3).range(-40,1200) */ * cRatio,
		mod.wrap(0, 4pi)*[1,multi
			,multi


		]

		) * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

/*sig = Splay.arFill(2,sig,spread: 0);*/
	//sig = Pan2.ar(sig, pan);
	Out.ar(out, sig  /* !2*/ * env);
}).add;


SynthDef(\filterModu,{|out=0, in, filMod=600,filMod2=500,qf=0.5,qf2=0.5,  which=0, filFreq2 =0, filFreq =0|

		var lp,hp, sig;

		sig = In.ar(in,3);

		lp = Resonz.ar(sig , filFreq2+ filMod ,qf);

	hp = BHiPass4.ar(sig, filFreq +filMod,qf2)*0.24;

		sig = SelectX.ar(which, [lp, hp]);

	/*Out.ar(out,Resonz.ar( sig,filMod ,qf));*/
	Out.ar(out,sig);
	}).add;


	SynthDef(\filterModu2,{|out=0, in, filMod=600,filMod2=500,qf=0.5,qf2=0.5,  which=0, filFreq =0|

		var lp,hp, sig;

		sig = In.ar(in,1);

		lp = Resonz.ar(sig , filFreq+ filMod ,qf);

	hp = BHiPass4.ar(sig, filFreq +filMod,qf2)*0.24;

		sig = SelectX.ar(which, [lp, sig, hp]);

	/*Out.ar(out,Resonz.ar( sig,filMod ,qf));*/
	Out.ar(out,sig);
	}).add;

SynthDef(\sequ,{|value, dur, in=0, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2|

		/*ReplaceOut.ar(in,  In.ar(in, 3) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  /*-In.kr(bus1, 1)*/  , dur * subsT,dur* relT],
			[atckC,decC,0     ,relC]),    //decC- (In.kr(bus2, 1)



	doneAction:2) );*/


	Out.kr(~seqBus,EnvGen.kr(Env.step([value],[dur]),doneAction: 2)   ) }).add;



	SynthDef(\recLoop){|buf=0,out=0,recording = 1,in = (~toRecord)|
	var input = In.ar(in,1);
	// Timer measures times between triggers
	// Changed emits a trigger when recording changes value
	// Gate updates recEnd only when not recording
	// BufSampleRate because Timer measures seconds and we need samples instead
	var recEnd = Gate.kr(
		Timer.kr(Changed.kr(recording)),
		1-recording
	)*BufSampleRate.ir(buf);

	// record buf from start to end
	// run only when recording
	// jump to start when recording is started
    var rec = RecordBuf.ar(input,buf,run:recording,loop:0,trigger:recording);

	var play = LoopBuf.ar(1,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);
		Out.ar(0,HPF.ar(input,100)!2);
	Out.ar(~dead,play);
}.add;



		SynthDef(\recLoopS){|buf=0,in=0,out=0,recording = 1|
	var input = In.ar(in/*~toRecord2*/,2);
	// Timer measures times between triggers
	// Changed emits a trigger when recording changes value
	// Gate updates recEnd only when not recording
	// BufSampleRate because Timer measures seconds and we need samples instead
	var recEnd = Gate.kr(
		Timer.kr(Changed.kr(recording)),
		1-recording
	)*BufSampleRate.ir(buf);

	// record buf from start to end
	// run only when recording
	// jump to start when recording is started
    var rec = RecordBuf.ar(input,buf,run:recording,loop:0,trigger:recording);

	var play = LoopBuf.ar(1,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);
		Out.ar(0,HPF.ar(input,100));
	Out.ar(~deadS,play);
}.add;

s.sync;

//130.882809922
//8100



	~kick =	Pbindef(\ki, \instrument, \kick,\dur, Pseq([1/1],1),\amp,(-10),\out,0);//-3.5 - 10.5

	~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\dA1,2,\out,~bassShapB);

	~bass = Pbindef(\bass,
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),

		\cho, Pseq([0,0.00378125,0.001890625,0],inf),
		\dur, Pseq([1/4],4),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.83,
		\atkcrv, -2,
		\relcrv, -1,
		\amp,(-19)/*(-13)*/,\out,0/*~again*//*~dipatchKB*///-10   -17
	);

	~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble,inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-20.3),\rel,Pseq([1/16],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-4.4), \crv1b,(-4), \mulMod, 1691,\out, ~comBusCymb);

~hat = Pbind(\instrument,\percussion,\dur,Pseq([1/4], 64),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -18.2), ( -18.2),( -18.2),( -19.2),( -17.2),( -17),( -18.2),( -18.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~comBusHat);

~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-16.5), \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ);




~bassRest = Pbindf(~bass,  \type,Pseq([\rest],inf));

~kbassRest =Ppar([~kick, ~bassRest], 1);


~bar = [Ppar([~kick,~bass],1),Ppar([~kick,~bass],4),Ppar([~kick,~bass],8),Ppar([~kick,~bass],12),Ppar([~kick,~bass],14) ,Ppar([~kick,~bass],15) ,Ppar([~kick,~bass],16)];




~perc = [


	Ppar([~bar[1],Pbindf(~cymbal, \dur,Pseq([1/4],16)),
		Pbindf(~hat, \dur,Pseq([1/4],16)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)),    ],1),


	Ppar([~bar[2],Pbindf(~cymbal, \dur,Pseq([1/4],32)),
		Pbindf(~hat, \dur,Pseq([1/4],32)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 4)),     ],1),

	Ppar([~bar[3],Pbindf(~cymbal, \dur,Pseq([1/4],48)),
		Pbindf(~hat, \dur,Pseq([1/4],48)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 6) )],1),


	Ppar([~bar[4],Pbindf(~cymbal, \dur,Pseq([1/4],56)),
		Pbindf(~hat, \dur,Pseq([1/4],56)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7))],1),


	Ppar([~bar[5],Pbindf(~cymbal, \dur,Pseq([1/4],60)),
		Pbindf(~hat, \dur,Pseq([1/4],60)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7))],1),


	Ppar([~bar[6],~hat,~cymbal/*,~snare*/],1)
];

	// Ppar([Pseq([~bass],inf),Pbindf(~snare,\da1,0)],1);//JEEEZ


});)