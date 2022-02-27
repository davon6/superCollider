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
	mod2 = SinOsc.ar( freq/10+ (In.kr(moduxx,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorxx ))+(In.kr(~seqBus,1)* factorxx2), mul:freq/10 *iEnv);

	//first level of modulation

		mod = SinOsc.ar( MouseX.kr( freq * mRatio + mod2)

		+ (In.kr(modux,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factorx )),

		mul: MouseY.kr(freq/2,  freq * mRatio *iEnv)
		);

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar(

			(In.kr(modu,1)* EnvGen.kr(Env.adsr(sustainLevel: 1,releaseTime: 0.1),factor ))+(In.kr(secBus,1)* factor2)+

			SelectX.ar(fmCtrl, [In.ar(~phaseBus,1),mod])  /* +( freq * cRatio )*/+ (-124).midicps(*432/440) /*0.00502929687*/ ,MouseY.kr(0,2));


	Out.ar(out, sig);
	Out.ar(out, sig);
	Out.ar(out, sig);

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig    * amp     *env);
}).add;


.......



	SynthDef(\fmX, {
		arg freq= 610,out=0,dur,gate=1,secBus,out1,out2,out3,in2,in1,amp=1,mRatio=1;

	var osc, osc2, osc3, iEnv, sig,env;

		env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (99999  ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
		/*Out.ar(out3, SinOsc.ar( freq/10,

		mul:freq/10 *iEnv));*/

	//first level of modulation

/*	Out.ar(/*~bus2A*/ out2,*/osc2=	SinOsc.ar(freq+2000 + In.ar(in2),

		mul:  freq * mRatio *iEnv)/*)*/;

	//my carrier is a mess but bring interesting outputs

	osc =SinOsc.ar( freq + In.ar(in1)+osc2);
/*
	Out.ar(out3, In.ar(bus3));
	Out.ar(out2, In.ar(bus2));
	Out.ar(out1, In.ar(bus1)); */

	sig = Shaper.ar(~tfBuf,   osc);

	sig  = LeakDC.ar(sig);

	Out.ar(out, sig * amp  *env);
}).add;


~bus1A=Bus.audio(s,1);
// ~bus1A=Bus.control(s,1);
~bus2A=Bus.audio(s,1);
Synth(\fmX,[\in1,~bus1A ,\out2,~bus1A,\in2,~bus2A])


SynthDef(\osc3, {|out=0,freq=610,amp=1,in,gate=1,mul=1|var sig, env;

	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);
	sig = SinOsc.ar( freq/10 ,mul: mul/10);

	Out.ar(out,    sig /** amp */ *env);
}).add;

SynthDef(\osc2, {|out=0,freq=610,amp=1,in,gate=1,dur,mul|var sig, env;

	env = EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: t.beatDur, doneAction: 2);
	sig = SinOsc.ar( freq + In.ar(in),mul:mul/*MouseX.kr(1,6000)*/);

	Out.ar(out,    sig /** amp*/  *env);
}).add;

SynthDef(\osc, {|out=0,freq=610,amp=1,in,gate=1|var sig, env;

	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);
	sig = SinOsc.ar( freq + In.ar(in));

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf,   sig)) * amp  *env);

}).add;


Synth( \osc,[\in,~bus1A],~g2,addAction: 'addAfter')

~bus1A.index
~g1=Group.new;
~g2=Group.after(~g1);


Pbind(\instrument, \osc3,\dur,Pseq([1],inf),\out,Prand([0,~bus2A,~bus1A],inf),\group,~g1,\freq,Pfunc({1800.rrand(1000)}),\mul,Pfunc({6000.rand})).play(t);
Pbind(\instrument, \osc2,\dur,Pseq([1],inf),\out,Prand([0,~bus1A],inf),\freq,Pfunc({1800.rand}),\mul,Pfunc({6000.rand}),\group,~g2,\in,~bus2A).play(t);

x=({Out.ar(~bus1A,SinOsc.ar(mul: 90))}.play)


({Out.ar(0,SinOsc.ar(500,In.ar(~bus1A)))}.play(target:x,addAction:\addAfter))

({EnvGen.kr(Env.step([1,1],[1,0]),timeScale: t.beatDur, doneAction: 2);}.plot(duration:2))





~busC1 =Bus.control(s,1);
~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);
~busC4 =Bus.control(s,1);

~busC5 =Bus.control(s,1);
~busC6 =Bus.control(s,1);

~bus1A=Bus.audio(s,1);
~bus2A=Bus.audio(s,1);
~bus3A=Bus.audio(s,1);




	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc3, {|out=0,freq=610,amp=1,in,gate=1,mul=1|var sig, env;

/*	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);*/
	sig = SinOsc.ar( In.kr(freq)/10 ,mul: In.kr(mul)/10);

	Out.ar(In.kr(out),    sig /** amp  *env*/);
}).add;

SynthDef(\osc2, {|out=0,freq=610,amp=1,in,gate=1,dur,mul=1|var sig, env;

/*	env = EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: t.beatDur, doneAction: 2);*/
	sig = SinOsc.ar( In.kr(freq) + In.ar(in),mul:In.kr(mul));

	Out.ar( In.kr(out),    sig /** amp*/  /**env*/);
}).add;

SynthDef(\osc, {|out=0,freq=610,amp=1,in,gate=1|var sig, env;

	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);
	sig = SinOsc.ar( freq + In.ar(in));

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf,   sig)) * amp  *env);

}).add;


~g1=Group.new;
~g2=Group.after(~g1);


Ppar([
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(1000)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(1000)}),\group,~g1,\out,~busC2),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Prand([~bus3A.index,~bus2A.index,~bus1A.index],inf),\group,~g1,\out,~busC5),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Prand([~bus3A.index,~bus1A.index],inf),\group,~g1,\out,~busC6)


],1).play(t);



h=Synth( \osc3,[\out,~busC5,\freq,~busC4,\mul,~busC3],~g1,addAction: 'addAfter');
x =Synth( \osc2,[\in,~bus2A,\freq,~busC2,\out,~busC6,\mul,~busC3],h,addAction: 'addAfter');
g=Synth( \osc,[\in,~bus1A,\out,~bus3A],x,addAction: 'addAfter');

 Synth(\lim,[\in, ~bus3A,\out,0,\ml,0.1],~g2);

.clip

SynthDef(\lim,{|out=0,ml=0.1,in|Out.ar(out,Balance.ar(In.ar(in),SinOsc.ar(mul: ml)).clip(0,10))}).add;



~busC1 =Bus.control(s,1);
~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);
~busC4 =Bus.control(s,1);

~busC5 =Bus.control(s,1);
~busC6 =Bus.control(s,1);

~bus1A=Bus.audio(s,1);
~bus2A=Bus.audio(s,1);
~bus3A=Bus.audio(s,1);




	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc3, {|out=0,freq=610,amp=1,in,gate=1,mul=1|var sig, env;

/*	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);*/
	sig = SinOsc.ar(  In.kr(freq)/10 ,mul:  In.kr(mul)/10);

	Out.ar(~bus2A,    sig /** amp  *env*/);
}).add;

SynthDef(\osc2, {|out=0,freq=610,amp=1,in,gate=1,dur,mul=1|var sig, env;


	sig = SinOsc.ar( In.kr(freq)+ In.ar(~bus2A.index),mul:1/*In.kr(mul)*/);

	Out.ar(~bus3A In.kr(out),    sig );
}).add;

SynthDef(\osc, {|out=0,freq=610,amp=1,in,gate=1|var sig, env;

	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);
	sig = SinOsc.ar( freq + In.ar(in));

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf,   sig)) * amp  *env);

}).add;


~g1=Group.new;
~g2=Group.after(~g1);


Ppar([
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC2),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,/*Prand([~bus3A.index,*/~bus2A.index/*,~bus1A.index],inf)*/,\group,~g1,\out,~busC5),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Prand([~bus3A.index,~bus1A.index],inf),\group,~g1,\out,~busC6)


],1).play(t);



h=Synth( \osc3,[\out,~busC5,\freq,~busC4,\mul,~busC3],~g1,addAction: 'addAfter');
x =Synth( \osc2,[\in,~bus2A,\freq,~busC2,\out,~busC6,\mul,~busC3],h,addAction: 'addAfter');
g=Synth( \osc,[\in,~bus1A,\out,~bus3A],x,addAction: 'addAfter');

 Synth(\lim,[\in, ~bus3A,\out,0,\ml,0.1],~g2);




XXXXX

	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;


SynthDef(\osc, {|out=0,freq=610,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1|var sig, env,mod,mod2;

		env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);

	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:In.kr(mul2));


	sig = SinOsc.ar( freq + mod);

	Out.ar(~qAu1,  LeakDC.ar(Shaper.ar(~tfBuf,   sig)) * amp  *env);

}).add;


SynthDef(\osc2, {|out=0,freq=610,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1|var sig, env,mod,mod2;

	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);

	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:1/*In.kr(mul2)/10*/);


	sig = SinOsc.ar( freq + mod2);

	Out.ar(~qAu1,  LeakDC.ar(Shaper.ar(~tfBuf,  sig+mod)) * amp  *env);

}).add;

SynthDef(\osc3, {|out=0,freq=610,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1|var sig, env,mod,mod2;


	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq3) ,mul:  1);

	mod = SinOsc.ar( In.kr(freq2),mul:1/*In.kr(mul2)/10*/);

	sig = SinOsc.ar( freq );

	Out.ar(~qAu1,  LeakDC.ar(Shaper.ar(~tfBuf,  sig+mod+mod2)) * amp  *env);

}).add;


~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);


Ppar([
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC2),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,/*Prand([~bus3A.index,*/~bus2A.index/*,~bus1A.index],inf)*/,\group,~g1,\out,~busC5),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Prand([~bus3A.index,~bus1A.index],inf),\group,~g1,\out,~busC6)


],1).play(t);


// Synth( \osc,[\out,~qAu3,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3],~g1,addAction: 'addAfter');

// Synth( \osc2,[\out,~qAu2,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3],~g1,addAction: 'addAfter');

Synth( \osc3,[\out,~qAu1,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3],~g1,addAction: 'addAfter');

 Synth(\lim,[\in, ~qAu1/*~bus3A*/,\out,0,\ml,0.1],~g2);

~qAu1= Bus.audio(s,1);
~qAu2= Bus.audio(s,1);
~qAu3= Bus.audio(s,1);

SynthDef(\lim,{|out=0,ml=0.1,in|Out.ar(out,Balance.ar(In.ar(in


/*MouseY.kr(~qAu1.index,~qAu3.index,).poll*/),SinOsc.ar(mul: ml))/*.clip(0,10)*/)}).add;



Rand.01





XXXXX 2

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

~bus1A=Bus.audio(s,1);
~bus2A=Bus.audio(s,1);
~bus3A=Bus.audio(s,1);

	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;




SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5),time=4| Out.kr(out,	EnvGen.kr(Env([valP1,valP2,valP1],[dur/time,0,0],[crv,0,0],0,3),Impulse.kr(imp)*

	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
	,timeScale: t.beatDur,doneAction: 0))}).add;





SynthDef(\osc, {|out=0,freq=52.midicps*(432/440),freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1,which,clip,skew,pitch |var sig, sig2, sig3, env,mod,mod2;

		env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq2)/10 ,mul:  In.kr(mul2)/10);

	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:In.kr(mul2));


	sig3 = Squine.ar( freq+In.kr(pitch),In.kr(clip),In.kr(skew ) + mod);





	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);

	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:1/*In.kr(mul2)/10*/);


	sig2 = Squine.ar( freq+In.kr(pitch),In.kr(clip),In.kr(skew) + mod2)+mod;






	env = EnvGen.kr(Env.adsr,gate,doneAction: 2);

	mod2 = SinOsc.ar(  In.kr(freq3)+In.kr(pitch) ,mul:  1);

	mod = SinOsc.ar( In.kr(freq2)+In.kr(pitch),mul:1/*In.kr(mul2)/10*/);

	sig = Squine.ar( freq+In.kr(pitch),In.kr(clip),In.kr(skew ) )+mod+mod2;

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf, Select.ar(In.kr(which),[ sig,sig2,sig3])   )) * amp  *env);

}).add;


~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);


Ppar([
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC4),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC3),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC2),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({6000.rand}),\group,~g1,\out,~busC1),



Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Prand([0,1,2],inf),\group,~g1,\out,~busC5),

Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({(1.0).rand}),\group,~g1,\out,~busC6),
Pbind(\instrument, \lfoStep, \dur,Pseq([1],inf),\val,Pfunc({(-1.0).rrand(1.0)}),\group,~g1,\out,~busC7),



	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({-1400.rrand(1400)}),\out,~busC8,\imp,Pfunc({9.65.rand}),\crv,Pfunc({-12.rand}),\time,Pfunc({4.00.rrand(1)})),




],1).play(t);



 Synth( \osc,[\out,~bus1A,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3,\which,~busC5,\clip,~busC7,\skew,~busC6,\pitch, ~busC8],~g1,addAction: 'addAfter');


	Pbind(\instrument, \gate ,\in,  ~bus1A ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],10), Pseq([1/1],1) ],inf) ,    \group,~g2, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
).play(t);

{ReplaceOut.ar(0, BHiPass4.ar(In.ar(0), 50+MouseY.kr(0,5000),0.5))}.play(target:~g2, addAction: \addAfter)



{Squine.ar(50,clip: MouseX.kr(0.0,1.0),skew: MouseY.kr(-1.0,1.0))}.play
