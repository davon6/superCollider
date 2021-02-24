
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);

Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");


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


"Shaper init".postln;





	//set the audio bus fro passing signal from synth to reverb to compression to limiter
// most of the busses a doubled as signal gets split in between low and high pass filtering
~reverbBus = Bus.audio(s,2);
~reverbBus2 = Bus.audio(s,2);

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

"Kontrol rate init".postln;

		s.sync;

	/*this section initialize the kick that will be used silently for the compression*/


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
		atk=0, rel=0.1, lpf=100, out = 0, modLvl = True,bus;

		var sig, env, lvlBa;


		if(modLvl== True,{
			lvlBa  = In.kr(bus, 1);
		},{
			lvlBa =1;
		});

		env = EnvGen.ar(
			Env(
				[0,1- In.kr(bus, 1),0],
				[atk,rel],
				[atkcrv,relcrv]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);
		sig = LPF.ar(sig, lpf);

		sig = sig * amp.dbamp!2;

		sig = sig * env;



		Out.ar(out, sig);
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




SynthDef(\lead, {
		arg freq= 500, mRatio=1, cRatio=1,  amp=0.01, atk= 0.01  , rel=3, atkE =0,decE=0.1936, subsE=50, relE=0, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, which = 1,phRise= 0 ,out=0, eFreq =0 , phFm=8, bus,bus2,bus3,bus4,bus5,bus6, bus7, bus8, gra=1,lvlDec=1,factor=1, factor2 =0, vlPE =27.1366666667,vlPE2=0,dcPE = 0.129066666667,atckC = 2.5, decC = (-2), crvEP = (-2), rqLPF =0.5, factor3 =1;


	var car, mod, mod2, env, iEnv, sig, filRte, lp, bp, hp, b1,lvlAtk;

		// envelope volume
		env = EnvGen.kr(Env([0,1,lvlDec,0],[atkE, decE-(In.kr(bus2, 1))     , subsE,relE],[atckC,decC- (In.kr(bus3, 1))

			,(-3),0,0]),
		doneAction:2);


		//inspired from Eli Fieldsteel FM tutorial this must be used to bring the best sound

	iEnv = EnvGen.kr(
			Env.new(
			[1, 1 * 5, 1 * 5],
			[0.000000000001,        (decE    ),      0.0000000001],
			[4, (-4)]
		));

	//second level of modulation

	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	//first level of modulation

	mod = SinOsc.ar(Lag.ar(  freq * mRatio + mod2 ,0.06)*


			SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:

		Lag.kr((freq * mRatio * iEnv)*gra,0.01)

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

	sig  = LeakDC.ar(sig);


	//the different filer in use for this example only hp (high pass) and lp (low ass) are used


	lp = BLowPass4.ar(sig , In.kr(bus, 1) ,rqLPF);

	bp = BPF.ar(sig,In.kr(bus5, 1) *factor3  ,0.26);//0.05

	hp = BHiPass4.ar(sig, In.kr(bus, 1),MouseY.kr(1,0.4,0));

	//select which filter to use	+ add envelope and final volume, all go mono

	sig =SelectX.ar(which, [lp, bp,hp,sig])* env* amp.dbamp;

	Out.ar(out, sig);
}).add;


	"synth lead init".postln;


	//GVerb + Splay in one synth

	SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|



	var a ,input;


		//trim freq below 100hz before to 16 bits the sound
		input = HPF.ar( In.ar(in,2),100).round(2**(-16));

		a = Resonz.ar(

		input
			,
      659.25 *   [8,16,32],

			wet
		).sum * 10;


		//apply reverb , splay stereo and another 100hz trim
    Out.ar(    out,  BHiPass4.ar(  Splay.ar(
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

		),spread2,level,center),100))

	}).add;

	"reverb init".postln;


	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, in2, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		// I just started using gain at the end to boost signal following jamshark70 example

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(in2,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain.dbamp  );

	}).add;


	"compression init".postln;


	//the limiter that I cannot comprehend---> effect wanted---> contain sound below a limit,


	//companderD crashes for me when played with other instruments (even if they also go through one companderD to have all sound going through the delay

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 |


		/*does not limit volumes*/
		//Out.ar(out , Limiter.ar(gain.dbamp*In.ar(in,2),vol.dbamp, du));


		/*this one has volume peaks when gain is pushed to reach  flat -23db*/
		//Out.ar(out , Compander.ar(In.ar(in,2),In.ar(in,2), 0.001, 1, 0.05, atk, rel))* gain;


		/*the best but crashes*/
		Out.ar(out , CompanderD.ar(In.ar(in,2), 0.001, 1, 0.05, atk, rel)* gain;)
	}).add;

"limiter init".postln;


	s.sync;


	//this section initiates arrays that store values and functions that distribute them on call

	//for sequencing
~pseqs=  [Pseq([3/3],3),  Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];

//choice of low of high filter
~wFils = [0,2];

//length or decay of the reverb
~revTails =[Pseq([1/4],4096),  Pseq([1/1],4096)];
//wetness of reverb
~wetsR = [0.05,0.1];

//reverb spread
~spreads = [1,1,1,1,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,40];

~damps = [0.22,0.8,0.4 ];
~freqs = [657.9895,657.9895];

~lvlDecs = [0.2,0.4,0.8];

~pp;~ff;~dd;~bf;~rt;~frq;~fct;~ps;~dps;~we;~tpp;~pm;~am;~ins;~sp;~bsFu;~fc3;~lvDc;


~lvlDec = {~lvDc =  ~lvlDecs[~lvlDecs.size.rand];~lvDc;};
~fac3 = {~fc3 =  ~fac3s[~fac3s.size.rand];~fc3;};
~spread = {~sp = ~spreads[~spreads.size.rand];~sp;};
~amp = {~am  = ~amps[~amps.size.rand];~am;};
~pseqm= {~pm=~pseqsm[~pseqsm.size.rand]; ~pm;};
~tpseq = {~tpp = ~thrpseqs[~thrpseqs.size.rand]; ~tpp;};
~damp = {~dps = ~damps[~damps.size.rand];~dps;};
~psqRise = {~ps = ~psqRises[~psqRises.size.rand];~ps;};

~freq = {~frq= ~freqs[~freqs.size.rand];~frq;};


~revTail = {|input|
	if(input==~melo1,{

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


~pseq = {
	~pp =~pseqs[~pseqs.size.rand];~pp;



};
~wet = { ~we =~wetsR[~wetsR.size.rand]; ~we;};


~rteFil = {|input|      if(input==0,{~bsFu =~reverbBus;},{~bsFu = ~reverbBus2;}); ~bsFu;};


	s.sync;

	//set sounds objects

    ~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,( -10.5),\out,0);


~bass = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1, /*\bus, ~bus6,*/
	\amp, (-0),\out,0
);

	~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest],inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-18.5),\rel,Pseq([1/16],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-2.4), \crv1b,(-3), \mulMod, 1691,\out, ~comBusCymb);

~hat = Pbind(\instrument,\percussion,\dur,Pseq([1/4], 64),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,( -17), \crv2, (-3), \modHz, exprand(20,10000), \mulMod, rrand(0, 10000), \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~comBusHat);

~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-15.5),\out,0);

s.sync;

	//set the groups

~micGrp = Group.new;

~revGrp = Group.after(~micGrp);

~compGrp = Group.after(~revGrp);


~compGrp2 = Group.after(~compGrp);

~limitGrp = Group.after(~compGrp2);


	//global vairable to set limiter delay "du" (this is the least noise artefact generator value I found)

//not used for this example coz limiter is replaced by CompanderD
~du = 60/151.703592/4;

 s.sync;


	//Control rates

o = {
		Out.kr(~bus1, MouseY.kr(0.2,0.00));

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));

	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3


	Out.kr(~bus7, SinOsc.ar(5.15).range(2637.02,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(2637.02,0.0201171875));

	Out.kr(~bus9,

		SinOsc.kr(     LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus10,  Lag.kr(LFNoise0.kr(1.2875).range(41.2,1318.51),0.2)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,0.321875])).range(5274.04,20.6));

	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.64375).range(20.6,41.20));

	Out.kr(~bus14, MouseY.kr(0,70));

	Out.kr(~bus15, SinOsc.ar(1.2875).range(41.2,1318.51));


}.play();




Ppar([

		/*	the first  2 lines set the ghost kick for the compressor to get compression even when real kick isnt playing
			it is sent to a limiter to get the same delay than the other sounds to bring more synchronicity    */
		Pseq([Pbindf(~kick,\out,~kbus)],4096),
		Pseq([Pbindf(~snare,\out,~snBus)],1024),




	Ppar([
		Ppar([~kick,~bass],16),~cymbal, ~snare,~hat
	],100),

Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\in, ~comBusHat ,\in2, ~kbus, \out,0,\group, ~compGrp),
	Pbind(\instrument,\comp,\dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\in, ~comBusCymb ,\in2, ~kbus, \out,0,\group, ~compGrp),



	Pseq([




				//For testing purpose: 2 statements one that always goes to lowpass and one for high pass once these are working the other block below can be used to see if volume is stable (more complex)

				//Uncomment to select the one to play

				//    LOW PASS
/*Pbind(\instrument,\lead, \dur,~pseq.(),\decE, ~pp,\freq, ~freq.(),\bus, ~busFi.(0),\lvlDec,~lvlDec.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,0 ,\amp,1,\out,~reverbBus ,\group, ~micGrp),*/



				//HIGH PASS
	/*Pbind(\instrument,\lead, \dur,~pseq.(),\decE, ~pp,\freq, ~freq.(),\bus, ~busFi.(2),\lvlDec,~lvlDec.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,2 ,\amp,1,\out,~reverbBus ,\group, ~micGrp),*/





			//MORE COMPLEX	to comment to test low and high filter with the above statements

		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\which, ~fil.(),\whichMod,0,
			\whichEnv,1,\amp,1,\out, ~rteFil.(~ff),\group, ~micGrp),
		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\which, ~fil.(),\whichMod,0,
			\whichEnv,1,\amp,1,\out, ~rteFil.(~ff),\group, ~micGrp),


		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\which, ~fil.(),\whichMod,0,
			\whichEnv,1,\amp,1,\out, ~rteFil.(~ff),\group, ~micGrp),
		Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(~ff),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\lvlDec,~lvlDec.(),\subsE,0,\which, ~fil.(),\whichMod,0,
			\whichEnv,1,\amp,1,\out, ~rteFil.(~ff),\group, ~micGrp)




				//THIS to repeat
		],80),






			//Low pass reverb

	Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime, ~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -2, \earlylevel, -12, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comFuzz, \group,~revGrp )),


			//High pass reverb

	Pdef(\revHFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,~damp.(), \inputbw, 1, \drylevel, -10, \earlylevel, -22, \taillevel, -15,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus2,\out,~comFuzz2, \group,~revGrp )),


			//Low pass compression

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840, \gain,(12.8)
,\in, ~comFuzz ,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),


			//High pass compression

	Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.6 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.04840,\gain,(6.3)
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~comSnaGrpBus, \group, ~compGrp),






Pbind(\instrument,\comp, \dur,Pseq([1024/1],1),\thr,0.4 ,\sB, 1.086,\sA, 0.2,\atk ,0.5, \rel ,0.7744
,\in, ~comSnaGrpBus ,\in2, ~snBus, \group, ~compGrp2,\out,~limitFuzz
),


		//both routed to same limiter but not sure what is best to get most flat volume possible

	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1),\du,~du, \vol,(-8.3),\gain,30,\group,~limitGrp,\out,0),




],1).play(t,quant:0);


});)

s.meter;
s.plotTree;
//  for second play cmd + . and Server.killAll, reboot server
Server.killAll;