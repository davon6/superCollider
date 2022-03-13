
new

~qAu1= Bus.audio(s,1);
~qAu2= Bus.audio(s,1);
~qAu3= Bus.audio(s,1);





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

~bspread=Bus.control(s);~bcenter=Bus.control(s);~bdlt1=Bus.control(s);~bdlt2=Bus.control(s);~bdecT=Bus.control(s);~bwhichS=Bus.control(s);


~bmix=Bus.control(s);~broom=Bus.control(s);~bdamp=Bus.control(s);

(

	SynthDef(\flanger1, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0,flangMod,ph=0, which;

		var input, effect,phaser;

		input=In.ar(in,1);

		input= input+ LocalIn.ar(1);

	effect= DelayN.ar(input,0.02,SinOsc.kr(In.kr(flangefreq),ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);




	phaser=In.ar(in,1)+ AllpassN.ar(In.ar(in,1) ,0.968,SinOsc.kr(flangefreq,ph,0.01,0.01),-0.5)*0.4;



	Out.ar(out,SelectX.ar(In.kr(which),[In.ar(in).round(2**(-16)),effect.round(2**(-16)),phaser.round(2**(-16))]));
	}).add;



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




	SynthDef(\limiter, {|in, out = 0,gain=1,vol =1, du =0.01,rel=0.8, atk =0.01 ,thr= 0.001,sB =1,sA= 0.05|

		Out.ar(out , CompanderD.ar(In.ar(in,2),thr, sB ,sA, atk, rel)* gain;)
	}).add;


SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=(-1500),rH=1500, which=0 ,width|var sine,noi,squa;


	sine = SinOsc.kr(val,ph*6).range(rL,rH);

	noi = LFNoise0.kr(val).range(rL,rH);/*GrayNoise.kr(val).range(-1000,1000);*/


	squa = LFPulse.kr(val,ph,width).range(rL,rH);


	Out.kr(out,SelectX.kr(In.kr(which),[noi,sine,squa])

		*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2))}).add;



	SynthDef(\lfoPerc, {|out, valA,valD,lvl,crv| Out.kr(out,EnvGen.kr(Env.perc(valA,valD,lvl,crv),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc, {|out=0,freq=  90.816812847401
/* 42.midicps*(432/440) *//*161.81716430268*/ ,mratio,freq4/*(52.midicps*(432/440))*/,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1,which,clip,skew,pitch,lfoP, melo,seed = 123,/* amp=0.2,*/ sustain=1,fmMod,fmMod2|var sig, sig2, sig3, sig4,sig5, sig6,mod,mod2,carrier, op1, op2,inX,
	 modX, car;


	mod2 = SinOsc.ar(  In.kr(freq2)/10 ,mul:  In.kr(mul2)/10);

	mod = SinOsc.ar( In.kr(freq2) +mod2,mul:In.kr(mul2));

	sig3 = Squine.ar( freq/*+ mod */+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew )+ mod ,/*initphase: mod.wrap(0, 16pi)*/ );


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
	modX = SinOsc.ar(Lag.kr( In.kr(freq2),0.2)) * Lag.kr( In.kr(mratio),0.2) * Lag.kr( In.kr(freq2),0.2) * Lag.kr( In.kr(mratio),0.2) * \index.kr(5);
	car = SinOsc.ar([Lag.kr( In.kr(freq2),0.2) * modX * inX[1], Lag.kr( In.kr(freq2),0.2) + modX + inX[0]]);
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

	Squine.ar(/* freq+*/In.kr(pitch)/*+In.kr(lfoP)*//*+In.kr(melo) */+

LFNoise2.kr(15).range(50,600)
		// SinOsc.kr(0.3).range(30,2000)
		,In.kr(clip),/*In.kr(skew )*/1 );

	// sig5 = WhiteNoise.ar;



	sig5 = SinOsc.ar(In.kr(freq2)+
	SinOsc.ar(In.kr(freq2)+


		SinOsc.ar(In.kr(freq2)/10,mul: In.kr(fmMod2)/10),mul:/* SinOsc.kr(0.6).range(0, 3000)  */

			In.kr(fmMod)
	)-In.kr(lfoP));

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf, Select.ar(In.kr(which),[ sig,In.ar(~qAu2)/*sig2*1.8*/,sig3,sig4,sig5])   )) * amp );


/*	Out.ar(sig3)*/

}).add;


SynthDef(\comb1, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR,which |

Out.ar(out,SelectX.ar(In.kr(which),[ BufCombN.ar(~b3.bufnum, In.ar(in,1),

/*			+ (In.kr(busMod,1)*fx)*/

		 (SinOsc.kr(In.kr(modS),phase: 3,add: 0).range(0.000000001, 0.001)* In.kr(f1))
		+ (LFTri.kr(In.kr(modT)).range(0.000000001, 0.001) *In.kr(f2))
		+ (Saw.kr(In.kr(modSa)).range(0.000000001, 0.001) * In.kr(f3))
		+ /*(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*In.kr(fr)))*/

		(LFDNoise0.kr(In.kr(modR).range(0.0008,0.00008)*1/*In.kr(fr)*/))


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


			// In.ar(in, 1),

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
			BPeakEQ.ar(	BPeakEQ.ar(In.ar(in, 1),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),val5,shelf2, gain5),

		frq),frq),frq),frq),frq),frq),frq),frq)* vol,




			In.kr( mix), // mix 0-1
			In.kr( room), // room 0-1
			In.kr( damp) // damp 0-1 duh
        ))}).add;


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

~dur;



~dur=Pseq(~dur.scramble,1);

~dur=[~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur/4,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur,~dur*4,~dur*4,~dur*4,~dur*4,~dur*16].scramble;

)




~dur =~dur/4



~dur=[3,2,7,1,3].scramble


if(~timeLeft ==0,{},{

	~time.rand;

	~timeLeft =

})



(
var nearestEven, nearestOdd, vps;

nearestEven = {
	arg val;
	var val_floor, val_ceil, res, distance;
	val_floor = val.floor;
	val_ceil = val.ceil;
	res = Select.ar(val % 2,
		[ val_floor, val_ceil ],
	);
	distance = (val - res).abs;
	[ res, distance ];
};

nearestOdd = {
	arg val;
	var val_floor, val_ceil, res, distance;
	val_floor = val.floor;
	val_ceil = val.ceil;
	res = Select.ar(val + 1 % 2,
		[ val_floor, val_ceil ],
	);
	distance = (val - res).abs;
	[ res, distance ];
};

vps = { |trig, freq, horizontal, vertical|
	var vertical_even = nearestEven.(vertical);
	var vertical_odd = nearestOdd.(vertical);
	var cos, phasor, sig;
	vertical = [vertical_even[0], vertical_odd[0]];
	phasor = Phasor.ar(Impulse.ar(trig), freq/2 * SampleDur.ir, horizontal.neg, 1-horizontal, horizontal.neg);
	phasor = phasor.bilin(0, horizontal.neg, 1-horizontal, vertical, 0, 1);
	cos = (phasor * 2pi).cos.neg;
	sig = XFade2.ar(cos[0], cos[1], vertical_even[1] * 2 - 1);
	sig = LeakDC.ar(sig);
	Out.ar(~qAu2,sig);
};

{
	var freq = \freq.kr(42.midicps*(432/440));
	var horizontal = LFNoise1.kr(5).range(0.01,0.99);
	var vertical = K2A.ar(LFNoise1.kr(5).range(1.0,10.0));
	var sig = vps.(0, freq,  horizontal, vertical);
	// sig!2 * 0.1;
}.play(fadeTime: 0,target:~g1);
)

(
~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g4=Group.after(~g3);
~g5=Group.after(~g4);
~g6=Group.after(~g5);
~g7=Group.after(~g6);
~g8=Group.after(~g7);
// 1800
Ppar([
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({/*(76.midicps*(432/440)).rrand(0)*/4000.rrand(20)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(76.midicps*(432/440))}),\group,~g1,\out,~busC2),
	// Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({5.rand}),\group,~g1,\out,~busC5),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(0.2)}),\group,~g1,\out,~busC6),

Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1.0).rrand(-1)}),\group,~g1,\out,~busC7),





	// 1400
	Pbind(\instrument,\lfoEnvPitch, \strt,Pfunc({76.midicps*(432/440)}), \crv,Pfunc({13.rand}), \pol, Pfunc({(-1).rrand(1)}),\dec, Pfunc({61.00.rand}),\decL,Pfunc({(-0.2).rrand(0.4)}),\loop,1/* Pfunc({2.rand})*/, \out,~busC8,\dur,Pseq(~dur,inf),\group,~g1),


	Pbind(\instrument, \lfo, \dur,Pseq(~dur,inf),\val,Pfunc({22.rand}),\group,~g1,\out,~busC9,\which,Pfunc({2.rand}),\rL,Pfunc({(-3000).rand}),\rH,Pfunc({3000.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),


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



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({46.rand}),\group,~g1,\out,~bmodS),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({46.rand}),\group,~g1,\out,~bmodT),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({46.rand}),\group,~g1,\out,~bmodSa),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({26.rand}),\group,~g1,\out,~bmodR),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf1),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf2),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bf3),
Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bfr),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pwrand([0,1],[1,4].normalizeSum,inf),\group,~g1,\out,~busC1),




	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({1.00.rand}),\group,~g1,\out,~bspread),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(-0.6)}),\group,~g1,\out,~bcenter),


	Prand([
		Ppar([
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.3)}),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.4.rrand(0.3)}),\group,~g1,\out,~bdlt2),
		],1),


		Ppar([
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.02.rrand(0.05)}),\group,~g1,\out,~bdlt1),
			Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.02.rrand(0.05)}),\group,~g1,\out,~bdlt2),
		],1)
	],1),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.00655.rand(0.012)}),\group,~g1,\out,~bdecT),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand})/*Pwrand([1,0],[1,8].normalizeSum,inf)*/,\group,~g1,\out,~bwhichS),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.3.rrand(0.05)}),\group,~g1,\out,~bmix),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.6.rrand(0.05)}),\group,~g1,\out,~broom),
	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({0.3.rrand(0.05)}),\group,~g1,\out,~bdamp),



	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand}),\group,~g1,\out,~bus6W),

		Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({3.rand}),\group,~g1,\out,~busC12),


	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({2.rand}),\group,~g1,\out,~busC13),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1/8).rrand( 8)}),\group,~g1,\out,~busC14),

	Pbind(\instrument, \lfoStep, \dur,Pseq(~dur,inf),\val,Pfunc({(1/16).rrand( 4)}),\group,~g1,\out,~busC17),

	// SinOsc.kr(0.6).range(0, 3000)
	Pbind(\instrument, \lfo,\val,Pfunc({(1/8).rrand( 8)}), \dur,Pseq(~dur,inf),\group,~g1,\out,~busC15,\rL,0,\rH,Pfunc({3000.rand}),\which,Pfunc({3.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),
	Pbind(\instrument, \lfo,\val,Pfunc({(1/8).rrand( 8)}), \dur,Pseq(~dur,inf),\group,~g1,\out,~busC16,\rL,0,\rH,Pfunc({3000.rand}),\which,Pfunc({3.rand}),\width,Pfunc({1.00.rand}),\ph,Pfunc({1.00.rand})),




],1).play(t);



 ~ye= Synth( \osc,[\out,~bus2A,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3,\which,~busC5,\clip,~busC6,\skew, ~busC7,\pitch, ~busC8,\lfoP,~busC9,\melo,~busC10,\mratio,~busC14,\fmMod,~busC15,\fmMod2,~busC16],~g1,addAction: 'addAfter');

~v =  Synth(\comb1,[ \in, ~bus2A,\out,~bus1A   ,\maxDel,0.7744,\decT,(-0.5)
, \modS,~bmodS , \f1,~bf1 , \modT, ~bmodT, \f2, ~bf2, \modSa,~bmodSa , \f3, ~bf3, \modR, ~bmodR, \fr, ~bfr,
\which,~busC1
],~ye,\addAfter);



// ~d=	({Out.ar(~bus1A,Balance.ar(In.ar(~bus6A),SinOsc.ar(mul: 0.5)))}.play(target:~v,addAction:\addAfter));


~fi=({Out.ar(~bus3A,



	/*BHiPass4.ar(In.ar(~bus1A  ),

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

		,0.3)*/


BHiPass4.ar(In.ar(~bus1A  ),


	SinOsc.kr(
		SinOsc.kr(0.4).range(0.4,18)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

	,0.3)



)}.play(target:~v, addAction: \addAfter));


({Out.ar(~bus11A,SelectX.ar(In.kr(~busC13),[In.ar(~bus3A),FreqShift.ar(In.ar(~bus3A),

	LFTri.kr(

		LFTri.kr(~hz1beat/256,3).range(~hz1beat/16,~hz1beat)

		,11).range((-2400),2400))]))}.play(target:~fi, addAction: \addAfter));




Synth(\flanger1,[\fdback,0.45,\in,~bus11A,\out,~bus10A,\which,~busC12,\flangefreq,~busC17],~g2,);



Pwrand([

	Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],1) ,    \group,~g3, \out,~bus4A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),


	Prand([
	Pbind(\instrument, \gate ,\in,~bus10A ,\type,Pseq([\note,\rest],inf),\group,~g3, \out,~bus4A,\dur,Pseq([1/8],16)),

		Pbind(\instrument, \gate ,\in,~bus10A ,\type,Pseq([\note,\rest],inf),\group,~g3, \out,~bus4A,\dur,Pseq([1/8],8))],1),

Pbind(\instrument, \gate ,\in,~bus10A   ,\vlDec,1,
	\dur,Pseq([1/1],1),    \group,~g3, \out,~bus4A,
	\atkT,1,
	\decT,0,
	\subsT,0,
	\relT,0,
	\atckC,Pfunc({(4).exprand(0.1)}),
\vlAtk ,0),

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

],[16,1,3/*,2,2,2*/].normalizeSum,inf).play(t);


/*.play(t);*/





Synth(\reverb,[\in,~bus4A,\out,~bus5A,\mix,~bmix,\room,~broom,\damp,~bdamp],~g4,\addAfter);


~w=Synth(\stereo,[\spread,~bspread,\center,~bcenter,\dlt1,~bdlt1,\dlt2,~bdlt2,\decT,~bdecT,\in,~bus5A,\which,~bwhichS,\out,~bus7A],~g5);


/*({Limiter.ar(In.ar(~bus7A,2),})*/

~gg= Synth(\limiter,[\in,~bus7A,\out,0,\gain,80],~w,\addAfter);


Pwrand([
	Pbind(\instrument,\rien,\dur,Pseq([1],1)),
	Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus8A,\dur,Pseq([2],1)),

		Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus9A,\dur,Pseq([1],1)
	)



],[256,1,4].normalizeSum
,inf).play(t);


// Pbind(\instrument, \gate2,\group,~g6,\in,0 ,\out,~bus9A,\dur,9).play(t);

x=({Out.ar(0/*~bus12A*/,Splay.ar( VerbEF.ar(In.ar(~bus9A,2),


	6,0.9,2000,6000,0.025
)))}.play(target:~g7));


	/*Pbind(\instrument, \gate ,\in,~bus12A   ,\vlDec,1,
	\dur,Pxrand([Pseq([1/4],4),    Pseq([1/1],1),/*,Pseq([2/1],1)*/Pseq([1/1],2) ],inf) ,    \group,~g8, \out,0,\type,Pseq([\note,\rest],inf)).play(t);*/



d = Synth(\tapedly, [\in, ~bus8A, \dlytime, 0.333, \fb, 0.5, \wet, 1.0],~g7);
d.set(\dlytime, 0.1, \fb, 0.8,\wet, 1.0,\fc, 5000);



)


(
{
loop({
    play({
        Pan2.ar(Klang.ar(`[ Array.rand(12, 200.0, 2000.0), nil, nil ], 1, 0), 1.0.rand)
             * EnvGen.kr(Env.sine(16), 1, 0.02, doneAction: Done.freeSelf);
    });
    2.wait;
})
}.fork;
)
