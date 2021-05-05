(
Server.killAll;
Pdef.all.do(_.clear);
Pbindef.all.do(_.clear);
Pbind.free;
Pbindf.free;
~bass.free;
Bus.free;
)


(
s.options.memSize = 2097152 ;
Server.default.options.numOutputBusChannels = 60;
Server.default.options.sampleRate =  48000;
Server.default.options.outDevice_("Audient iD14");
s.options.numAudioBusChannels=3000;
)

Server.default.options.outDevice_("External Headphones");
Server.default.options.outDevice_("BlackHole 2ch","Built-in Output");

Server.default.options.outDevice_("MacBook Air Speakers");



ServerOptions.outDevices;


(
 s.waitForBoot({

	var numSegs;
	// ~bpm = 171.703592;
	~bpm = 151.703592;

	~hz1beat = ~bpm * 16/60/32;

	/*t.beatDur/2048*/

	~hz1Oct = ~bpm * 16/30;
	~hzQbeat = ~hz1beat/4;
	~hzHbeat = ~hzQbeat/4;
	~hz8Oct = ~hz1beat * 2048;
	~scale = 2.rand;

	FreqScope.new;
	s.meter;
	s.plotTree;

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




	~b = Buffer.alloc(s, 2048);
~sig = Signal.newClear(1024);


s.sync;

//more complex trigonometric expression
~sig.waveFill({
	arg x, y, i;
	sin(x.squared) + cos(x.sqrt).abs;
}, 0, 2pi);

	// ~sig.plot

 ~wtx = ~sig.asWavetable;
	~b.loadCollection(~wtx);

	~k = Buffer.alloc(s, s.sampleRate *0.3872,1);

	// ~k = Buffer.alloc(s, s.sampleRate *999,1);
	~k2 = Buffer.alloc(s, s.sampleRate *1,1);
	~b3 = Buffer.alloc(s, s.sampleRate *5,1);
	~kb1 = Buffer.alloc(s, s.sampleRate *1,1);
	~kb2 = Buffer.alloc(s, s.sampleRate *t.beatDur,2);
	~cymb = Buffer.alloc(s, s.sampleRate *1,2);
	~hat = Buffer.alloc(s, s.sampleRate *1,2);
	~snare = Buffer.alloc(s, s.sampleRate *1,1);

		~fkAr = Buffer.alloc(s, s.sampleRate *t.beatDur*64,2);


	~lpPrec = Buffer.alloc(s, s.sampleRate *t.beatDur*64,1);

	~lpPrec2 = Buffer.alloc(s, s.sampleRate *t.beatDur*64,1);
	/*~lpPrec = Buffer.alloc(s, s.sampleRate *t.beatDur*64,2);
	~lpPrec = Buffer.alloc(s, s.sampleRate *t.beatDur*64,10);*/


	~kb2Test = Buffer.alloc(s, s.sampleRate *20,2);
	~e = Buffer.alloc(s, s.sampleRate *   t.beatDur*4 /*0.3872*/,1);
	~f = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);//  (t.beatDur*4)/*1.5488*/,1);
	~e2 = Buffer.alloc(s, s.sampleRate *   t.beatDur*4 /*0.3872*/,1);
	~f2 = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);//  (t.beatDur*4)/*1.5488*/,1);
	~delay = Buffer.alloc(s, 48000 * 3, 2);
	~delayX = Buffer.alloc(s, 48000 * 3, 2);
~delay2 = Buffer.alloc(s, 48000 * 3, 2);
	~delay3 = Buffer.alloc(s, 48000 * 3, 2);
		/*~delay4 = Buffer.alloc(s, 48000 * 3, 2);
	~delay5 = Buffer.alloc(s, 48000 * 3, 2);*/
	~delay6= Buffer.alloc(s, 48000 * 3, 2);



	b = Buffer.alloc(s, 44100 * 2, 2);
	~b2 = Buffer.alloc(s,48000,1);

	~buf = Buffer.alloc(s,s.sampleRate*256* t.beatDur  );
	~bufBg = Buffer.alloc(s,s.sampleRate*60,10 );
	~bufSnoopy = Buffer.alloc(s,s.sampleRate*256* t.beatDur );
	~leTout = Buffer.alloc(s,s.sampleRate* (256* t.beatDur),10);

	~leTout2 = Buffer.alloc(s,s.sampleRate* (256* t.beatDur),10);


	// ~remyAudio = Buffer.read(s, "/Users/davidmignot/superCollider-master/remy.wav");


	/*	~remyAudio = Buffer.read(s,
*/
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



	~quickFi =[\roomsize, 40, \revtime, 4, \damping, 0.9, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -28];
	~rShor = [\roomsize, 41, \revtime, Pseq([1/4],inf), \damping, 0.81, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -12];
	~rLon =	[\roomsize, 41, \revtime, Pseq([1/1],inf), \damping, 0.31, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -9];
	~churc =[\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -11 ];

	~revRnd = [~quickFi,~rShor,~rLon];
~revL = [~quickFix, ~rShort, ~rLong];

	~dispatchBus = Bus.audio(s,1);

	~micBus = Bus.audio(s,1);
	~ptrBus = Bus.audio(s,1);
	/*~micBus2 = Bus.audio(s,1);*/
	~ptrBus2 = Bus.audio(s,1);
	/*~micBus3 = Bus.audio(s,1);*/
	~ptrBus3 = Bus.audio(s,1);
	/*~micBus4 = Bus.audio(s,1);
	~ptrBus4 = Bus.audio(s,1);*/

	~distoPercu= Bus.audio(s,1);

	~part2Fuzz= Bus.audio(s,10);
	~part2Fuzz2= Bus.audio(s,10);

	~revBus1= Bus.audio(s,1);
	~revBus2= Bus.audio(s,1);
	~comBus1= Bus.audio(s,2);
	~comBus2= Bus.audio(s,2);
	~comBus3= Bus.audio(s,2);
	~comBus5= Bus.audio(s,2);
	~limitBus1= Bus.audio(s,2);
	~limitBus2= Bus.audio(s,2);
	~sterBus1= Bus.audio(s,2);
	~sterBus2= Bus.audio(s,2);
	~sterBus5= Bus.audio(s,2);
	~sterBus6= Bus.audio(s,2);
	~toLim = Bus.audio(s,2);
	~to4bar= Bus.audio(s,2);

	~toStereoRise = Bus.audio(s,1);

~percuStereo= Bus.audio(s,2);
	~gateBus = Bus.audio(s,1);
	~gateBusB = Bus.audio(s,1);
	~gateBus2 = Bus.audio(s,1);
	~gateRnd = Bus.audio(s,1);
	/*~gateSquelch = Bus.audio(s,1);
	*/
~gateMelo = Bus.audio(s,1);

	~revBus4 = Bus.audio(s,1);
	~comBus4= Bus.audio(s,2);
	~part2Limit4= Bus.audio(s,2);
	~sterBus4= Bus.audio(s,2);
	~eqBus4 = Bus.audio(s,1);

	~part2ToPhas = Bus.audio(s,1);
	~part2ToG= Bus.audio(s,2);
	~part2ToEq = Bus.audio(s,1);

	~snareComp= Bus.audio(s,1);

	//WATCH OUT MIGHT BE NEEDED

	/*~part2ToRev = Bus.audio(s,1);
	~part2ToComp= Bus.audio(s,2);
	~part2ToLimit= Bus.audio(s,2);
	~part2ToStereo= Bus.audio(s,2);
	~part2ToComp2= Bus.audio(s,10);
	~part2ToFilter= Bus.audio(s,1);*/

	~gateSeqBus = Bus.audio(s,1);
	/*~gateSeqBus2 = Bus.audio(s,1);*/
	~gateSeqRnd = Bus.audio(s,1);
	/*~gateSeqSquelch = Bus.audio(s,1);
	~gateSeqMelo = Bus.audio(s,1);*/
	~delayToLimit= Bus.audio(s,2);

	~delayToEq= Bus.audio(s,2);
	~toKbGate= Bus.audio(s,2);

	/*~gate2Bus = Bus.audio(s,1);*/

	~gateBus3= Bus.audio(s,1);

	/*~stereoPhase = Bus.audio(s,1);*/
	~stetoSnaCom1 = Bus.audio(s,10);
	~eqBus10= Bus.audio(s,10);
~eqBus310= Bus.audio(s,10);
	/*~eqBus210= Bus.audio(s,10);*/

	~kickHatEq = Bus.audio(s,2);
	~kickHatEq2 = Bus.audio(s,2);
~bassEq = Bus.audio(s,2);
	~phaseBus = Bus.audio(s,1);
	~delToStereo= Bus.audio(s,2);
	~bangLimit= Bus.audio(s,10);
	~slideBusToStereo= Bus.audio(s,2);

	~bgBus = Bus.audio(s,2);
	~part2Slide2= Bus.audio(s,1);
	~part2SEq2= Bus.audio(s,1);
	~part2SRev2= Bus.audio(s,1);
	~part2SComp2= Bus.audio(s,2);
	~part2SLimit2= Bus.audio(s,2);
	~part2SStereo2= Bus.audio(s,2);

	~main1GToG= Bus.audio(s,1);
	~perchLimiToG= Bus.audio(s,2);
	~perchLimiToG2= Bus.audio(s,2);
	~perchLimiToG3= Bus.audio(s,2);
	~perchLimiToG4= Bus.audio(s,2);
	~perchLimiToG5= Bus.audio(s,2);
	~perchLimiToG6= Bus.audio(s,2);
	~perchLimiToG7= Bus.audio(s,2);
	~perchLimiToG8= Bus.audio(s,2);
	~perchLimiToG9= Bus.audio(s,2);
	~perchLimiToG10= Bus.audio(s,2);
	~perchLimiToG11= Bus.audio(s,2);
	~perchLimiToG12= Bus.audio(s,2);


	~riToEq2= Bus.audio(s,2);
	~riToRev2= Bus.audio(s,2);
	~riToComp2= Bus.audio(s,2);
	~riToLimit2= Bus.audio(s,2);
	~riToStereo2= Bus.audio(s,2);
	~riToEq3= Bus.audio(s,2);
	~riToRev3= Bus.audio(s,2);
	~riToComp3= Bus.audio(s,2);
	~riToLimit3= Bus.audio(s,2);
	~riToStereo3= Bus.audio(s,2);
	~bellFlang3= Bus.audio(s,2);
	~bellFlang4= Bus.audio(s,2);


	~kbToPan2= Bus.audio(s,1);
	~bgFil = Bus.audio(s,1);
	~bgFil2= Bus.audio(s,1);
	/*~bgDelay= Bus.audio(s,1);
	~bgDelay2= Bus.audio(s,1);*/
	~bgCom = Bus.audio(s,1);
	~bgLimit = Bus.audio(s,1);
	~bgStereo = Bus.audio(s,1);
	/*~dispatchBg = Bus.audio(s,2);*/
	~no2= Bus.audio(s,10);
	~no2Eq= Bus.audio(s,1);

	~part2Slide= Bus.audio(s,1);
	~part2SEq= Bus.audio(s,1);
	~part2SRev= Bus.audio(s,1);
	~part2SComp = Bus.audio(s,2);
	~part2SLimit = Bus.audio(s,2);
	~part2SStereo = Bus.audio(s,2);


	~no2ToRev = Bus.audio(s,1);
	~no2ToCom = Bus.audio(s,2);
	~no2ToLimit = Bus.audio(s,2);
	~no2ToStereo = Bus.audio(s,2);

	~toEq = Bus.audio(s,1);
	~bellFlang= Bus.audio(s,2);


	~bgFil22= Bus.audio(s,1);
	~bgCom2 = Bus.audio(s,1);
	~bgLimit2 = Bus.audio(s,10);
	~bgBus2= Bus.audio(s,10);
	~bgStereo2 = Bus.audio(s,1);
	~bgStereo2 = Bus.audio(s,2);
	~eqBg10 = Bus.audio(s,10);
	~finGran = Bus.audio(s,10);

	~limitCymb= Bus.audio(s,2);
	~limitHat= Bus.audio(s,2);


	/*~distoBg = Bus.audio(s,1);
~distoBg2= Bus.audio(s,1);*/
	~eqBg = Bus.audio(s,1);
	~outDisto = Bus.audio(s,3);

	~distoPerch2= Bus.audio(s,2);~eqPerch2= Bus.audio(s,2);~revPerch2= Bus.audio(s,2);~comPerch2= Bus.audio(s,2);~limitPerch2= Bus.audio(s,2);

	/*~phaseBus2= Bus.audio(s,1);/*
	~phaseBus3= Bus.audio(s,1);/*~distoPerch3= Bus.audio(s,1);*/~eqPerch3= Bus.audio(s,1);~revPerch3= Bus.audio(s,1);~comPerch3= Bus.audio(s,2);~limitPerch3= Bus.audio(s,2);
	~phaseBus4= Bus.audio(s,1);/*~distoPerch4= Bus.audio(s,1);*/~eqPerch4= Bus.audio(s,1);~revPerch4= Bus.audio(s,1);~comPerch4= Bus.audio(s,2);~limitPerch4= Bus.audio(s,2);
	~phaseBus5= Bus.audio(s,1);/*~distoPerch5= Bus.audio(s,1);*/~eqPerch5= Bus.audio(s,1);~revPerch5= Bus.audio(s,1);~comPerch5= Bus.audio(s,2);~limitPerch5= Bus.audio(s,2);
	~phaseBus6= Bus.audio(s,1);/*~distoPerch6= Bus.audio(s,1);*/~eqPerch6= Bus.audio(s,1);~revPerch6= Bus.audio(s,1);~comPerch6= Bus.audio(s,2);~limitPerch6= Bus.audio(s,2);
	~phaseBus7= Bus.audio(s,1);/*~distoPerch7= Bus.audio(s,1);*/~eqPerch7= Bus.audio(s,1);~revPerch7= Bus.audio(s,1);~comPerch7= Bus.audio(s,2);~limitPerch7= Bus.audio(s,2);
	~phaseBus8= Bus.audio(s,1);/*~distoPerch8= Bus.audio(s,1);*/~eqPerch8= Bus.audio(s,1);~revPerch8= Bus.audio(s,1);~comPerch8= Bus.audio(s,2);~limitPerch8= Bus.audio(s,2);
~limitPerch9= Bus.audio(s,2);
~limitPerch10= Bus.audio(s,2);
~limitPerch11= Bus.audio(s,2);
~limitPerch12= Bus.audio(s,2);*/*/

	~bellFlang2= Bus.audio(s,2);
	~flanToDisto2= Bus.audio(s,2);
	~flanToEq2= Bus.audio(s,2);
	~flanToRev2= Bus.audio(s,2);
	~flanToComp2= Bus.audio(s,2);
	~flanToLimit2= Bus.audio(s,2);
	~flanToStereo2= Bus.audio(s,2);

	~part2G = Bus.audio(s,1);
	~part2G2 = Bus.audio(s,1);
	~part2G3 = Bus.audio(s,1);

	~part2Limit= Bus.audio(s,2);
	~part2Limit2= Bus.audio(s,2);
	~part2Limit3= Bus.audio(s,2);

	~absoFinalGate= Bus.audio(s,10);
	~absoFinalGate2= Bus.audio(s,10);
	~absoFinalGate3= Bus.audio(s,10);


	~riToEq= Bus.audio(s,2);
	~riToComp= Bus.audio(s,2);
	~riToDisto= Bus.audio(s,2);
	~riToDisto2= Bus.audio(s,2);
	~riToDisto3= Bus.audio(s,2);
	~riToEnv2= Bus.audio(s,2);
	~riToEnv3= Bus.audio(s,2);

	~riToLimit= Bus.audio(s,2);
	~riToRev  = Bus.audio(s,2);
	~riToStereo = Bus.audio(s,2);

	~flanToEq= Bus.audio(s,2);
	~flanToComp= Bus.audio(s,2);
	~flanToDisto= Bus.audio(s,2);
	~flanToLimit= Bus.audio(s,2);
	~flanToRev  = Bus.audio(s,2);
	~flanToStereo  = Bus.audio(s,2);

	~bigRiToEnv= Bus.audio(s,2);
	~bigRiToEq= Bus.audio(s,2);
	~bigRiToComp= Bus.audio(s,2);
	~bigRiToDisto= Bus.audio(s,2);
	~bigRiToLimit= Bus.audio(s,2);
	~bigRiToRev  = Bus.audio(s,2);
	~bigRiToStereo  = Bus.audio(s,2);


	~filterBus = Bus.audio(s,1);
	~filterBus2 = Bus.audio(s,1);
	~filterRnd = Bus.audio(s,1);
	/*~filterSquelch = Bus.audio(s,1);
	~filterMelo = Bus.audio(s,1);*/

	~distoBus1 = Bus.audio(s,1);
	/*~distoBus2 = Bus.audio(s,1);
	~distoBus3 = Bus.audio(s,1);*/
	~distoBus4 = Bus.audio(s,1);
	/*~distoBass = Bus.audio(s,2);*/
	~eqBass = Bus.audio(s,2);

	~filterPass1= Bus.audio(s,1);~eqPass1= Bus.audio(s,1); ~revPass1= Bus.audio(s,1); ~compPass1= Bus.audio(s,2); ~limitPass1= Bus.audio(s,2); ~stereoPass1= Bus.audio(s,2);
	~filterPass2= Bus.audio(s,1); ~eqPass2= Bus.audio(s,1); ~revPass2= Bus.audio(s,1); ~compPass2= Bus.audio(s,2); ~limitPass2= Bus.audio(s,2); ~stereoPass2= Bus.audio(s,2);
	~filterPass3= Bus.audio(s,1); ~eqPass3= Bus.audio(s,1); ~revPass3= Bus.audio(s,1); ~compPass3= Bus.audio(s,2); ~limitPass3= Bus.audio(s,2); ~stereoPass3= Bus.audio(s,2);~comp10Pass= Bus.audio(s,10);


	~delayBus = Bus.audio(s,1);
~delayBus2= Bus.audio(s,1);
	~reverbBus = Bus.audio(s,1);
	~reverbBus2 = Bus.audio(s,1);
	~reverbBus3 = Bus.audio(s,1);
	/*~reverbRnd = Bus.audio(s,1);*/
	~reverbSquelch = Bus.audio(s,1);
	~reverbMelo = Bus.audio(s,1);

	~dumSnaEq= Bus.audio(s,1);
	~dumSnaLimit= Bus.audio(s,1);


	~revDelay= Bus.audio(s,2);
	~comDelay = Bus.audio(s,2);
	~limitDelay= Bus.audio(s,2);

	~riToGate= Bus.audio(s,2);
	~riToGate2= Bus.audio(s,2);
	~riToGate3= Bus.audio(s,2);
	/*~riToGate4= Bus.audio(s,2);*/

	~stereoBus1 = Bus.audio(s,2);
	~stereoBus2 = Bus.audio(s,2);
	~stereoBus3 = Bus.audio(s,2);
	~stereoBus4 = Bus.audio(s,2);

	/*~stereoCymb = Bus.audio(s,1);
	~stereoHat = Bus.audio(s,1);
	~stereoRkick = Bus.audio(s,1);*/
~stereoBus3b= Bus.audio(s,2);

	/*~comRnd = Bus.audio(s,2);
	~comMelo = Bus.audio(s,2);*/
	~comSquelch = Bus.audio(s,2);
	~comFuzz = Bus.audio(s,2);
	~comFuzz2 = Bus.audio(s,2);
	~comFuzz3 = Bus.audio(s,2);
	~comBusHat = Bus.audio(s,2);
	~comBusCymb = Bus.audio(s,2);

	~comSnaGrpBus = Bus.audio(s,2);
	~comSnaGrpBus2 = Bus.audio(s,10);

	~limitFuzz = Bus.audio(s,2);
	~limitFuzz2 = Bus.audio(s,2);
	~limitFuzz3 = Bus.audio(s,2);
	~limitRnd = Bus.audio(s,2);
	~limitSquelch = Bus.audio(s,2);
	/*~limitMelo = Bus.audio(s,2);*/
	~delayEq= Bus.audio(s,2);


	~limitRkick = Bus.audio(s,1);
/*	~gateShap = Bus.audio(s, 2);*/

	~riTriptoDisto = Bus.audio(s, 2);
	~riTriptoEq = Bus.audio(s, 2);
	~riTriptoRev = Bus.audio(s, 2);
	~riTriptoComp = Bus.audio(s, 2);
	~riTriptoLimit = Bus.audio(s, 2);
	~riTriptoStereo = Bus.audio(s, 2);


	~noiseToMixA= Bus.audio(s, 2);
	~noiseToMixB= Bus.audio(s, 2);
	~noiseToMixC= Bus.audio(s, 2);
	~noiseToMixD= Bus.audio(s, 2);

	~vocalBus= Bus.audio(s,1);
	~vocToEq = Bus.audio(s,1);
	~vocToRev  = Bus.audio(s,1);
	~vocToFil =  Bus.audio(s,2);
	~vocToComp =  Bus.audio(s,2);
	~vocToLimit  =  Bus.audio(s,2);
	~vocToStereo=  Bus.audio(s,2);

	~vocToDispatch=  Bus.audio(s,10);


	~kbus = Bus.audio(s,1);
	~snBus = Bus.audio(s,1);

	~bassShapB = Bus.audio(s,1);

	~noiseRev =  Bus.audio(s,2);

	/*~noiseStereo2 =  Bus.audio(s,1);*/

	/*~lpSide=  Bus.audio(s,1);
	~gateSide=  Bus.audio(s,1);
	~comSide =  Bus.audio(s,2);
	~limitSide =  Bus.audio(s,2);
	~stereoSide =  Bus.audio(s,2);
	~revSide=  Bus.audio(s,1);
*/
	~newBus1=  Bus.audio(s,2);
	~newBus2=  Bus.audio(s,2);
~fusible1 = Bus.audio(s,1);

~toGateX =  Bus.audio(s,2);
	~toGateX2 =  Bus.audio(s,2);
	~eqPerch =  Bus.audio(s,1);
	/*~distoPerch =  Bus.audio(s,1);*/
	~revPerch =  Bus.audio(s,1);
	~comPerch=  Bus.audio(s,2);
	~limitPerch=  Bus.audio(s,2);
	~stereoPerch=  Bus.audio(s,2);
	~stereoPerch2=  Bus.audio(s,2);

	~toGate10 =  Bus.audio(s,10);
	~toGate102  =  Bus.audio(s,10);

	~eqBus1=  Bus.audio(s,1);
	~eqBus2=  Bus.audio(s,1);

	~eqBus2x=  Bus.audio(s,1);
	~eqBus3=  Bus.audio(s,1);
	/*~eqBus4=  Bus.audio(s,1);*/
	~eqNoise =  Bus.audio(s,2);
	 ~eqDs =  Bus.audio(s,1);
	~filterNoise  =  Bus.audio(s,1);

	~outFil =Bus.audio(s,1);
	~toRecord=Bus.audio(s,1);
	~toRecord2=Bus.audio(s,2);
	~dead=Bus.audio(s,1);
	~noiseToComp=Bus.audio(s,2);
	~noiseToLimit=Bus.audio(s,2);
	~noiseToStereo=Bus.audio(s,2);

	~deadS=Bus.audio(s,2);

	~dead10=Bus.audio(s,10);

	~rndBus=Bus.audio(s,10);

	~rythmFil=Bus.audio(s,10);
	~rythmFilEQ=Bus.audio(s,10);
	~rythmComp=Bus.audio(s,10);
	~rythmLimit=Bus.audio(s,10);
	~toCom = Bus.audio(s,10);
	~no1 = Bus.audio(s,10);
	~fusible = Bus.audio(s,10);
	~dipatchKB = Bus.audio(s,2);
	~dipatchKB2 = Bus.audio(s,2);
	~stereoK= Bus.audio(s,1);
	~rollingK = Bus.audio(s,10);

	~lpK=Bus.audio(s,1);
	~hpK=Bus.audio(s,1);
	~bpK=Bus.audio(s,1);

	/*~outFil2=Bus.audio(s,2);
	~outDisto2=Bus.audio(s,2);*/

	~riToEnv=Bus.audio(s,2);
	~no4ToGate=Bus.audio(s,1);
	~no4ToGate2=Bus.audio(s,1);


~new10 =Bus.audio(s,10);
~again =Bus.audio(s,10);
	~again2 =Bus.audio(s,10);

	~bigRiLastEq=Bus.audio(s,10);

	/*~distoBou=Bus.audio(s,1);*/
	~filterBou=Bus.audio(s,1);

	~newCOn=Bus.audio(s,10);
	~newCOn2=Bus.audio(s,10);

	~comBusHat2=  Bus.audio(s,2);~comBusCymb2=  Bus.audio(s,2);~limitRkick2=  Bus.audio(s,1);/*~stereoRkick2=  Bus.audio(s,1);*//*~revSide2=  Bus.audio(s,1);*//*~eqNoise2==  Bus.audio(s,1);*//*~eqDs2=  Bus.audio(s,1);*//*~comSide2=  Bus.audio(s,2);*//*~limitSide2=  Bus.audio(s,2);*//*~stereoSide2=  Bus.audio(s,2);*//*~eqNoise2=  Bus.audio(s,1);*//*~noiseRev2=  Bus.audio(s,2);*//*~reverbBus32=  Bus.audio(s,1);*//*~comFuzz32=  Bus.audio(s,2);*//*~limitFuzz32=  Bus.audio(s,2);*//*~stereoBus42=  Bus.audio(s,1);*/~stetoSnaCom12=  Bus.audio(s,10);/*~distoBus12=  Bus.audio(s,1);*/ /*~distoBus42=  Bus.audio(s,1);*/ /*~distoBus12=  Bus.audio(s,1);*/ /*~filterBus12=  Bus.audio(s,1);*//*~eqBus12=  Bus.audio(s,1);*//*~reverbBus12=  Bus.audio(s,1);*//*~comFuzz12=  Bus.audio(s,2);*//*~limitFuzz12=  Bus.audio(s,2);*//*~stereoBus12=  Bus.audio(s,2);*//*~filterBus22=  Bus.audio(s,1);~reverbBus22=  Bus.audio(s,1);*/~comFuzz22=  Bus.audio(s,2);/*~limitFuzz22=  Bus.audio(s,2);*//*~stereoBus22=  Bus.audio(s,2);*/~eqBus102=  Bus.audio(s,10);
~toLimitlast = Bus.audio(s,10);



	~distoBus43 =  Bus.audio(s,1);~filterBus23=  Bus.audio(s,1);  ~eqBus23=  Bus.audio(s,1); ~gateBus23=  Bus.audio(s,1); ~reverbBus23=  Bus.audio(s,1); ~micBus23=  Bus.audio(s,1); ~micBus33=  Bus.audio(s,1);  ~comFuzz23=  Bus.audio(s,2);
~limitFuzz23=  Bus.audio(s,2); ~stereoBus23=  Bus.audio(s,2); ~no3=  Bus.audio(s,10);
	~ptrBus23=Bus.audio(s,1); ~ptrBus33=Bus.audio(s,1);




	~stereoBus14=  Bus.audio(s,2);  ~limitFuzz4=  Bus.audio(s,2);~comFuzz4=  Bus.audio(s,2);~reverbBus4=  Bus.audio(s,1);
~slideBus2=  Bus.audio(s,1);
	~slideBus=  Bus.audio(s,2);  ~slideBusToLimit=  Bus.audio(s,2);
	~slideBusToLimit2=  Bus.audio(s,1);
~slideEq=  Bus.audio(s,2);
	~slideEq2=  Bus.audio(s,1);
/*~riFil=  Bus.audio(s,2);
	~riFil2=  Bus.audio(s,2);
	 ~riEq=  Bus.audio(s,2);
	~riDisto=  Bus.audio(s,2);
	~riRev=  Bus.audio(s,2);
	~riComp=  Bus.audio(s,2);
	~riLimit=  Bus.audio(s,2);   /* ===>random ~flanger would be awe*/
~riStereo=  Bus.audio(s,2);*/

~outTolimit=  Bus.audio(s,3);
	~snareEQ=  Bus.audio(s,1);
	~snareLimit=  Bus.audio(s,1);

	~percuEq=  Bus.audio(s,1);

	~percuRev=  Bus.audio(s,1);
	~percuLimit=  Bus.audio(s,2);

/*	~percuDelay=  Bus.audio(s,2);*/

	~percuCom=  Bus.audio(s,2);
	~percuComb=  Bus.audio(s,2);

	~percuCom2=  Bus.audio(s,10);
	~percuFil=  Bus.audio(s,1);

	~cymbalEq=  Bus.audio(s,2);
	~hatEq=  Bus.audio(s,2);

/*	~no2Delay = Bus.audio(s,1);*/

	~toPan2= Bus.audio(s,1);
/*	~toPan22= Bus.audio(s,1);*/
~toPan3= Bus.audio(s,1);

	~toShifter= Bus.audio(s,1);

	~toEqFlo= Bus.audio(s,1);
	~toGateFlo= Bus.audio(s,1);
	~toReverbFlo= Bus.audio(s,1);
	~toCompFlo=  Bus.audio(s,2);
	~toLimitFlo=  Bus.audio(s,2);
	~toStereoFlo=  Bus.audio(s,2);
	~risesGate=  Bus.audio(s,10);

	~part2RiDisto=  Bus.audio(s,2);
	~part2RiFilter=  Bus.audio(s,2);
	~part2RiEq=  Bus.audio(s,2);
	~part2RiRev=  Bus.audio(s,2);
	~part2RiComp=  Bus.audio(s,2);
	~part2RiComp2=  Bus.audio(s,10);
	~part2RiLimit=  Bus.audio(s,2);
	~part2RiStereo=  Bus.audio(s,2);

	~fusible10=  Bus.audio(s,10);


	~gateBou=  Bus.audio(s,1);
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

	~bus16 = Bus.control(s,1);

	~bus17 = Bus.control(s,1);

	~bus18 = Bus.control(s,1);

	~bus19 = Bus.control(s,1);
	~bus20 = Bus.control(s,1);
	~bus21 = Bus.control(s,1);
	~bus22 = Bus.control(s,1);

	~bus23 = Bus.control(s,1);

	~bus24 = Bus.control(s,1);
	~bus25 = Bus.control(s,1);
	~bus26 = Bus.control(s,1);

~mod1= Bus.control(s,1);
	~mod2= Bus.control(s,1);
	~mod3= Bus.control(s,1);
	~mod4= Bus.control(s,1);
	~mod5= Bus.control(s,1);
	/*
	~mod1x= Bus.control(s,1);
	~mod2x= Bus.control(s,1);
	~mod3x= Bus.control(s,1);
	~mod4x= Bus.control(s,1);
	~mod5x= Bus.control(s,1);


	~mod1xx= Bus.control(s,1);
	~mod2xx= Bus.control(s,1);
	~mod3xx= Bus.control(s,1);
	~mod4xx= Bus.control(s,1);
	~mod5xx= Bus.control(s,1);

	~seqBusx= Bus.control(s,1);*/
	~seqBus= Bus.control(s,1);
	s.sync;




	SynthDef(\playBuf ,{|out = 0,start=0, trig= 0.002, dur, buf,rte=1 , tS=1, loopy=1,	decT=1, subsT=0,vl=1 ,dA=1 |Out.ar(out,PlayBuf.ar(1,buf,rte ,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy)*
	EnvGen.kr(Env([0,vl,vl,vl,0],[0,dur*decT*dA,dur* subsT]),timeScale: tS,doneAction: 2)

	);}).add;


	SynthDef(\playBufMod ,{|out = 0,start=0, trig= 0.002, dur, buf, dA=2,rte=1 , tS=1, loopy=1,	decT=1, subsT=0 ,modP |Out.ar(out,PlayBuf.ar(1,buf,rte+ In.kr(modP) ,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* /*EnvGen.kr(Env([0,1,1,0],[0,dur,0]),timeScale: tS,doneAction: 2)*/
	EnvGen.kr(Env([0,1,1,1,0],[0,dur*decT,dur* subsT]),timeScale: tS,doneAction: 2)

	);}).add;


	SynthDef(\playBufS ,{|out = 0,start=0,rte=1, trig= 0.002, dur, buf, dA=2, tS=1, loopy=1,vl=1|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));}).add;

	SynthDef(\playBuf10 ,{|out = 0,start=0, trig= 0.002, dur, buf, dA=2, tS=1, loopy=1,vl=1|Out.ar(out,PlayBuf.ar(10,buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));}).add;



	SynthDef(\playBuf10N ,{|out = 0,start=0, trig= 0.002, dur, buf, dA=2, tS=1, loopy=1,vl=1,in|Out.ar(~fusible,PlayBuf.ar(10,buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));

	Out.ar(out,In.ar( in, 10));}).add;


	SynthDef(\playBuf1N ,{|out = 0,start=0, trig= 0.002, dur, buf, dA=2, tS=1, loopy=1,vl=1,in|Out.ar(~fusible1,PlayBuf.ar(1,buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));

	Out.ar(out,In.ar( in, 10));}).add;


	SynthDef(\playBufX ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: dA));}).add;




	SynthDef(\playBufXG ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0|Out.ar(out,PlayBuf.ar(1,buf,rte,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atckC,decC,0,relC]),timeScale: tS, doneAction:2)

	);}).add;


	SynthDef(\playBufXGMod ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0,busMod|Out.ar(out,PlayBuf.ar(1,buf,rte+ In.kr(busMod),trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atckC,decC,0,relC]),timeScale: tS, doneAction:2)

	);}).add;


/*	SynthDef(\playBufXG10 ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001,
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0|Out.ar(out,PlayBuf.ar(10,buf,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atckC,decC,0,relC]),timeScale: tS, doneAction:2)

	);}).add;*/






	SynthDef(\playBufX2 ,{|out = 0,start=0, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001,vl=1|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)*
	EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));
	}).add;


	/*SynthDef(\playBufX1 ,{|out = 0,start, trig, dur, buf, dA=2, loo=0,tS=1,impulse=0.001|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse),startPos: start,loop:loo,doneAction: 2));}).add;*/


	SynthDef(\playBuf2 ,{|out = 0,start=0, trig=0.002, dur, buf, dA=2|Out.ar(out,PlayBuf.ar(2, buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: 1/*,doneAction: dA*/)/** EnvGen.kr(Env([0,1,1,0],[0,dur,0]))*/);}).add;


	SynthDef(\shap,{|in, out, vl1=80, vl2=0,vl3=0, dA1 =0,tS=1|
	var halfBeat, shap;

	halfBeat = t.beatDur * 0.5;

		shap = EnvGen.ar(Env([vl1,vl2],[halfBeat,halfBeat],6),timeScale: tS,doneAction:dA1);

	Out.ar(out, shap);

	}).add;



	SynthDef(\lfo1, {|out,ph, val=1, dur,tS=1|Out.kr(out,
/*	SinOsc.kr(Select.kr(val,
			[    ~hz1beat, ~hzHbeat/*,0.321875*/	])

			* SinOsc.kr(~hzHbeat*2).range(~hz1beat.neg, ~hz1beat)).range(~hz8Oct, ~hz1Oct)*/


	SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,3).round(1),
		[    ~hz1beat/4,~hz1beat,~hz1beat,~hzHbeat,/*~hz1beat *4*/ /*,~hzHbeat*4   */  /*,0.321875*/	]
		)    *  SinOsc.kr(~hzHbeat*4).range((~hz1beat.neg),~hz1beat),ph).range(~hz8Oct/16,~hz1Oct/4)


		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;






	/*SynthDef(\lfo1, {|out,ph, val=1, dur|Out.kr(out,
/*	SinOsc.kr(Select.kr(val,
			[    ~hz1beat, ~hzHbeat/*,0.321875*/	])

			* SinOsc.kr(~hzHbeat*2).range(~hz1beat.neg, ~hz1beat)).range(~hz8Oct, ~hz1Oct)*/


	SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,4).round(1),
		[    ~hz1beat/4,~hz1beat,~hz1beat,~hzHbeat,~hz1beat *4 /*,~hzHbeat*4   */  /*,0.321875*/	]
		)    *  SinOsc.kr(~hzHbeat*4).range((~hz1beat.neg),~hz1beat*4),ph).range((-340),1500)


		*EnvGen.kr(Env.step([1,0],[dur,0]),doneAction: 2))}).add;*/




	SynthDef(\lfo12, {|out, val=1,ph, dur,tS=1|Out.kr(out,
LFNoise0.kr(~hz1beat).range(0.1,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16]),ph).range(0.2,0.00)
*EnvGen.kr(Env.step([0.08,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;




	SynthDef(\lfo13, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4,tS=1 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;



	SynthDef(\lfo14, {|out, val, dur,tS=1| Out.kr(out, EnvGen.kr(Env.step([val,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;



	SynthDef(\lfo15, {|out, val, dur,tS=1|Out.kr(out,  SinOsc.kr( ~hz1beat/4).range(~hz1beat*64, ~hz1beat*1024)
		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	/*Out.kr(~bus5, SinOsc.kr(Select.kr(LFNoise2.ar(~hz1beat).range(0,1).round(1),
		[    ~hz1beat, ~hzHbeat/*,0.321875*/	]
	)    *  SinOsc.kr(~hzHbeat*2).range((~hz1beat.neg),~hz1beat)).range(~hz8Oct,~hz1Oct),);*/




	/*SynthDef(\lfoSaw, {|out, val, dur|Out.kr(out,
		//Saw.kr(val).range(~hz1beat*256, ~hz1beat*2048)* EnvGen.kr(Env.step([1],[dur]),doneAction: 2)


		Saw.kr(val).range(~hz1beat*256, ~hz1beat*2048)* EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
	)}).add;*/

	SynthDef(\lfoSaw, {|out, val, dur,tS=1,ph =0,gte=(-4)|Out.kr(out,

		Saw.ar(/*MouseY.kr(0.24,20.6)*/SinOsc.ar(0.0025,ph).range(0.24,20.6)

			,-1,-0.4).range(-1,0).lincurve(-1,2,5,-3,gte)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2)
	)}).add;


	SynthDef(\lfoPulse, {|out, val, dur,tS=1,ph =0,gte=(-4),frq=1,wdth=0.5|Out.kr(out,

		LFPulse.kr(/*frq*/
			LFNoise0.kr(1.2875).range(0.0001,20.6)

			/*MouseY.kr(0.001,32) */ ,width:In.kr(wdth,1)/*MouseX.kr(0.4,1).poll */)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2)
	)}).add;



	SynthDef(\lfoSin, {|out, val, dur,tS=1,ph =0,gte=(-4),frq=1,wdth=0.5|Out.kr(out,

		/*SinOsc.kr(MouseY.kr(0.3,20.6)).range(0,MouseX.kr(0.2,1) )*/

	Osc.ar(~b.bufnum, LFNoise0.kr(1.2875).range(0.08046875,1.2875) )/*MouseY.kr(0.3,3.23888))*/.range(0.6,1)

		* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)
	)}).add;



SynthDef(\envSli, {|out, val1=20, val2=20000,  dur,tS=1, crv =7|Out.kr(out,
	EnvGen.kr(Env([val1,val2],[dur*0.95,dur*0.05],crv ),timeScale: tS,doneAction: 2)
)}).add;


	SynthDef(\envSli2, {|out,val, val0 ,val1=20, val2=20000,  dur,tS=1, crv =7,crv2|Out.kr(out,
		EnvGen.kr(Env([ val0 ,val1,val2],[dur*0.9,dur*0.41,dur*0.09],[crv,crv2] ),timeScale: tS,doneAction: 2)
)}).add;


	SynthDef(\lfo2, {|out, val=1, dur,tS=1|Out.kr(out,

		LFNoise1.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.06,0.00)

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;


	/*Out.kr(~bus8,  /*Lag.kr(*/LFNoise1.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.06,0.00));*/


	SynthDef(\lfo,{|out, vl1, vl2, dur, tim = 0.0484, crv =(-12)|
		Out.kr(out,VarLag.kr( Line.kr(vl1, vl2, dur, doneAction: 2),tim,crv));}).add;

	SynthDef(\lfo3,{|out,tS=1| Out.kr(out ,EnvGen.kr(Env([143,0],[0.4,0],-30),timeScale: tS,doneAction: 2))}).add;


	SynthDef(\lfo2,{|out, out2, out3, riseT, flatT, dur, vl=0.0000000095262251, vl2=0, vl3=0|

		var flat =  0.0000000095262251,acti = 0.01005859375, scaRi = (-10.4), phR = 15;

		riseT = t.beatDur* 16*4;
		flatT = t.beatDur* 48* 4;

		Out.kr(out,Line.kr(vl,vl,dur,doneAction: 2));
		Out.kr(out2,Line.kr(vl2,vl2,dur,doneAction: 2));
		Out.kr(out3,Line.kr(vl3,vl3,dur,doneAction: 2));


	}).add;



/*SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.001,0.008,0.1,0,0.01],
				\exp
			)
		);

		env =EnvGen.ar(
	Env([1 , 0.4, 1,    1,1,0],
		[0.008, 0.08, 0,0.006,0.01],[-2,-30,5,5,-5]),doneAction:2);
	//EnvGen.ar(Env.perc(0, 0.40),doneAction:2);


		sig =
		//BPeakEQ.ar(
		// BPeakEQ.ar(
		//BPeakEQ.ar(
			SinOsc.ar(envF, mul: env);
			// ,41.2, 4,4)
//,1318.51,4, (-8));
		//,659.255,16, (-4));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;*/

		SynthDef(\kick, {
		arg amp=0.2,out=0;
		var sig, env, envF;

		envF = EnvGen.ar(
			Env(
				[5178.15,1539.47,165,26,0,0],
				[0.001,0.008,0.1,0,0.2],
				\exp
			)
		);

		env =EnvGen.ar(
	Env([0.8 , 0.2, 0.6,    0.6,0.6,0],
		[0.008, 0.08, 0,0.006,0.22],[-1.8,-50,5,5,-5]),doneAction:2);
	//EnvGen.ar(Env.perc(0, 0.40),doneAction:2);


		sig =
		//BPeakEQ.ar(
		// BPeakEQ.ar(
		//BPeakEQ.ar(
			SinOsc.ar(envF, mul: env);
			// ,41.2, 4,4)
//,1318.51,4, (-8));
		//,659.255,16, (-4));

		sig = sig * amp.dbamp  ;
		sig = Pan2.ar(sig);
		Out.ar(out, sig);
	}).add;



	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus, dur,cho=0,rel2,relcrv2,envF,relcrv3;

		var sig, env, lvlBa;

		env = EnvGen.kr(
			Env(
				[0,1,0.6,0],
				[atk,rel-cho,rel2],
				[atkcrv,relcrv,relcrv2]
			),
			doneAction:2
		);

		envF = EnvGen.kr(
			Env(
				[0,1280,20,0],
				[atk,rel/2/*/4*/,rel2],
				[atkcrv,relcrv3,relcrv2]
			),
			doneAction:2
		);

		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);


		sig =
		LPF.ar(LPF.ar(
		BPeakEQ.ar(
			BPeakEQ.ar(

			sig

			,2637.02 /*659.255*4*/ ,4, (-20))
		,164.81375,8, (-14)).round(2**(-16)
,envF+lpf - In.ar(bus, 1)),envF+lpf - In.ar(bus, 1))
		);

	//sig = LPF.ar(LPF.ar LPF.ar(LPF.ar(sig, lpf - In.ar(bus, 1)).round(2**(-16)

		sig = sig * amp.dbamp;

		sig = sig * env;

		Out.ar(out, Pan2.ar(sig));

		Out.ar(0,RMS.ar(sig).ampdb.round(0.1).poll(label:"bass db :")* [0,0,1])
	}).add;

	s.sync;

		SynthDef.new(\percussion, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0, rel=1, amp=0.2, pan=0,rel2=1,out=0, latch = 6000, crv1, crv1b, mulMod, stereoL=0, stereoR=0, dA1=2, dA2=2,atk2=0,tS=1;
	var car, mod, env, car2, mod2,env2,sig;

	env = EnvGen.kr(Env.perc(atk, rel,1,crv1),timeScale: tS, doneAction:dA1);

	env2 = EnvGen.kr(Env.perc(atk, rel2, 1, crv1b),timeScale: tS, doneAction:dA2);

	mod = SinOsc.ar(modHz, mul:mulMod);
	car = SinOsc.ar(carHz + mod) * env * 0.05;

	car2 = WhiteNoise.ar(modAmp) * env2 ;

		sig =  Latch.ar(tanh(car+car2),Impulse.ar(latch));

		Out.ar(out, sig/*.dup * amp.dbamp*/
	* [amp.dbamp+stereoL,amp.dbamp+stereoR]);
}).add;


	/*SynthDef(\homeStereo,{|in, out=0,stereoL=0, stereoR=0,amp|Out.ar(out, In.ar(in)
		* [amp.dbamp+stereoL,amp.dbamp+stereoR]);}).add;*/

	SynthDef.new(\snare, {
		arg carHz=500, modHz=100, modAmp=1691, modAmp2=0.321875, atk=0, atk2=0, rel=1, amp=0.2, pan=0,rel2=2,out=0,latch=12000, da1=2, da2=2, crv1=(-3),crv2 = (-2) , noiLv  =0.321875, tS=1,atkC=0;
	var car, mod, env, car2, mod2,env2, sig;

	env = EnvGen.kr(Env.perc(atk, rel,curve:crv1), timeScale: tS,doneAction:da1);

		env2 = EnvGen.kr(Env.perc(atk2, rel2, 1,[atkC, crv2]),timeScale: tS, doneAction:da2);

	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * modAmp2;

	car2 = BrownNoise.ar(noiLv) * env2 ;

	sig = car+car2;

	Out.ar(out,sig.clip(-41.2,41.2) * amp.dbamp);

}).add;

	/*.clip(-0.2,0.3)*/

	SynthDef(\wNoise, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0, tS=1;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([0,amp.dbamp,0],[atk,dec,0],[3,-2]),timeScale: tS,doneAction:2);

	sig =  SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF)),

			HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF))]);

/*sig = Pan2.ar( sig , pan);*///0 was pan

	Out.ar(out,Pan2.ar(  sig , pan)   /*.dup*/ *amp.dbamp;//* env2 //

    )
}).add;
"side events init".postln;


	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur ,out =0 ,tS=1 ,moduR,moduS,fS=0, fR=0;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],//middle was 10
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*0.038,dur*0.924,0,dur*0.038]/*[dur*0.01,dur*0.97,0,dur*0.02]*/,[16,0,0-16]),timeScale: tS,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))
			 + (In.kr(moduS,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS ))
			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod)))* env * amp;
	car = Pan2.ar(car, pan);
	Out.ar(out, car);
}).add;


		SynthDef(\rise2, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur ,out =0 ,tS=1 ,iEnv,busMod,triMod=0.075;
	var car, mod, env, mod2;



		mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 * In.kr(iEnv,1));
		mod = SinOsc.ar(freq * f2 + mod2, mul:freq * mRatio * In.kr(iEnv));
		car = SinOsc.ar((freq * f1 + mod)*
			/*In.kr(busMod)) */LFTri.kr(triMod))

		/** env */* amp;
	car = Pan2.ar(car, pan);
	Out.ar(out, car*EnvGen.kr(Env([0,1,1,0],[dur*0.01,dur*0.97,0,dur*0.02],[6,0,0-6]),timeScale: tS,doneAction: 2));
}).add;





SynthDef(\trippyRise, {|out=0, ph=0,dur,tS=1|
	var r = /*  MouseX.kr(0, 20.6); */  SinOsc.ar(0.075,ph).range(0, 20.6);
	// stereo expansion
	var phi = LFSaw.ar([44.1, 42.2], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
		Out.ar(out,Limiter.ar(~fPo.(x, y), 0.2)*  EnvGen.kr(Env([0,1,1,0],[dur*0.05 ,dur*0.90,0,dur*0.05],[9,0,0-9]),timeScale: tS,doneAction: 2))
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

SynthDef(\dispatch2,{|in, out, dur,tS=1|Out.ar(out, In.ar(in,2)*  EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;

	SynthDef(\dispatchS,{|in, out, dur,tS=1|ReplaceOut.ar(out, In.ar(in,10) *EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;


	SynthDef(\dispatchS10,{|in, out, dur,tS=1|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;

SynthDef(\dispatch2X,{|in, out=0, dur,tS=1|ReplaceOut.ar(out, In.ar(in,2)*  EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;



	///GITHUB VERSION


	/*SynthDef(\dispatch,{|in, out, dur|Out.ar(out, In.ar(in,1)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

SynthDef(\dispatch2,{|in, out, dur|Out.ar(out, In.ar(in,2)* EnvGen.kr(Env([0,1,1,0],[0,dur,0,0]),doneAction:2))}).add;

	SynthDef(\dispatchS,{|in, out, dur|ReplaceOut.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;


	SynthDef(\dispatchS10,{|in, out, dur|Out.ar(out, In.ar(in,10)* EnvGen.kr(Env([1,1],[dur,0]),doneAction:2))}).add;*/



SynthDef(\shiftX, {|in, out=0, frq=0,mult=0,rte=1|Out.ar(out, FreqShift.ar(In.ar(in, 1),freq:
		[frq,frq+5000*rte,frq-8000*rte],mul: [1,mult,mult]

	)!2);}).add;


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


		SynthDef(\shiftEx, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 2)/*.sign*/,

			/*freq:  freq2+    In.kr( boo, 1)  +   (EnvGen.kr(Env([vlPE,vlPE2],[dur/*dcPE*/,0],crvEP),doneAction: dA)*factor2)
*/
			freq:LFTri.ar(1.2875/16).range(-400,400)
   ));
	}).add;





		/*SynthDef(\shift2, {|in, out, freq, dur, tS=1
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 2)/*.sign*/,
freq         )* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;*/


	SynthDef(\shift2, {|in, out, freq, dur, tS=1
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 2)/*.sign*/,
freq         )* EnvGen.kr(Env([0,1,1,0],[0.055,dur-0.055,0],4),timeScale: tS,doneAction:2))}).add;



	SynthDef(\filter,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 freqFil=0, qf =0, qf2=0|

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+ In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;


	SynthDef(\filterG,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 freqFil=0, qf =0, qf2=0|

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1)+ MouseX.kr(40,22000) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+ In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1)+ MouseX.kr(40,22000),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;


	SynthDef(\filterGS,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 freqFil=0, qf =0, qf2=0|

		var lp, bp, hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1)+ MouseX.kr(40,22000) ,qf +In.kr(rqLPF));

		bp = BBandPass.ar(sig,freqFil+ In.kr(busMod, 1) *factor3 + MouseX.kr(40,12000) ,qf2 );

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1)+ MouseX.kr(40,22000),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;

	SynthDef(\filterX,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5 freqFil=0, qf =0, qf2=0,tS=1,dur|

		var lp, bp, hp, sig;

		sig = In.ar(in,2);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+ In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2) );
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


	SynthDef(\filter10,{|out=0, in, busMod, bus7, which, factor3=1, rqLPF=0.5, freqFil=0, qf =0, qf2=0 |

		var lp, bp, hp, sig;

		sig = In.ar(in,10);

		lp = BLowPass4.ar(sig , freqFil+ In.kr(busMod, 1) ,qf +In.kr(rqLPF));

		bp = BPF.ar(sig,freqFil+In.kr(busMod, 1) *factor3  ,qf2 +0.26);

		hp = BHiPass4.ar(sig, freqFil+ In.kr(busMod, 1),/*0.6 */ qf2 +In.kr(bus7, 1));

		sig = SelectX.ar(which, [lp, bp,hp,sig]);

		Out.ar(out, sig);
	}).add;


	SynthDef(\phaser,{|in, out, rate, value, dur maxDlT =0.0968,decT=1,amp=0.4,tS=1,ph=0| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1) ,maxDlT,SinOsc.kr(value,ph,0.01,0.01),decT)*amp* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2)   );}).add;


	SynthDef(\disto, {|out=0,in, hpf= 81.41|Out.ar(out, In.ar(in,1).round(2**(-16)));}).add;

	/*SynthDef(\disto3, {|out=0,in|Out.ar(out, In.ar(in,3).round(2**(-16)));}).add;*/


	SynthDef(\distoS, {|out=0,in|Out.ar(out, In.ar(in,2).round(2**(-16)));}).add;

	SynthDef(\disto3, {|out=0,in, gain=1|Out.ar(out, In.ar(in,3).round(2**(-16))*gain);}).add;

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

	SynthDef(\gateS,{|in, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,tS =1|
	var env;

	env =   In.ar(in, 10) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atckC,decC ,0     ,relC]),

timeScale: tS,	doneAction:2);

		Out.ar(out, env);
}).add;


	SynthDef(\gateSD,{|in, out=0,out2, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,tS =1|
	var env;

	env =   In.ar(in, 10) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atckC,decC ,0     ,relC]),

timeScale: tS,	doneAction:2);

		Out.ar(out, env);

		Out.ar(out2, env);
}).add;


	SynthDef(\gate2,{|in, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,tS =1|
	var env;

	env =   In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atckC,decC ,0     ,relC]),

timeScale: tS,	doneAction:2);

		Out.ar(out, env);
}).add;


	SynthDef(\gateX,{|in, out=0,busMod|Out.ar(out,  In.ar(in, 2)* In.kr(busMod))}).add;


	SynthDef(\gateX2,{|in, out=0,tS=1,busMod,dur|Out.ar(out,  In.ar(in, 2)* In.kr(busMod)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

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


	SynthDef.new(\gran2, {
		arg amp=1, buf =0, out=0, minPtrDelay=1000,pitchRte=1,duration=8,impulse = 1.2875, crv= 12,vlAtk =0,vlDec=1 ,vlSub=1,dur ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atckC=0,decC=0,relC=0,tS=1,pos=0,busMod;

		var sig, env, densCtrl, durCtrl, rateCtrl, panCtrl, ptr, ptrRand, totalDelay, maxGrainDur;


		env = EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atckC,decC,0,relC]),timeScale: tS, doneAction:2);



		sig = GrainBuf.ar(
			1,
			Impulse.ar(impulse),//Impulse.ar(0.0968),//lenth of interval ///20.6 and 10.3 are funny was 1
			duration,//3.0976,//8,//length of the feedback
			buf,
			pitchRte + In.kr(busMod,1)  ,//pitch
			pos,//MouseX.kr(0,20)//pos
			mul: amp
		);
		sig = sig * env ;

		Out.ar(out, sig);
	}).add;

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




	//GVerb

	SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2, mod|

	var a ,input;

		input =In.ar(in,1);

		a = Resonz.ar(

		//input

			Array.fill(4, input),

    1294.5373184/*659.25*//*1760*/     *  /*[1, 2, 4, 8] */ [8,16,32],

		/*	wet*/0.01
		).sum * 10;


    Out.ar(    out,
            GVerb.ar(
            a,
            roomsize,
				revtime /*+ In.kr(mod)*/,
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
				roomsize,0.3)
		+ input	)

	}).add;

	"reverb init".postln;

	SynthDef(\del, {|out=0, in, decT=1.5544|AllpassL.ar(In.ar(in,1),decaytime: decT)}).add;

	SynthDef(\pingD, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,1);

    Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;


	SynthDef(\pingD10, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	Mix.ar(In.ar(in,10));

    Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;


	SynthDef(\pingDS, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,2);

    Out.ar(out ,PingPong.ar(bufnum, left, delayTime, feedback, 1)
		/*	* [amp+stereoL,amp+stereoR] * EnvGen.kr(Env([1,1,0],[0,dur,0],4),doneAction:2) */)
	}).add;


	SynthDef(\pingDSX, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in, tS=1 |
    var left;

		left =	Mix.ar(In.ar(in,2));

		Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 3)
		* EnvGen.kr(Env.step([1,1],[dur,0],4),timeScale: tS,doneAction:2) )
	}).add;


/*	SynthDef(\comb, {|out=0, in ,maxDel, delayT,decT|
		Out.ar(out, CombN.ar(In.ar(in,1),maxDel, delayT,decT))}).add;*/

SynthDef(\comb, {|out=0, in ,maxDel, delayT,decT=6.1952,amp=0.09|
		Out.ar(out, /*CombN.ar(In.ar(in,1),0.7744/*MouseX.kr(0.01,2)*/,MouseY.kr(0.001,0.6), decT ,amp)*/
			CombN.ar(In.ar(in,2),delaytime:
	LFNoise1.kr(2.575).range(0.001,2)
			/*	MouseY.kr(0.001,0.6)*/,decaytime:-0.2)
			)}).add;


	SynthDef(\comb2, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,2),/*maxDel/*MouseX.kr(0.01,2)*/,*/MouseY.kr(0.6,0.001), decT ,amp))}).add;


	SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/MouseX.kr(0.024,0)+ SinOsc.kr(MouseY.kr(20,0),phase: 3,add: 0).range(0.000000001, 0.001), decT ,amp))}).add;





	SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/

			delayT+ MouseX.kr(0.024,0)/*+ SinOsc.kr(MouseY.kr(20,0),phase: 3,add: 0).range(0.000000001, 0.001)*/,



			decT ,amp)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) )}).add;




		SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/

			/*[delayT+ MouseX.kr(0.024,0),  delayT+ MouseX.kr(0.024,0)+0.00001392889167817/*,    delayT+ MouseX.kr(0.024,0)+0.05*/]*/

			[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]


			/*+ SinOsc.kr(MouseY.kr(20,0),phase: 3,add: 0).range(0.000000001, 0.001)*/,



			decT ,[amp,multi,multi])!2* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) )}).add;


	SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR |
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/

			/*[delayT+ MouseX.kr(0.024,0),  delayT+ MouseX.kr(0.024,0)+0.00001392889167817/*,    delayT+ MouseX.kr(0.024,0)+0.05*/]*/

		delayT+ MouseY.kr(0.024,0)  /*[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]*/

			+ (In.kr(busMod,1)*fx)

				+ (SinOsc.kr(modS/*MouseY.kr(20,0)*/,phase: 3,add: 0).range(0.000000001, 0.001)* f1)
				+ (LFTri.kr(modT).range(0.000000001, 0.001) *f2)
				+ (Saw.kr(modSa).range(0.000000001, 0.001) * f3)
				+ (LFDNoise0.kr(modR).range(0.0008,0.00008)*fr)
			// (LFDNoise0.kr(modR).range(0.000000001,0.001)*fr)
			/*(LFDNoise0.kr(modR).range(-0.0000008,-0.00000008)*fr)*/


			,decT ,amp/* + MouseY.kr(0.5,0)*/ +MouseX.kr(0,-0.63))   /*[amp,multi,multi])!2*//** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) */)}).add;


	// BufCombN.ar(b.bufnum, WhiteNoise.ar(0.01), XLine.kr(0.0001, 0.01, 20), -0.2) }.play;
	SynthDef(\combX, {|out=0, in ,maxDel, delayT,decT=3,dur, tS=1,modu,factor=0,factor2=0|
		Out.ar(out, CombN.ar(In.ar(in,1),1.5488/*MouseX.kr(0.01,2)*/,/*VarLag.kr(delayT,0.04)*/delayT+ MouseY.kr(0.001,0.6)
			+ (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)
			,decT,0.09)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) )}).add;


	SynthDef(\combS, {|out=0, in ,maxDel, delayT,decT,dur, tS=1,amp=1|
		Out.ar(out, CombN.ar(In.ar(in,2),/*MouseX.kr(0.01,2)*/maxDel, delayT /*MouseY.kr(0.01,2)*/,decT/*3*/,amp)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) )}).add;

	SynthDef(\reverbS, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2|

	var a ,input;
		input =In.ar(in,2);

		a = Resonz.ar(		Array.fill(4, input), 1294.5373184 *   [8,16,32],0.01/*wet*/).sum * 10;
    Out.ar(    out, GVerb.ar( a,roomsize,revtime,damping,inputbw, spread,drylevel.dbamp,earlylevel.dbamp,taillevel.dbamp,roomsize+1,0.3)+a)
}).add;

	"reverb init".postln;

	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,1) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;

	SynthDef(\compS, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;

	SynthDef(\compSX, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1,tS=1,dur|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain * EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;



		SynthDef(\EQ, {|out=0, in, val, quant, gain| Out.ar(out, BPeakEQ.ar(
		In.ar(in, 1),val,quant, gain))};).add;


	SynthDef(\EQ2, {|out=0, in, val, quant, gain| Out.ar(out, BPeakEQ.ar(
		In.ar(in, 2),val,quant, gain))};).add;



	SynthDef(\EQHP2, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,shelf, gain3| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BHiShelf.ar(
		BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),val3,shelf, gain3),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


		SynthDef(\EQHP2Dyna, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,valD,quantD,ctrl| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(
			BPeakEQ.ar(
		BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2)
,valD,quantD, Amplitude.ar(In.ar(ctrl,10)).range(-2,-18)/*.poll*/),
		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


SynthDef(\EQHP96, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant4, gain4| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(	BPeakEQ.ar(	BHiShelf.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,shelf, gain3),val4,quant4, gain4),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


	SynthDef(\EQHP, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,quant3,gain3, gain4,val4,shelf| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BHiShelf.ar(BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(Mix.ar(In.ar(in, 1)),val,quant, gain),val2,quant2, gain2)
,val3,quant3, gain3),val4,shelf, gain4)
			,frq),frq),frq),frq),frq),frq)* vol)};).add;


SynthDef(\EQHP10, {|out=0, in, val, quant, gain, val2, quant2, gain2 frq=100, vol =1| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BPeakEQ.ar(BPeakEQ.ar(In.ar(in, 10),val2,quant2, gain2)    ,val,quant, gain)   ,frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;

	"compression init".postln;

	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(In.ar(in,1),thr, sB ,sA, atk, rel)* gain;)
	}).add;


	SynthDef(\limiterS, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar( In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;


	// Out.ar(0,RMS.ar(sig).ampdb.round(0.1).poll(label:"bass db :")* [0,0,1])

	SynthDef(\limiterStoMixer, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05,
		c1=0,c2=0,c3=0,c4=0,c5=0,c6 =0,c7 =0,c8 =0,c9 =0,c10 =0,c11 =0,c12 =0,c13 =0,c14 =0,c15 =0,c16=0,c17=0,c18=0,c19=0,c20 =0,c21=0,c22=0,c23=0,c24=0,c25=0,c26=0,name,c27=0,c28=0,c29=0,c30=0,c31=0,c32=0,c33=0,c34=0,c35=0,c36=0,c37=0,c38=0,c39=0,c40=0,
		c41=0,c42=0,c43=0,c44=0,c45=0,c46=0,c47=0,c48=0,c49=0,c50=0,c51=0,c52=0,c53=0,c54=0,c55=0,c56=0,c57=0,c58=0,c59=0,c60=0|

		Out.ar(out , CompanderD.ar( In.ar(in,2),thr, sB ,sA, atk, rel)* gain;);

		Out.ar( 0,  CompanderD.ar( In.ar(in,2),thr, sB ,sA, atk, rel)* gain * [0,0,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,c42,c43,c44,c45,c46,c47,c48,c49,c50,c51,c52,c53,c54,c55,c56,c57,c58,c59,c60]);


	/*	Out.ar(0,RMS.ar(CompanderD.ar( In.ar(in,2),thr, sB ,sA, atk, rel)* gain ).ampdb.round(0.1).poll(label:name.poll)* [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]);*/
	}).add;

	SynthDef(\limiterToMixer, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05,
		c1=0,c2=0,c3=0,c4=0,c5=0,c6 =0,c7 =0,c8 =0,c9 =0,c10 =0,c11 =0,c12 =0,c13 =0,c14 =0,c15 =0,c16=0,c17=0,c18=0,c19=0,c20 =0,c21=0,c22=0,c23=0,c24=0,c25=0,c26=0,name|

		Out.ar(out , CompanderD.ar( In.ar(in,1),thr, sB ,sA, atk, rel)* gain;);

		Out.ar( 0,  CompanderD.ar( In.ar(in,1),thr, sB ,sA, atk, rel)* gain * [0,0,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26]);

	}).add;



	SynthDef(\limiter10toMixer, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05,
		c1=0,c2=0,c3=0,c4=0,c5=0,c6 =0,c7 =0,c8 =0,c9 =0,c10 =0,c11 =0,c12 =0,c13 =0,c14 =0,c15 =0, c16=0,c17=0,c18=0,c19=0,c20 =0,c21=0,name|

		Out.ar(out , CompanderD.ar( In.ar(in,10),thr, sB ,sA, atk, rel)* gain;);

		Out.ar( 0,  CompanderD.ar( In.ar(in,10),thr, sB ,sA, atk, rel)* gain * [0,0,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21]);

		/*Out.ar(0,RMS.ar(CompanderD.ar( In.ar(in,10),thr, sB ,sA, atk, rel)* gain ).ampdb.round(0.1).poll(label:name.poll)* [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]);*/
	}).add;


	SynthDef(\playBuf10NToMixer ,{|out = 0,start, trig= 0.002, dur, buf, dA=2, tS=1, loopy=1,vl=1,in,c1=0,c2=0,c3=0,c4=0,c5=0,c6 =0,c7 =0,c8 =0,c9 =0,c10 =0,c11 =0,c12 =0,c13 =0,c14 =0,c15 =0,c16=0,c17=0,c18=0,c19=0,c20 =0,c21=0 ,name|

		Out.ar(~fusible,PlayBuf.ar(10,buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));

	Out.ar(out,In.ar( in, 10));


	Out.ar(0,PlayBuf.ar(10,buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: loopy/*,doneAction: dA*/)* [0,0,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21]* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale: tS,doneAction: 2));

/*	Out.ar(0,RMS.ar(In.ar( in, 10)).ampdb.round(0.1).poll(label:name.poll )* [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]);*/
	}).add;


	SynthDef(\limiter10, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar( In.ar(in,10),thr, sB ,sA, atk, rel)* gain;)
	}).add;


	"limiter init".postln;



	SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				{ In.ar(in, 1)}
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoW,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(2,
				{ In.ar(in, 2)}
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoS,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				{Mix.ar(In.ar(in, 2))}
				,spread,level,center/*+ In.kr(modPan)*/)
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoX,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				{	Mix.ar(In.ar(in, 2))}
				,spread,level,center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoX1,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				In.ar(in, 1)
				,spread,level,center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;




	SynthDef(\stereoS2,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
					{	Mix.ar(In.ar(in, 2))}
				,spread,level, center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\brokenStereo,{|out=0, in, bus1, bus2,tS,dur,spread=1, center=0|

		Out.ar(out,
			Splay.arFill(10,
					{	Mix.ar(In.ar(in, 2))}
				,spread,1, [center+ In.kr(bus1),  center+ In.kr(bus2)]       )
			* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)
			//,doneAction: 2)
		);
	}).add;



	SynthDef(\comp10, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain/** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2)*/)}).add;




	SynthDef(\sinModul,{|modu, busMod,hS=2200,lS=(-40),dur,tS=1,out,ph=0|Out.kr(out, SinOsc.kr(modu+ In.kr(busMod),ph).range(lS,hS)
		* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

SynthDef(\ranModul,{|modu, busMod,lS=0, hS=4200,dur,tS=1,out|Out.kr(out,LFDNoise0.kr(modu+ In.kr(busMod)).range(lS,hS)
			* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	SynthDef(\triModul,{|modu, busMod,hS=1200,lS=(-40),dur,tS=1,out|Out.kr(out, LFTri.kr(modu+ In.kr(busMod)).range(lS,hS)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	//SAFETY VERSION WITH NO BUSSES
SynthDef(\sinModulC,{|modu, busMod,hS=2200,lS=(-40),dur,tS=1,out|Out.kr(out, SinOsc.kr(modu).range(lS,hS)
		* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

SynthDef(\ranModulC,{|modu, busMod,lS=0, hS=4200,dur,tS=1,out|Out.kr(out,LFDNoise0.kr(modu).range(lS,hS)
			* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	SynthDef(\triModulC,{|modu, busMod,hS=1200,lS=(-40),dur,tS=1,out|Out.kr(out, LFTri.kr(modu).range(lS,hS)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;



	SynthDef(\squaModul,{|modu, busMod,wdth=0.5,hS=1200,lS=0|Out.kr(busMod,Pulse.kr(modu,wdth).range(lS,hS) )}).add;
SynthDef(\sawModul,{|modu, busMod,hS|Out.kr(busMod, Saw.kr(modu).range(-40,hS))}).add;

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

		car =SinOsc.ar( [0.00502929687, 0.00502929687+20, 0.00502929687 +50]+ cRatio + (In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+

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

	SynthDef(\fmX, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=0,  amp=1.5, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 ,factorx=0, factorx2 =0,factorxx=0, factorxx2 =0  /*,vlPE =27.1366666667,vlPE2=0.2,dcPE = 0.129066666667*/, rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50/*, crvEP = (-2)*/,gate=1,pan=0, modu,modu2, multi=0, multi2=0,modux=0,moduxx=0,fmCtrl=1;

	var car, mod, mod2, iEnv, sig, filRte,env;

		env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (/*decE*/ dur/*30000*/   ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar(freq/10+ (In.kr(moduxx,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorxx ))+(In.kr(~seqBus,1)* factorxx2), mul:freq/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		// mod = SinOsc.ar(MouseX.kr(0,freq * mRatio + mod2), mul:freq * mRatio * iEnv);

		mod = SinOsc.ar( [MouseX.kr( freq * mRatio + mod2 ),
	 MouseX.kr( freq * mRatio + mod2 )-30,
		MouseX.kr( freq * mRatio + mod2 )+50 ]

		/*	SinOsc.kr(In.kr(~bus2, 1),In.kr(~bus3, 1)).range([In.kr(~bus11, 1)]), mul:*/

			 * SinOsc.kr(sineRate,phRise).range([sineRangeLow])+ (In.kr(modux,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorx ))/*+(In.kr(~seqBusx,1)* factorx2)*/, mul:

			/*(*/     /* [ */ MouseY.kr(freq/2,  freq * mRatio *iEnv) /*In.kr( gra, 1) */
		/*	,MouseY.kr(164.815,  659.26 * mRatio *iEnv)* multi2
			,MouseY.kr(164.815,  659.26 * mRatio *iEnv)* multi2  ]*/


			/*) *   In.kr( gra, 1)*/

		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar(/* ( +*/

			(In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+

			//remove this line as shwon to decrease sound quality so I left it / HERE CHNAGE THE SOUND
			/*SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),mod])*/
		SelectX.ar(fmCtrl   /*SinOsc.kr((0.00502929687/2/2),phFm).range(0,1)*/,[In.ar(~phaseBus,1)/*SinOsc.ar(0)*/,mod])           /*    +*/
			/*[0.00502929687, 0.00502929687-30, 0.00502929687 +50]*/


			/*freq*/
			/*)*/ +( freq * cRatio )+ 0.00502929687

			//pitch envelope
			/*+  (EnvGen.kr(Env([vlPE,vlPE2],[dcPE,0],crvEP))*factor2)*/
			//extra pitch modulation
			/*+ pitch +  (In.kr(bus4, 1)/factor)  */         ,mul: [1,
			multi
			,multi  ]   );


	/*	car2 =SinOsc.ar((In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+
		SelectX.ar(fmCtrl   ,[In.ar(~phaseBus,1)/*SinOsc.ar(0)*/,mod])            +( freq2 * cRatio )+ 0.00502929687
    ,mul: 1   );

		car3 =SinOsc.ar((In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2)+
		SelectX.ar(fmCtrl   ,[In.ar(~phaseBus,1)/*SinOsc.ar(0)*/,mod])            +( freq3 * cRatio )+ 0.00502929687
    ,mul: 1   );*/

	//transform signal through the shaper

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	// sig = Splay.arFill(2,sig,spread: 0);
	Out.ar(out, sig /* !2*/   * amp     *env/** EnvGen.kr(Env.adsr(0.1), gate)*/);
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


		/*mod = SinOsc.ar( freq2  /*In.kr(~bus.postln,1) */   * mRatio + (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2),/*mod2.wrap(0, 16pi),*/ mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);*/

		mod = SinOsc.ar( freq2  * mRatio , mul: iEnv* index3);

		car = Saw.ar( /* MouseX.kr(0.3,*/[659.26/4, 659.26/4+20, 659.26/4 -40]/*)*/

		/*+ LFNoise0.kr(10.3).range(-40,1200) */ * cRatio
			+ (In.kr(modu,1)*EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(~seqBus,1)* factor2),
		mod.wrap(0, 4pi)*[1,multi
			,multi


		]

		) * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig * env);
}).add;


SynthDef(\filterModu,{|out=0, in, filMod=600,filMod2=500,qf=0.5,qf2=0.5,  which=0, filFreq2 =0, filFreq =0|

		var lp,hp, sig;

		sig = In.ar(in,1);

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


		/*Out.kr(~seqBusx,EnvGen.kr(Env.step([value],[dur]),doneAction: 2));*/
	Out.kr(out,EnvGen.kr(Env.step([value],[dur]),doneAction: 2)   ) }).add;



	SynthDef(\pan2,{|out=0,in|Out.ar(out, Pan2.ar(In.ar(in)))}).add;

	SynthDef(\filterU, {|out=0,in,  hFrq=900,lFrq=300 ,qfH = 0.822379, qlL = 0.504212|Out.ar(out, BLowPass4.ar(   BHiPass4.ar(  In.ar(in,1) , hFrq , qfH), lFrq
		/*MouseX.kr(20,22000)*/,qlL )) }).add;

	SynthDef(\filterU, {|out=0,in,  hFrq=900, hFrq2=900,lFrq=300,lFrq2=300 ,qfH = 0.822379, qfH2=0.6,qlL = 0.504212,qlL2=0.4|Out.ar(out,

	/*BLowPass4.ar(   BLowPass4.ar( */BLowPass.ar(
			BHiPass4.ar(  BHiPass4.ar(
				In.ar(in,1)
				, hFrq2 , qfH) 	, hFrq , qfH2)
/*	, lFrq,qlL ) */,lFrq2 ,qlL2 )

	) }).add;



	SynthDef(\recLoop){|buf=0,out=0,recording = 1,in = (~toRecord)|
		var input =  Mix.ar(In.ar(in,1));
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
		/*Out.ar(0,HPF.ar(input,100));*/
		Out.ar(0,BHiPass4.ar(play),100);
		/*Out.ar(0,play);*/
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

	var play = LoopBuf.ar(2,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);
		/*Out.ar(0,HPF.ar(input,100));*/
		//Out.ar(0,BHiPass4.ar(play),100);
		Out.ar(0,play);
}.add;


		SynthDef(\recLoop10){|buf=0,in=0,out=0,recording = 1|
	var input = In.ar(in/*~toRecord2*/,10);
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

	var play = LoopBuf.ar(10,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);
		Out.ar(0,HPF.ar(input,100));
	Out.ar(~dead10,play);
}.add;

		SynthDef(\recLoop102){|buf=0,in=0,out=0,recording = 1|
	var input = In.ar(in/*~toRecord2*/,10);
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

	var play = LoopBuf.ar(10,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);

}.add;




	SynthDef(\flanger, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0;

		var input, effect;

		input=In.ar(in,2);

		input= input+ LocalIn.ar(2);

		effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq,0,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);

		//LocalOut.ar(fdback*BPF.ar(effect,MouseX.kr(1000,10000),0.1)); //alternative with filter in the feedback loop

		Out.ar(out,effect /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).add;

	SynthDef(\lim,{|out=0,ml=0.1|Out.ar(out,Balance.ar(In.ar(~outTolimit),SinOsc.ar(mul: ml)))}).add;

	SynthDef(\lim2,{|out=0,ml=0.2,in|Out.ar(out,Balance.ar(In.ar(in,2),SinOsc.ar(mul: ml)))}).add;

	SynthDef(\lim10,{|out=0,ml=0.2,in|Out.ar(out,Balance.ar(In.ar(in,10),SinOsc.ar(mul: ml)))}).add;

s.sync;

//130.882809922
//8100

/*Pbindef(\ki,   \out, 0) ;Pbindef(\bass, \out, 0) ;
	Pbindef(\ki,   \out, 700) ;Pbindef(\bass, \out, 700);*/
	~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/1],1),\amp,(-3/*-10.2*/),\out,0/*~main1GToG*/);//-3.5 - 10.5

	~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],1),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374);
//Problem overlapping
	/*~bass = Pbindef(\bass,
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),

		\cho, Pseq([0.00378125*4,0.001890625*4,0,0],inf),
		\dur, Pseq([1/4],4),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.05,
		\rel, t.beatDur/4 * 0.98,
		\rel2, t.beatDur/4 * 0.012,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4,
		\amp,(-14.6)/*(-13)*/,\out,~bassEq
	);*/


	/*~bass = Pbindef(\bass,
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([1/4],4),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.98,
		\rel2, t.beatDur/4 * 0.0012,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4
		,\amp,(-12.6)/*(-13)*/,\out,~bassEq
	);*/


	~bassZ = Pbind(\instrument, \bass,
	// \type, Pseq([\note, \note, \note, \note], inf),
	// \cho, Pseq([0,0.00378125*4,0.001890625*4,0],inf),
		\dur, Pseq([4/1],1),\lpf,100,
		\midinote, 28, \bus, ~bassShapB,
		\atk, 0/*t.beatDur/4 * 0.01*/,
		\rel, t.beatDur*4 * 0.996,/*\rel, t.beatDur/4 * 0.98,*/
		\rel2, t.beatDur/4 * 0.0012,
		\atkcrv, -2,
		\relcrv, -2,\relcrv2, -4, \relcrv3, -6
		,\amp,(-1.5/*-1*/)/*(-13)*/,\out,~bassEq
	);

	~hat2 =Pbind(\instrument, \percussion,\rel,0.04840,\rel2,0.02420,\amp, (-28.2), \crv1, (-4), \crv1b, (-5), \modHz, exprand(500,10000), \mulMod, rrand(100, 500), \carHz, exprand(20,10000), \modAmp, 0.82875.rrand(0.4),\dur,Pseq([1/1],1) ,\out, ~kickHatEq);

	//HARD WIRED
	/*~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble,inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224,\modHz,1899.3343179398,\modAmp, 0.12875 ,\amp,(-17.5),\rel,Pseq([1/16],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-4.4), \crv1b,(-4), \mulMod, 1691,\out, ~comBusCymb);*/

/*	~cymbal = Pbind(\instrument, \percussion,\type, Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble,inf),\dur,Pseq([1/4],64 ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, ~cymbalEq);



~hat = Pbind(\instrument,\percussion,\dur,Pseq([1/4], 64),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -16.7),( -16.5),( -16.2),( -16.2),( -15.9),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~hatEq);


	//MUST BE RNDMED
	~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\da1,2);*/


	~bell = Pbind(\instrument, \percussion, \dur,Pseq([4/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)}));

	~noise = Pbind(\instrument, \wNoise,\dur, Pseq([4/1],1),\dec ,Pkey(\dur),\amp,(2),\out,~filterNoise);


	//SO WRONG NO VOL ctrl at all
	~hit = Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,~bufSnoopy,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}));


	//MAYBE ?
	~hit2= Pbind(\instrument, \percussion,\dur,Pseq([1/4],1 ),\carHz,Pfunc({ 525.12070612224.rrand(0.01)}),\modHz,Pfunc({ 11899.3343179398.rrand(0.001)}),\modAmp,Pfunc({  0.12875.rrand(0.000001)}) ,\amp,(-17.5),\rel,Pseq([1/1],inf),\rel2,Pseq([1/4],inf),\latch,8000,\stereoL, 0.00555, \crv1, Pfunc({  (-14.4).rrand(-1)}), \crv1b,(-4), \mulMod, 1691,\out, 0);


~bassRest = Pbindf(~bass,  \type,Pseq([\rest],inf));

~kbassRest =Ppar([~kick, ~bassRest], 1);


/*~bar = [Ppar([~kick,~hat2,~bass],1),Ppar([~kick,~hat2,~bass],4),Ppar([~kick,~hat2,~bass],8),Ppar([~kick,~hat2,~bass],12),Ppar([~kick,~hat2,~bass],14) ,Ppar([~kick,~hat2,~bass],15) ,Ppar([~kick,~hat2,~bass],16)];

	~bar = [Pbindef( \kbRec, \dur,  Pseq([1/1],1)),Pbindef( \kbRec, \dur,  Pseq([1/1],4)),Pbindef( \kbRec, \dur,  Pseq([1/1],8)),Pbindef( \kbRec, \dur,  Pseq([1/1],12)),Pbindef( \kbRec, \dur,  Pseq([1/1],14)),Pbindef( \kbRec, \dur,  Pseq([1/1],15)),Pbindef( \kbRec, \dur,  Pseq([1/1],16)),
		Pbindef( \kbRec, \dur,  Pseq([3/1],1))
	];

	~bar = [Pbindf(~daKb,  \dur,  Pseq([1/1],1)),Pbindf(~daKb,  \dur,  Pseq([1/1],4)),Pbindf(~daKb,  \dur,  Pseq([1/1],8)),Pbindf(~daKb,  \dur,  Pseq([1/1],12)),Pbindf(~daKb, \dur,  Pseq([1/1],14)),Pbindf(~daKb,  \dur,  Pseq([1/1],15)),Pbindf(~daKb, \dur,  Pseq([1/1],16)),
		Pbindf(~daKb,  \dur,  Pseq([3/1],1))
	];


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


	Ppar([~bar[6],~hat,~cymbal/*,~snare*/],1),


		Ppar([~bar[7],Pbindf(~cymbal, \dur,Pseq([1/4],12)),
		Pbindf(~hat, \dur,Pseq([1/4],12)),
		Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2))],1),



];*/


	//OFF RN

	// Ppar([Pseq([~bass],inf),Pbindf(~snare,\da1,0)],1);//JEEEZ
~bassMel=[	Pbindf(~bass,\freq, Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -4)),
		Pbindf(~bass,\freq, Scale.minor(\just).degreeToFreq(7.rand, 76.midicps, -4))];


/*~riseSet = Pxrand([

		Ppar([

	Prand([

				Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf,/*Prand([*/ ~buf/*,~buf2],inf)*/,\out,~noiseStereo2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos,0.90000.rand),

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-20),\out,~eqNoise,\tS, 0.39550810372374,),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf,/*Prand([ */~bufSnoopy/*,~bufSnoopy2],inf)*/,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}))],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  )
		],1),




				Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riEq),


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riDisto,\tS, 0.39550810372374),



],2);*/

	s.sync;

//mixing from here
	/*~bang = /*Pseq([*/
Pbind( \instrument, \playBuf10, \impulse, 10 ,
		\dur,   Pseq([1/2],4) , \tS,  0.39550810372374,\start,~bangVar,\buf,~leTout,\out, ~again,\loopy,0,\vl,0.25);/*],4);*/*/







~eqGrp=Group.new;
~stereoGrp=Group.after(~eqGrp);
~recGrp2=Group.after(~stereoGrp);
s.sync;

Ppar([

	/*	~bassShap,~bassZ  ,

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,~main1GToG,\group, ~eqGrp, \val, 659.255/2, \quant,1, \gain ,(-30)),
*/

Pbind(\instrument, \snare,\carHz, 41.2 ,\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.7744,\dur, Pseq([1/2], 1),\amp,1, \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),  \da1,0    ),


	Pbind(\instrument, \percussion ,\dur,Pseq([1/4],1 ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,1,\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out,   ~comBusCymb).play(t),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], 1),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,1, \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,~comBusHat),



Pbind(\instrument,\recLoopS,\buf,~cymb,\recording,1, \in,~comBusCymb,\group,~recGrp2,\dur,inf),
Pbind(\instrument,\recLoopS,\buf,~hat,\recording,1, \in,~comBusHat,\group,~recGrp2,\dur,inf),
Pbind(\instrument,\recLoop,\buf,~snare,\recording,1, \in,~snareEQ,\group,~recGrp2,\dur,inf),
/*Pbind(\instrument,\recLoop,\buf,~k2,\recording,1, \in,~main1GToG,\group,~recGrp2,\dur,inf),
		Pbind(\instrument,\recLoop,\buf,~b3,\recording,1, \in,~bgFil,\group,~recGrp2,\dur,inf),*/
],1).play(t);



});



)

(
~eqGrp=Group.new;
~stereoGrp=Group.after(~eqGrp);
~recGrp2=Group.after(~stereoGrp);
)

(
Ppar([~hat2,~kick,Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255/2, \quant,1, \gain ,(-30)),
	Pbind(\instrument,\recLoop,\buf,~k2,\recording,1, \in,0,\group,~recGrp2,\dur,inf)
],1).play(t) ;
)

~kick.play
~k2.plot
~b3.play
~hat.plot

(//BASS ALONE
Ppar([

	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~eqGrp, \val, 659.255, \quant,1, \gain ,(-30)),




	~bassShap,           Ppar([/*~hat2,~kick,*/~bassZ],1),

	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~eqGrp, \frq, 20.6,\vol,1),

	Pbind(\instrument,\recLoop,\buf,~b3,\recording,1, \in,0,\group,~recGrp2,\dur,inf)

],1).play(t);

)

~b3.plot
~k2.play
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~k2,\out, 0,\loopy,0,\start,0,\tS, 0.39550810372374).play(t)
Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out, 0,\loopy,0,\start,0,\tS, 0.39550810372374).play(t)

~kb2.plot


(
Ppar([

	Pbind(\instrument,\recLoopS,\buf,~kb2,\recording,1, \in,0,\group,~recGrp2,\dur,inf),
Pseq([
	Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/2],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374),

		/*Pbindf(~kick ,\dur,    Pseq([1/2],1),\out,~kbToPan2),*/
		Pbind(\instrument, \wNoise,\dur,Pseq([1/2],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  )],inf),

Pseq([Pbind(\instrument, \wNoise,\dur,Pseq([1/4],1),\dec ,Pkey(\dur),\amp,(-12),\tS, 0.39550810372374,\type, \rest  ),
		Pbind( \instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/4],3), \tS,  0.39550810372374,\buf,~b3,\out, ~kbToPan2,\loopy,0,\start,0,  \decT,0.90,\subsT ,Pseq([0,0.01,0.02],inf))],inf),
Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~stereoGrp,\dur, inf),






],1).play(t);



)

({SinOsc.ar}.play)



~daKb =Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2);

~daKb.play(t)

s.latency=0.2

~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");

~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-02.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");

