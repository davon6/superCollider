

f = { |n=14, min=0, max=11| (min..max).scramble.keep(n) };
//~f2 = { |n=6, min=0, max=5| (min..max).scramble.keep(n) };
~rythmsP = f.value(5, 0, 5);


~rythmsP[2]

//sync up hat and cymbal maybe use above

//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd

//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!

//RISE add more filtering
//comp10 might be overlapping
//plop noise in bass
//bass has too much high, blocks leads
//start noise reverb volume breaks somestimes good sometimes buzzkill

~audio3.play
~hat2.play
~buf.play
~bufSnoopy.play

(
	~perc=Buffer.read(s,	"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/funkPerc.aiff");


~bgRev=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/RevBg.aiff");
~larme=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/larme.aiff");
~bruise = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bruise.aiff");

~cymb= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/cymbal.aiff");
~hat= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/hat.aiff");

~snare= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/snare.aiff");

~b3=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bass.aiff");
~snare2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/snare2.aiff");

~b4=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bass2.aiff");
~snComp = Buffer.read(s, "/Users/davidmignot/Music/SuperCollider Recordings/F#/1/snareComp.aiff");
~k2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/kick.aiff");

~kass= Buffer.read(s, "/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bassTw.aiff");
~bassL=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bassL.aiff");
~bassD=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/bassTw.aiff");

~noise=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/noise.aiff");

~bNoi =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings//F#/1/blopN.aiff");

/*~one = ~leTout2.numFrames/ 256 * 240.rand;
~two = ~leTout2.numFrames/ 256 * 240.rand;
~troi= ~leTout2.numFrames/ 256 * 240.rand;*/


~rythm1=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm2=[\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble; ~rythm3=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm4=[\rest,\rest,\rest,\note ,\note,\note ,\note, \rest].scramble;
	~rythmL = [\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble;

// ~start = ~start =~fkAr.numFrames.rrand(215000)-215000;


/*

~ouai=~leTout2.numFrames/256* (220.rand);
~ouai2=~leTout2.numFrames/256* (220.rand);



~first=  ~leTout2.numFrames/ 256 * 222.rrand(1);
		 ~second= ~leTout2.numFrames/ 256 * 222.rrand(1);*/


)



(
/*	~mont =0;
~boba=1;
~bobo=220;
~crv=12;
~as=1676373; ~tram=3659560;~gram=373706; ~pick=285965;
~bool=True;*/


~lfoGrp  = Group.new;

~filterGrp  = Group.after(~lfoGrp);

~eqGrp = Group.after(~filterGrp);

~gateGrp =  Group.after(~eqGrp);

~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~revGrp = Group.after(~granGrp);

~delayGrp = Group.after(~revGrp);

~compGrp = Group.after(~delayGrp);

~limitGrp = Group.after(~compGrp);

~shifGrp= Group.after(~limitGrp);

~stereoGrp = Group.after(~shifGrp);

~extraDelay= Group.after(~stereoGrp);
~extraRev= Group.after(~extraDelay);

~eqGrp3=Group.after(~compGrp5);

~dynaEq= Group.after(~eqGrp3);

~stereoGrp5 = Group.after(~dynaEq);
~compGrp6 = Group.after(~stereoGrp5);
~extraGrp = Group.after(~compGrp6);

~kickgroup1 = Group.after(~extraGrp);
	~kickgroup = Group(~kickgroup1);
~padgroup1 = Group.after(~kickgroup1);
	~padgroup = Group(~padgroup1);

~compGrp8= Group.after(~padgroup1);

~kickgroup2 = Group.after(~compGrp8);
	~kickgroup3 = Group(~kickgroup2);
~padgroup2 = Group.after(~kickgroup2);
	~padgroup3 = Group(~padgroup2);

~finalComp= Group.after(~padgroup2);
~finalEq= Group.after(~finalComp);


~dynaEq2= Group.after(~finalEq);
~compGrp7 = Group.after(~dynaEq2);

~stereoGr7 = Group.after(~compGrp7);
~compGrp8 = Group.after(~stereoGr7);
~kbGate= Group.after(~compGrp8);
~recGrp3= Group.after(~kbGate);



o = {


}.play;

)


~base.play(t,quant:1)
(

~base = Ppar([



	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1520, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pseq([Pbindf(~kick,\out,~kbus)],inf),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,\dur, Pseq([1/2], inf),\type,  Pseq([\rest ,\rest,\note,\rest] , inf),\out,~dumSnaEq),
	Pbind(\instrument , \EQHP96, \frq, 220 ,\dur, inf,\in, ~dumSnaEq, \group, ~eqGrp,\val, 400, \quant, 8, \gain, (-10),  \out , ~dumSnaLimit),
	Pbind(\instrument , \limiter,\dur, inf, \in,~dumSnaLimit, \gain, 40,\group, ~limitGrp,\out,~snBus),


//HERE

	Pseq([


	Pbind(\instrument,\gateS, \dur, Pxrand([ Pseq([12/1],1)  ],1)
		,\in,Pseq([ ~no1 ],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

Pxrand([

	Pbind(\instrument,\gateS, \dur,Pseq([64/1],1)
				,\in, ~no3,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([56/1],1)
			,\in, ~no3 ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),


				Pbind(\instrument,\gateS, \dur,Pseq([4/1],1),\in, ~no3  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([6/1],1),\in,~no1  ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in,~no1 , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374),].scramble,1)
		],1),




Pbind(\instrument,\gateS, \dur,Pseq([2/1],2),\in, Pxrand([/*~vocToDispatch,*/~percuCom2,~comSnaGrpBus2,~tam,~no2],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)


	].scramble,inf),




Pseq([
Pseq([

		Pseq([
		Pbind( \instrument,\playBuf , \impulse, 0.3,\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start, Pfunc({~as}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~as==1676373 ,{~gateBou;},{~eqPass5;})})
			,\loopy,0),
		Pbind(\instrument,\gateS, \dur,  Pseq([12/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([
		Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],8), \tS,  0.39550810372374,\start,  Pfunc({~tram}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~tram==3659560 ,{~eqPass1;},{~eqPass6;})})
			,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\rest,\note,\note,\rest,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
	].scramble,2),

			Pseq([
		Pbind( \instrument,\playBuf, \impulse, 0.3,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\start, Pfunc({~gram}),\buf,~bufSnoopy2,\out,
			Pfunc({if(~gram==373706 ,{~eqPass2;},{~eqPass7;})})
			,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([7/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

	Ppar([
			Pseq([
Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/4],2), \tS,  0.39550810372374,\start,  Pfunc({~pick}),\buf,~bufSnoopy2,\out,
				Pfunc({if(~pick==285965 ,{~eqPass3;},{~eqPass4;})})
				,\loopy,0,\decT,0,\atkT,1,\atckC,8,\type,Pseq([\note,\rest].scramble,inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([7.25/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

		Pseq([
			Pbind(\instrument,\gateS, \dur,  Pseq([15.9/1],1),\tS,t.beatDur,\type,\rest),
			Pbind(\instrument,\gateS, \dur,  Pseq([0.1/1],1),\tS,t.beatDur,\type,\rest,\in,Pfunc({
				if(~bool==True,{
					~as=3890307; ~tram=135844;~gram=2321737; ~pick=65263;
					~bool=False;
				},{
				~as=1676373; ~tram=3659560;~gram=373706; ~pick=285965;
					~bool=True;})
		}))],1)
	],1)


	// ~as=4676373/3890307; ~tram=3659560/135844;~gram=373706/2321737; ~pick=285965/65263

],2),

		Ppar([
	Pbind(\instrument,\playBufS,\buf,~crushed,\tS,t.beatDur,\dur,Pseq([64/1],1),\out,~toEq2),

		Pbind(\instrument,\comp10P,\sB,1,\sA,0.3, \thr,1, \ctrl, ~stereoBus14,\tS,t.beatDur,\dur,Pseq([64/1],1),\in,~finGran,\out, 0,\group,~gateGrp5),


	],1),

		Ppar([
	Pseq([


		Pbind(\instrument, \lfo13T, \val,~hz1beat/64,\dur,Pseq([16/1],1),\rL,0,\rH,3350, \ph,3.1,\out, ~bus33 , \group, ~lfoGrp,\tS, 0.39550810372374),

Pbind(\instrument, \lfo13T, \val,~hz1beat/64,\dur,Pseq([48/1],1),\rL,0,\rH,3350, \ph,3.1,\out, ~bus33 , \group, ~lfoGrp,\tS, 0.39550810372374),


	],1),

		Pseq([

		Pbind( \instrument,\playBufXG , \impulse, 0.3,\dur,Pseq([1/8],16), \tS,  0.39550810372374,\start,/*~bufSnoopy2.numFrames.rand.postln*/3574097,\buf,~buf,\out,~gateBou,\loopy,0,\type,Pseq([\note,\rest,\note,\rest],inf),
			\vlSub,0.7.exprand(0.4,1),\vlSub2,Pkey(\vlSub),\atkT,0.10.exprand(0.01),
	\decT,0.6.exprand(0.8,0.3),
	\subsT,0.2.exprand(0.1),
	\relT,0.22.exprand(0.1,1),
	\atckC,6.exprand(1,1),
	\decC,-4.exprand(-0.1),
			\relC,-8.exprand(-2,1),\vlAtk ,1.00.exprand(0.01),\vlRel,0.1.exprand(0.01)),


	Pbind(\instrument,\gateS, \dur,  Pseq([5/1],1),\in,~finGran, \out,0,\group, ~gateGrp5,\tS, 0.39550810372374,),

	].scramble,8),


	Pbind(\instrument, \shift1,\in, ~gateBou ,\bus,  ~bus33, \dur, Pseq([64/1],1),\out,~eqRi,\group,~filterGrp)
		],1)

],1)


],1))

s.scope
Ppar([~boost, ~kb],1).play(t,quant:1)
~kb.play(t);
.stop
(~kb =Ppar([


	///temp
	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pbind(\instrument,\playBuf,	\buf,~snare2,\dur, Pseq([1/2],inf),\type,Pseq([\rest,\rest,\note,\rest],inf),\out,~snBus),


	Pbind(\instrument, \playBuf, \buf,~cymb,\type,Pseq([

		/*Pseq(~rythmL,30),Pseq([ \rest],258),
		Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL,64),*/


		Pseq(~rythmL,1024),
		Pseq([ \rest],inf),

		],1),\dur,Pseq([1/4],inf ),\out,    ~cymbalEq),


Pseq([
	Pbind(\instrument,\playBuf,	\buf,~snare2,\dur, Pseq([1/2],128 /*TO CHANGE*/),\type,Pseq([\rest,\rest,\note,\rest],inf),\out,~snareEQ,
		\vlDec,Pseq([
			// Pseq([\note],128),Pseq([\rest],256),Pseq([\note],128),
		Pseq([\rest],64),],1),

		\vlSub,Pkey(\vlDec) ,\vlSub2,Pkey(\vlDec),
		\decT,Pseq([ /*Pseq([1],512), */Pseq([0.5],128)   ],1)),

		//WILL NEED ANOTHER AUDIO PROCESS PATH
		Pseq([
		Pbind(\instrument, \playBuf, \buf, ~snComp, \dur, Pseq([4/1],1),\amp,0.14,\out,~snareEQ2,\amp,0.14,),


			Pbind(\instrument, \playBuf, \buf, ~snComp, \dur, Pseq([1/4],48),\start,Pfunc({~snComp.numFrames/4*(3.rand)}),\loo,~snareEQ2,\amp,0.14,\decT,Pseq([1,0.8,0.6,0.4],inf))],4),

		Pbind(\instrument,\playBuf,	\buf,~snare,\dur, Pseq([1/2],64),\type,Pseq([\rest,\rest,\note,\rest],inf),\out,~snareEQ2,\decT,0.52),

			Pbind(\instrument,\playBuf,	\buf,~snare2,\dur, Pseq([1/2],640),\type,Pseq([\rest,\rest,\note,\rest],inf),\out,~snareEQ,\amp,0.14,
		\vlDec,Pseq([
Pseq([\rest],128),
		Pseq([\rest],64),Pseq([\note],64),],1),

		\vlSub,Pkey(\vlDec) ,\vlSub2,Pkey(\vlDec),
			\decT,1)



	],1),


	Pbind(\instrument, \playBuf,\buf,~hat,\dur,Pseq([1/4], inf) ,\vlDec,Pfunc({1.00.rrand(0.8)}),\vlSub,Pkey(\vlDec), \vlSub2,Pkey(\vlDec),\out,~comBusHat,

		\type, Pseq([
			// Pseq([ \note],256) , Pseq([ \rest],256),  Pseq([ \note],512),

			 Pseq([ \note],1024),

			Pseq([\rest],inf)],1)),

Ppar([

			Pseq([Pbindf(~kick,\out,~limitKick)],inf),

		Pbind(\instrument, \playBuf, \buf, ~b3, \dur, Pseq([1/4],inf),\amp,1,\type,Pseq([\rest,\note,\note,\note],inf),  \decT,	Pseq([0,0.86,0.88,0.9 ],inf),\start,0,\out,~bassFi),

				/*Pbind(\instrument, \playBuf, \buf, ~b4, \dur, Pseq([1/4],inf),\amp,1,\type,Pseq([\rest,\note,\note,\note],inf), \decT,	Pseq([0,0.8,0.86,0.92 ],inf),\start,0,\out,~bassFi)*/

],1),

		Pbind(\instrument, \shap, \dur,Pseq([1/1],inf),\dA1,2,\out,~bassShapB, \crv, (-6),\tS, 0.39550810372374)


],1))









~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus2 ,\dur,Pseq([64/1],inf),\ph,0, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),


	//why was it commented out
	Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,1500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,Pseq([3/1],inf),\group,~lfoGrp ,\frq,Pfunc({5.15.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2Eq,\group, ~distoGrp0),



	/*Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument,\stereo, \dur, Pseq([16/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374,\spread,0.4),


//no limiter
/*	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({(~leTout.numFrames/ 256 * 222.rand)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),*/

	/*Prand([


	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,\vl,0.162),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, ~vocalBus,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.162)
],inf),*/


	/*Pbind(\instrument,  \stereoS, \in,~vocToStereo,  \out,~vocToDispatch , \dur,9999, \spread, 0.8.rrand(0.1),\tS,  0.39550810372374,\group,~stereoGrp),*/


//rythm needs to evolve
Pbind(\instrument, \snare, \type,Pxrand([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),

],inf),
/*	\modHz,~modHz ,*/ \carHz,41.2/*~carHz*//*, \noiLv,~noiLv,\crv1,~crv1,\crv2,~crv2 ,\rel,~rel,\rel2, ~rel2,\modAmp,~modAmp,\modAmp2,~modAmp2*/,
	\crv1,(-8),\crv2,(-7),\rel, 0.0968,\rel2, 0.3872,

	\atk, 0.00502929687,\dur, Pseq([1/4], inf),\amp,(-16.5) ,\out, ~distoPercu  , \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\tS, 0.39550810372374),



],1);

~sequ.stop;
~sequ =
Ppar([

	Pbind(\instrument, \lfoSin, \out, ~bus15,\dur,Pseq([64/1],inf),\tS, 0.39550810372374, \group, ~lfoGrp),



	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([64/1],inf), \out,  ~bus6,\tS, 0.39550810372374,\rL,-0.06,\rH,0.08),

Pbind(\instrument,\playBufXGMod,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,~toEq,\impulse,0.03,\busMod,~bus6
		,\start,Pfunc({~lpPrec.numFrames.rand})),


	Prand([
		Pbind(\instrument, \gateX2,\dur,Prand([Pseq([1/1],1),Pseq([2/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in, ~gateBus3,\out,~revBus1,\group, ~gateGrp),



		Pxrand([
		Pbind(\instrument, \gate,\dur,Prand([Pseq([1/1],1),Pseq([1.5/1],1)],1), \tS, 0.39550810372374,\in, ~gateBusB,\out,~revBus2,\group, ~gateGrp,\vlSub,0.8,\vlSub2,Pkey(\vlSub)),


			Pbind(\instrument, \gate,\dur,Pseq([1/8],8), \tS, 0.39550810372374,\in, ~gateBusB,\out,~revBus2,\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub),\type,Pseq([\note,\rest],1)),

			],1),




		Pxrand([

			Pbind(\instrument, \gate, \dur, Pseq([1/8 ],12),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,
				\type,Pseq([\note,\rest],inf),
				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus),

		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,  ~gateBus,\out,
   ~reverbBus, \tS, 0.39550810372374,\group, ~gateGrp,\atckC,9.00.rrand(2),	\atkT,1, \decT,0),

		Pbind(\instrument, \gate ,\in,  ~gateBus ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],10), Pseq([1/1],1) ],1) ,    \group,~gateGrp, \out,~reverbBus,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],10)/*, Pseq([1/1],1)  */],1),\group, ~gateGrp,\relSu,Pfunc({1.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus),
],1)

	],inf),

],1);



/*~mainLead.play(t)
Ppar([~base, ~mainLead],1).play(t,quant:1)
~mainLead.stop;*/
~mainLead =

Ppar([



	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([64/1],inf), \out,  ~bus1,\tS, 0.39550810372374,\rL,-0.2,\rH,0.8),

	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn,~micBus23 /*~micBus33*/, \buf, ~e2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~f, \out, ~ptrBus,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, ~f,\group,~recGrp,\dur,inf),


	Pbind(\instrument, \playBufXG,\rte,Pfunc({8.rrand(0.25)}),\buf, ~f2,\out,~main1GToG,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/2],inf)),

	Pbind(\instrument, \playBufXG,\buf, ~e2,\out,~main1GToG2,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/8],inf)),


	Pbind(\instrument, \playBufXGMod,\busMod,~bus1,\buf, ~f,\out,~main1GToG3,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/1],inf)),


		Pbind(\instrument, \gate, \dur, Pseq([1.25/1 ],inf),\group, ~distoGrp2,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~micBus),


Pbind(\instrument,\gate,\dur,Pxrand([ /*Pseq([1/4],1),*/Pseq([1/1],1)],inf), \in,~gateBus23  ,\out, ~micBus33,\group, ~distoGrp2,
	\atckC,9.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),


		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1/1],1) ],inf) ,    \group,~distoGrp2, \out,/*Pwrand([~micBus23,~micBus33],[1,1].normalizeSum,inf)*/~micBus23,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.1.exprand(0.01)}),\vlRel,Pkey(\vlAtk)),


	Pbind(\instrument, \gate,\dur,Pseq([1/8],inf), \tS, 0.39550810372374,\in, ~gateBus23,\out,~micBus33,\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub),\type,Pseq([\note,\rest],1)),
	/*].scramble,inf),*/



	Pxrand([

	Prand([
		Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([1/3],3),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})),

				Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([3/1],1),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
					\vlSub,Pfunc({1.exprand(0.9)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)})),


			Pbind(\instrument, \gate,\dur,Pseq([1/8],10), \tS, 0.39550810372374,\in, ~reverbMelo,\out,~outFil,\group, ~gateGrp,\vlSub,1,\vlSub2,Pkey(\vlSub),\type,Pseq([\note,\rest],1)),

		],1),

Pseq([

Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/1],1)],1), \in,~gateBus23  ,\out, ~reverbBus23,\group, ~gateGrp,
	\atckC,5.00.rrand(2),	\atkT,1, \decT,0,\tS, 0.39550810372374,),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],12), Pseq([1/1],1) ],1) ,    \group,~gateGrp, \out,~reverbBus23,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.9.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.3.exprand(0.2)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({4.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
				\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({0.01.exprand(0.001)}),\vlRel,Pkey(\vlAtk)),



Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],6),/* Pseq([1/1],1) */ ],1),\group, ~gateGrp,\relSu,Pfunc({0.8.exprand(0.004)}),
\in, ~gateBus23,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),


			Pbind(\instrument, \gate ,\dur, Pseq([  Pseq([1.5/1 ],1), Pseq([0.75/1 ],1), Pseq([1/2],1)].scramble,1),\in,Prand([~main1GToG,~main1GToG2,~main1GToG3],inf) ,\group,~gateGrp2 ,\out,~reverbBus23,\vlDec,1.2,\vlSub,1.2,\vlAtk,0, \vlSub2,Pkey(\vlSub),\tS, 0.39550810372374)

].scramble,1),


	],inf),


 ],1)

);



~fx.play(t)
Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([


	Pbind(\instrument,\stereoS, \dur,Pseq([8/1],inf), \in, ~delToStereo   ,\out,~toCom/*~tofinalRythm*/,\spread,1, \center, Prand([ Pfunc({0.6.rrand(0.2)}),Pfunc({-0.6.rrand(-0.2)})],inf),\group,~stereoGrp4,\tS, 0.39550810372374),




],1))



Routine({

Ppar([~boost,~pedonk],1).play(t);
	wait(0.16);
	s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/pedonk.aiff",numChannels:10,duration:t.beatDur*128);
}).play(t,quant:1)
// ~ped.play
~pedonk.play(t)
.stop
(~pedonk =Ppar([

	Pbind(\instrument, \lfoSin, \out, ~bus15,\dur,Pseq([64/1],inf),\tS, 0.39550810372374, \group, ~lfoGrp),


	/*Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 80000,\tS, 0.39550810372374 ,\vlSub,  1 , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,0,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),*/



	/*Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
		~eqBus2x,\impulse,0.003,\start, 600000,\tS, 0.39550810372374,\loo,1),*/

/*Prand([

	some idea !!!!


Pbind(\instrument,\playBufXG,\dur, Pseq([Pseq([1/8],12), Pseq([1/4],1),Pseq([1/2],1)/*,Pseq([1.25/1],1) */].scramble,1),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,\loopy,0,\vlDec,Pseq([ Pseq([1],64), Pseq([0.125],32), Pseq([0.5],32)   /*,Pseq([0.21],32)*/],inf),\type,Prand([ \note,  Pseq([\rest,\note],16) ],inf)  ),


	Pbind(\instrument,\playBufXG,\dur, Pseq([1/4],4),\amp, 1,\buf,~lpPrec,\out, ~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,\loopy,0,\type,Prand([ \note,  Pseq([\rest,\note],16) ],inf)  )],inf),*/


Pbind(\instrument,\playBufXG,\dur,/*Pseq([1/2],inf)*/Pseq([1/2],inf)	,\tS, 0.39550810372374
		,\amp, 1,\buf,~lpPrec,\out,~toEq,\impulse,0.03
	,\start,Pfunc({~lpPrec.numFrames.rand})),


Pwrand([
		Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([Pseq([2.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBusB,\tS, 0.39550810372374,\group, ~gateGrp,\out, ~revBus2),

	Prand([

			Prand([
	Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),

				Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([
					Pseq([1/4],6)  ,Pseq([1/4],5)],1),\type, Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note],inf),
				\in,~gateBus,\tS, 0.39550810372374,\group, ~gateGrp,\out,~reverbBus),
			],1),

			/*Pbind(\instrument,\gate, \vlSub,  1 , \vlSub2,Pkey(\vlSub), \dur, Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \in,~gateBus3,\tS, 0.39550810372374,\group, ~gateGrp,\out,~revBus1)*/


				Pbind(\instrument, \gateX2,\dur,Prand([  Pseq([1/2],1) ,Pseq([1.5/1],1)  ,Pseq([1.25/1],1)],1), \tS, 0.39550810372374, \busMod, ~bus15 ,\in, ~gateBus3,\out,~revBus1,\group, ~gateGrp),






		],5),

	],[2,8].normalizeSum,inf),

	Pwrand([
	Pbind(\instrument,\gateS, \in,~deadS, \out,0, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374 ,\type,\rest ),
		Pbind(\instrument,\gateS, \in,~no1, \out,  ~part2Fuzz, \group,~dispatchGrp2,\dur,Pseq([7.75/1],1),\tS, 0.39550810372374  ),

	],[1,16].normalizeSum,inf),


	Pseq([
//1643640
		Prand([
			Pbind(\instrument,\playBufXG, \dur,Pseq([3.75/1],1),\amp, 1,\buf,~lpPrec,\out,~eqBus4,\impulse,0.003,\start,43640 ,\tS, 0.39550810372374,\vlDec,1 ,\vlSub,  ~pSub,\vlSub2,Pkey(\vlSub), \atkT,0.05,\decT, 0.9 ,	\subsT, 0.05 , \relT,0,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~absoFinalGate*/, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )


		],1),


				Pbind(\instrument,\gateS, \in,~part2Fuzz, \out,0/*~absoFinalGate*/, \group,~gateGrp3,\dur, Pseq([56.5/1],1),\tS, 0.39550810372374  ),    // was 60.25 -3.75



		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0/*~absoFinalGate*/, \start,Pfunc({ ~leTout2.numFrames/ 256 * 220.rand}),\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1) )

		],inf)
],1))


// (Pbind(\instrument, \recLoop102,\buf,~leTout,\recording,1, \in,0,\group, ~recGrp3,\dur,inf).play(t, quant:1))




(
Routine({

	Ppar([~base,~no4,~sequ,~mainLead ]).play(t);

	wait(0.160005);

	  s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/stem1.aiff",numChannels:10,duration:t.beatDur*192);


}).play(t,quant:1))



~helpVol=Synth(\volAna,[\in,0],target:~recGrp2 /*~recGrp3*/)
~helpVol.set(\in,0)
~helpVol.free




128+64


~leTout =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/stem1.aiff")
~leTout.play

 s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/stem2.aiff",numChannels:10,duration:t.beatDur*256);

~leTout2 =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/stem2.aiff")

(Pbind(\instrument, \recLoop102,\buf,~leTout2,\recording,1, \in,~absoFinalGate2,\group, ~recGrp3,\dur,inf).play(t, quant:1))


~leTout.free
~leTout.play
~bufBg.play
~buf.play
~bufSnoopy.play
~leTout2.play

s.scope


//simple rise

Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk,0,\f1, 1 , \f2,0, \f3,0.00001,  \ic_atk,-3,\index,1,\mRatio,5,\out ,0,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ,\freq,300).play(t)


({LPF.ar( WhiteNoise.ar(0.3),XLine.kr(1500,3500,0.1)*EnvGen.kr(Env.perc(releaseTime:  0.3),doneAction:2))!2}.play)


SynthDef(\vlan, {|out=0, in, val, quant, gain,frq=220, vol =0.05, val2,quant2, gain2,val3,shelf, gain3,val4,quant3, gain4,val5,quant5, gain5, val6,shelf2, gain6| Out.ar(out,

		HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(HPF.ar(BLowShelf.ar(	BHiShelf.ar( 	BPeakEQ.ar(
		BPeakEQ.ar(	BPeakEQ.ar(LPF.ar( WhiteNoise.ar(0.3),XLine.kr(1500,3500,0.1)*EnvGen.kr(Env.perc(releaseTime:  0.3),doneAction:2)),val,quant, gain),val2,quant2, gain2),val3,quant3, gain3),val4,shelf, gain4),1000,1, (-16)),

		frq),frq),frq),frq),frq),frq),frq),frq)!2* 4)};).play;






{ DynKlank.ar(`[[LFNoise0.kr(0.3).range(100,800),LFNoise0.kr(0.3).range(800,3000),LFNoise0.kr(0.3).range(100,3000),LFNoise0.kr(0.3).range(100,3000)], nil, [4, 4, 4, 4]], Impulse.ar(0.3, 0, 0.1)) }.play;




