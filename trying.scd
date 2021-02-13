//Pan2 lead
//percu cutting the 1/2 for progression
//slider aka minirise
//delay
(
Server.killAll;
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);
Pbind.free;
Pbindf.free;
~melo1.free;
~bass.free;
)
Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");



Server.default.options.sampleRate =  48000


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





	//set the audio bus fro passing signal from synth to reverb to compression to limiter
// most of the busses a doubled as signal gets split in between low and high pass filtering



~gateBus = Bus.audio(s,1);

~micBus = Bus.audio(s,1);
~ptrBus = Bus.audio(s,1);

~bassShapB = Bus.audio(s,1);

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


//use for ghost signal for compression
~kbus = Bus.audio(s,2);
~limitDumK = Bus.audio(s,2);

~snBus = Bus.audio(s,2);



	s.sync;

	//the control rates

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
	~bus16 = Bus.control(s,1);



	~bus17 = Bus.control(s,1);
	~bus18 = Bus.control(s,1);


	~filterCtrl = Bus.control(s,1);

"Kontrol rate init".postln;

		s.sync;



	~tim = 3.0976;
~vl1  = 3.rand;
~vl2  = 3.rand;
~vl3  = 3.rand;
~vl4  = 3.rand;
~vl5  = 3.rand;
~vl6  = 3.rand;
~vl7  = 3.rand;
~vl8  = 3.rand;

s.sync;




	SynthDef(\shap,{|in, out=0,out2, vl1=80, vl2=0,vl3=0|
	var halfBeat, shap, shap2;

	halfBeat = t.beatDur * 0.5;

		shap = EnvGen.ar(Env([vl1,vl2],[halfBeat,halfBeat],9),doneAction:2);

		shap2 = EnvGen.kr(Env([~vl1,~vl1,~vl2,~vl2,~vl3,~vl3,~vl4,~vl4,~vl5,~vl5,~vl6,~vl6,~vl7,~vl7,~vl8,~vl8],

	[~tim,0,~tim,0,~tim,0,~tim,0,~tim,0,~tim,0,~tim,0,~tim ]),doneAction:2);


		/*env = EnvGen.kr(Env([0,1,lvlDec,0],[atkE, decE-(In.kr(bus2, 1))     , subsE,relE],[atckC,decC- (In.kr(bus3, 1))

			,(-3),0,0]),


		doneAction:2);*/



	Out.ar(out, shap);
	Out.kr(out2, shap2);
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


		sig = SinOsc.ar(envF, mul: env);

		sig = sig * amp.dbamp  !2;

		Out.ar(out, sig);
	}).add;


"Kick init".postln;
	s.sync;

	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus;

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

		sig = sig * amp.dbamp!2;

		sig = sig * env;

		Out.ar(out, sig);
	}).add;
s.sync;



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

	Out.ar(out, sig
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

		Out.ar(out, Latch.ar(sig,Impulse.ar(latch))!2
			* amp.dbamp);

}).add;




	SynthDef(\wNoise, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([0,amp.dbamp,0],[atk,dec,0],[3,-2]),doneAction:2);

	sig =  SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF)),

			HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF))]);

sig = Pan2.ar( sig , pan);//0 was pan

	Out.ar(out,HPF.ar(sig,100);//* env2 //*amp

    )
}).add;
"side events init".postln;




SynthDef(\lead, {
		arg freq= 500, mRatio=1, cRatio=1,  amp=0.01, atk= 0.01  , rel=3, atkE =0,decE=0.1936, subsE=50, relE=0, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, which = 1,phRise= 0 ,out=0, eFreq =0 , phFm=8, busLP,busHP,bus2,bus3,bus4,busBP,bus6, bus7, bus8, gra=1,lvlDec=1,factor=1, factor2 =0, vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667,atckC = 2.5, decC = (-2), crvEP = (-2), rqLPF =0.5, factor3 =1;


	var car, mod, mod2, env, iEnv, sig, filRte, lp, bp, hp, b1,lvlAtk;

		// envelope volume
		env = EnvGen.kr(Env([0,1,lvlDec,0],[atkE, decE-(In.kr(bus2, 1))     , subsE,relE],[atckC,decC- (In.kr(bus3, 1))

			,(-3),0,0]),


		doneAction:2);


		//inspired from Eli Fieldsteel FM tutorial this must be used to bring the best sound

	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5,5],
			[0.000000000001,        (decE    ),      0.0000000001],
			[4, (-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )*


			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

			(freq * mRatio * iEnv) *gra

		);



	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar( 0.00502929687+eFreq  /* freq */    * cRatio +

			//remove this line as shwon to decrease sound quality so I left it
			SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])

			//pitch envelope
			+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)
			//extra pitch modulation
			+ pitch +  (In.kr(bus4, 1)/factor));

	//transform signal through the shaper

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig)* env;


	//the different filer in use for this example only hp (high pass) and lp (low ass) are used


	lp = BLowPass4.ar(sig , In.kr(busLP, 1) ,rqLPF);

	bp = BPF.ar(sig,In.kr(busBP, 1) *factor3  ,0.26);//0.05             bus5

	hp = BHiPass4.ar(sig, In.kr(busHP, 1),In.kr(bus7, 1)); //0.6);//      MouseY.kr(1,0.4,0));

	//select which filter to use	+ add envelope and final volume, all go mono

	sig =SelectX.ar(which/*In.kr(which, 1)*/, [lp, bp,hp,sig])* amp;

	Out.ar(out, sig);
}).add;


	"synth lead init".postln;




	SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=0, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2|
	var env;

		/*env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel],
			[atkT , decT-(In.kr(bus1, 1)) , subsT,relT],
			[atckC,decC- (In.kr(bus2, 1)) ,0     ,relC]),

		doneAction:2);*/



		env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel],
			[atkT , decT-In.kr(bus1, 1), subsT,relT],
			[atckC,decC ,0     ,relC]),

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
	arg amp=1, buf =0, out=0, atk=1, rel=1, gate=1, sync=1, dens=40, baseDur=0.05, durRand=1, rate=1, rateRand=1, pan =0, panRand=0, grainEnv=(-1), ptrBus =0, ptrSampleDelay=20000, ptrRandSamples= 5000, minPtrDelay=1000,pitchRte=1,duration=8,impulse = 1.2875,pos=0,roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel,maxRoomsize,wet=0.4;

	var sig, env, densCtrl, durCtrl, rateCtrl, panCtrl, ptr, ptrRand, totalDelay, maxGrainDur;


		env = EnvGen.kr(Env([1,1,1],[atk,rel,0]), gate, doneAction:2);

	densCtrl = Select.ar(sync, [Dust.ar(dens), Impulse.ar(dens)]);
	durCtrl= baseDur * LFNoise1.ar(100).exprange(1/durRand, durRand);
	rateCtrl = rate * LFNoise1.ar(100).exprange(1/rateRand, rateRand);
	panCtrl = pan + LFNoise1.kr(100).bipolar(panRand);

	ptrRand = LFNoise1.ar(100).bipolar(ptrRandSamples);
	totalDelay = max(ptrSampleDelay - ptrRand, minPtrDelay) ;

	ptr = In.ar(ptrBus,1);
	ptr = ptr - totalDelay;
	ptr = ptr / BufFrames.kr(buf);


	maxGrainDur = (totalDelay / rateCtrl) / SampleRate.ir;
	durCtrl = min(durCtrl, maxGrainDur);

	sig = GrainBuf.ar(
		1,
		Impulse.ar(impulse),//Impulse.ar(0.0968),//lenth of interval ///20.6 and 10.3 are funny was 1
		duration,//3.0976,//8,//length of the feedback
		buf,
		pitchRte,//pitch
		0//MouseX.kr(0,1)//pos
	);
	sig = sig * env * amp;

	Out.ar(out, sig!2);
}).add;





	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, in2, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		// I just started using gain at the end to boost signal following jamshark70 example

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(in2,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );

	}).add;


	"compression init".postln;


	//the limiter that I cannot comprehend---> effect wanted---> contain sound below a limit,


	//companderD crashes for me when played with other instruments (even if they also go through one companderD to have all sound going through the delay

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|


		/*does not limit volumes*/
		//Out.ar(out , Limiter.ar(gain.dbamp*In.ar(in,2),vol.dbamp, du));


		/*this one has volume peaks when gain is pushed to reach  flat -23db*/
		//Out.ar(out , Compander.ar(In.ar(in,2),In.ar(in,2), 0.001, 1, 0.05, atk, rel))* gain;


		/*the best but crashes*/
		Out.ar(out , CompanderD.ar(In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;

"limiter init".postln;



});)


(

	//this section initiates arrays that store values and functions that distribute them on call

	//for sequencing
~pseqs=  [Pseq([3/3],3),  Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];

	~thrpseqs = [  Pseq([ (Pseq([1/24],24)/1.5) ,Pseq([1/24],24),  (Pseq([1/24],24)*1.5)  ],1) ,Pseq([ (Pseq([1/24],12)/1.5) ,Pseq([1/24],12),  (Pseq([1/24],12)*1.5)  ],1) ,Pseq([ (Pseq([1/24],6)/1.5) ,Pseq([1/24],6),  (Pseq([1/24],6)*1.5)  ],1),Pseq([1/3],3) ];

//choice of low of high filter
~wFils = [0,2];

//length or decay of the reverb
~revTails =[Pseq([1/4],4096),  Pseq([1/1],4096)];
//wetness of reverb
~wetsR = [0.05,0.1];

//reverb spread
~spreads = [1,1,1,1,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,40];
~fac3s = [0.25,1,4];
~factors = [500,5000,5,1,1,1,1,10];
~damps = [0.22,0.8,0.4 ];
~freqs = [657.9895,657.9895];
~pseqsm =    [Pseq([1 /4],1),Pseq([1 /1],1)];
~lvlDecs = [0.2,0.4,0.8];
~insts = [~melo1,~fuzz, ~squelch, ~rnd].scramble;
~dure = [1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,16];
~pp;~ff;~dd;~bf;~rt;~frq;~fct;~ps;~dps;~we;~tpp;~pm;~am;~ins;~sp;~bsFu;~fc3;~lvDc;~rq;


~dur =  {~dd =~dure[~dure.size.rand];~dd;};
~lvlDec = {~lvDc =  ~lvlDecs[~lvlDecs.size.rand];~lvDc;};
~fac3 = {~fc3 =  ~fac3s[~fac3s.size.rand];~fc3;};
~spread = {~sp = ~spreads[~spreads.size.rand];~sp;};
~amp = {~am  = ~amps[~amps.size.rand];~am;};
~pseqm= {~pm=~pseqsm[~pseqsm.size.rand]; ~pm;};
~tpseq = {~tpp = ~thrpseqs[~thrpseqs.size.rand]; ~tpp;};
~damp = {~dps = ~damps[~damps.size.rand];~dps;};
~psqRise = {~ps = ~psqRises[~psqRises.size.rand];~ps;};
~factor = {~fct = ~factors[~factors.size.rand];  ~fct;};
~freq = {~frq= ~freqs[~freqs.size.rand];~frq;};

~inst ={~ins =~insts[~insts.size.rand];~ins;};
~revTail = {|input|
		if(input.asCompileString.compare(~melo1.asCompileString)==0,{

		~rt = Pseq([1/3],1);~rt;

	},

{
	~rt = ~revTails[~revTails.size.rand]; ~rt;
	});


	};

	//different filter modulation in case low or high pass
~busFi = {|input|
	var busAr;
	~busLFis = [~bus4,~bus4,~bus4,~bus4,~bus7,~bus8];
	~busHFis = [~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];


	if(input ==0,{ busAr = ~busLFis   },{  busAr = ~busHFis  });
	~bf = busAr[busAr.size.rand];~bf;};


~fil =  {~ff =~wFils[~wFils.size.rand];~ff;};

~order = True;
~pseq = {|input, order|

		order.postln;

		if(order.isNil ==False,{~order = order},{});


		if(~order ==False,{

		if(input.asCompileString.compare(~melo1.asCompileString)==0,{~pp = ~tpseq.(); ~pp;},{

			if(input.asCompileString.compare(~squelch.asCompileString)==0,{~pp =~pseqm.();~pp },{


				~pp =~pseqs[~pseqs.size.rand];~pp;});

		});},{
			 if(order==2,{~order =0;},{}); ~pp=Pseq([1/4],16);~pp   })
};
~wet = { ~we =~wetsR[~wetsR.size.rand]; ~we;};


~rteFil = {|input|      if(input==0,{~bsFu =~reverbBus;},{~bsFu = ~reverbBus2;}); ~bsFu;};
	~rqs={|input|      if(input==2 ,{ ~rq =~bus6;~rq;},{~rq=50;~rq;})};

	//s.sync;






	//set sounds objects

    ~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,( -4.5),\out,0);


~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\out,~bassShapB);

~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),\lpf,81.41,
		\midinote, 28, \bus, ~bassShapB,
		/*\atk, t.beatDur/4 * 0.01,*/
		/*\rel, t.beatDur/4 * 0.99,*/
		\atkcrv, -2,
		\relcrv, -1,
	\amp, (12),\out,0
);

// Ppar([~bass],inf).play(t)

// ~bass.play(t)

/*~bassShap.play(t);



Ppar([, Pseq([~bass],inf)]).play(t)*/

// ~bassPr = Ppar([ Pbindf(~bass, \out, ~bassShapB), Pbindf(~bassShap, \in, ~bassShapB)],7).play(t);



	~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-2.3),\rel,Pseq([1/16],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-2.4), \crv1b,(-3), \mulMod, 1691,\out, ~comBusCymb);

~hat = Pbind(\instrument,\percussion,\dur,Pseq([1/4], 64),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,( -5), \crv2, (-3), \modHz, exprand(20,10000), \mulMod, rrand(0, 10000), \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~comBusHat);

~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-5.5),\out,0);


	~fuzz = Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\which, ~fil.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,~rqs.(~ff),\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\whichMod,0,
	\whichEnv,1,\amp,0.5,\out,~rteFil.(~ff));//,\group, ~micGrp);


	~squelch =  Pbind(\instrument,\lead,\dur,~pseqm.(),\lvlDec,~lvlDec.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\factor2,1,\amp,(0.5),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~reverbSquelch);


~melo1 = Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 2.575,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,\bus7,~bus16,\decE,~tpp
		,\bus,~bus12,\bus3,~bus14,\bus4,~bus16,\amp,(0.2)	,\subsE,0,\lvlDec,0  ,\out,~reverbMelo);


~rnd = Pbind(\instrument,\lead, \dur,~pseq.(),\lvlDec,~lvlDec.(),\decE,~pp,\freq,661.44.rand.postln,\factor3,~fac3.(),
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
			\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,2, \gra,2.00.rand.postln,\out,~reverbRnd);

//s.sync;

	//set the groups





~leadGrp = Group.new;

~gateGrp =  Group.after(~leadGrp);

/*~micGrp = Group.new;*/

~micGrp =  Group.after(~gateGrp);


~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~revGrp = Group.after(~granGrp);

~compGrp = Group.after(~revGrp);


~compGrp2 = Group.after(~compGrp);

~limitGrp = Group.after(~compGrp2);


	//global vairable to set limiter delay "du" (this is the least noise artefact generator value I found)


 //s.sync;


	//Control rates

o = {
		Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));     //                MouseY.kr(0.2,0.00));

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));

	Out.kr(~bus4, SinOsc.ar( 5.15 + SinOsc.kr(0.64375).range(0.01005859375,1.2875)  ).range(659.255,81.41));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3

	Out.kr(~bus6, SinOsc.ar(0.321875).range(1,0.4));

	Out.kr(~bus7, SinOsc.ar(5.15).range(2637.02,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(2637.02,0.0201171875));

	Out.kr(~bus9,

		SinOsc.kr(     LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus10,  Lag.kr(LFNoise0.kr(1.2875).range(41.2,1318.51),0.2)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,0.321875])).range(5274.04,20.6));

	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,41.20));
	Out.kr(~bus13, SinOsc.ar(0.64375).range(20.6,41.20));

	Out.kr(~bus14,
	LFNoise2.kr(5.15).range(0,10)
			+ SinOsc.ar(1.2875).range(30,70));          //MouseY.kr(0,70));

	Out.kr(~bus15, SinOsc.ar(1.2875).range(41.2,1318.51));

	Out.kr(~bus16, SinOsc.ar(0.08046875).range(1,0.4));


	Out.kr(~bus17, MouseY.kr(0,659.26));


	/*Out.ar(~bus17,  //CANCELLED

		/*EnvGen.kr(Env([0,0,0,0,1,1,1,0],[0,0,0,t.beatDur/2,0, t.beatDur/2,0,0],5,6,0),Trig.kr(1,490))*/
	EnvGen.ar(Env([0,80,80,80,0,0,0,0],[0,0,0,t.beatDur/2,0, t.beatDur/2,0,0],9,6,0),Trig.kr(1,490))



	);*/


}.play();

// FreqScope.new


Ppar([

	Pbind(\instrument,\ptr, \buf, e, \out, ~ptrBus,\group,~ptrGrp,\dur,Pseq([1024/1],1)),
Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, e,\group,~recGrp,\dur,Pseq([1024/1],1)),

	~bassShap,

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
		Pseq([Pbindf(~snare,\out,~snBus)],4096),






Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\in2, ~kbus, \out,0,\group, ~compGrp),
		Pbind(\instrument,\comp,\dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\in2, ~kbus, \out,0,\group, ~compGrp),



			Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime, ~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -20, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp ),


			//High pass reverb


		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 51, \revtime,~revTail.(), \damping,~damp.(), \inputbw, 0.5, \drylevel, -20, \earlylevel, -22, \taillevel, -22,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp ),


			//Low pass compression

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,(5)
,\in, ~comFuzz ,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),


			//High pass compression

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.020,\sA, 1/2,\atk ,0.0121, \rel ,0.0484,\gain,(1.3)
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),



		Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime,~revTail.(), \damping, ~damp.(), \inputbw, 0.2, \drylevel, (-30), \earlylevel, (-1), \taillevel, (-42),\maxRoomsize,62,\spread,~spread.(),\wet,~wet.(),\in,~reverbSquelch , \out,~comSquelch,\group, ~revGrp),

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 4,\in, ~comSquelch ,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),




		Pbind(\instrument,\reverb,  \dur,Pseq([1024/1],1),\roomsize, 50, \revtime,Pseq([1/4],32), \damping, ~damp.(), \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -50,\amp,1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comRnd,\group, ~revGrp)
			,

Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0121, \rel ,0.04840
,\gain,4,\in, ~comRnd,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),



	Pbind(\instrument,\reverb,\dur,Pseq([1024/1],1),\roomsize, 46, \revtime, Pseq([1/1],1), \damping,~damp.(), \inputbw, 1, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-1),\maxRoomsize,86,\in,~reverbMelo , \out,~comMelo,\group, ~revGrp),



Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.8 ,\sB, 1.2,\sA, 1/3,\atk ,0.0968, \rel ,0.04840
,\in, ~comMelo ,\in2, ~kbus,\gain,6, \out,~comSnaGrpBus, \group, ~compGrp),




Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2,\out,~limitFuzz
),


		//both routed to same limiter but not sure what is best to get most flat volume possible

	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1)
	/*,\thr,  0.1*/

		,\gain,44,\group,~limitGrp,\out,0),
/*thr, sB ,sA, atk, rel
gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05*/

],1).play(t,quant:1);

)


// Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)).play(t,quant:1)

//});)
s.meter;
s.plotTree;
//  for second play cmd + . and Server.killAll, reboot server
Server.killAll;