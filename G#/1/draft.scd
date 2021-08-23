
p=({Out.ar(0,SinOsc.ar(SinOsc.kr(0.3).range(10,300),SinOsc.kr(200,mul: MouseX.kr(0,100)).range(0.00,100.00)).round(2**(-16))
	*0.1)
}.play)




a= ({
  |mxDel, dlt1=0.3,dlt2=0.4, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:w,addAction:\addAfter))



a.set(\dlt1,0.5)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/squelch.aiff");


s.meter

s.plotTree


~stereoGrp=Group.new;

				SynthDef(\bug,{|out=0,rte=3000/*(~hz1beat*8)*/,val,dur,bts=4,fdb|Out.ar(out,Decimator.ar( SinOscFB.ar(
					// LFNoise0.kr(rte).range(140,3600)
					EnvGen.kr(Env.step([val,0],[dur,0]),timeScale: t.beatDur,doneAction: 2),fdb
					/*val,EnvGen.kr(Env([1,0],[dur,0],[dur, */
				).round(2**(-16)),rte,bts)*0.05)}).add;



				Pbind(\instrument, \bug,\dur,Pfunc({0.25.rrand(0.01)}) ,\val,Pfunc({3600.00.exprand(140)}) ,
				\fdb,Pfunc({2.00.rand}),
					\rte,Pfunc({18000.rrand(100)}),\bts,Pfunc({30.rrand(1)})
				).play(t)

/*
~pani=Synth(\stereoO, [ \in,0, \out,0,\dlt1,0.6.rrand(0.001),\dlt2,0.6.rrand(0.001), \decT,t.beatDur*4.rrand(0.001)],~stereoGrp);*/


~pani=Synth(\stereoO, [ \in,0, \out,0,\dlt1,0.1,\dlt2,0.4, \decT,t.beatDur],~stereoGrp);

~pani.set(\dlt1,0.5,\spread,0)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/glitch.aiff");




	a= ({Out.ar(0,
				/*	LeakDC.ar(Shaper.ar(~tfBuf,   */


					BHiShelf.ar(
					SinOsc.ar(
					66.midicps*(432/440)

							+SinOsc.ar(78.midicps*(432/440) +SinOsc.ar(78.midicps*(432/440)/10,mul:78.midicps*(432/440)/10*5),mul:66.midicps*(432/440)*74 )),8400,1,(-7))/*));*/)}.play);





SynthDef(\pam,{|out=0,vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0,flangefreq=0.001,ph=0,fdback=0.8|


	var input,effect;

	input= 	SinOsc.ar(
					56.midicps*(432/440)

							+SinOsc.ar(80.midicps*(432/440) +SinOsc.ar(79.midicps*(432/440)/10,mul:31.midicps*(432/440)/10*1),mul:80.midicps*(432/440)*74 ));

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq,ph,0.005,0.005)); //max delay of 20msec

		LocalOut.ar(fdback*effect);





	Out.ar(out/*~record2*/,

				/*	BHiShelf.ar(*/
BBandPass.ar(
				effect.round(2**(-16))*    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

			timeScale:  t.beatDur,	doneAction:2),MouseX.kr(300,2500),0.78)


		/*,8400,1,(-7))*/

)}).add

Routine({
Pbind(\instrument,\pam, \dur,Pseq([10000/4],inf),

\vlSub,Pfunc({1.9.exprand(0.16,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.12.exprand(0.01)}),
	\decT,Pfunc({0.2.exprand(0.6)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.52.exprand(0.1,1)}),
	\atkC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-6.exprand(-0.1)}),
	\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk),\out,~record2).play(t,quant:1);
		wait(0.18);

	// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/leadBP2.aiff",numChannels:2,duration:t.beatDur*64);}).play(t,quant:1)




p=Synth(\stereoO, [\in,~record2, \out,0/*~hiCom*/],);
p.set(\spread,1,\center,0,\dlt1,0.01,\dlt2,0.08,\decT,t.beatDur/8, \mxDel,t.beatDur);


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/BGlead.aiff",);


	({ GVerb.ar(

	BLowPass4.ar(
			Decimator.ar(
	Saw.ar(EnvGen.ar(
		Env(
				[119.midicps*(432/440),66.midicps*(432/440),47.midicps*(432/440),18.midicps*(432/440),0,0],
			[0.004,t.beatDur/32,t.beatDur/4,0],
			[-8.4,-2,-2]
		)
	), mul: EnvGen.ar(
		Env([ 0.056 , 0.085,   0.01 ,  0.0042,0.0,0],
			[ 0.00602 , 0.0016,   0.8  , t.beatDur/4 , 0.001  ],[0.66,1.5,-1.6,1.2,8]),doneAction:0)),

				3000,12)
			,MouseX.kr(10,4000),0.4)

	/*)*/,2,41,0.9)*3}.play);



	q=	{
		Decimator.ar(
		DynKlank.ar(`[[
			VarLag.kr( LFNoise0.kr(~hz1beat/1.5).range(100,800),t.beatDur*0.00002,146)
			,VarLag.kr(LFNoise0.kr(~hz1beat/1.5).range(800,3000),t.beatDur*0.00002,46)
			,VarLag.kr(LFNoise0.kr(~hz1beat/1.5).range(100,3000),t.beatDur*0.00002,46)
			,VarLag.kr(LFNoise0.kr(~hz1beat/1.5).range(100,3000),t.beatDur*0.00002,46)

	], nil, [4, 4, 4, 4]], Impulse.ar(~hz1beat/1.5, 0, 0.1)),LFNoise0.kr(~hz1beat/1.5).range(100,30000),LFNoise0.kr(~hz1beat/1.5).range(4,26))*0.2 }.play;



	a= ({
  |mxDel, dlt1=0.3,dlt2=0.4, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:q,addAction:\addAfter))

	a.set(\dlt1,0.2,\dlt2,0.1,\decT,t.beatDur,\mxDel,t.beatDur)


	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/bell.aiff",);


	({

		BHiPass4.ar(  WhiteNoise.ar(0.4),
			EnvGen.kr(Env([16000,250],[t.beatDur/4,0],[-6,0]),doneAction: 2),0.4)}.play(target:a,addAction:\addBefore))

	a=({GVerb.ar(   In.ar(0),60,3,0.4,0.9)}.play)


	~perc= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/funkPercX.aiff");


	x=({PlayBuf.ar(2,~perc,LFNoise0.kr(
		LFNoise0.kr(~hz1beat).range(~hz1beat/4,~hz1beat*4)
	).range(-2,8)

	,Impulse.kr(~hz1beat/2),LFNoise0.kr(
		LFNoise0.kr(~hz1beat).range(~hz1beat/4,~hz1beat*4)
	).range(~perc.numFrames,0))}.play)


		g=({Out.ar( 0,PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur, t.beatDur/16), MouseY.kr(0.8,0.1), ))}.play(target:x,addAction:\addAfter));


		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/percLoo.aiff");


	SynthDef(\fmX, {
	arg freq= 659.26, freq2=200,freq3=200, mRatio=1, cRatio=1,  amp=1, sineRate = 0.0000000095262251,  sineRangeLow=0, pitch = 0, phRise= 0 ,out=0, eFreq =0 , phFm=8, bus2,bus3,bus4,busBP,bus6, bus7, bus8, busSR, busSS, busSP, gra=0.5,lvlDec=1,factor=0, factor2 =0 ,factorx=0, factorx2 =0,factorxx=0, factorxx2 =0  , rqLPF =0.5, factor3 =1, decE= 0.1936, dur, gain =50,gate=1,pan=0, modu,modu2, multi=0, multi2=0,modux=0,moduxx=0,fmCtrl=1,secBus,crv=(-3),
				vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0;

	var car, mod, mod2, iEnv, sig, filRte,env;

		env =
		// EnvGen.kr(Env([1,0],[dur,0],crv),timeScale: t.beatDur,doneAction: 2);



		EnvGen.kr(Env([vlAtk,vlDec,vlSub,vlSub2,vlRel],
			[dur * atkT,dur* decT-(dur*gateSub),dur * subsT,dur *relT],
			[atkC,decC,0,relC]),timeScale: t.beatDur, doneAction:2);

	iEnv = EnvGen.kr(
			Env.new(

			[1, 1 * 5, 1 * 5,4.8],
			[0,0.000000000001,        (dur  ),      0.0000000001],
			[4, 4,(-4)]
		));

	//second level of modulation
		mod2 = SinOsc.ar(80.midicps*(432/440)/10, mul:MouseY.kr(80.midicps*(432/440)/10 * iEnv));

	//first level of modulation

			mod = SinOsc.ar( 80.midicps*(432/440)*mRatio+mod2, mul:MouseY.kr(80.midicps*(432/440)*mRatio* iEnv));

	//my carrier is a mess but bring interesting outputs

		car =SinOsc.ar([freq,freq+14,freq+21]*cRatio+mod);

	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);

		Out.ar(out, sig.round(2**(-16))   * amp     *env);
}).add;




	Pbind(\instrument,\fmX,\dur,Pseq([10000/1],inf),\freq, Pfunc({	Scale.chromatic(\just).degreeToFreq(7.rand, 78.midicps, -4)}),\crv,Pfunc({-6.rrand(-1)}) ).play(t)


		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft3.aiff",numChannels:1,duration:t.beatDur*64);

	Routine({

		Pbind(\instrument,\fmX,\dur,Pseq([1/4],inf),\freq, Pfunc({	Scale.chromatic(\just).degreeToFreq(7.rand, 78.midicps, -4)}),\crv,Pfunc({-6.rrand(-1)}),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest].scramble,inf) ).play(t);

		wait(0.16);

			s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft1.aiff",numChannels:1,duration:t.beatDur*64);
	}).play(t,quant:1)

	~draft1=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft1.aiff")

~draft1.play
	Routine({
	({BHiPass4.ar( PlayBuf.ar(1,~draft1),MouseX.kr(60,7000),0.6)}.play);
		wait(0.16);

			s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft2.aiff",numChannels:1,duration:t.beatDur*64);
	}).play(t,quant:1)

	~draft2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft2.aiff")


			Pseq([
		Pbind(\instrument, \playBuf, \buf, ~draft2, \dur, Pseq([4/1],1),\out,~record2,\amp,1,),


				Pbind(\instrument, \playBuf, \buf, ~draft2, \dur, Pseq([1/4],inf),\start,Pfunc({~draft2.numFrames/64*(63.rand)}),\out,~record2,\amp,1)],4).play(t,quant:1)



	p=Synth(\stereoO, [\in,0, \out,0/*~hiCom*/],);
p.set(\spread,1,\center,0,\dlt1,0.05,\dlt2,0.042,\decT,t.beatDur/8, \mxDel,t.beatDur);

		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/leadHp.aiff");


	~draft3=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draft3.aiff")

	({BHiPass4.ar( PlayBuf.ar(1,~draft3,loop: 1),MouseX.kr(20,8000),0.5)}.play)

	p=Synth(\stereoO, [\in,0, \out,0/*~hiCom*/],);
p.set(\spread,1,\center,0,\dlt1,0.05,\dlt2,0.042,\decT,t.beatDur/8, \mxDel,t.beatDur);


		s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/leadHpAGin.aiff");

	x=	({
		BBandPass.ar(
		Decimator.ar(  Saw.ar(MouseX.kr(4,1600)
	).round(2**(-16)),LFNoise0.kr(~hz1beat/4).range(400,35000),MouseY.kr(36,1)),
			SinOsc.kr(~hz1beat).range(40,2800)+
			SinOsc.kr(
				MouseX.kr(~hz1beat/4,~hz1beat*4).range(32.midicps*(432/440),8.midicps*(432/440))),0.6)
	}.play)



	g=({Out.ar( 0,PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur/16, t.beatDur), MouseY.kr(0.8,0.1), ))}.play(target:x,addAction:\addAfter));



	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/squelch2.aiff");





		Pbind(\instrument,	\reverbG,\dur, Pfunc({4.00.rand}), \mix,Pfunc({1.rrand(0.01)}),\room,Pfunc({1.rrand(0.01)}),\damp,Pfunc({1.rrand(0.01)}),\out,0,\in,~record3,\group, ~revGrp)],1).play(t,quant:1);


SynthDef(\ploup,{|dur|Out.ar(0,
	// Saw.ar(LFNoise0.kr(~hz1beat*2).range(0/10,130/10))+

/*	LeakDC.ar(Shaper.ar(~tfBuf, */


	SinOsc.ar( LFNoise0.kr(~hz1beat*2).range(0,2000)+
		EnvGen.kr(Env([0,40],[0.6,0],[-8,0])),mul: LFNoise0.kr(~hz1beat*2).range(0,1)).round(2**(-16))!2
/*	SinOsc.ar(100,mul: SinOsc.kr(1).range(0,1))*/
/*	))*/*EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
)}).add;


Pbind(\instrument,\ploup,\dur,1).play(t,quant:1)

({SinOsc.ar( LFNoise0.kr(~hz1beat*2).range(0,2000)+
	EnvGen.kr([-1000,0],[0.6,0],[-8,0]),mul: LFNoise0.kr(~hz1beat*2).range(0,1))}.play)

({SinOsc.ar(100,mul: SinOsc.kr(1).range(0,1))}.play)
({Saw.ar(LFNoise0.kr(~hz1beat*2).range(0/10,130/10))}.play)


({AllpassN.ar(Saw.ar(32.midicps*(432/440),	Saw.kr(MouseY.kr(0.24,20.6)

	,-1,-0.4).range(-1,1).lincurve(-1,2,5,-3,-4)),delaytime: MouseX.kr(0.1,0001),decaytime: -1)}.play)




x=({AllpassN.ar(Saw.ar(44.midicps*(432/440)),delaytime:

	SinOsc.kr(0.001,0,0.1,0.1),decaytime: MouseX.kr(000001,0.0000006),mul: 	Saw.kr(MouseY.kr(0.24,20.6)

	,-1,-0.4).range(-1,1).lincurve(-1,2,5,-3,-4))}.play)


	g=({Out.ar( 0,PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur/16, t.beatDur), MouseY.kr(0.8,0.1), ))}.play(target:x,addAction:\addAfter));




({PlayBuf.ar(2,~k2,MouseX.kr(-2,4),Impulse.kr(MouseY.kr(0.1,15)),2000)}.play)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/kickRoll.aiff");



({PlayBuf.ar(2,~k2,MouseX.kr(-2,4),Impulse.kr(MouseY.kr(0.1,15)),2000)}.play)




x=	SynthDef(\co, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR |
	Out.ar(out, BufCombN.ar(~b2.bufnum,/*PinkNoise.ar(0.003)*/

		Saw.ar(800+LFNoise0.kr(10.6).range(-500,900)+SinOsc.kr(70,mul: 70,add: 200)+

	LFTri.kr(0.07,4.6).range(-800,1000)

)

	/*	Saw.ar(8.midicps*(432/440))*/,/*MouseY.kr(0.6,0.001)*/

			/*[delayT+ MouseX.kr(0.024,0),  delayT+ MouseX.kr(0.024,0)+0.00001392889167817/*,    delayT+ MouseX.kr(0.024,0)+0.05*/]*/

		delayT+ MouseY.kr(0.024,0)  /*[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]*/

		// +  Saw.ar(800+SinOsc.kr(70,mul: 7,add: 20)).range(0.0001,0.00008)

		// +	(SinOsc.kr(30,phase: 4.6,add: 1).range(0.000000001, 0.0003)* 1)
				+ (SinOsc.kr(0.08/*MouseY.kr(20,0)*/,phase: 4.6,add: 1).range(0.000000001, 0.001)* 1)
		// + (LFTri.kr(0.5).range(0.000000001, 0.001) *0.2)
				+ (Saw.kr(modSa).range(0.000000001, 0.001) * f3)
				+ (LFDNoise0.kr(~hz1beat*16).range(0.0008,0.00008)*1)
			// (LFDNoise0.kr(modR).range(0.000000001,0.001)*fr)
			/*(LFDNoise0.kr(modR).range(-0.0000008,-0.00000008)*fr)*/


			,-0.05 ,2/* + MouseY.kr(0.5,0)*/ +MouseX.kr(0,-0.63)).round(2**(-16))   /*[amp,multi,multi])!2*//** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) */)}).play;



~rise1=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draftRise.aiff");


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/draftRise.aiff",numChannels:1);

x=({Saw.ar(800+LFNoise0.kr(10.6).range(-500,900)+SinOsc.kr(70,mul: 70,add: 200)+

	LFTri.kr(0.07,4.6).range(-800,1000)

).round(2**(-16))}.play)


	SynthDef(\ga,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atkC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0,vlSub2=0|
	var env =  PlayBuf.ar(1,~rise1,loop: 1) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:2);
		Out.ar(out, env);
}).add;


x=({Out.ar(0,PlayBuf.ar(1,~rise1,loop: 1)*9)}.play)

~gateGrp=Group.new;
Pbind(\instrument,\gate,\in,~record1,\dur,Pseq([1/4],inf),\group,~gateGrp,\vlDec,2,
	\vlSub,1.9.exprand(0.16,1),\vlSub2,Pkey(\vlSub),\atkT,0.12.exprand(0.01),
	\decT,0.2.exprand(0.8),
	\subsT,0.3.exprand(0.2),
	\relT,0.52.exprand(0.1,1),
	\atkC,4.exprand(1,1),
	\decC,-6.exprand(-0.1),
	\relC,-8.exprand(-2,1),\vlAtk ,0.01.exprand(0.001),\vlRel,Pkey(\vlAtk),).play(t,quant:1)



a= ({
  |mxDel, dlt1=0.3,dlt2=0.4, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:x,addAction:\addAfter));


a.set(\dlt1,0.5,\decT,t.beatDur*4)


// s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/rise1.aiff");


({Saw.ar(8.midicps*(432/440))}.play)



x=({AllpassN.ar(Saw.ar(8.midicps*(432/440)),delaytime:

	SinOsc.kr(0.001,0,0.1,0.1),decaytime: SinOsc.kr(0.01,mul: 0.1,add: 0.2)

	,decaytime:  -1,add: -0.4)}.play)






x=({Saw.ar(8.midicps*(432/440))}.play)


g=({Out.ar( 0,FreqShift.ar( PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur/16, t.beatDur), MouseY.kr(0.8,0.1), ),MouseY.kr(0,1000)))}.play(target:x,addAction:\addAfter));



s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/groovySlide.aiff");


~grSlid= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/groovySlide.aiff");




({BLowPass4.ar(
PlayBuf.ar(2,~grSlid,loop: 1),
	SinOsc.kr(0.1,4.6).range(700,8000),0.8)}.play)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/groovySlide2.aiff");





({Pan2.ar( BLowPass.ar( WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 1, 1, -5),doneAction: 0)),
	EnvGen.kr(Env([100,3318,2600],[0.01,2.6,0.6],[8,-5,-5]),doneAction: 0),Line.kr(0.112,1,2))*EnvGen.kr(Env([0.1,0,0.2,0,0.8,0,0.4,0.5],[0.001,0,0.01,0,0.01,0,0.38],-4)))
	}.play);

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/clap2.aiff");





({Saw.ar(40*SinOsc.kr(MouseX.kr(0.02,50)).range(10,30))}.play)



g=({Out.ar( 0,PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur/16, t.beatDur), MouseY.kr(0.8,0.1), ))}.play(target:x,addAction:\addAfter));


g=({Out.ar( 0,FreqShift.ar( PingPong.ar(~delayX, [In.ar(0),In.ar(1)], MouseX.kr(t.beatDur/16, t.beatDur), MouseY.kr(0.8,0.1), ),MouseY.kr(0,1000)))}.play(target:x,addAction:\addAfter));


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/expo.aiff");



({
	BHiPass4.ar(

	SinOsc.ar(
					68.midicps*(432/440)

			+SinOsc.ar(80.midicps*(432/440) +SinOsc.ar(77.midicps*(432/440)/10,mul:3.midicps*(432/440)/10*5),mul:200.midicps*(432/440)*4 )).round(2**(-16)),MouseX.kr(20,8000),0.5)}.play)


a= ({
  |mxDel, dlt1=0.3,dlt2=0.4, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:w,addAction:\addAfter))



a.set(\dlt1,0.5)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/leadHp4.aiff");









x=	SynthDef(\co, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR |
	Out.ar(out,FreqShift.ar( AllpassL.ar( BufCombN.ar(~b2.bufnum,/*PinkNoise.ar(0.003)*/

	PlayBuf.ar(1,~k2,MouseX.kr(4,-2),Impulse.kr(MouseY.kr(0.1,15)),2000),



		delayT+ MouseY.kr(0.024,0)  /*[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]*/

		// +  Saw.ar(800+SinOsc.kr(70,mul: 7,add: 20)).range(0.0001,0.00008)

		// +	(SinOsc.kr(30,phase: 4.6,add: 1).range(0.000000001, 0.0003)* 1)
				+ (SinOsc.kr(0.08/*MouseY.kr(20,0)*/,phase: 4.6,add: 1).range(0.000000001, 0.001)* 1)
		// + (LFTri.kr(0.5).range(0.000000001, 0.001) *0.2)
				+ (Saw.kr(modSa).range(0.000000001, 0.001) * f3)
				+ (LFDNoise0.kr(~hz1beat*16).range(0.0008,0.00008)*1)
			// (LFDNoise0.kr(modR).range(0.000000001,0.001)*fr)
			/*(LFDNoise0.kr(modR).range(-0.0000008,-0.00000008)*fr)*/


		,MouseY.kr(-1,-0.05) ,2/* + MouseY.kr(0.5,0)*/ +MouseX.kr(0,-0.63)).round(2**(-16)) ,delaytime: MouseX.kr(3, 0.05)) ,SinOsc.kr(0.03).range(-400,300)) /*[amp,multi,multi])!2*//** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction:2) */)}).play;


a= ({
  |mxDel, dlt1=0.1,dlt2=0.2, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},spread,1,center));

}.play(target:x,addAction:\addAfter))

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/rise3.aiff");



//yessss


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


a= ({
  |mxDel, dlt1=0.8,dlt2=0.7, decT,in,center,spread=0|

	ReplaceOut.ar(0,Splay.ar({

			CombN.ar(
				In.ar(in, 1), mxDel, [dlt1,dlt2], decT)

	},1,1,center));

}.play)

s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/bg2.aiff");



	Routine({
			({Pan2.ar( GVerb.ar(/*FreeVerb.ar(*/
		BLowPass4.ar(
	Saw.ar(EnvGen.ar(
		Env(
				[7.midicps*(432/440),8.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.1,t.beatDur,t.beatDur*0.45,0],
			[-30,-2,-2.4]
		)
	), mul:EnvGen.ar(
		Env([ 0.280 , 0.175,   0.064 ,  0.42,0.442,0],
					[ 0.004 , 0.002,   0.05  , t.beatDur*0.05 , t.beatDur*0.2  ],[-3.66,5.5,-4.6,-1.2,8]),doneAction:0))
			,MouseX.kr(10,4000),0.4)

		/*)*/,1,9,0.9))}.play);
				wait(0.18);

				s.record(s,path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/hit.aiff");

		}).play;


Env(
				[97.midicps*(432/440),68.midicps*(432/440),49.midicps*(432/440),8.midicps*(432/440),0,0],
			[0.00015,t.beatDur/16,t.beatDur*0.45,0],
			[30,-2,-2.4]
		)
	);

	env =

EnvGen.ar(
		Env([ 0.280 , 0.175,   0.064 ,  0.842,0.442,0],
			[ 0.004 , 0.002,   0.05  , t.beatDur*0.05 , t.beatDur*0.2  ],[-3.66,5.5,-4.6,-1.2,8]),doneAction:2);
	//-2.6 can be zero


({WhiteNoise.ar(EnvGen.kr(Env.perc(releaseTime: t.beatDur),doneAction: 2))!2}.play)




({ReplaceOut.ar(0,GVerb.ar(In.ar(0,2),5,6,0.1))}.play)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/hit3.aiff");



({ GrayNoise.ar(EnvGen.kr(Env.step([0.3,0],[t.beatDur,0]),doneAction: 2))!2}.play)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/hit2.aiff");



({WhiteNoise.ar(EnvGen.kr(Env.perc(releaseTime: t.beatDur),doneAction: 2))!2}.play)




({ReplaceOut.ar(0,GVerb.ar(In.ar(0,2),4.7,6,0.1))}.play)


s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/hit4.aiff");


({ GrayNoise.ar(EnvGen.kr(Env.step([0.3,0],[t.beatDur,0]),doneAction: 2),-0.5)!2}.play)



({BLowPass.ar(WhiteNoise.ar(0.4),
	EnvGen.kr(Env([3520,1318],[0.3872,0],-8),doneAction: 2),0.5)*EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.37],-4))
	}.play);


({EnvGen.kr(Env([1,0,0.8,0,0.8,0,0.4,0],[0.01,0,0.01,0,0.01,0,0.37],-4))}.plot(duration:1))



({  SinOsc.ar(8.midicps*(432/440)* SinOsc.kr(-4.midicps*(432/440)

	+SinOsc.kr(-16.midicps*(432/440),mul: 10).range(1,10)

	,mul: 1).range(1,10)   +LFTri.kr(Line.kr(0.001,800,t.beatDur*128),4.6,90),mul: 0.2)   }.play)



~pani=Synth(\stereoO, [ \in,0, \out,0,\dlt1,0.1,\dlt2,0.4, \decT,t.beatDur],~stereoGrp);

~pani.set(\dlt1,0.4,\dlt2, 0.3,\spread,1)




x=	SynthDef(\co, {|out=0, in ,maxDel=0.7744, delayT,decT=6.1952,amp=0.09,tS=1,dur,multi=0,f1=0,f2=0,f3=0,fx=0,busMod,fr=0,modS,modT,modSa,modR |
	ReplaceOut.ar(out, BufCombN.ar(~b2.bufnum,/*PinkNoise.ar(0.003)*/

		In.ar(0)

	/*	Saw.ar(8.midicps*(432/440))*/,/*MouseY.kr(0.6,0.001)*/

			/*[delayT+ MouseX.kr(0.024,0),  delayT+ MouseX.kr(0.024,0)+0.00001392889167817/*,    delayT+ MouseX.kr(0.024,0)+0.05*/]*/

		delayT+ MouseY.kr(0.024,0)  /*[delayT+ MouseY.kr(0.024,0),  delayT+ MouseY.kr(0.024,0)+0.00001392889167817,    delayT+ MouseX.kr(0.024,0)-0.00001692889167817]*/

		// +  Saw.ar(800+SinOsc.kr(70,mul: 7,add: 20)).range(0.0001,0.00008)

		// +	(SinOsc.kr(30,phase: 4.6,add: 1).range(0.000000001, 0.0003)* 1)
				+ (SinOsc.kr(0.08/*MouseY.kr(20,0)*/,phase: 4.6,add: 1).range(0.000000001, 0.001)* 1)
		// + (LFTri.kr(0.5).range(0.000000001, 0.001) *0.2)
				+ (Saw.kr(modSa).range(0.000000001, 0.001) * f3)
		// + (LFDNoise0.kr(~hz1beat*16).range(0.0008,0.00008)*1)
			// (LFDNoise0.kr(modR).range(0.000000001,0.001)*fr)
			/*(LFDNoise0.kr(modR).range(-0.0000008,-0.00000008)*fr)*/


			,-0.05 ,2 +MouseX.kr(0,-0.63)).round(2**(-16))  )}).play;




	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/G#/1/riseBg.aiff");


