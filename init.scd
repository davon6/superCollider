//Ajouter un push dans le 4x4 et enfin faire onduler le tout
//PERcu snare with oner sample qui s etent go back to mummy


//find a way reverb or ... to extend clap or make new snary, noisy

//maybe bim, boom bum bum bim bing


//The Bone Collector (Original Motion Picture Soundtrack)
//utilise the glitchy beep to make nano breaks
//ainsi que le zip one
//more lead delayed
//plus  d'envelopement in and out of the zone
//scandelaous stabs
//trompettte papa

//long slide grimacant actif
//reverbpercu loof puis reverse

DONT FORGET 16 BIT DISTO !!!!!

ACHETER UN METRE A PAPA

popping fire work sqelch

(
Server.default.options.numWireBufs = 1024;

// s.options.memSize = 2097152 ;
// Server.default.options.numOutputBusChannels = 60;
Server.default.options.sampleRate =  48000;
// Server.default.options.outDevice_("Audient iD14");
// Server.default.options.outDevice_("CABLE Input (VB-Audio Virtual C");
// s.options.numAudioBusChannels=3000;

Server.default.options.outDevice_("MacBook Air Speakers");

// Server.default.options.inDevice_("MacBook Air Microphone");
// Server.default.options.inDevice_("Audient iD14");
// Server.default.options.inDevice_("Scarlett 4i4 USB");
Server.default.options.inDevice_("BlackHole 2ch");


/*Server.default.options.inDevice_("MME : Microsoft Sound Mapper - Input");
	Server.default.options.outDevice_("CABLE Input (VB-Audio Virtual C");*/
)

Server.default.options.outDevice_("External Headphones");
Server.default.options.outDevice_("BlackHole 2ch","Built-in Output");

ServerOptions.outDevices

DiskOut

RecordBuf

s.options.numOutputBusChannels = 10

ServerOptions.inDevices


Server.default.options.inDevice_("MME : Microsoft Sound Mapper - Input");
	Server.default.options.outDevice_("CABLE Input (VB-Audio Virtual C");

Server.default.options.outDevice_("MacBook Air Speakers");

Server.default.options.outDevice_("30108121");
ServerOptions.inDevices;
ServerOptions.outDevices;
/*({SinOsc.ar}.play)*/

(
 s.waitForBoot({

	var numSegs;

	~bpm = 150;
	~hz1beat = ~bpm * 16/60/32;

	~count=0;

	FreqScope.new;
	s.meter;
	s.plotTree;
	s.scope;

	s.sync;
	"buff init".postln;

// tempo wanted

	t = TempoClock.new(~bpm/60).permanent_(true);

	//necessary for the buffer of the shaper to work
	// ~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);


	~tf = Env([~val=1.00.rand,0,~val.neg],[1,1],[~val2=12.rand,~val2.neg]).asSignal(1025);


	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);

	s.sync;

	//this section initialize the shaper
	"no of seg".postln;
	numSegs= rrand(1,2).postln;


	/*~tf = Env(
		(({rrand(0.0,0.01).postln}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20).postln}!numSegs,
		{rrand(-20,20).postln}!numSegs
	).asSignal(1025);*/


		~tf = Env(
		(({rrand(0.0,0.01).postln}!(numSegs+1)) * [1,-1]).scramble,
	/*	{exprand(1,5).postln}!numSegs,
		{rrand(-5,5).postln}!numSegs*/
	).asSignal(1025);



	~tf = ~tf + (
		Signal.sineFill(
			1025,
			[1,/* 1/4, 1/6,*/ 1/2],
			{rrand(0,1pi)}!16
		) /*/ 4*/
	);

	// ~tf.plot
	~tf = ~tf.normalize;
	~tfBuf.loadCollection(~tf.asWavetableNoWrap);
	~b = Buffer.alloc(s, 2048);
	~sig = Signal.newClear(1024);

	"Shaper init".postln;

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
	// ~k2 = Buffer.alloc(s, s.sampleRate *1,1);

	~b3 = Buffer.alloc(s, s.sampleRate *5,1);
	~b4= Buffer.alloc(s, s.sampleRate *5,1);
	~b5= Buffer.alloc(s, s.sampleRate *5,1);

	~e = Buffer.alloc(s, s.sampleRate *   t.beatDur*4 ,1);
	~f = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);
	~e2 = Buffer.alloc(s, s.sampleRate *   t.beatDur*4,1);
	~f2 = Buffer.alloc(s, s.sampleRate *  t.beatDur*4);
	~delay = Buffer.alloc(s, 48000 * 3, 2);
	~delayX = Buffer.alloc(s, 48000 * 3, 2);
	~delay2 = Buffer.alloc(s, 48000 * 3, 2);
	~delay3 = Buffer.alloc(s, 48000 * 3, 2);
	~delay6= Buffer.alloc(s, 48000 * 3, 2);
	b = Buffer.alloc(s, 44100 * 2, 2);
	~b2 = Buffer.alloc(s,48000,1);
		~b3 = Buffer.alloc(s,48000,1);
	~bufBg = Buffer.alloc(s,s.sampleRate*60,10 );
	~temp= Buffer.alloc(s,s.sampleRate*2,1);

	s.sync;

	~fPo = { |x, y| sin(x) - (sin(y) * log(x * x + 1)) / 10 };



	~church =	Pbind(\instrument,\reverb, \dur,inf,\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -11 );

	~churcx =[\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -2 ];

	~rLong =	[\roomsize, 41, \revtime, Pseq([1/1],inf), \damping, 0.31, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -9];


	~quickFi =[\room, 0.2, \mix,0.115, \damp, 0.41];
	~rShor = [\room, 0.25, \mix,0.3, \damp, 0.1];
	~rLon =	[\room, 0.5, \mix,0.3, \damp, 0.2];
	~mChu = [\room, 0.8, \mix,0.5, \damp, 0.7];


	~revRnd = [~quickFi,~rShor,~rLon];


	~record1=Bus.audio(s,1);~record2=Bus.audio(s,1);~record3=Bus.audio(s,1);~record4=Bus.audio(s,1);
	~record5=Bus.audio(s,1);~record6=Bus.audio(s,1);


		~record1S=Bus.audio(s,2);~record2S=Bus.audio(s,2);~record3S=Bus.audio(s,2);



~bassFi=Bus.audio(s,1);~kbus=Bus.audio(s,1);~limitKick=Bus.audio(s,1);~limitBass=Bus.audio(s,1); ~comFuzz=Bus.audio(s,1); ~kToPan=Bus.audio(s,1);













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


	~bassShapB = Bus.control(s,1);

	~mixM= Bus.control(s,1);
	~roomM= Bus.control(s,1);
	~dampM= Bus.control(s,1);

	~mod1= Bus.control(s,1);
	~mod2= Bus.control(s,1);
	~mod3= Bus.control(s,1);
	~mod4= Bus.control(s,1);
	~mod5= Bus.control(s,1);
	~seqBus= Bus.control(s,1);

	s.sync;






	SynthDef(\playBufMod ,{|out = 0,start=0, trig= 0.002, dur, buf, dA=2,rte=1 ,  loopy=1,	decT=1, subsT=0 ,modP |Out.ar(out,PlayBuf.ar(1,buf,
		rte+ In.kr(modP) ,
		trig, start, loopy)*
	EnvGen.kr(Env([0,1,1,1,0],[0,dur*decT,dur* subsT]),timeScale:  t.beatDur,doneAction: 2)

	);}).add;



	SynthDef(\playBufXs ,{|out = 0,start, trig, dur, amp=1,buf, dA=0, loo=1,impulse=0.001|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse),startPos: start,loop:loo,doneAction: dA)*amp);}).add;

	SynthDef(\playBufXsS ,{|out = 0,start, trig, dur, amp=1,buf, dA=0, loo=1,impulse=0.001|Out.ar(out,PlayBuf.ar(2,buf,trigger:
		Impulse.kr(impulse),startPos: start,loop:loo,doneAction: dA)*amp);}).add;





	SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(1,buf,rte,trigger:impulse,startPos: start,loop:loo,doneAction: dA)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT-(dur*gateSub),dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;




	SynthDef(\playBufS ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,buf,/*rte*/MouseY.kr(0.01,6),trigger:impulse,startPos: start,loop:loo,doneAction: dA)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT-(dur*gateSub),dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2)/** amp*/

	);}).add;




	SynthDef(\playBufXG2 ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale:  t.beatDur, doneAction:2)

	);}).add;


	SynthDef(\playBufXGMod ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0, impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,busMod|Out.ar(out,PlayBuf.ar(1,buf,rte+ In.kr(busMod),trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale:  t.beatDur, doneAction:2)

	);}).add;







	SynthDef(\playBufX2 ,{|out = 0,start=0, trig, dur, amp=1,buf, dA=2, loo=0, impulse=0.001,vl=1|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2)*
	EnvGen.kr(Env([0,vl,vl,0],[0,dur,0]),timeScale:  t.beatDur,doneAction: 2));
	}).add;




	SynthDef(\playBuf2 ,{|out = 0,start=0, trig=0.002, dur, buf, dA=2|Out.ar(out,PlayBuf.ar(2, buf,trigger:
		trig/*Dust.kr(4.0)*/,startPos: start,loop: 1/*,doneAction: dA*/)/** EnvGen.kr(Env([0,1,1,0],[0,dur,0]))*/);}).add;


	SynthDef(\shap,{|in, out, vl1=(-3000), vl2=0,vl3=0, dA1 =0,crv=6|
	var halfBeat, shap;



		shap = EnvGen.kr(Env([vl1,vl2],[0.5,0.5],crv),timeScale:  t.beatDur,doneAction:dA1);

	Out.kr(out, shap);

	}).add;

	SynthDef(\ampO,{|out=0,in|Out.kr(out,Amplitude.kr(In.ar(in)).linlin(0,0.0304096,1,0))}).add;



	SynthDef(\lfo13, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,SinOsc.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

	SynthDef(\lfo13T, {|out, dur,ph, val = (~hzQbeat), rL=1,rH=0.4 | Out.kr(out,LFTri.ar(val,ph).range(rL,rH)
*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;



	SynthDef(\lfoSaw, {|out, val, dur, ph =0,gte=(-4)|Out.kr(out,

		Saw.ar(/*MouseY.kr(0.24,20.6)*/SinOsc.ar(0.0025,ph).range(0.24,20.6)

			,-1,-0.4).range(-1,0).lincurve(-1,2,5,-3,gte)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2)
	)}).add;

	SynthDef(\lfoPulse, {|out, val, dur,ph =0,gte=(-4),frq=1,wdth=0.5|Out.kr(out,

		LFPulse.kr(/*frq*/
			LFNoise0.kr(1.2875).range(0.0001,20.6)

			/*MouseY.kr(0.001,32) */ ,width:In.kr(wdth,1)/*MouseX.kr(0.4,1).poll */)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2)
	)}).add;


	SynthDef(\lfoStep, {|out, val, dur|Out.kr(out,
		EnvGen.kr(Env.step([val],[dur]),timeScale: t.beatDur,doneAction: 2)
	)}).add;




	SynthDef(\lfoSin, {|out, val, dur,ph =0,gte=(-4),frq=1,wdth=0.5|Out.kr(out,

	Osc.ar(~b.bufnum, LFNoise0.kr(1.2875/4).range(0.08046875,1.2875) ).range(0.7,1)

		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2)
	)}).add;



	SynthDef(\envSli, {|fc1=0.95,fc2=0.05  out, val1=20, val2=20000,  dur, crv =7|Out.kr(out,
	EnvGen.kr(Env([val1,val2],[dur*fc1,dur*fc2],crv ),timeScale:  t.beatDur,doneAction: 2)
	)}).add;



	SynthDef(\lfo2, {|out, val=1, dur,tS=1|Out.kr(out,

		LFNoise1.kr(~hz1beat).range(0.10,0.0)/*,0.02)*/
		+SinOsc.kr(SelectX.kr(LFNoise0.kr(~hz1beat*4).range(0,1).round(1),[~hz1beat,~hz1beat*4,~hz1beat*16])).range(0.06,0.00)

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	SynthDef(\lfo,{|out, vl1, vl2, dur, tim = 0.0484, crv =(-12)|
		Out.kr(out,VarLag.kr( Line.kr(vl1, vl2, dur, doneAction: 2),tim,crv));}).add;

	SynthDef(\lfo3,{|out,tS=1| Out.kr(out ,EnvGen.kr(Env([143,0],[0.4,0],-30),timeScale: tS,doneAction: 2))}).add;




	SynthDef(\kick, {
	arg amp=40,out=0;
	var sig, env, envF;

	envF = EnvGen.ar(
		Env(
				[109.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.0125,t.beatDur/64,t.beatDur*0.7,0],
			[-8,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 1.360 , 0.155,   0.4 ,  1,0.14,0],
			[ 0.012 , 0.005,   0.06  , t.beatDur*0.455 , t.beatDur*0.3  ],[-1.66,-5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero

	sig = SinOsc.ar(envF, mul: env);

	sig = sig * 50 ;
	// sig = Pan2.ar(sig);
	Out.ar(out, sig);

}).add;





		SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.8, lpf=100, out = 0, bus, dur,cho=0,rel2,relcrv2,envF,relcrv3,vlDec=0.6,vlDecF=0,vlDecFx=1080, vlDecFx2=0;

		var sig, env, lvlBa;

		env = EnvGen.kr(
			Env(
				[1,0],
			[t.beatDur,0],
				[atkcrv,0]
			)
			,doneAction:2
		);

		envF = EnvGen.kr(
			Env(
				[vlDecFx,vlDecFx2],
				[rel],
				[atkcrv,relcrv2]
			)
			,doneAction:0
		);
		sig =Saw.ar(freq,mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7);
		sig = LPF.ar(LPF.ar(

			sig.round(2**(-8))

			,envF+lpf /*- In.ar(bus, 1)*/),envF+lpf/* - In.ar(bus, 1)*/);

		sig = sig * amp.dbamp* env;
		Out.ar(out, Pan2.ar(sig));
	}).add;



		SynthDef(\bassMod,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.8, lpf=100, out = 0, bus, dur,cho=0,rel2,relcrv2,envF,relcrv3,vlDec=0.6,vlDecF=0,vlDecFx=1080, vlDecFx2=0;

		var sig, env, lvlBa;

		env = EnvGen.kr(
			Env(
				[1,0],
			[rel,rel2],
				[atkcrv,relcrv,relcrv2]
			),
			timeScale: t.beatDur,doneAction:2
		);

		envF = EnvGen.kr(
			Env(
				[vlDecFx,vlDecFx2],
				[rel],
				[atkcrv,relcrv2]
			),
			timeScale: t.beatDur,doneAction:2
		);
		sig =Saw.ar(MouseY.kr(27.midicps*(432/440),30.midicps*(432/440)),mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7);
		sig = LPF.ar(LPF.ar(

			sig.round(2**(-8))

			,envF+lpf /*- In.ar(bus, 1)*/),envF+lpf/* - In.ar(bus, 1)*/);

		sig = sig * amp.dbamp* env;
		Out.ar(out, Pan2.ar(sig));
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

		Out.ar(out, sig /*.dup*/);
}).add;


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



	SynthDef(\wNoise, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0, tS=1,dA=0,dA2=0,dur,amp2=0,crv=(-2),dwn=0,amp3=1;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([dwn,amp.dbamp,amp2],[atk,dec,0],[3,crv]),timeScale: tS,doneAction:2);

	sig = SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF,doneAction: dA)),

			HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF)),

			BHiPass4.ar(LPF.ar(WhiteNoise.ar(0.03),EnvGen.kr(Env([0,10000],[3],3))),EnvGen.kr(Env([0,10000],[dur],3),timeScale: tS,doneAction:dA2),0.2);
	]);


	Out.ar(out, sig   /*.dup*/ *amp.dbamp *amp3;

    )
}).add;


	SynthDef(\wNoise2, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0, tS=1,dA=0,dA2=0,dur,amp2=0;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([0,amp.dbamp,amp2],[dur*atk,dur*dec,0],[3,-2]),timeScale: tS,doneAction:2);

	sig = /* SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF,doneAction: dA))*/

		HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF,doneAction: dA));   	/*,
			BHiPass4.ar(LPF.ar(WhiteNoise.ar(0.03),EnvGen.kr(Env([0,10000],[3],3))),EnvGen.kr(Env([0,10000],[dur],3),timeScale: tS,doneAction:dA2),0.2);
	]);*/

/*sig = Pan2.ar( sig , pan);*///0 was pan

	Out.ar(out, sig   /*.dup*/ *env;//* env2 //

    )
}).add;



"side events init".postln;

	SynthDef(\kiasmosPad, {arg freq = 440, out = 0, amp = 1, atk= 0.01, rel= 0.01,tS=1,dur;
    var carriers, modulators, mix, verb, filter, env, filterEnv;
    freq = freq + [0, Rand(1,4)];
    carriers = [SinOsc, Saw, Pulse].collect(_.ar(freq));
    modulators = carriers.collect {|c| SinOsc.kr(rrand(0.0322,1.0)*0.0647)};
    mix = Mix(carriers * modulators) * 0.15;
    verb = FreeVerb.ar(mix)/*+sig*/;

	filterEnv = EnvGen.kr(Env([3600, 220], dur, \exp), doneAction: Done.freeSelf);
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, dur - atk - rel, rel], [4,-4]));

	filter = LPF.ar(verb, filterEnv);
	Out.ar(out, filter * env * amp* EnvGen.kr(Env.step([1,0],[dur,0],4),timeScale: tS,doneAction:0));
}).add;


	SynthDef(\abc, {|freq=432,out=0,tS=1|Out.ar(out,Saw.ar([freq,freq-50],mul: EnvGen.kr(Env.perc(releaseTime: 0.3872),timeScale: tS,doneAction: 2)).round(2**(-16)))}).add;


	SynthDef(\rise, {
	arg freq=659.26, mRatio=1, cRatio=1,
	index=1, iScale=5, ic_atk=4, ic_rel=(-4),
	amp=2, rel=3, pan=0, f1,f2,f3, vlAtk=0,atk=0, dec=0,atkE=0  ,dur ,out =0 ,tS=1 ,moduR,moduS,fS=0, fR=0,atk2=0.05 ,dec2   =0.932;
	var car, mod, env, iEnv, mod2;
	iEnv = EnvGen.kr(
		Env(
			[vlAtk, index*iScale, index],
			[dur*atk, dur* dec],
			[ic_atk, ic_rel]//atkC was 10
		),timeScale: tS,doneAction:2
	);
		env = EnvGen.kr(Env([0,1,1,0],[dur*atk2,dur*dec2,0,dur*0.018],[16,0,0-16]),timeScale: tS,doneAction: 2);
	mod2 = SinOsc.ar(freq/10*f3, mul:freq/10 *iEnv);

	mod = SinOsc.ar(freq * f2 + mod2
			 + (In.kr(moduR,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fR ))

			, mul:freq * mRatio * iEnv);

//car = SinOsc.ar(freq * f1 + mod) * env * amp;
	car  = LeakDC.ar(Shaper.ar(~tfBuf,SinOsc.ar(freq * f1 + mod + (In.kr(moduS,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),fS )))))* env * amp;
	/*car = Pan2.ar(car, pan);*/
	Out.ar(out, car);
}).add;

SynthDef(\trippyRise, {|out=0, ph=0,dur,tS=1|
	var r = /*  MouseX.kr(0, 20.6); */  SinOsc.ar(~hz1beat/32,ph).range(0, 20.6);
	// stereo expansion
	var phi = LFSaw.ar([44.1, 42.2], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
		Out.ar(out,/*Limiter.ar(*/~fPo.(x, y)/*, 0.2)*/*  EnvGen.kr(Env([0,1,1,0],[dur*0.05 ,dur*0.90,0,dur*0.05],[9,0,0-9]),timeScale: tS,doneAction: 2))
}).add;



SynthDef(\shiftX, {|in, out=0, frq=0,mult=0,rte=1|Out.ar(out, FreqShift.ar(In.ar(in, 1),freq:
		[frq,frq+5000*rte,frq-8000*rte],mul: [1,mult,mult]

	)!2);}).add;


//below dur can be factored to change mod
	SynthDef(\shift, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0|


		Out.ar(out, FreqShift.ar(In.ar(in, 1)/*.sign*/,


			freq:SinOsc.ar(0.3).range(-100,100)
        ));
	}).add;


		SynthDef(\shiftEx, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0, triMod=0.08046875  |


		Out.ar(out, FreqShift.ar(In.ar(in, 1)/*.sign*/,

			/*freq:  freq2+    In.kr( boo, 1)  +   (EnvGen.kr(Env([vlPE,vlPE2],[dur/*dcPE*/,0],crvEP),doneAction: dA)*factor2)
*/
			freq:LFTri.ar(triMod/*1.2875/16*/).range(-400,400)
   ));
	}).add;


		SynthDef(\shiftExG, {|in, out, freq,boo, freq2, factor =1, factor2, factor3, vlPE =27.1366666667,vlPE2=0.2, crvEP = (-2), dcPE = 0.129066666667, dur,
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0, triMod=0.08046875,vl=1,tS=1,hS=400  |


		Out.ar(out, FreqShift.ar(In.ar(in, 1)/*.sign*/,


			freq:LFTri.ar(triMod/*1.2875/16*/).range(-400,hS)
   )* EnvGen.kr(Env([0,vl,vl,0],[0,dur,0],4),timeScale: tS,doneAction:2));
	}).add;



	SynthDef(\shift2, {|in, out, freq, dur, tS=1
		vlPE3,vlPE33,crvEP2, dA=0, dA2=0, dA3=0,vl=1|


		Out.ar(out, FreqShift.ar(In.ar(in, 2)/*.sign*/,
freq         )* EnvGen.kr(Env([0,vl,vl,0],[0.055,dur-0.055,0],4),timeScale: tS,doneAction:2))}).add;




	SynthDef(\shift10, {|in, out, freq, dur,vl=1,bus|

		Out.ar(out, FreqShift.ar(In.ar(in, 10),In.kr(bus  ) )
			* EnvGen.kr(Env.step([vl,0],[dur,0]),timeScale: t.beatDur,doneAction:2))}).add;



		SynthDef(\shift1, {|in, out, freq, dur,vl=1,bus|

		Out.ar(out, FreqShift.ar(In.ar(in, 1),In.kr(bus  ) )
			* EnvGen.kr(Env.step([vl,0],[dur,0]),timeScale: t.beatDur,doneAction:2))}).add;


	SynthDef(\phaser,{|in, out, rate, value, dur maxDlT =0.0968,decT=1,amp=0.4,tS=1,ph=0| Out.ar(out, In.ar(in,1)+ AllpassN.ar(In.ar(in,1) ,maxDlT,SinOsc.kr(value,ph,0.01,0.01),decT)*amp* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2)   );}).add;


	SynthDef(\disto, {|out=0,in, hpf= 81.41|Out.ar(out, In.ar(in,1).round(2**(-16)));}).add;

	SynthDef(\distoS, {|out=0,in|Out.ar(out, In.ar(in,2).round(2**(-16)));}).add;

	SynthDef(\disto3, {|out=0,in, gain=1|Out.ar(out, In.ar(in,3).round(2**(-16))*gain);}).add;


	SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0|
	var env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:0);
		Out.ar(out, env* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2));
}).add;


		SynthDef(\gate,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0|
	var env =   In.ar(in, 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:2);
		Out.ar(out, env);
}).add;



	SynthDef(\gate3,{|in, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env = In.ar(in, 3) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),

timeScale:  t.beatDur,	doneAction:2);

		Out.ar(out, env);
}).add;


	SynthDef(\gateS,{|in, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

	env =   In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),

timeScale:  t.beatDur,	doneAction:2);

		Out.ar(out, env);
}).add;


	SynthDef(\gateSD,{|in, out=0,out2, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

	env =   In.ar(in, 10) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),

timeScale:  t.beatDur,	doneAction:2);

		Out.ar(out, env);

		Out.ar(out2, env);
}).add;


	SynthDef(\gate2,{|in, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1 vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

	env =   In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -relSu  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),

timeScale:  t.beatDur,	doneAction:2);

		Out.ar(out, env);
}).add;


	SynthDef(\gateX,{|in, out=0,busMod|Out.ar(out,  In.ar(in, 2)* In.kr(busMod))}).add;


	SynthDef(\gateX2,{|in, out=0,busMod,dur|Out.ar(out,  In.ar(in, 2)* In.kr(busMod)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

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
		arg amp=1, buf =0, out=0,pitchRte=1,duration=8,impulse = 1.2875,pos=0, dur,vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,tS=1;

		var env = EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2);

		Out.ar(out, GrainBuf.ar(1,Impulse.ar(impulse),duration ,buf,pitchRte,pos,mul: amp)* env );
	}).add;


	SynthDef.new(\granLive, {
		arg amp=1, buf =0, out=0,pitchRte=1,duration=8,impulse = 1.2875,pos=0, dur,vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,tS=1;

	Out.ar(out, GrainBuf.ar(1,Impulse.ar(MouseX.kr(20.6,0.08)),duration,buf,MouseX.kr(0.01,10),pos,mul: amp) );
	}).add;

	SynthDef.new(\granLiveA, {
		arg amp=1, buf =0, out=0,pitchRte=1,duration=8,impulse = 1.2875,pos=0, dur,vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,tS=1;

	Out.ar(out, GrainBuf.ar(1,Impulse.ar(Line.kr(0.08,20.6,dur,doneAction: 2)),duration,buf,    Line.kr(10,0.01,dur,doneAction: 2),pos,mul: amp)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2) );
	}).add;

	SynthDef(\reverb, {
		|out=0,in,damp,room,mix|
    Out.ar(    out,
		 FreeVerb.ar(  In.ar(in,1),
            mix, // mix 0-1
            room, // room 0-1
            damp // damp 0-1 duh
        ))}).add;



	SynthDef(\reverbMod, {
		|out=0,in,damp,room,mix|
    Out.ar(    out,
		 FreeVerb.ar(  In.ar(in,1),
				MouseY.kr( 0.1,0.6), // mix 0-1
            room, // room 0-1
            damp // damp 0-1 duh
        ))}).add;




	SynthDef(\reverbModu, {
		|out=0,in,damp,room,mix,dur,tS=1,mixMod,roomMod,dampMod|
    Out.ar(    out,
		 FreeVerb.ar(  In.ar(in,1),
				mix+In.kr(mixMod), // mix 0-1
            room+In.kr(roomMod), // room 0-1
            damp+In.kr(dampMod) // damp 0-1 duh
        ))}).add;


	SynthDef(\reverbMad, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,damp,room,mix
    taillevel, amp=0.3,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2, mod|

	var a ,input;

		input =In.ar(in,1);

		a = Resonz.ar(input, 1294.5373184   *   [8,16,32],0.01	).sum * 10;

    Out.ar(    out, GVerb.ar( a, roomsize, revtime , damping, inputbw, spread, drylevel.dbamp, earlylevel.dbamp,
            taillevel.dbamp, roomsize,0.3) + input)
}).add;


	SynthDef(\reverbMad2, {
		|out=0,in,  roomsize, revtime, damping, inputbw, drylevel, earlylevel,damp,room,taillevel,spread=15|

	var a ,input;

		input =In.ar(in,2);

		a = Resonz.ar(input, 1294.5373184 *   [8,16,32],0.01).sum * 10;

    Out.ar(    out,GVerb.ar(a, roomsize,revtime , damping,inputbw,spread,drylevel.dbamp, earlylevel.dbamp,taillevel.dbamp,roomsize,0.3)+ input)}).add;

	"reverb init".postln;

	SynthDef(\del, {|out=0, in, decT=1.5544,delT=0.2|Out.ar(out,AllpassL.ar(In.ar(in,1),delaytime: delT,decaytime: decT))}).add;


	SynthDef(\del10, {|out=0, in, decT=1.5544|Out.ar(out,AllpassL.ar(In.ar(in,10),decaytime: decT))}).add;


	SynthDef(\del10T, {|out=0, in, decT=1.5544,dur|Out.ar(out,AllpassL.ar(In.ar(in,10),decaytime: decT)*
		 EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction:2))
	}).add;

	SynthDef(\pingD, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,1);

    Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1))
	}).add;





	/*SynthDef(\pingDMod, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in /*stereoL =0.00555, stereoR =0, dec=0.5, amp =1*/ |
    var left;

		left =	In.ar(in,1);

		Out.ar(out ,PingPong.ar(bufnum, [left,left], MouseX.kr(t.beatDur, t.beatDur/16), MouseY.kr(0.8,0.1), 1))
	}).add;*/




	SynthDef(\pingDS, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in  |
    var left =	Mix.ar(In.ar(in,2));

		Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 1))
	}).add;


	SynthDef(\pingDSX, { |out = 0, bufnum = 0, dur, feedback = 0.5, delayTime = 0.3, in|
    var left;

		left =	Mix.ar(In.ar(in,2));

		Out.ar(out ,PingPong.ar(bufnum, [left,left], delayTime, feedback, 3)
		* EnvGen.kr(Env.step([1,0],[dur,0],4),timeScale:  t.beatDur,doneAction:2) )
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


	SynthDef(\comb1C, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/

			delayT+ MouseX.kr(0.024,0)/*+ SinOsc.kr(MouseY.kr(20,0),phase: 3,add: 0).range(0.000000001, 0.001)*/,

			decT ,amp)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction:2) )}).add;


		SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0| // reverse for fun was 0.001,0.6)
		Out.ar(out, BufCombN.ar(~b2.bufnum, In.ar(in,1),/*MouseY.kr(0.6,0.001)*/

			/*[delayT+ MouseX.kr(0.024,0),  delayT+ MouseX.kr(0.024,0)+0.00001392889167817/*,    delayT+ MouseX.kr(0.024,0)+0.05*/]*/

			[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]


			/*+ SinOsc.kr(MouseY.kr(20,0),phase: 3,add: 0).range(0.000000001, 0.001)*/,



			decT ,[amp,multi,multi])!2* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2) )}).add;


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
			,decT,0.09)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2) )}).add;


	SynthDef(\combS, {|out=0, in ,maxDel, delayT,decT,dur, tS=1,amp=1|
		Out.ar(out, CombN.ar(In.ar(in,2),/*MouseX.kr(0.01,2)*/maxDel, delayT /*MouseY.kr(0.01,2)*/,decT/*3*/,amp)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2) )}).add;

	SynthDef(\reverbS, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel,maxRoomsize,wet=0.4,in =0,wF =0, spread2=0, level=1, center=0.0, multi = 2,mix,room,damp|

	var a ,input;
		input =In.ar(in,2);

		a = Resonz.ar(		Array.fill(4, input), 1294.5373184 *   [8,16,32],0.01/*wet*/).sum * 10;
    Out.ar(    out, /*GVerb.ar( a,roomsize,revtime,damping,inputbw, spread,drylevel.dbamp,earlylevel.dbamp,taillevel.dbamp,roomsize+1,0.3)+a)*/
FreeVerb.ar(
			  In.ar(in,2),
            mix, // mix 0-1
            room, // room 0-1
            damp // damp 0-1 duh
		))

}).add;


	SynthDef(\reverbG, {|out=0, in,mix,room,damp,dur/*,mixB*/|
		Out.ar(    out, FreeVerb.ar( In.ar(in), mix/*+In.kr(mixB)*/, room, damp )
		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
		)
}).add;

	"reverb init".postln;

	//the compressor received for control a signal going on channel that never goes to zero (renamed ghost)
	SynthDef(\comp, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1|

		Out.ar(out, Compander.ar(In.ar(in,1) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;

	SynthDef(\compS, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1,relMod|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain );
	}).add;


	SynthDef(\compSG, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1,dur|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,2)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel) *EnvGen.kr(Env.step([gain,0],[dur,0]),timeScale: t.beatDur,doneAction: 2));
	}).add;




	SynthDef(\compMod, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1,relMod|

		Out.ar(out, Compander.ar(In.ar(in,1) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel+In.kr(relMod))* gain );
	}).add;

	SynthDef(\compSX, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1,tS=1,dur|

		Out.ar(out, Compander.ar(In.ar(in,2) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain * EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;









SynthDef(\EQHP2LP, {|out=0, in, val, quant, gain,frq=100,frq2=3310, vol =0.05, val2,quant2, gain2,val3,quant3, gain3,val4, gain4, quant4,val5,quant5, gain5,val6,shelf2, gain6,val7,quant7, gain7| Out.ar(out,


			LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(
		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(

			BLowShelf.ar(  BPeakEQ.ar( BPeakEQ.ar(BPeakEQ.ar(BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,quant4, gain4),val5,quant5, gain5),val7,quant7, gain7),val6,shelf2, gain6),

		frq),frq),frq),frq),frq),frq),frq),frq)
			,frq2),frq2),frq2),frq2),frq2),frq2),frq2),frq2)* vol)};).add;




		SynthDef(\EQHP2LP2, {|out=0, in, val, quant, gain,frq=100,frq2=3310, vol =0.05, val2,quant2, gain2,val3,quant3, gain3,val4, gain4, shelf,val5,quant5, gain5,val6,shelf2, gain6,val7,quant7, gain7| Out.ar(out,


			LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(LPF.ar(
		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(

			BLowShelf.ar(  BPeakEQ.ar( BPeakEQ.ar(BHiShelf.ar(BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,quant5, gain5),val7,quant7, gain7),val6,shelf2, gain6),

		frq),frq),frq),frq),frq),frq),frq),frq)
			,MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310)),MouseX.kr(40,3310))


		* vol)};).add;








		SynthDef(\EQHPDyna, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,valD,quantD,ctrl| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(
			BPeakEQ.ar(
		BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2)
				,valD,quantD,
				Amplitude.ar(In.ar(ctrl,1)).linlin(0, 0.003, 0, -12)/*.poll*/)

			,
		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


/*warning*/
//POTENTIAL GLITCH IN FURTE SET VOL TO 1
	SynthDef(\EQHP96, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


	SynthDef(\EQHP96S, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;







	SynthDef(\EQHP2, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,quant3, gain3,val4, gain4, shelf,val5,quant5, gain5,val6,shelf2, gain6,val7,quant7, gain7| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar( BLowShelf.ar(  BPeakEQ.ar( BPeakEQ.ar(BHiShelf.ar(BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 2),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,quant5, gain5),val7,quant7, gain7),val6,shelf2, gain6),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;

	SynthDef(\EQHP96Mod, {|out=0, in, val, quant, gain,frq=100, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6,gainMod,amp=1| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)*  In.ar(gainMod).linlin(0, 0.003,amp, 0).poll)};).add;

	SynthDef(\gateVol,{|out=0,gainMod,amp=0.4,in,dur|Out.ar(out,In.ar(in, 10)*EnvGen.kr(Env.step([In.ar(gainMod).linlin(0, 0.003,amp, 0).poll,0],[dur,0],),timeScale: t.beatDur,doneAction: 2))}).add;


SynthDef(\EQHP10, {|out=0, in, val, quant, gain, val2, quant2, gain2 frq=100, vol =1| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(In.ar(in, 10) ,frq),frq),frq),frq),frq),frq),frq),frq),frq),frq)* vol)};).add;


	SynthDef(\EQHP10D, {|out=0,out2,frq2=2800, in, val, quant, gain, val2, quant2, gain2 frq=100, vol =1| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(In.ar(in, 10) ,frq),frq),frq),frq),frq),frq),frq),frq),frq),frq)* vol);

	Out.ar(out2,HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(Mix.ar(In.ar(in, 10)) ,frq2),frq2),frq2),frq2),frq2),frq2),frq2),frq2),frq2),frq2)* vol)};

	).add;


	"compression init".postln;


	// SynthDef(\crusher,{|out=0,in,rte=48000,bts=24|Out.ar(out,Decimator.ar(In.ar(in),rte,bts))}).add;

	SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				{In.ar(in, 1)}
			/*	{(In.ar(in, 10).flop) }*/
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)

		);
	}).add;



		SynthDef(\stereoO,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1|

		ReplaceOut.ar(out,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,level,center))}).add;


	/*SynthDef(\stereoO,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1|
		Out.ar(out,Splay.arFill(2,{
			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)
	},spread,level,center))}).add;*/


	SynthDef(\stereoO10,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1|

		Out.ar(out,Splay.ar({

			CombN.ar(
				Mix.ar(In.ar(in, 10).flop)

				, mxDel, [dlt1,dlt2], decT)

	},spread,level,center))}).add;


/*	SynthDef(\stereo10,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|
		Out.ar(out,
			Splay.arFill(10,
				{ In.ar(in, 2)}
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale: tS,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;*/


	SynthDef(\stereoW,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(2,
				{ In.ar(in, 2)}
				,spread,level,center)* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoS,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.ar(
				{Mix.ar(In.ar(in, 2))}
				,spread,level,center/*+ In.kr(modPan)*/)
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoX,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
				{	Mix.ar(In.ar(in, 2))}
				,spread,level,center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\stereoX1,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,decT=1,crvA=0,tS=1,vlSub=1|

		Out.ar(out,
			Splay.arFill(10,
				In.ar(in, 1)
				,spread,level,center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,vlSub,0],[dur* atkT,dur*decT,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;




	SynthDef(\stereoS2,{|out=0, in, spread=0, level=1, center=0.0,dur,modPan,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.arFill(10,
					{	Mix.ar(In.ar(in, 2))}
				,spread,level, center+ In.kr(modPan))
			* EnvGen.kr(Env([0,1,1,0],[atkT,dur,0],[crvA,0]),timeScale:  t.beatDur,doneAction: 2)
			//EnvGen.kr(Env.step([1],[dur]),doneAction: 2)
		);
	}).add;


	SynthDef(\brokenStereo,{|out=0, in, bus1, bus2,tS,dur,spread=1, center=0|

		Out.ar(out,
			Splay.arFill(10,
					{	Mix.ar(In.ar(in, 2))}
				,spread,1, [center+ In.kr(bus1),  center+ In.kr(bus2)]       )
			* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2)
			//,doneAction: 2)
		);
	}).add;

	SynthDef(\comp10, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain)}).add;


		SynthDef(\comp10Duo, {|in, in2, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10)+In.ar(in2,10) , In.ar(ctrl,1)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain)}).add;


	SynthDef(\comp1010P, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,10)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction:2))}).add;


	SynthDef(\comp1010, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,10)  , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain)}).add;


	SynthDef(\comp10P, {|in, ctrl, out= 0, dec  , thr  =0.01 ,sB = 1, sA = (1/4), atk = 0.001, rel = 0.04 , gain=1, dur,tS=1|

		Out.ar(out, Compander.ar(In.ar(in,10) , In.ar(ctrl,1)/*.neg */ , thresh: thr, slopeBelow: sB, slopeAbove: sA, clampTime: atk, relaxTime: rel)* gain* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction:2))}).add;



	SynthDef(\sinModul,{|modu, busMod,hS=2200,lS=(-40),dur,tS=1,out,ph=0|Out.kr(out, SinOsc.kr(modu+ In.kr(busMod),ph).range(lS,hS)
		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

SynthDef(\ranModul,{|modu, busMod,lS=0, hS=4200,dur,tS=1,out|Out.kr(out,LFDNoise0.kr(modu+ In.kr(busMod)).range(lS,hS)
			* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

	SynthDef(\triModul,{|ph=0,modu, busMod,hS=1200,lS=(-40),dur,tS=1,out|Out.kr(out, LFTri.kr(modu+ In.kr(busMod),ph).range(lS,hS)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2))}).add;

	//SAFETY VERSION WITH NO BUSSES
SynthDef(\sinModulC,{|modu, busMod,hS=2200,lS=(-40),dur,tS=1,out|Out.kr(out, SinOsc.kr(modu).range(lS,hS)
		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

SynthDef(\ranModulC,{|modu, busMod,lS=0, hS=4200,dur,tS=1,out|Out.kr(out,LFDNoise0.kr(modu).range(lS,hS)
			* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

	SynthDef(\triModulC,{|modu, busMod,hS=1200,lS=(-40),dur,tS=1,out|Out.kr(out, LFTri.kr(modu).range(lS,hS)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

	SynthDef(\squaModul,{|modu, busMod,wdth=0.5,hS=1200,lS=0|Out.kr(busMod,Pulse.kr(modu,wdth).range(lS,hS) )}).add;
SynthDef(\sawModul,{|modu, busMod,hS|Out.kr(busMod, Saw.kr(modu).range(-40,hS))}).add;

	~phaseBus=Bus.audio(s);
	s.sync;

	SynthDef(\fmX, {
		arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=0,  amp=1.5, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 ,factorx=0, factorx2 =0,factorxx=0, factorxx2 =0  , rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50,gate=1,pan=0, modu,modu2, multi=0, multi2=0,modux=0,moduxx=0,fmCtrl=1,secBus;

	var car, mod, mod2, iEnv, sig, filRte,env;

		env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (99999  ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
	mod2 = SinOsc.ar( freq/10+ (In.kr(moduxx,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorxx ))+(In.kr(~seqBus,1)* factorxx2), mul:freq/10 *iEnv /*In.kr( gra, 1)*/ );

	//first level of modulation

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2 )

		/* * SinOsc.kr(sineRate,phRise).range([sineRangeLow])*/+ (In.kr(modux,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorx )), mul:

		 MouseY.kr(freq/2,  freq * mRatio *iEnv)
		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar(

			(In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(secBus,1)* factor2)+

			SelectX.ar(fmCtrl  ,[In.ar(~phaseBus,1),mod])  /* +( freq * cRatio )*/+ (-124).midicps(*432/440)/*0.00502929687*/ ,MouseY.kr(0,2));

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

			Out.ar(out, sig    * amp     *env);
}).add;

	/*
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
*/

	SynthDef(\fader, { |in, out, level = 1, pan = 0|
		var sig = In.ar(in, 10) * level;
		Out.ar(out, Balance2.ar(sig[0], sig[1], pan))
	}).add;

	SynthDef(\fakeSidechain, { |out, sideBus, thresh = 0.05,
		clamp = 0.05, clampLevel = 0.2, relax = 0.08,amp=0.78|
		var sig = In.ar(out, 10);
		var side = In.ar(sideBus, 2).sum;
		var level = Amplitude.ar(side, 0.01, 0.1);
		var gate = level > thresh;
		var eg = EnvGen.ar(Env([1, clampLevel, 1], [clamp, relax], releaseNode: 1), gate);
		ReplaceOut.ar(out, sig * eg*0.86);
			}).add;

	SynthDef(\filterModu,{|out=0, in, filMod=600,filMod2=500,qf=0.5,qf2=0.5,  which=0, filFreq2 =0, filFreq =0|

		var lp,hp, sig;

		sig = In.ar(in,1);

		lp = BLowPass4.ar(sig , filFreq2+ filMod ,qf);

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

SynthDef(\sequ,{|value, dur, in=0, out=0, vlAtk=0, vlDec=1,vlSub=1,vlSub2=1, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2|


	Out.kr(out,EnvGen.kr(Env.step([value],[dur]),doneAction: 2)   ) }).add;



	SynthDef(\pan2,{|out=0,in,amp=1|Out.ar(out, Pan2.ar(In.ar(in))*amp)}).add;

	SynthDef(\filterU, {|out=0,in,  frq=900,lFrq=300 ,qfH = 0.822379, qlL = 0.504212|Out.ar(out, BLowPass4.ar(   BHiPass4.ar(  In.ar(in,1) , frq , qfH), frq
		/*MouseX.kr(20,22000)*/,qlL )) }).add;

/*	SynthDef(\filterU, {|out=0,in,  hFrq=900, hFrq2=900,lFrq=300,lFrq2=300 ,qfH = 0.822379, qfH2=0.6,qlL = 0.504212,qlL2=0.4|Out.ar(out,
	/*BLowPass4.ar(  */ BLowPass4.ar( BLowPass.ar(
			BHiPass4.ar(  BHiPass4.ar(
				In.ar(in,1)
				, hFrq2 , qfH) 	, hFrq , qfH2)
	, lFrq,qlL ) ,lFrq2 ,qlL2 )

	) }).add;*/



	SynthDef(\flanger1, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0,flangMod,ph=0;

		var input, effect;

		input=In.ar(in,1);

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq,ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);

		//LocalOut.ar(fdback*BPF.ar(effect,MouseX.kr(1000,10000),0.1)); //alternative with filter in the feedback loop

		Out.ar(out,effect /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).add;

		SynthDef(\flanger1Mod, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0,flangMod,ph=0;

		var input, effect;

		input=In.ar(in,1);

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq+In.kr(flangMod),ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);

		//LocalOut.ar(fdback*BPF.ar(effect,MouseX.kr(1000,10000),0.1)); //alternative with filter in the feedback loop

		Out.ar(out,effect /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).add;



	SynthDef(\flanger, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0;

		var input, effect;

		input=In.ar(in,2);

		input= input+ LocalIn.ar(2);

		effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq,0,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);

		//LocalOut.ar(fdback*BPF.ar(effect,MouseX.kr(1000,10000),0.1)); //alternative with filter in the feedback loop

		Out.ar(out,effect /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).add;

/*	SynthDef(\lim,{|out=0,ml=0.1,in|Out.ar(out,Balance.ar(In.ar(in),SinOsc.ar(mul: ml)))}).add;

	SynthDef(\lim2,{|out=0,ml=0.2,in|Out.ar(out,Balance.ar(In.ar(in,2),SinOsc.ar(mul: ml)))}).add;
	SynthDef(\lim10,{|out=0,ml=0.2,in|Out.ar(out,Balance.ar(In.ar(in,10),SinOsc.ar(mul: ml)))}).add;*/

	SynthDef(\tantra,{|out=0,wT=0,in,dur|Out.ar(out,SelectX.ar(wT,[

	PingPong.ar(~delay3.bufnum,Mix.ar( In.ar(in,10) )!2,0.38)*0.21,
	FreqShift.ar(In.ar(in,10),  LFNoise0.kr(5.15).range(-2041.2,3020.6)),
	FreeVerb.ar( In.ar(in,10), 0.9,0.9,0.7),

])* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur*2,doneAction: 2))}).add;


s.sync;

	~kick =	Pbind(\instrument, \kick,\dur, Pseq([1/2],2),\amp,(-10),\out,0,\type,Pseq([\note,\rest],inf));

	~bassShap = Pbind(\instrument, \shap, \dur,Pseq([1/1],1),\dA1,2,\out,~bassShapB, \tS, 0.39550810372374);





~recordBuses = { |buses, path, recHeaderFormat = "wav", recSampleFormat = "float", recBufSize = 131072, latency = 0.2|
	var dir = path.dirname;
	var recorders, servers = Set.new;
	var digits = 1;

	var pad = { |num, digits|
		num = num.asString;
		if(num.size < digits) {
			String.fill(digits - num.size, $0) ++ num
		} {
			num
		}
	};

	if(File.exists(dir)) {
		if(File.type(dir) != \directory) {
			Error(
				"Path '%' exists but is not a directory"
				.format(dir)
			).throw;
		}
	} {
		// didn't exist
		// throws error upon failure (good)
		File.mkdir(dir);
	};

	recorders = buses.collect { |bus|
		digits = max(digits, bus.server.options.numAudioBusChannels.log10.ceil.asInteger);
		servers.add(bus.server);
		Recorder(bus.server)
		.recHeaderFormat_(recHeaderFormat)
		.recSampleFormat_(recSampleFormat)
		.numChannels_(bus.numChannels)
		.recBufSize_(recBufSize);
	};

	fork {
		recorders.do { |rec, i|
			rec.prepareForRecord(
				path.format(pad.value(buses[i].index, digits)),
				buses[i].numChannels  // yes, must pass again, hm
			);
		};

		// normally this will be just one server,
		// but let's handle the unusual case too
		servers.do { |server| server.sync };

		servers.do { |server|
			server.makeBundle(latency, {
				recorders.do { |rec, i|
					if(rec.server == server) {
						rec.record(bus: buses[i]);
					};
				};
			});
		};
	};

	recorders
};

~stopRecording = { |recorders|
	recorders.do { |rec| rec.stopRecording };
};


SynthDef(\playBuf ,{|out =0,start, trig, dur, amp=4,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0,impulseMod,envVol,audio1,audio2,audio3,audio4,audio5,record1,record2,record3,record4,record5|



	Out.ar( record1,PlayBuf.ar(2,audio1,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)

		*

		In.kr(envVol));

			Out.ar( record2,PlayBuf.ar(2,audio2,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)

		*

		In.kr(envVol));


				Out.ar( record3,PlayBuf.ar(2,audio3,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));


					Out.ar( record4,PlayBuf.ar(2,audio4,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));

						Out.ar( record5,PlayBuf.ar(2,audio5,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));




	Out.ar(0,In.ar(record1,2)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur, doneAction:2));
		Out.ar(0,In.ar(record2,2));
		Out.ar(0,In.ar(record3,2));
		Out.ar(0,In.ar(record4,2));
		Out.ar(0,In.ar(record5,2));


	}).add;

});

)



({Pan2.ar(Saw.ar(32.midicps*(432/440),mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7).round(2**(-8)))}.play)

({Pan2.ar(Saw.ar(28.midicps*(432/440),mul: 1,add: 0.4).lincurve(-1,1,-1,1,7).round(2**(-8)))}.play)

// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/E2/bass.aiff",numChannels:2,duration:t.beatDur*8)

({Pan2.ar(Saw.ar(30.midicps*(432/440),mul: 1,add: 0.4).lincurve(-1,1,-1,1,7).round(2**(-8)))}.play)

({Pan2.ar(Saw.ar(30.midicps*(432/440),mul: -1,add: 0.4).lincurve(-1,1,-1,1,7).round(2**(-8)))}.play)


({Pan2.ar(Saw.ar(31.midicps*(432/440),mul: 1,add: 0.4).lincurve(-1,1,-1,1,7).round(2**(-8)))}.play)
