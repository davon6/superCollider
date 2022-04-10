({
	BBandPass.ar(

	 LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(5
	+ Squine.ar(550
		+ Squine.ar(550
					,0.4,0.3,0.1,3000),0.6,0.1,0.2,5000),0.1,0.8,0.6))),




	SinOsc.kr(
		SinOsc.kr(0.7).range(0.4,18)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*64,~hz1beat*1024),0.2).round(2**(-16))



}.play)


(
b = {
	var sig = BBandPass.ar(

	 LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(5
	+ Squine.ar(550
		+ Squine.ar(550
					,0.4,0.3,0.1,3000),0.6,0.1,0.2,5000),0.1,0.8,0.6))),




	SinOsc.kr(
		SinOsc.kr(0.7).range(0.4,18)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*64,~hz1beat*1024),0.2).round(2**(-16));
	var ctl = In.ar(1, 1);

	sig = Compander.ar(sig, ctl,
		thresh: 0.05, slopeBelow: 1, slopeAbove: -100,
		clampTime: 0.1, relaxTime: 0.2
	);

	(sig * 1).dup
}.play(target:~g9);




	/*,LFDNoise0.kr(

			LFDNoise1.kr(	6).range(0.3,8)

	).range(30,3000),0.6).round(2**(-16))*/


)



({
 Compander.ar(	Pan2.ar(


		BBandPass.ar(

	 LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(5
	+ Squine.ar(550
		+ Squine.ar(550
					,0.4,0.3,0.1,3000),0.6,0.1,0.2,5000),0.1,0.8,0.6,0.73))),




	SinOsc.kr(
		SinOsc.kr(0.7).range(0.4,18)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*64,~hz1beat*1024),0.3)


	).round(2**(-16)),

	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)



}.play(target:~g9))


----------


({
	Pan2.ar(

		// BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ Squine.ar(79.midicps*(430/440)
		+ Squine.ar(79.midicps*(430/440)/10
					,0.7,0.3,0.1, 383.08644880035),0.6,0.3,0.2,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1).round(2**(-16)))

	/*,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.3)


	)*/




}.play)




({
 Compander.ar(	Pan2.ar(

BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ Squine.ar(79.midicps*(430/440)
		+ Squine.ar(79.midicps*(430/440)/10
					,0.4,0.3,0.1, 383.08644880035),0.6,0.1,0.2,3830.8644880035),0.1,0.8,0.6,0.73)))


				,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1)

	,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.23)


	).round(2**(-16)),

	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)



}.play(target:~g9))





({
	Pan2.ar(

		BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1)

	,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.3).round(2**(-16))


	)




}.play)




({
 Compander.ar(	Pan2.ar(

BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1)

	,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.3).round(2**(-16))


	).round(2**(-16)),

	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)



}.play(target:~g9))



({Pan2.ar(

BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 79.midicps*(430/440)*5/10),0,79.midicps*(430/440)*5),0.04,0,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.05)

	,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.3)


	).round(2**(-16))}.play)


====

good

({
 Compander.ar(	Pan2.ar(

BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1)

	,SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),0.3)).round(2**(-16))


,

	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)



}.play(target:~g9))



({	Pan2.ar(

BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/16,0,0.05,0.05)    ,-0.1),



		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat/4).range(100,3000)]),0.36,1)






).round(2**(-16))}.play)



//new good

({
 Compander.ar(	Pan2.ar(




BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.9,SinOsc.kr(~hz1beat/4,0,0.02,0.02)+

				SinOsc.kr(~hz1beat/16,0,0.025,0.25)
				,-0.05),



		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(100,3000)]),0.36,0.7 )


	).round(2**(-16))


,

	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)



}.play(target:~g9))


({Pan2.ar(




BBandPass.ar(

AllpassN.ar(




				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,0.73)))


			,0.05,SinOsc.kr(~hz1beat/4,0.3,0.02,0.02)+

				SinOsc.kr(~hz1beat/16,2,0.025,0.25)
				,-0.005),



		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(100,3000)]),0.36,0.7 )


	).round(2**(-16))}.play)




	/*Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,\vl,1.76)*/

Pbind(\instrument,\gran,\dur,Pseq([64/1],inf),\amp, 6,\buf, ~f2,\out,0,\pitchRte,1,\duration,Pkey(\dur),\impulse,3/*,\pos,0.17,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf)*/, \group, ~g4,\vl,5).play(t)



~micBus=  Bus.audio(s,1);
~ptrBus=Bus.audio(s,1);
~busA1=

/*~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g4=Group.after(~g3);*/
(
({


	Out.ar(~micBus,

BBandPass.ar(






				LeakDC.ar(Shaper.ar(~tfBuf,


				Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,1)))




,
		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(100,3000)]),0.36,0.7 )


		.round(2**(-16)))



}.play(target:~g1));



Synth(\ptr, [\buf, ~f2, \out, ~ptrBus],~g2);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~f2],~g3);


Pbind(\instrument, \lfoStep, \dur,1,\val,Prand([0,1],inf),\group,~g1,\out,~busC1).play(t);

({
	 Compander.ar(	Pan2.ar(

		AllpassN.ar(



	SelectX.ar(In.kr(~busC1),[
		GrainBuf.ar(1,Impulse.kr(~hz1beat*4),t.beatDur,~f2.bufnum),In.ar(~micBus)])
,0.05,/*SinOsc.kr(~hz1beat/4,0.3,0.02,0.02)+*/
SinOsc.kr(~hz1beat/4,2,0.1,0.1)
				,-0.5)


	).round(2**(-16))


,


	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
	// clampTime: 0.1, relaxTime: 0.2)
	clampTime: 0.05, relaxTime: 0.05)
}.play(target:~g9)))




~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g9=Group.after(~g3);
~g10=Group.after(~g9);
~g11=Group.after(~g10);
~g12=Group.after(~g11);
~g13=Group.after(~g12);
(
({


	Out.ar(~micBus,

BBandPass.ar(






				LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,1))),





		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(100,3000)]),0.36,0.7 )


		.round(2**(-16)))



}.play(target:~g1));



Synth(\ptr, [\buf, ~f2, \out, ~ptrBus],~g2);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~f2],~g3);


Pbind(\instrument, \lfoStep, \dur,1,\val,Prand([0,1],inf),\group,~g1,\out,~busC1).play(t);

({

	Out.ar(~bus16A,
 Compander.ar(	/*Pan2.ar(*/

		AllpassN.ar(



	SelectX.ar(In.kr(~busC1),[
		GrainBuf.ar(1,Impulse.kr(~hz1beat*4),t.beatDur,~f2.bufnum),In.ar(~micBus)])
,0.05,/*SinOsc.kr(~hz1beat/4,0.3,0.02,0.02)+*/
SinOsc.kr(~hz1beat/4,2,0.01,0.01)//good phaser
				,-0.5).round(2**(-16))

	/*)*/
/*	)*/


,


	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
			clampTime: 0.1, relaxTime: 0.2)
			// clampTime: 0.05, relaxTime: 0.05)
	)
}.play(target:~g9));


Pxrand([
Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g10, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,

	Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g10, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,

	Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g10, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,





Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g10, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/* (swingBase: 1, swingAmount: 0.2, swingThreshold: 0.5)*/
)],inf).play(t);



~rvy=Synth(\reverbStat,[\in,~bus17A,\out,~bus18A,\mix,0.26,\room,0.4,\damp,0.6],~g11);


Synth(\stereoStat,[\in,~bus18A,\out,~bus19A],~g12);

~limit= Synth(\limiter,[\in,~bus19A,\out,0,\gain,70],~g13);

)



-----------



v2

311351.35135135-291891.89189189

1-0.0625

~leadCre = Buffer.alloc(s, s.sampleRate *  t.beatDur*16);

// ~leadCre = Buffer.alloc(s, s.sampleRate *  t.beatDur);
~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);
~g9=Group.after(~g3);
~g10=Group.after(~g9);
~g11=Group.after(~g10);
~g12=Group.after(~g11);
~g13=Group.after(~g12);
~g14=Group.after(~g13);
~g15=Group.after(~g14);
~g16=Group.after(~g15);
(

Synth(\ptr, [\buf, ~leadCre, \out, ~ptrBus2],~g7);
Synth(\rec, [\ptrIn, ~ptrBus2, \micIn, ~bus1A/*~micBus2*/, \buf, ~leadCre],~g8);
({


	Out.ar(~micBus,

BBandPass.ar(


			// In.ar(~bus1A)
			GrainBuf.ar(1,Impulse.kr(
				/*MouseY.kr(~hz1beat*16,~hz1beat)*/


				In.kr(~busC3)


			/*~hz1beat*4*/),t.beatDur*4,~leadCre.bufnum,rate:
				1// LFTri.kr(0.08,3).range(0.1,4)
				,pos: 0.9375
)


				/*LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,1)))*/







			,





		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(100,3000)]),0.36,1 )


		.round(2**(-16))
	+

		BBandPass.ar(


			// In.ar(~bus1A)
			GrainBuf.ar(1,Impulse.kr(
				/*MouseY.kr(~hz1beat*16,~hz1beat)*/


				In.kr(~busC3)


			/*~hz1beat*4*/),t.beatDur*4,~leadCre.bufnum,rate:
				1// LFTri.kr(0.08,3).range(0.1,4)
				,pos: 0.9375
)


				/*LeakDC.ar(Shaper.ar(~tfBuf,Squine.ar(79.midicps*(430/440)
	+ SinOsc.ar(79.midicps*(430/440)
		+ SinOsc.ar(79.midicps*(430/440)/10
					,0, 383.08644880035),0,3830.8644880035),0.1,0.8,0.6,1)))*/







			,





		SelectX.kr(
			LFNoise0.kr(1).range(0,1)
			,[SinOsc.kr(
		SinOsc.kr(0.3).range(0.4,12)
	).range(20,470)+

		SinOsc.kr(

		SelectX.kr( LFNoise1.kr(~hz1beat).range(0,2),[~hz1beat,~hz1beat/4,~hz1beat*4])
	).range(~hz1beat*32,~hz1beat*1048),

		SinOsc.kr(~hz1beat).range(60,2500)]),0.36,1 )


		.round(2**(-16))
	)



}.play(target:~g9));


Synth(\ptr, [\buf, ~f2, \out, ~ptrBus],~g10);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~f2],~g11);

Ppar([
Pbind(\instrument, \lfoStep, \dur,1,\val,Pwrand([0,1],[1,5].normalizeSum,inf),\group,~g1,\out,~busC1),


	Pbind(\instrument, \lfoStep, \dur,Pseq([16/1],inf),\val,Pfunc({(~hz1beat*16).rrand(~hz1beat)}),\group,~g1,\out,~busC3)],inf).play(t);

({

	Out.ar(~bus16A,
		Compander.ar(	/*Pan2.ar(*/

		AllpassN.ar(



	SelectX.ar(In.kr(~busC1),[
		GrainBuf.ar(1,Impulse.kr(~hz1beat*4),t.beatDur,~f2.bufnum),In.ar(~micBus)])
,0.05,/*SinOsc.kr(~hz1beat/4,0.3,0.02,0.02)+*/
SinOsc.kr(~hz1beat/4,2,0.01,0.01)//good phaser
				,-0.5).round(2**(-16))

	/*)*/
/*	)*/


,


	In.ar(0,1),	thresh: 0.02, slopeBelow: 1, slopeAbove: -200,
			clampTime: 0.1, relaxTime: 0.2)
			// clampTime: 0.05, relaxTime: 0.05)
	)
}.play(target:~g12));


Pxrand([
Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g13, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,

	Pbind(\instrument, \gate ,\in,~bus16A   ,\group,~g13, \out,~bus17A,\dur,Pseq([16/1],1)),

	Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g13, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,

	Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g13, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/*	(swingBase: 2, swingAmount: 1, swingThreshold: 0.05)*/)
,





Pchain(
    ~swingify,



	Pbind(\instrument, \gate ,\in,~bus16A   ,\vlDec,1,
		\dur,/*Pxrand([Pseq([1/4],4),   Pseq([1/4],16), */Pseq([1/4],64)/*,Pseq([2/1],1)*//*Pseq([1/1],2) ],inf)*/ ,    \group,~g13, \out,~bus17A,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({(-4).exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),
  (swingBase: 4.00.rand, swingAmount: 2.00.rand, swingThreshold: 1.00.rand)
	/* (swingBase: 1, swingAmount: 0.2, swingThreshold: 0.5)*/
)],inf).play(t);



~rvy=Synth(\reverbStat,[\in,~bus17A,/*\ctrl,~bus17A,*/\out,~bus18A,\mix,0.26,\room,0.4,\damp,0.6],~g14);


Synth(\stereoStat,[\in,~bus18A,\out,~bus19A],~g15);

~limit= Synth(\limiter,[\in,~bus19A,\out,0,\gain,80],~g16);

)
