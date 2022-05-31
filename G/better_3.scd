doubke decimator low pass
try make use of live gran
fix flanger/phaser
newf
(

~leadCre = Buffer.alloc(s, s.sampleRate *  t.beatDur*16);


~buffer=Buffer.read(s,"C:/Users/PC/Desktop/tender and juicy.wav");
 ~chords =[[0,1,3,4],[0,1,3,7], [0,2,3,4], [0,5,1,4]];

~qAu1= Bus.audio(s,1);
~qAu2= Bus.audio(s,1);
~qAu3= Bus.audio(s,1);


/*~bandL= Bus.audio(s,1);
~bandL2= Bus.audio(s,1);
~bandM= Bus.audio(s,1);
~bandH= Bus.audio(s,1);*/


~ptrBus2=Bus.audio(s,1);
~micBus2=Bus.audio(s,1);

~micBus=  Bus.audio(s,1);
~ptrBus=Bus.audio(s,1);

~busC1 =Bus.control(s,1);
~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);
~busC4 =Bus.control(s,1);

~busC5 =Bus.control(s,1);
~busC6 =Bus.control(s,1);

~busC7 =Bus.control(s,1);

~busC8 =Bus.control(s,1);
~busC9 =Bus.control(s,1);
~busC10=Bus.control(s,1);

~busC11=Bus.control(s,1);

~busC12=Bus.control(s,1);
~busC13=Bus.control(s,1);
~busC14=Bus.control(s,1);
~busC15=Bus.control(s,1);
~busC16=Bus.control(s,1);
~busC17=Bus.control(s,1);
~busC18=Bus.control(s,1);
~busC19=Bus.control(s,1);

~busC20=Bus.control(s,1);

~busC21=Bus.control(s,1);
~busC22=Bus.control(s,1);
~busC23=Bus.control(s,1);

~busC24=Bus.control(s,1);

~busC25=Bus.control(s,1);

~busC26=Bus.control(s,1);
~busC27=Bus.control(s,1);
~busC28=Bus.control(s,1);

~seqBus=Bus.control(s,1);
~bus6W=Bus.control(s,1);

~bmodS=Bus.control(s); ~bf1=Bus.control(s);  ~bmodT =Bus.control(s); ~bf2=Bus.control(s);  ~bmodSa=Bus.control(s);  ~bf3=Bus.control(s);  ~bmodR=Bus.control(s);  ~bfr=Bus.control(s);

~bus1A=Bus.audio(s,1);
~bus2A=Bus.audio(s,1);
~bus3A=Bus.audio(s,1);
~bus4A=Bus.audio(s,1);
~bus5A=Bus.audio(s,1);
~bus6A=Bus.audio(s);
~bus7A=Bus.audio(s,2);
~bus8A=Bus.audio(s,2);
~bus9A=Bus.audio(s,2);

~bus10A=Bus.audio(s);
~bus11A=Bus.audio(s);

~bus12A=Bus.audio(s,2);
~bus13A=Bus.audio(s,2);

~bus14A=Bus.audio(s,2);
~bus15A=Bus.audio(s,2);

~bus16A=Bus.audio(s,1);
~bus17A=Bus.audio(s,1);
~bus18A=Bus.audio(s,1);
~bus19A=Bus.audio(s,2);

~bspread=Bus.control(s);~bcenter=Bus.control(s);~bdlt1=Bus.control(s);~bdlt2=Bus.control(s);~bdecT=Bus.control(s);~bwhichS=Bus.control(s);


~bmix=Bus.control(s);~broom=Bus.control(s);~bdamp=Bus.control(s);
)
(


~swingify = Prout({ |ev|
    var now, nextTime = 0, thisShouldSwing, nextShouldSwing = false, adjust;
    while { ev.notNil } {
        // current time is what was "next" last time
        now = nextTime;
        nextTime = now + ev.delta;
        thisShouldSwing = nextShouldSwing;
        nextShouldSwing = ((nextTime absdif: nextTime.round(ev[\swingBase])) <= (ev[\swingThreshold] ? 0)) and: {
            (nextTime / ev[\swingBase]).round.asInteger.odd
        };
        adjust = ev[\swingBase] * ev[\swingAmount];
        // an odd number here means we're on an off-beat
        if(thisShouldSwing) {
            ev[\timingOffset] = (ev[\timingOffset] ? 0) + adjust;
            // if next note will not swing, this note needs to be shortened
            if(nextShouldSwing.not) {
                ev[\sustain] = ev.use { ~sustain.value } - adjust;
            };
        } {
            // if next note will swing, this note needs to be lengthened
            if(nextShouldSwing) {
                ev[\sustain] = ev.use { ~sustain.value } + adjust;
            };
        };
        ev = ev.yield;
    };
});


	SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=2|Out.ar(out,PlayBuf.ar(1,buf,rte,trigger:impulse,startPos: start,loop:loo,doneAction: dA)

		* EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT,dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;





	SynthDef(\flanger1, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0,flangMod,ph=0, which;

		var input, effect,phaser;

		input=In.ar(in,1);

		input= input+ LocalIn.ar(1);

	effect= DelayN.ar(input,0.02,SinOsc.kr(In.kr(flangefreq),ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);




	phaser= /*In.ar(in,1)+*/ AllpassN.ar(In.ar(in,1) ,0.968,SinOsc.kr(flangefreq,ph,0.01,0.01),-0.5)*1;












	Out.ar(out,SelectX.ar(In.kr(which),[In.ar(in).round(2**(-16)),effect.round(2**(-16)),phaser.round(2**(-16)),


	]));
	}).add;


SynthDef(\iEnv,{|out,index,iScale,atk,rel,ic_atk,ic_rel,dur|
Out.kr(out,EnvGen.kr(
		Env(
			[index, index*iScale, index],
			[dur*atk,dur-(dur*atk)],
			[ic_atk, ic_rel]
		),timeScale: t.beatDur,doneAction: 2
))}).add;



SynthDef(\rien,{|dur=1|EnvGen.kr(Env.step([1,0],[ dur,0]),timeScale: t.beatDur,doneAction: 2)}).add;

	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

SynthDef(\lfoStepMelo, {|out, dur, midinote| Out.kr(out,EnvGen.kr(Env.step([midinote.midicps,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5),time=4| Out.kr(out,	EnvGen.kr(Env([valP1,valP2,valP1],[dur/time,0,0],[crv,0,0],0,3),Impulse.kr(imp)*

	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
	,timeScale: t.beatDur,doneAction: 0))}).add;


SynthDef(\lfoEnvPitch,{|out,strt,loop,val,pol,dec, decL, crv=7,dur|var sig1,sig2;

	sig1 = XLine.kr(start: strt, end: 0, dur: dec);
	sig2 = Saw.kr(val,mul: pol,add: decL).lincurve(-1,1,-1,1,crv).range(strt,0);

	Out.kr(out,SelectX.kr(loop,[sig1,sig2])

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2));

}).add;


SynthDef(\tapedly, {
	|in=0, out=0,fb=0.6, fc=5000, dlytime=0.125, wet=0.5,which pan=0.0,modS,f1,modT,f2,modSa,f3,fr,modR,decT=6.1952,amp=0.1,gate,combMod|
	var local, sig, delayed, phi, phR, phP, freq;
	var tdbh; // time delay between heads (seconds)



	local = LocalBuf(SampleRate.ir * 3, 1);
	local.clear; // clear the buffer

	tdbh = 0.125;
	phi = (2 * tdbh) / BufDur.ir(local);
	freq = 1.0 / BufDur.ir(local); // frequency to playback the buffer at rate 1
	freq = (freq * tdbh) / VarLag.kr(In.kr(dlytime), 2, warp:\linear);
	phR = LFSaw.ar( freq, phi, 0.5, 0.5)*BufFrames.kr( local );
	phP = LFSaw.ar( freq, 0.0, 0.5, 0.5)*BufFrames.kr( local );

	sig = Mix.ar(In.ar(in,2));




	delayed = BufRd.ar(1, local, phP, loop:1);
	delayed = delayed.tanh;
	BufWr.ar( LPF.ar( (sig + delayed), fc, mul:fb), local, phR, loop:1);
	pan = LFNoise1.ar(5);
	Out.ar(out,	/*Balance.ar(*/
		SelectX.ar(0/*In.kr(which)*/,[ In.ar(in,2)+


		(BufCombN.ar(~b3.bufnum,


			/*Decimator.ar(	*/	delayed*wet/* ,MouseY.kr(50,48000),MouseX.kr(1,36))*/
	,

/*			+ (In.kr(busMod,1)*fx)*/

		/* (SinOsc.kr(In.kr(modS),phase: 3,add: 0).range(0.000000001, 0.001)* In.kr(f1))
		+ (LFTri.kr(In.kr(modT)).range(0.000000001, 0.001) *In.kr(f2))
		+ (Saw.kr(In.kr(modSa)).range(0.000000001, 0.001) * In.kr(f3))
		+ /*(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/

		(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/


			In.kr(combMod)

			,decT ,amp)





		* In.kr(gate)*1.6),

				PingPong.ar(~delayX.bufnum, [Mix.ar(In.ar(in,2)),Mix.ar(In.ar(in,2))], 0.3, 0.5, 1),

		delayed*wet
	])/*,SinOsc.ar(mul: 0.26))*/);
}).add;


	SynthDef(\gate2,{|in, out=0,which|




	Out.ar(/*~bus8A*/ SelectX.kr(In.kr(which),[0,~bus8A.index,~bus9A.index]),  In.ar(in, 2));
}).add;


	SynthDef(\gateMod,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0|
	var env =     EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:2);
		Out.kr(out, env);
}).add;


	SynthDef(\gateX,{|in, out=0,dur|
	Out.ar(out,In.ar(in)*	EnvGen.kr(Env([0,1,0],[dur/2,dur/2],[5,8]),timeScale: t.beatDur,doneAction: 2))}).add;


SynthDef(\gateX2,{|in, out=0,dur|
	Out.ar(out,In.ar(in)*	LFPulse.kr(MouseX.kr(1,12)).range(1,0))}).add;



	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;



SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=(-1500),rH=1500, which=0 ,width,flat|var sine,noi,squa;


	sine = LFTri.kr(val,ph*4/* 6*/).range(rL,rH);

	noi = LFNoise0.kr(val).range(rL,rH);/*GrayNoise.kr(val).range(-1000,1000);*/


	// squa = LFPulse.kr(val,ph,width).range(rL,rH);

	flat = EnvGen.kr(Env.step([rH,rH],[dur,0]));


	Out.kr(out,SelectX.kr(In.kr(which),[noi,sine,/*squa,*/flat])

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2))}).add;




	SynthDef(\lfoPerc, {|out, valA,valD,lvl,crv| Out.kr(out,EnvGen.kr(Env.perc(valA,valD,lvl,crv),timeScale:  t.beatDur,doneAction: 2))}).add;


	SynthDef(\lfoPercBis, {|out, valA,valD,lvl,crv,dur| Out.kr(out,EnvGen.kr(Env.perc(dur*valA,dur*valD,lvl,crv),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc, {|out=0,freq=  90.816812847401
/* 42.midicps*(432/440) *//*161.81716430268*/ ,mratio,freq4/*(52.midicps*(432/440))*/,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1,which,clip,skew,pitch,lfoP, melo,seed = 123,/* amp=0.2,*/ sustain=1,fmMod,fmMod2,impulse,buf,start,freqMod,freqMod2,cratio,iEnv,modulus,iEnv2|var sig, sig2, sig3, sig4,sig5, sig6,mod,mod2,carrier, op1, op2,inX,
	 modX, car;

/*
	mod2 = SinOsc.ar(  In.kr(freq2)/10 ,mul:  In.kr(mul2)/10);

	mod = SinOsc.ar( In.kr(freq2) +mod2,mul:In.kr(mul2));

	sig3 = Squine.ar( In.kr(freq2)/*freq*//*+ mod */+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew )+ mod ,/*initphase: mod.wrap(0, 16pi)*/ );


/*sig3=SinOsc.ar(600+
	SinOsc.ar(600+


		SinOsc.ar(60,mul: 300),mul: 3000)+SinOsc.kr(0.08).range(-100,100));*/

/*	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);

	// mod = SinOsc.ar( freq/*In.kr(freq2)*/+ mod2,mul:1/*In.kr(mul2)/10*/);

	sig2 = SinOsc.ar( In.kr(freq2)/*freq */+In.kr(pitch)+In.kr(lfoP)+ In.kr(melo) + mod2/*,In.kr(clip),In.kr(skew)*/ )/*+mod*/;*/

sig2 =Saw.ar(40
	+SinOsc.ar(2200+
		SinOsc.ar(120,500)+In.kr(lfoP),5000),Squine.ar(12,1,skew: 1,sync: 0.1).range(0,LFNoise0.kr(5).range(0.2,1))+

LFPulse.kr(12,0.5).range(0,0.6)
	);


	/*mod2 = SinOsc.ar(In.kr(freq2)-50 /* In.kr(freq3)*/+In.kr(melo)+In.kr(pitch)+In.kr(lfoP) /*,In.kr(clip),In.kr(skew )*/ ,mul:  1);

	mod = SinOsc.ar( In.kr(freq2)+78+In.kr(melo) +In.kr(pitch)+In.kr(lfoP)/*,In.kr(clip),In.kr(skew )*/,mul:1/*In.kr(mul2)/10*/);

	sig = Mix.ar( SinOsc.ar( In.kr(freq2)/*freq*/+In.kr(melo) +In.kr(pitch)+In.kr(lfoP) /*  ,In.kr(clip),In.kr(skew ) */)+mod+mod2)*0.8;*/



	// freq4 = MouseY.kr(20, 4000, 1);
	// mratio = MouseX.kr(1/8, 8, 1);

	inX = LocalIn.ar(2);
	modX = SinOsc.ar(Lag.kr( In.kr(freq3),0.2)) * Lag.kr( In.kr(mratio),0.2) * Lag.kr( In.kr(freq3),0.2) * Lag.kr( In.kr(mratio),0.2) * \index.kr(5);
	car = SinOsc.ar([Lag.kr( In.kr(freq3),0.2) * modX * inX[1], Lag.kr( In.kr(freq3),0.2) + modX + inX[0]]);
    LocalOut.ar(car * \fb.kr([10, 5]));
    sig = Mix(car);




	/*RandID.ir(10);         // choose a specific RandID (read help:)
	RandSeed.ir(1, 300);  // the Rand Seed may be set from outside at creation time.

	// 2 operators, with efficient FSinOScand random freqs, phases, amps
	op1 = FSinOsc.kr(ExpRand(10, 800), Rand(-pi, pi),     Rand(-100, 400));
	op2 = FSinOsc.ar(ExpRand(1, 8000), {Rand(-pi, pi)}!2, ExpRand(0.2, 100));

	carrier = SinOsc.ar(
		ExpRand(0.2, 1000) // carrier freq
		+ op1 //  adding op1
		* op2 // scaled by op2
		,
		{ Rand(-pi, pi) }!2,
		amp
	);

	carrier = EnvGen.ar(Env.perc(ExpRand(0.01, 0.2), sustain), doneAction: 2)
	* carrier;
	sig4= CompanderD.ar(AllpassN.ar(carrier


		,0.2,SinOsc.kr(Lag.kr(MouseY.kr(0.2,5.15)),0,0.01,0.01)


	),0.001, 1, 0.05,0.01,0.8)*60);*/

	sig4 = /* Saw.ar( ( In.kr(freq2)+In.kr(pitch)+In.kr(lfoP)+In.kr(melo))/4 );
	*/

	Saw.ar(/* freq+*/(In.kr(pitch)/8)   +(In.kr(pitch)/7.6)   /*+In.kr(lfoP)*//*+In.kr(melo) */+

		LFNoise2.kr(15).range(5,600)/*+In.kr(lfoP)*/
		// SinOsc.kr(0.3).range(30,2000)
/*		,In.kr(clip),*//*In.kr(skew )*//*1*/ );

	// sig5 = WhiteNoise.ar;



	sig5 = SinOsc.ar(In.kr(freq2)+
	SinOsc.ar(In.kr(freq2)+


		SinOsc.ar(In.kr(freq2)/10,mul: In.kr(fmMod2)/10),mul:/* SinOsc.kr(0.6).range(0, 3000)  */

			In.kr(fmMod)
)-In.kr(lfoP));


	sig2=PlayBuf.ar(2,buf,trigger:
	Impulse.kr(In.kr(impulse)),startPos: In.kr(start),loop:0,doneAction: 0);

*/


//DIFFERENT SQUINE ALLEZZZZ

	/*mod2 = Squine.ar(  In.kr(freqMod2)/10,In.kr(clip),In.kr(skew ) ,mul:  In.kr(freqMod)/10);

	mod = Squine.ar( In.kr(freqMod2)*In.kr(mratio) +mod2,In.kr(clip),In.kr(skew ),mul:In.kr(freqMod)*In.kr(mratio)/*In.kr(mul2)*/);

	sig2 = Squine.ar(In.kr(freqMod2)*In.kr(cratio) /*+ freq2*/+ mod  ,In.kr(clip),In.kr(skew )/*+ mod ,*/,mul:  1/*+In.kr(~busC25)/ In.kr(~busC25)*/);*/
///stqrted here

	/*mod2 = Squine.ar(  In.kr(freq)/10,In.kr(clip),In.kr(skew ) ,mul:  In.kr(freq)/10* In.kr(iEnv));

	mod = Squine.ar(





		(In.kr(freq)*In.kr(mratio) +mod2)%((In.kr(freq)*In.kr(mratio)+mod2)/
			((In.kr(freq)*In.kr(mratio)+mod2)*In.kr(modulus)))





		,In.kr(clip),In.kr(skew ),mul:In.kr(freq)*In.kr(mratio)* In.kr(iEnv));

	sig2 = Squine.ar(In.kr(freq)*In.kr(cratio) /*+ freq2*/+ mod  ,In.kr(clip),In.kr(skew ));*/



	mod2 = SinOsc.ar(  In.kr(freq)/10,mul:  In.kr(freq)/10* In.kr(iEnv));

	mod = SinOsc.ar(




		// In.kr(freq)*In.kr(mratio) +mod2
		/*(In.kr(freq)*In.kr(mratio) +mod2)%((In.kr(freq)*In.kr(mratio)+mod2)/
			((In.kr(freq)*In.kr(mratio)+mod2)*In.kr(modulus)))*/




		(In.kr(freq)/**In.kr(mratio)*/ +mod2) %(	(In.kr(freq)*In.kr(mratio) +mod2)*In.kr(modulus))




		,mul:In.kr(freq)/*%(In.kr(freq)*In.kr(modulus)) */ /**In.kr(mratio)*/* In.kr(iEnv));

	sig2 = Squine.ar(In.kr(freq)/**In.kr(cratio)*/ * In.kr(iEnv2) /*+ mod*/,In.kr(clip),In.kr(skew )  /*,initphase: mod.wrap(0, 4pi)*/);

	// sig2 = SinOsc.ar(In.kr(freq)* In.kr(iEnv2) + mod);
	Out.ar(out,
		// Balance.ar(
		LeakDC.ar(Shaper.ar(~tfBuf,sig2


		/*Select.ar(In.kr(which),[ sig/*,In.ar(~qAu2)*//*sig2*1.8*/,sig3,sig4,sig5])*/





	))
		// ,SinOsc.ar(mul: 0.1))

		* amp );


/*	Out.ar(sig3)*/

}).add;

/*
SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR,which |

Out.ar(out,SelectX.ar(1/*In.kr(which)*/,[ BufCombN.ar(~b3.bufnum, In.ar(in,1),

/*			+ (In.kr(busMod,1)*fx)*/

		 (SinOsc.kr(In.kr(modS),phase: 3,add: 0).range(0.000000001, 0.001)* In.kr(f1))
		+ (LFTri.kr(In.kr(modT)).range(0.000000001, 0.001) *In.kr(f2))
		+ (Saw.kr(In.kr(modSa)).range(0.000000001, 0.001) * In.kr(f3))
		+ /*(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/

		(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*1/*In.kr(fr)*/))


		,decT ,amp),In.ar(in,1)])  )}).add;
*/
SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1,which,str|

	Out.ar(out,SelectX.ar(In.kr(which), [Pan2.ar(	In.ar(in, 1)).round(2**(-16)), Splay.ar({

		CombN.ar(
			In.ar(in, 1), mxDel, [In.kr(dlt1)+In.kr(str),In.kr(dlt1)], In.kr(decT))

},In.kr(spread),level,In.kr(center)).round(2**(-16))]))}).add;


SynthDef(\stereoStat,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1,which=0,str|

	Out.ar(out,SelectX.ar(which, [Pan2.ar(	In.ar(in, 1)), Splay.ar({

		CombN.ar(
			In.ar(in, 1), mxDel, [dlt1+str,dlt1], In.kr(decT))

},In.kr(spread),level,In.kr(center))]))}).add;


/*SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1,which,str|

	Out.ar(out,/*SelectX.ar(In.kr(which), [Pan2.ar(	In.ar(in, 1)),*/ Splay.ar({

	/*	CombN.ar(*/
			In.ar(in, 1)/*, mxDel, [In.kr(dlt1)+In.kr(str),In.kr(dlt1)], In.kr(decT))
*/
},0/*In.kr(spread)*/,1,0/*In.kr(center)*/)/*])*/)}).add;




SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dur,atkT=0,crvA=0,tS=1|

		Out.ar(out,
			Splay.ar(
				{ In.ar(in, 1)}
				,spread,level,center)

		);
	}).add;*/

	SynthDef(\reverb, {
		|out=0,in,damp,room,mix|
    Out.ar(    out,
		 FreeVerb.ar(  In.ar(in,1),
			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        ))}).add;


SynthDef(\reverb, {
		|out=0,in,damp,room,mix, val, quant, gain,frq=100, vol =0.3, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6|
    Out.ar(    out,

		// Decimator.ar(
		 FreeVerb.ar(


			// In.ar(in, 1),

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
				BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),3000/*val4*/,1.3/*shelf*/, (-14)/*gain4*/),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        )
		// ,MouseX.kr(100,48000),MouseY.kr(1,24))



)}).add;
//A RE TESTER !!!!

SynthDef(\reverb, {
		|out=0,in,damp,room,mix, val, quant, gain,frq=100, vol =0.3, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6,ctrl|
    Out.ar(    out,

		// Decimator.ar(
		 FreeVerb.ar(


			// In.ar(in, 1),

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
				BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, /*gain2*/Amplitude.ar(In.ar(ctrl,1)).linlin(0, 0.5, 9, 0)),val3,quant3, gain3),3000/*val4*/,1.3/*shelf*/,Amplitude.ar(In.ar(ctrl,1)).linlin(0, 0.5, 0, -7) /*(-14)*//*gain4*/),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        )
		// ,MouseX.kr(100,48000),MouseY.kr(1,24))



)}).add;



/*SynthDef(\reverb, {
		|out=0,in,damp,room,mix, val, quant, gain,frq=100, vol =0.3, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6,ctrl|

	  var a, b, c, d;


	 #a, b, c, d = BandSplitter4.ar(In.ar(in, 1), 100, 800, 1200);

	// Amplitude.kr(a).poll; 0.214062

	// Amplitude.kr(b).poll; 0.143601

	// Amplitude.kr(c).poll;0.38212


	// Amplitude.kr(d).poll;0.781636

	// Amplitude.kr(d).poll;
   Out.ar(    out,

		// Decimator.ar(
		 FreeVerb.ar(


			// In.ar(in, 1),

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
				BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),900,1.4, /*gain2*/Amplitude.kr(c).linlin(0.15, 0.8, 0, -16)),

				400,1.3,Amplitude.kr(b).linlin(0.15, 0.8, 0, -16)/*gain3*/),

			1300/*val4*/,1.3/*shelf*/,Amplitude.kr(d).linlin(0.15, 0.8, 0, -16) /*(-14)*//*gain4*/),
			200,1.2,Amplitude.kr(a).linlin(0.15, 0.8, 0, -16)
			/* gain5*/),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        )

)}).add;*/


/*  var a, b, c, d;
    #a, b, c, d = BandSplitter4.ar(Saw.ar(100), 200, 600, 1000);
	// Select.ar(MouseX.kr(0, 4), [a, b, c, d]);

	Amplitude.kr(a).linlin(0.057934, 0.281179, 20, 0).poll*/



/*SynthDef(\reverbStat, {
		|out=0,in,damp,room,mix, val, quant, gain,frq=100, vol =0.3, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6,ctrl|

		  var a, b, c, d;


	 #a, b, c, d = BandSplitter4.ar(In.ar(in, 1), 100, 800, 1200);

  Out.ar(    out,

		// Decimator.ar(
		 FreeVerb.ar(


			// In.ar(in, 1),

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
				BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),900,1.4, /*gain2*/Amplitude.kr(c).linlin(0.15, 0.8, 0, -16)),

				400,1.3,Amplitude.kr(b).linlin(0.15, 0.8, 0, -16)/*gain3*/),

			1300/*val4*/,1.3/*shelf*/,Amplitude.kr(d).linlin(0.15, 0.8, 0, -16) /*(-14)*//*gain4*/),
			200,1.2,Amplitude.kr(a).linlin(0.15, 0.8, 0, -16)
			/* gain5*/),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			mix, // mix 0-1
			 room, // room 0-1
			 damp // damp 0-1 duh
        ))}).add;*/





SynthDef(\del, {|out=0, delT,in, dur|Out.ar(out,AllpassL.ar(In.ar(in,1),delaytime: /*In.kr(~busC8)*/delT,decaytime:dur)*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2))}).add;





SynthDef(\gVerb,{|out,in,roomSize,revT,damp,earlyLvl,dur|Out.ar(out,GVerb.ar(In.ar(in),roomSize,revT,damp,earlyreflevel: earlyLvl)*
	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
)}).add;

SynthDef(\fx,{|out,in,roomSize,revT,damp,earlyLvl,dur,delT,which,wild,rate,ratePhaser,rte,bits,flangefreq=0.3, fdback=0.3,ph=0 ,ph2,rL1, rH1,rL2, rH2,rL3, rH3,rL4, rH4, modS,modT,modSa,modR,f1,f2,f3,fr

		|	var dry, wet, snd, count,input, effect,



 voicedCarrier
,snd2, numBands, bandFreqs, carrier;



	numBands = 32;
	bandFreqs = (0..numBands - 1).linexp(0, numBands - 1, 100, 8000);
	snd2 =PlayBuf.ar(2, ~buffer, rate,Impulse.kr(0.8));
	voicedCarrier =In.ar(in,1);
	carrier = SelectX.ar((ZeroCrossing.ar(snd2).cpsmidi.lag(0.05) > 5000.cpsmidi).lag(0.05), [voicedCarrier, PinkNoise.ar]);
	snd2 = Amplitude.ar(BPF.ar(snd2, bandFreqs, 0.05), 0.01, 0.05);
	snd2 = BPF.ar(carrier, bandFreqs, 0.05) * snd2;
	snd2 = snd2.sum;
	snd2 = snd2 * 190.dbamp;
	snd2 = Limiter.ar(snd2);


	/*------*/






		input=In.ar(in,1);

		input= input+ LocalIn.ar(1);

	effect= DelayN.ar(input,0.02,SinOsc.kr(In.kr(flangefreq),ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);






	Out.ar(out,


		SelectX.ar(which,
		[
				snd2,
				In.ar(in,1),
			AllpassL.ar(In.ar(in,1),delaytime:delT,decaytime:dur),


			GVerb.ar(In.ar(in),roomSize,revT,damp,earlyreflevel: earlyLvl),


			GVerb.ar(AllpassL.ar(In.ar(in,1),delaytime:delT,decaytime:dur),roomSize,revT,damp,earlyreflevel: earlyLvl),



				AllpassL.ar(GVerb.ar(In.ar(in),roomSize,revT,damp,earlyreflevel: earlyLvl),delaytime:delT,decaytime:dur),




	dry =In.ar(in,1);
	count = 3;
	wet = LeakDC.ar(LocalIn.ar(1)).tanh * wild; // turn up the feedback past 1 for some WILD sounds
	wet = wet + dry;
	wet = 2.collect { |i|
		DelayC.ar(wet, 0.03, LFTri.ar(0.1, ((0..count - 1) + (i * 0.5)) / count * 2pi).linlin(-1, 1, 5e-3, 20e-3)).sum / sqrt(count);
	};
	LocalOut.ar(wet.sum);
	snd = (dry +  wet) / sqrt(2);
	snd = snd * 0.5;,




				AllpassN.ar( In.ar(in,1)

,0.05,/*SinOsc.kr(~hz1beat/4,0.3,0.02,0.02)+*/
SinOsc.kr(ratePhaser,2,0.01,0.01)//good phaser
				,-0.5),


				Decimator.ar(In.ar(in,1),rte,bits),


				effect,


				FreqShift.ar(In.ar(in,1),

					 (SinOsc.kr(modS,phase: 3,add: 0).range(rL1, rH1)* f1)
		+ (LFTri.kr(modT).range(rL2, rH2) *f2)
		+ (Saw.kr(modSa).range(rL3, rH3) * f3)
		+(LFDNoise0.kr(modR).range(rL4, rH4)*fr)

					,ph2)

	])





		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
	);
}).add;

SynthDef(\lim2,{|out=0,ml=0.1,in|Out.ar(out,Balance.ar(In.ar(in,2),SinOsc.ar(mul: ml)))}).add;

)
~dur=[Pseq([1],64),Pseq([8],1),Pseq([1],8),Pseq([8],1),Pseq([1],8),Pseq([8],1),Pseq([1],8),Pseq([8],1),Pseq([1],8)];


~dur=[Pseq([32],1),Pseq([4],8)];


~dur=[16];
~dur=[1];
~dur=16;


~dur=[1,2];

~time=16

~time.rand

~timeLeft =

~dur=[4,3,6,1,1,1].scramble


~dur=Pseq([4,3,6,1,1,1].scramble,1)

~dur=1

[4,3,6,1,1,1]/4
[4,3,6,1,1,1]*4

~dur =~dur*4

(
~time = 16;
~dur=List[  ];
~ajout=0;


while({~time !=0},{

	~ajout= ~time.rand+1;

	~time =~time -~ajout;
	// ~time.postln;

	~dur.add(~ajout)
});

~dur.postln;

// ~dur=[ 3, 2, 3, 3, 3, 1, 1 ]


~dur=Pseq(~dur.scramble,1);

~dur=[~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur*4,~dur*4,~dur*4,~dur*4,~dur*16].scramble;

)


~dur=[~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur*4,~dur*4,~dur*4,~dur*4,~dur*16].scramble;


~dur.scramble


~dur=   [  0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   3, 2, 3, 3, 3, 1, 1 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   3, 2, 3, 3, 3, 1, 1 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25 ,   3, 2, 3, 3, 3, 1, 1 ,   0.75, 0.5, 0.75, 0.75, 0.75, 0.25, 0.25].scramble

~dur =~dur/4
~dur=[1000]
~dur=[inf]

~dur=[3,2,7,1,3].scramble


if(~timeLeft ==0,{},{

	~time.rand;

	~timeLeft =

})


~dur=[ 3, 2, 3, 3, 3, 1, 1 ]/16

;
(
~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g4=Group.after(~g3);
~g5=Group.after(~g4);
~g6=Group.after(~g5);
~g7=Group.after(~g6);
~g8=Group.after(~g7);

~g9=Group.after(~g8);
~g10=Group.after(~g9);
~g11=Group.after(~g10);
~g12=Group.after(~g11);
~g13=Group.after(~g12);
~g14=Group.after(~g13);
~g15=Group.after(~g14);
~g16=Group.after(~g15);

~g17=Group.after(~g16);
~g18=Group.after(~g17);
// 1800
Ppar([


	/*
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({/*(76.midicps*(432/440)).rrand(0)*/4000.rrand(20)}),\group,~g1,\out,~busC2),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({4000.rand}),\group,~g1,\out,~busC3),

	//this one freq2
/*Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(76.midicps*(432/440)).rand}),\group,~g1,\out,~busC4),*/
	// Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({4.rand}),\group,~g1,\out,~busC5),







	// 1400
	Pbind(\instrument,\lfoEnvPitch, \strt,Pfunc({76.midicps*(432/440)}), \crv,Pfunc({13.rand}), \pol, Pfunc({(-1).rrand(1)}),\dec, Pfunc({61.00.rand}),\decL,Pfunc({(-0.2).rrand(0.4)}),\loop,1/* Pfunc({2.rand})*/, \out,~busC8,\dur,Pseq(~dur,inf),\group,~g1),


	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({22.rand}),\group,~g1,\out,~busC9,\which,Pfunc({2.rand}),\rL,Pfunc({(-3000).rand}),\rH,Pfunc({3000.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),


		Pbind(\instrument, \lfoStep,\out, ~seqBus, \val,Pfunc({



		Scale.majorPentatonic(\just).degreeToFreq(7.rand, 38.midicps, 2)*(432/440)

		// Scale.chromatic(\just).degreeToFreq(7.rand, 38.midicps, 2)*(432/440)
/*	Scale.chromatic(\just).degreeToFreq(7.rand, 38.midicps, 2),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20)*/

	}),\dur,Pxrand([ Pseq([1/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\group,~g1,\out,~busC10),

*/

	Pbind(\instrument, \lfoPerc, \dur,Pxrand([ Pseq([3/1],1),Pseq([1/3],4), Pseq([1/4],16),Pseq([1],1)],inf),\val,Pfunc({(-1.0).rrand(1.0)}),\group,~g1,\out,~busC11,\valA,Pfunc({t.beatDur.rand}),\valD,Pfunc({t.beatDur.rand}),\lvl,Pfunc({(-65).rrand(700)}),\crv,Pfunc({(-6).rrand(6)}),),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({20.rand}),\group,~g1,\out,~bmodS),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({20.rand}),\group,~g1,\out,~bmodT),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({20.rand}),\group,~g1,\out,~bmodSa),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({20.rand}),\group,~g1,\out,~bmodR),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf1),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf2),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf3),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bfr),
///here
	/*Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pwrand([0,1],[1,4].normalizeSum,inf),\group,~g1,\out,~busC1),*/




	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bspread),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(-0.6)}),\group,~g1,\out,~bcenter),






/*	Prand([
		Ppar([
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.3)}),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.3)}),\group,~g1,\out,~bdlt2),
		],1),

		Ppar([
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.2.rrand(0.1)}),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.2.rrand(0.1)}),\group,~g1,\out,~bdlt2),
		],1),


		Ppar([
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.02.rrand(0.05)}),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(-0.05).rrand(0.05)}),\group,~g1,\out,~bdlt2),
		],1)
	],inf),*/

	// skew
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(0.2)}),\group,~g1,\out,~busC6),

Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(-1)}),\group,~g1,\out,~busC7),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Prand([0.02.rrand(0.05),0.2.rrand(0.1),0.4.rrand(0.3)],inf),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(-0.05).rrand(0.05)}),\group,~g1,\out,~bdlt2),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.3)}),\group,~g1,\out,~bdlt2),


	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.00655.rand(0.012)}),\group,~g1,\out,~bdecT),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand})/*Pwrand([1,0],[1,8].normalizeSum,inf)*/,\group,~g1,\out,~bwhichS),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(0.05)}),\group,~g1,\out,~bmix),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(0.05)}),\group,~g1,\out,~broom),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.7.rrand(0.05)}),\group,~g1,\out,~bdamp),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand}),\group,~g1,\out,~bus6W),

		Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({3.rand}),\group,~g1,\out,~busC12),


	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({3.rand}),\group,~g1,\out,~busC13),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1/64).rrand( 4)}),\group,~g1,\out,~busC14),

		Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1/64).rrand( 8)}),\group,~g1,\out,~busC28),


	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1/16).rrand( 4)}),\group,~g1,\out,~busC17),

	// SinOsc.kr(0.6).range(0, 3000)
	Pbind(\instrument, \lfo,\val,Pfunc({(1/8).rrand( 8)}), \dur,Pseq(~dur,inf),\group,~g1,\out,~busC15,\rL,0,\rH,Pfunc({3000.rand}),\which,Pfunc({3.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),
	Pbind(\instrument, \lfo,\val,Pfunc({(1/8).rrand( 8)}), \dur,Pseq(~dur,inf),\group,~g1,\out,~busC16,\rL,0,\rH,Pfunc({3000.rand}),\which,Pfunc({3.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),


	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pwrand([0,1,2],[20 ,0.5,1].normalizeSum,inf),\group,~g1,\out,~busC20),




	Pbind(\instrument, \lfoStep, \dur,Pseq([4],inf),\val,Pfunc({1.00.rrand(0.05)}),\group,~g1,\out,~busC21),




	// BandSplitter



	/*Pbind(\instrument, \lfoPerc, \dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16),Pseq([1],1)],inf),\group,~g1,\out,~busC22,\valA,Pfunc({t.beatDur.rand}),\valD,Pfunc({t.beatDur.rand}),\lvl,Pfunc({Scale.majorPentatonic(\just).degreeToFreq(7.rand, 38.midicps, 2)*(432/440)}),\crv,Pfunc({(-6).rrand(6)})),

	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({22.rand}),\group,~g1,\out,~busC22,\which,Pfunc({2.rand}),\rL,Pfunc({(-3000).rand}),\rH,Pfunc({3000.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),*/

	/*Pbind(\instrument, \lfoPercBis, \dur,Pseq(~dur,inf),\group,~g1,\out,Prand([~busC23,~busC22/*,~busC4*/],inf),\valA,Pfunc({1.00.rand}),\valD,Pfunc({1.00.rand}),\lvl,Pfunc({700.00.rand}),\crv,Pfunc({(-6).rrand(6)})),

	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({12.00.rand}),\group,~g1,\out,Prand([~busC23,~busC22/*,~busC4*/],inf),\which,Pfunc({3.rand}),\rL,Pfunc({(-700.00).rand}),\rH,Pfunc({700.00.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),*/


	//combMod

	Pbind(\instrument, \lfoPercBis, \dur,Pseq(~dur,inf),\group,~g1,\out,~busC8,\valA,Pfunc({1.00.rand}),\valD,Pfunc({1.00.rand}),\lvl,Prand([/*0.001,*/0.01,0.00001],inf),\crv,Pfunc({(-6).rrand(6)})),

	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~busC8,\which,Pfunc({3.rand}),\rL,0.000000001,\rH,0.0001,\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),

		Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~busC8,\which,Pfunc({3.rand}),\rL,0.000000001,\rH,0.0001,\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),


		Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({10.00.rand}),\group,~g1,\out,~busC8,\which,Pfunc({3.rand}),\rL,0.000000001,\rH,0.0001,\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),






/*	(SinOsc.kr(In.kr(modS),phase: 3,add: 0).range(0.000000001, 0.001)* In.kr(f1))
		+ (LFTri.kr(In.kr(modT)).range(0.000000001, 0.001) *In.kr(f2))
		+ (Saw.kr(In.kr(modSa)).range(0.000000001, 0.001) * In.kr(f3))
		+ /*(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/

		(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/




	Pbind(\instrument,	\iEnv, \dur,Pseq(~dur,inf),\group,~g1,\out,~busC2,

	\atk,Pfunc({1.00.rand}) ,\index,Pfunc({6.00.rand})
		,\iScale,Pfunc({6.rand}) ,\ic_atk, Pfunc({6.rrand(-6)}),\ic_rel,Pfunc({6.rrand(-6)})),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.20.rand})/*Pwrand([500000,0.3],[20,1].normalizeSum,inf)*/  /*Pfunc({500000.rand})*/,\group,~g1,\out,~busC10),



/*	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(79.midicps*(432/440)).rand}),\group,~g1,\out,~busC4),*/









//REMOVE DOWN
	/*Pbind(\instrument, \gateMod  ,\vlDec,Pfunc({700.00.rrand(-700.00)}),
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],inf) ,    \group,~g1, \out,~busC23,
		\vlSub,Pfunc({700.00.rrand(-700.00)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({700.00.rrand(-700.00)}),\vlRel,Pfunc({700.00.rrand(-700.00)})),*/

///////

	Pbind(\instrument, \lfoPercBis, \dur,Pseq(~dur,inf),\group,~g1,\out,~busC23,\valA,Pfunc({1.00.rand}),\valD,Pfunc({1.00.rand}),\lvl,Pfunc({(1/64).rrand( 8)/*1.4.rand*/}),\crv,Pfunc({(-12).rrand(12)})),

/*	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~busC23,\which,Pfunc({3.rand}),\rL,Pfunc({0.20.rand}),\rH,Pfunc({Pfunc({0.20.rand})}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),*/



	/*------------------------*/
Prand([
	Pchain(
    ~swingify,

	Pbind(\instrument, \gateMod  ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],1) ,    \group,~g3, \out,~busC24,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pfunc({0.7.exprand(0.4,1)})/*Pkey(\vlSub)*/,\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)}),\type,Prand([\note,\rest],inf)) ,(swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)

),


	Pchain(
    ~swingify,

	Pbind(\instrument, \gateMod  ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],1) ,    \group,~g3, \out,~busC24,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pfunc({0.7.exprand(0.4,1)})/*Pkey(\vlSub)*/,\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)}),\type,Prand([\note,\rest],inf)) ,(swingBase: 1.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)

)
	],inf),


	Prand([
	Pbind(\instrument, \gateMod  ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),Pseq([1/8],8),   Pseq([1/16],16), /*Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) */ ],1) ,    \group,~g3, \out,~busC25,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pfunc({0.7.exprand(0.4,1)})/*Pkey(\vlSub)*/,\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
			\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)}),\type,Prand([\note,\rest],inf)),

		Pbind(\instrument, \gate ,\in,~bus10A ,\type,Pseq([\note,\rest],inf),\group,~g3, \out,~busC25,\dur,Pseq([1/8],8))],inf),

///which tape delay

	Pbind(\instrument, \lfoStep, \dur,Pseq([4/1],inf),\val,
		Pfunc({3.rand})

		/*Pwrand([0,1,2],[20,1,1].normalizeSum,inf)*/
		,\group,~g1,\out,	~busC26)
	,

		Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand}),\group,~g1,\out,
		~busC27),


	//delay fx
/*	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.9.rand.round(0.01)}),\group,~g1,\out,~busC8),*/


	/*Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,\dur,\group,~g1,\out,
		~busC9)*/
],1).play(t);

(
a = (60..71);
b = (75..86);

/*a = (30..41);
b = (45..56);*/




// randomly exchange one pitch of array
p = PSrecur({ |x|
	x[0][(0..2).choose] = (a.asSet - x[0].asSet).choose;
	x[0]
	// random start
}, 1, start: [a.scramble[0..2]]);

q = PSrecur({ |x|
	x[0][(0..4).choose] = (b.asSet - x[0].asSet).choose;
	x[0]
}, 1, start: [b.scramble[0..4]]);

x = Prand([


Pbind(\instrument,
	\lfoStepMelo, \dur,Pxrand([Pseq([1/4],4),/* Pseq([1/3],6), */  Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],4)/*,Pseq([4/1],1),Pseq([4/1],4) */],inf) ,\group,~g1,\out,~busC4,
	\midinote, Pseq([p.flatten, q.flatten], inf)/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
)
,

	Pbind(\instrument,
	\lfoStepMelo, \dur,Pxrand([Pseq([1/4],4),/* Pseq([1/3],6), */  Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],4),Pseq([4/1],1),Pseq([4/1],4) ],inf) ,\group,~g1,\out,~busC4,
	\midinote, Pn(Pshuf(~chords+60))/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
),



Pbind(\instrument,
	\lfoStepMelo, \dur,Pseq(~dur,inf) ,\group,~g1,\out,~busC4,
	\midinote, Pseq([p.flatten, q.flatten], inf)/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
)
,

	Pbind(\instrument,
	\lfoStepMelo, \dur,Pseq(~dur,inf) ,\group,~g1,\out,~busC4,
	\midinote, Pn(Pshuf(~chords+60))/*,\legato, Pseq([0.25, 1.0,0.75].scramble, inf)*/
)


],inf).play(t)
);


/*Pbind(\instrument, \lfoStep, \dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],inf) ,\val,Pfunc({(76.midicps*(432/440)).rand}),\group,~g1,\out,~busC4),*/


 ~ye= Synth( \osc,[/*\mul2,~busC3,\freq3,~busC2,\mul3,~busC3,\which,~busC5,\pitch, ~busC8,\lfoP,~busC9,\melo,~busC10,*/

	\iEnv,~busC2,\modulus,~busC10,
	\out,~bus2A/*~bus1A*/,\freq,~busC4,\clip,~busC6,\skew, ~busC7,\mratio,~busC14,\cratio,~busC28,\fmMod,~busC15,\fmMod2,~busC16,\freqMod,~busC22,/*\freqMod2*/\iEnv2,~busC23],~g1,addAction: 'addAfter');

/*~v =  Synth(\comb1,[ \in, ~bus2A,\out,~bus1A   ,\maxDel,0.7744,\decT,(-0.5)
, \modS,~bmodS , \f1,~bf1 , \modT, ~bmodT, \f2, ~bf2, \modSa,~bmodSa , \f3, ~bf3, \modR, ~bmodR, \fr, ~bfr,
\which,~busC1
],~ye,\addAfter);*/



// ~d=	({Out.ar(~bus1A,Balance.ar(In.ar(~bus6A),SinOsc.ar(mul: 0.5)))}.play(target:~v,addAction:\addAfter));




// Pbind(\instrument,\del,\in,~bus2A,\out,~bus1A, \delT,Pfunc({0.9.rand.round(0.01)}),\dur,Pseq(~dur,inf),\group,~g2).play(t);


// Pbind(\instrument,\gVerb ,\out,~bus1A,\in,~bus2A,\roomSize,Pfunc({10.rrand(1)}),\revT,Pfunc({1.rrand(3)}),\damp,Pfunc({0.05.rand}),\earlyLvl,Pfunc({0.2.rand}),\group,~g2,\dur,Pseq(~dur,inf)).play(t);


Pbind(\instrument,\fx,\dur,Pseq(~dur,inf),\which,Pfunc({11.rand})/*Pwrand([0,1],[4,1].normalizeSum,inf)*/,\group,~g2,\out,Prand([~bus4A,~bus10A],inf),\in,~bus2A,\roomSize,100/*Pfunc({3.rrand(1)})*/,\revT,Pfunc({5.rrand(8)}),\damp,Pfunc({0.05.rand}),\earlyLvl,Pfunc({0.2.rand}),\delT,Pfunc({0.9.rand.round(0.01)}),\wild,Pfunc({0.8.rrand(2.3).round(0.01)}),\rate,Pfunc({0.6.rrand(1)}),\ratePhaser,Pfunc({(~hz1beat/4).rrand(~hz1beat*4)}),
	\rte,Pfunc({48000.rand}),\bits,Pfunc({24.rand}),

	\flangefreq, Pfunc({0.01.rrand(1.6)}), \fdback,  Pfunc({0.1.rrand(0.8)}),\ph, Pfunc({7.rand})

,\ph2,Pfunc({6.28.rand}),\rL1,Pfunc({700.rand}), \rH1,Pfunc({700.rand}),\rL2,Pfunc({700.rand}), \rH2,Pfunc({700.rand}),\rL3,Pfunc({700.rand}), \rH3,Pfunc({700.rand}),\rL4,Pfunc({700.rand}), \rH4,Pfunc({700.rand}), \modS,Pfunc({3.00.rand}),\modT,Pfunc({3.00.rand}),\modSa,Pfunc({3.00.rand}),\modR,Pfunc({3.00.rand}),\f1,Pfunc({1.00.rand}),\f2,Pfunc({1.00.rand}),\f3,Pfunc({1.00.rand}),\fr,Pfunc({1.00.rand})
).play(t);





/*({

	GVerb.ar(

		LFPulse.ar(MouseY.kr(140,600)),

		2,30-70,0.01,earlyreflevel: 0.0001
	)
}.play)*/

/*
~fi=({Out.ar(~bus10A/*~bus3A*/,SelectX.ar(In.kr(~busC13),[In.ar(~bus1A).round(2**(-16)),FreqShift.ar(In.ar(~bus1A),

	LFTri.kr(

		LFTri.kr(~hz1beat/256,3).range(~hz1beat/16,~hz1beat)

		,11).range((-800),800)).round(2**(-16))]))}.play(target:~g3));

/*
({Out.ar(~bus10A/*~bus11A*/,



	/*BHiPass4.ar(In.ar(~bus1A  ),

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

		,0.3)*/

	SelectX.ar(In.kr(~busC27),[

BHiPass4.ar(In.ar(~bus3A  ),


	SinOsc.kr(
		SinOsc.kr(0.4).range(0.4,18)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

	,0.3)

	,


		BLowPass4.ar(In.ar(~bus3A),	SinOsc.kr(~hz1beat).range(100,3000),0.5),

		BBandPass.ar(In.ar(~bus3A  ),SinOsc.kr(~hz1beat/4).range(-100,100)+SinOsc.kr(~hz1beat).range(700,2200)+SinOsc.kr(~hz1beat*7.3,2.4).range(-550,400),0.6)
	])



)}.play(target:~g4));


*/
*/


// Synth(\flanger1,[\fdback,0.45,\in,~bus11A,\out,~bus10A,\which,~busC12,\flangefreq,~busC17],~g2,);
//gate below

/*Pchain(
    ~swingify,*/
Pwrand([

	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],1) ,    \group,~g5, \out,~bus4A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pfunc({0.7.exprand(0.4,1)})/*Pkey(\vlSub)*/,\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),


/*	Prand([
	Pbind(\instrument, \gate ,\in,~bus10A ,\type,Pseq([\note,\rest],inf),\group,~g5, \out,~bus4A,\dur,Pseq([1/8],4)),

		Pbind(\instrument, \gate ,\in,~bus10A ,\type,Pseq([\note,\rest],inf),\group,~g5, \out,~bus4A,\dur,Pseq([1/8],8))],1),*/

Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Prand([Pseq([0.75],1),Pseq([1.5],1)],1),    \group,~g5, \out,~bus4A,
	\atkT,1,
	\decT,0,
	\subsT,0,
	\relT,0,
	\atckC,Pfunc({(4).exprand(0.1)}),
\vlAtk ,0),

	/*Pbind(\instrument, \gate ,\in,~bus10A  ,\dur,Pseq([1/12],12),\group,~g5, \out,~bus4A,\type,Pseq([\note,\rest],inf)),*/

	Pbind(\instrument, \gateX ,\in,~bus10A  , \dur,Pseq([1],1),\group,~g5,\out,~bus4A)

/*	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pseq([1/4],8)  ,\type,Pseq([\note,\rest],inf),    \group,~g3, \out,~bus4A,
		\vlSub,0/*Pfunc({0.7.exprand(0.4,1)})*/,\vlSub2,Pkey(\vlSub),
	\decT,1/*Pfunc({0.6.exprand(0.8,0.3)})*/,
	\subsT,0/*Pfunc({0.2.exprand(0.1)})*/,

	\decC,(-4)/*Pfunc({(-4).exprand(-0.1)}),*/
	/*\vlAtk ,Pfunc({1.00.exprand(0.01)}) */ ),*/



/*	//rythm gate

	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pseq([1/4],16)  ,\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf),    \group,~g3, \out,~bus4A,
		\vlSub,0/*Pfunc({0.7.exprand(0.4,1)})*/,\vlSub2,Pkey(\vlSub),
	\decT,1/*Pfunc({0.6.exprand(0.8,0.3)})*/,
	\subsT,0/*Pfunc({0.2.exprand(0.1)})*/,

	\decC,(-4)/*Pfunc({(-4).exprand(-0.1)}),*/
	/*\vlAtk ,Pfunc({1.00.exprand(0.01)}) */ ),

	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pseq([1/8],16)  ,\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf),    \group,~g3, \out,~bus4A,
		\vlSub,0/*Pfunc({0.7.exprand(0.4,1)})*/,\vlSub2,Pkey(\vlSub),
	\decT,1/*Pfunc({0.6.exprand(0.8,0.3)})*/,
	\subsT,0/*Pfunc({0.2.exprand(0.1)})*/,

	\decC,(-4)/*Pfunc({(-4).exprand(-0.1)}),*/
	/*\vlAtk ,Pfunc({1.00.exprand(0.01)}) */ )*/

],[16,1,3/*,2,2,2,2,2*/].normalizeSum,inf)


	// ,(swingBase: 3.217, swingAmount: 1.045, swingThreshold: 0.249293)
// (swingBase: 4.00.rand.postln, swingAmount: 1.00.rand.postln, swingThreshold: 0.5.rand.postln)
/*)*/.play(t);



/*.play(t);*/




// Pbind(\instrument, \gateX ,\in,~bus10A  , \dur,Pseq(~dur,inf),\group,~g3).play(t);


/*({Out.ar(~bus4A,In.ar(~bus10A)*EnvGen.kr(Env([0,1,0],[t.beatDur/3,t.beatDur/3,t.beatDur/3],[5,8,5])))}.play(target:~g3));*/


/*Synth(\reverb,[\in,~bus4A,\out,~bus5A,\mix,~bmix,\room,~broom,\damp,~bdamp,\ctrl,~bus4A],~g6,\addAfter);*/


~w=Synth(\stereo,[\spread,~bspread,\center,~bcenter,\dlt1,~bdlt1,\str,~bdlt2,\decT,~bdecT,\in,/*~bus5A*/~bus4A/*~bus10A*//*~bus1A*/,\which,~bwhichS,\out,0/*~bus7A*/],~g7);


/*({Limiter.ar(In.ar(~bus7A,2),})*/

// ~gg= Synth(\limiter,[\in,~bus7A,\out,~bus13A,\gain,440],~w,\addAfter);


/*
Pwrand([
	Pbind(\instrument,\rien,\dur,Pseq([1],1)),
	Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus8A,\dur,Pseq([2],1)),

		Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus9A,\dur,Pseq([1],1)
	)



],[256,1,4].normalizeSum
,inf).play(t);*/


/*Pbind(\instrument, \gate2,\group,~g6,\in,~bus13A ,\out,~bus8A,\dur,Pseq([1],inf),\out,~busC20).play(t);*/

/*Synth(\gate2,[\in,~bus7A/*~bus13A*/ ,\which,~busC20],~g8);
// Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus9A,\dur,9).play(t);

x=({Out.ar(0/*~bus14A*//*~bus15A*/,Splay.ar( VerbEF.ar(In.ar(~bus9A,2),


	2.7,0.5,2000,6000,0.025,2.2*In.kr(~busC25)
)))}.play(target:~g7));*/


	/*Pbind(\instrument, \gate ,\in,~bus12A   ,\vlDec,1,
	\dur,Pxrand([Pseq([1/4],4),    Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],inf) ,    \group,~g8, \out,0,\type,Pseq([\note,\rest],inf)).play(t);*/



/* d = Synth(\tapedly, [\in, ~bus8A, /*\dlytime, 0.333,*/ \fb, 0.5, \wet, 1.0,\decT,(-0.5)
 , \modS,~bmodS , \f1,~bf1 , \modT, ~bmodT, \f2, ~bf2, \modSa,~bmodSa , \f3, ~bf3, \modR, ~bmodR, \fr, ~bfr,\which,~busC26,\out,~bus14A,\combMod,~busC8,\gate,~busC24],~g9);
 d.set(\dlytime, ~busC21, \fb, 0.9,\wet, 1.0,\fc, 5000);*/


// Synth(\limiter,[\in,~bus14A,\out,0,\gain,340],~g10);

// Synth(\limiter,[\in,~bus15A,\out,0,\gain,70],~g8);
/*
*/

)


(
{
loop({
    play({
        Pan2.ar(Klang.ar(`[ Array.rand(12, 200.0, 2000.0), nil, nil ], 1, 0), 1.0.rand)
             * EnvGen.kr(Env.sine(32), 1, 0.02, doneAction: Done.freeSelf);
    });
    2.wait;
})
}.fork;
)
s.plotTree

({

	FreqShift.ar(


	VerbEF.ar(
	Decimator.ar( Saw.ar(LFNoise0.kr(0.3).range(60,400),
				EnvGen.kr(Env.perc(releaseTime: t.beatDur))/**Dust.kr(1.2)*/

				// Impulse.kr(1.2)


		),

			600.rrand(300),20.rand),12.rand,0.2),LFTri.kr(0.0001,2).range(1600,-1600),4)
}.play)



({VerbEF.ar( Saw.ar([55.midicps*(432/440),70.midicps*(432/440),84.midicps*(432/440)],
	EnvGen.kr(Env.perc)),60,0.5)
}.play)



({
	VerbEF.ar(
	FreqShift.ar(

		AllpassL.ar(

	Decimator.ar( Saw.ar(LFNoise0.kr(0.3).range(60,400)+2600,
				EnvGen.kr(Env.perc(releaseTime: t.beatDur))/**Dust.kr(1.2)*/

				// Impulse.kr(1.2)


		),

			600.rrand(300),20.rand)

			,delaytime: 0.24,decaytime: 50,mul: Line.kr(1,50,40)),

			LFTri.kr(0.001,2).range(3600,-3600),4),12.rand,0.2)
}.play)


({
Splay.ar(

	 AllpassN.ar(


	SinOsc.ar(79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440),mul: 3000000*

			Line.kr(0,0.1,30)))

			,0.968,SinOsc.kr(0.08,2,0.01,0.01),-0.5))
}.play)




({
Splay.ar(

	 AllpassN.ar(


	SinOsc.ar(79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440),mul: 30000000*

			Line.kr(0.06,0.1,70)))

			,0.968,SinOsc.kr(0.008,2,0.01,0.01),-0.5))
}.play)


({SinOsc.ar(79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)/10,mul: 40000/10*

			Line.kr(0,1,30))

			,mul: 30000*

			Line.kr(0,0.1,30)))}.play)





({SinOsc.ar(79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)/10,mul: 30000/10)

			,mul: 30000))}.play)


===the idea==


({
	BBandPass.ar(
	SinOsc.ar(79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)+
		SinOsc.ar(	79.midicps*(432/440)/10,mul: 30000/10)

				,mul: 30000*

				// LFTri.kr(0.08).range(0.2,1)

				EnvGen.kr(Env([0.2,1,0.2],[4,4,4]) )
		)),
		MouseY.kr(50,3000)


		,0.5)}.play)

