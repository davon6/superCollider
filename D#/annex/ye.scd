
new

	SynthDef(\rien,{|dur=1|EnvGen.kr(Env.step([1,0],[ dur,0]),timeScale: t.beatDur,doneAction: 2)}).add;

	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;

SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5),time=4| Out.kr(out,	EnvGen.kr(Env([valP1,valP2,valP1],[dur/time,0,0],[crv,0,0],0,3),Impulse.kr(imp)*

	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
	,timeScale: t.beatDur,doneAction: 0))}).add;


SynthDef(\lfoEnvPitch,{|out,strt,loop,val,pol,dec, decL, crv=7,dur|var sig1,sig2;

	sig1 = XLine.kr(start: strt, end: 0, dur: dec);
	sig2 = Saw.kr(val,mul: pol,add: decL).lincurve(-1,1,-1,1,crv).range(strt,0);

	Out.kr(out,SelectX.kr(loop,[sig1,sig2])

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2));

}).add;

(
SynthDef(\tapedly, {
	|in=0, out=0,fb=0.6, fc=5000, dlytime=0.125, wet=0.5, pan=0.0|
	var local, sig, delayed, phi, phR, phP, freq;
	var tdbh; // time delay between heads (seconds)
	local = LocalBuf(SampleRate.ir * 3, 1);
	local.clear; // clear the buffer

	tdbh = 0.125;
	phi = (2 * tdbh) / BufDur.ir(local);
	freq = 1.0 / BufDur.ir(local); // frequency to playback the buffer at rate 1
	freq = (freq * tdbh) / VarLag.kr(dlytime, 2, warp:\linear);
	phR = LFSaw.ar( freq, phi, 0.5, 0.5)*BufFrames.kr( local );
	phP = LFSaw.ar( freq, 0.0, 0.5, 0.5)*BufFrames.kr( local );

	sig = Mix.ar(In.ar(in,2));
	delayed = BufRd.ar(1, local, phP, loop:1);
	delayed = delayed.tanh;
	BufWr.ar( LPF.ar( (sig + delayed), fc, mul:fb), local, phR, loop:1);
	pan = LFNoise1.ar(5);
	Out.ar(out, Pan2.ar(delayed*wet, pan));
}).add;
)



	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;


SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=(-1500),rH=1500, which=0 |var sine,noi;


	sine = SinOsc.kr(val,ph).range(rL,rH);

	noi = LFNoise0.kr(val).range(rL,rH);



	Out.kr(out,SelectX.kr(In.kr(which),[noi,sine])

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2))}).add;



	SynthDef(\lfoPerc, {|out, valA,valD,lvl,crv| Out.kr(out,EnvGen.kr(Env.perc(valA,valD,lvl,crv),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc, {|out=0,freq=   161.81716430268 /*(52.midicps*(432/440))*/,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1,which,clip,skew,pitch,lfoP, melo,seed = 123,/* amp=0.2,*/ sustain=1|var sig, sig2, sig3, sig4,mod,mod2,carrier, op1, op2;


	mod2 = SinOsc.ar(  In.kr(freq2)/10 ,mul:  In.kr(mul2)/10);

	mod = SinOsc.ar( In.kr(freq2) +mod2,mul:In.kr(mul2));

	sig3 = Squine.ar( freq/*+ mod */+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew )+ mod ,/*initphase: mod.wrap(0, 16pi)*/ );




	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);

	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:1/*In.kr(mul2)/10*/);

	sig2 = Squine.ar( freq+In.kr(pitch)+In.kr(lfoP)+ In.kr(melo) + mod2,In.kr(clip),In.kr(skew) )+mod;




	mod2 = Squine.ar(  In.kr(freq3)+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew ) ,mul:  1);

	mod = Squine.ar( In.kr(freq2)+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew ),mul:1/*In.kr(mul2)/10*/);

	sig = Squine.ar( freq+In.kr(pitch)+In.kr(lfoP)+In.kr(melo)    ,In.kr(clip),In.kr(skew ) )+mod+mod2;





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

	Squine.ar(/* freq+*/In.kr(pitch)+In.kr(lfoP)/*+In.kr(melo) */+


		SinOsc.kr(0.3).range(30,2000)
		,In.kr(clip),In.kr(skew ) );

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf, Select.ar(In.kr(which),[ sig,sig2*0.62,sig3,sig4])   )) * amp );

}).add;


SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR,which |

Out.ar(out,SelectX.ar(In.kr(which),[ BufCombN.ar(~b3.bufnum, In.ar(in,1),

/*			+ (In.kr(busMod,1)*fx)*/

		 (SinOsc.kr(In.kr(modS),phase: 3,add: 0).range(0.000000001, 0.001)* In.kr(f1))
		+ (LFTri.kr(In.kr(modT)).range(0.000000001, 0.001) *In.kr(f2))
		+ (Saw.kr(In.kr(modSa)).range(0.000000001, 0.001) * In.kr(f3))
		+ /*(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/

		(WhiteNoise.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))


		,decT ,amp),In.ar(in,1)])  )}).add;

SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1,which|

	Out.ar(out,SelectX.ar(In.kr(which), [Pan2.ar(	In.ar(in, 1)), Splay.ar({

			CombN.ar(
			In.ar(in, 1), mxDel, [In.kr(dlt1),In.kr(dlt2)], In.kr(decT))

},In.kr(spread),level,In.kr(center))]))}).add;

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
		 FreeVerb.ar(




		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        ))}).add;



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

~dur=[3,2,7,1,3].scramble


if(~timeLeft ==0,{},{

	~time.rand;

	~timeLeft =

})

~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g4=Group.after(~g3);
~g5=Group.after(~g4);
~g6=Group.after(~g5);

Ppar([
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC2),
	// Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({4.rand}),\group,~g1,\out,~busC5),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(0.2)}),\group,~g1,\out,~busC6),

Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(-1)}),\group,~g1,\out,~busC7),




/*	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({-1400.rrand(1400)}),\out,~busC8,\imp,/*Pfunc({9.65.rand})*/Prand([9.65.rrand(8),9.65,0]),\crv,Pfunc({-12.rand}),\time,Pfunc({4.00.rrand(1)}),\group,~g1),*/

	Pbind(\instrument,\lfoEnvPitch, \strt,Pfunc({1400.rand}), \crv,Pfunc({13.rand}), \pol, Pfunc({(-1).rrand(1)}),\dec, Pfunc({61.00.rand}),\decL,Pfunc({(-0.2).rrand(0.4)}),\loop, Pfunc({2.rand}), \out,~busC8,\dur,Pseq(~dur,inf),\group,~g1),


	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({22.rand}),\group,~g1,\out,~busC9,\which,Prand([1,0],inf)),


		Pbind(\instrument, \lfoStep,\out, ~seqBus, \val,Pfunc({

		Scale.chromatic(\just).degreeToFreq(7.rand, 38.midicps, 2)*(432/440)
/*	Scale.chromatic(\just).degreeToFreq(7.rand, 38.midicps, 2),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -22),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -21),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20),
Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -20)*/

	}),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\group,~g1,\out,~busC10),



	Pbind(\instrument, \lfoPerc, \dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16),Pseq([1],1)],inf),\val,Pfunc({(-1.0).rrand(1.0)}),\group,~g1,\out,~busC11,\valA,Pfunc({t.beatDur.rand}),\valD,Pfunc({t.beatDur.rand}),\lvl,Pfunc({(-65).rrand(700)}),\crv,Pfunc({(-6).rrand(6)}),),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({26.rand}),\group,~g1,\out,~bmodS),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({26.rand}),\group,~g1,\out,~bmodT),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({26.rand}),\group,~g1,\out,~bmodSa),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({6.rand}),\group,~g1,\out,~bmodR),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf1),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf2),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf3),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bfr),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pwrand([0,1],[1,4].normalizeSum,inf),\group,~g1,\out,~busC1),




	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bspread),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(-0.6)}),\group,~g1,\out,~bcenter),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.05)}),\group,~g1,\out,~bdlt1),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.05)}),\group,~g1,\out,~bdlt2),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.00655.rand(0.012)}),\group,~g1,\out,~bdecT),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand})/*Pwrand([1,0],[1,8].normalizeSum,inf)*/,\group,~g1,\out,~bwhichS),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.3.rrand(0.05)}),\group,~g1,\out,~bmix),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(0.05)}),\group,~g1,\out,~broom),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.3.rrand(0.05)}),\group,~g1,\out,~bdamp),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand}),\group,~g1,\out,~bus6W)


],1).play(t);



 ~ye= Synth( \osc,[\out,~bus2A,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3,\which,~busC5,\clip,~busC6,\skew, ~busC7,\pitch, ~busC8,\lfoP,~busC9,\melo,~busC10],~g1,addAction: 'addAfter');

~v =  Synth(\comb1,[ \in, ~bus2A,\out,~bus1A   ,\maxDel,0.7744,\decT,(-0.5)
, \modS,~bmodS , \f1,~bf1 , \modT, ~bmodT, \f2, ~bf2, \modSa,~bmodSa , \f3, ~bf3, \modR, ~bmodR, \fr, ~bfr,
\which,~busC1
],~ye,\addAfter);



// ~d=	({Out.ar(~bus1A,Balance.ar(In.ar(~bus6A),SinOsc.ar(mul: 0.5)))}.play(target:~v,addAction:\addAfter));


{Out.ar(~bus3A,

	/*/*SelectX.ar(In.kr(~bus6W),[*/
	BHiPass4.ar(In.ar(~bus1A  ),  /*+MouseY.kr(100,2500)*/

	 SinOsc.kr( LFTri.kr( ~hz1beat/4).range(~hz1beat/4,~hz1beat)).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

			,0.3),*/


	BHiPass4.ar(In.ar(~bus1A  ),

	/*SinOsc.kr( LFTri.kr(





		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat/8,~hz1beat*8)).range(~hz1beat*64,~hz1beat*1024)*/

		SinOsc.kr( /*LFTri.kr( */





		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
/*	).range(~hz1beat/8,~hz1beat*8)*/).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

		,0.3)

	/*	BLowPass4.ar( In.ar(~bus1A  ),SinOsc.kr(~hz1beat).range(50,2600),0.6)*3])*/



)}.play(target:~v, addAction: \addAfter);



	Pbind(\instrument, \gate ,\in,~bus3A   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),Pseq([2/1],1) ],inf) ,    \group,~g2, \out,~bus4A,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
).play(t);


Synth(\reverb,[\in,~bus4A,\out,~bus5A,\mix,~bmix,\room,~broom,\damp,~bdamp],~g3,\addAfter);


~w=Synth(\stereo,[\spread,~bspread,\center,~bcenter,\dlt1,~bdlt1,\dlt2,~bdlt2,\decT,~bdecT,\in,~bus5A,\which,~bwhichS,\out,~bus7A],~g4);


/*({Limiter.ar(In.ar(~bus7A,2),})*/

~gg= Synth(\limiter,[\in,~bus7A,\out,0,\gain,80],~w,\addAfter);


Pwrand([
	Pbind(\instrument,\rien,\dur,Pseq([1],1)),
	Pbind(\instrument, \gate2,\group,~g5,\in,0 ,\out,~bus8A,\dur,Pseq([2],1)),

		Pbind(\instrument, \gate2,\group,~g5,\in,0 ,\out,~bus9A,\dur,Pseq([1],1)
	)



],[256,1,6].normalizeSum
,inf).play(t);

/*x=({VerbEF.ar(0,In.ar(~bus8A,2),


	5.5,0.09,2000,6000,0.025
)!2}.play()*/


x=({Out.ar(0,Splay.ar( VerbEF.ar(In.ar(~bus9A,2),


	10.5,0.9,2000,6000,0.025
)))}.play(target:~g6));



d = Synth(\tapedly, [\in, ~bus8A, \dlytime, 0.333, \fb, 0.5, \wet, 1.0],~g6);
d.set(\dlytime, 0.1, \fb, 0.8,\wet, 1.0,\fc, 5000)
