~recGrp2=Group.new;
Pbindf(~kick,\out,~toRecord).play(t);
x = Synth(\recLoop,[buf:~k2,\recording,1, \in,~toRecord],~recGrp2);

~k2.play
Pbindef(\ki, \out,0).play(t)
//percu cutting the 1/2 for progression
//new env shape for percu in env file
//replace all TS by t.beatDur in running.scd

//panning big debate , is there any ?
//PANNING Not working on
//IMPORTSNT ~toLimitlast might only block left and UNWANTED feedback with right !!!!


//comp10 might be overlapping
s.plotTree
/* KB AND BASE have unrecordeds    ~bufSnoopy       and     ~bufBg{!=~no4, ~kb, ~rises}   */

Synth(\playBuf2,  [  \buf,/*~bufBg*/ , \out, ~bgFil22    ]);

~buf.play
~bufBg.play
Ppar([~bassShap, Ppar([~kick, ~bass],inf)],1).play(t)

(

~lfoGrp  = Group.new;

~ptrGrp0 = Group.after(~lfoGrp);
~recGrp0 = Group.after(~ptrGrp0);


~granuGrp= Group.after(~recGrp0);
~phaserGrp =  Group.after(~granuGrp);
~distoGrp =  Group.after(~phaserGrp);
~dispatchGrp = Group.after(~distoGrp);
~filterGrp  = Group.after(~dispatchGrp);
~distoGrp0 =  Group.after(~filterGrp);

~eqGrp0 = Group.after(~distoGrp0);
~distoGrp2 =  Group.after(~eqGrp0);

~gateGrp =  Group.after(~distoGrp2);
~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~gateGrp2 =  Group.after( ~granGrp);



~revGrp = Group.after(~gateGrp2);

~delayGrp = Group.after(~revGrp);
~eqGrp = Group.after(~delayGrp);
~dispatchGrp1 = Group.after(~eqGrp);
~filterGrp2  = Group.after(~dispatchGrp1);


~compGrp = Group.after(~filterGrp2);
~delayGrp2 = Group.after(~compGrp);
~combGrp = Group.after(~delayGrp2);
~limitGrp = Group.after(~combGrp);
~stereoGrp = Group.after(~limitGrp);
~dispatchGrp2 = Group.after(~stereoGrp);

~gateGrp3 = Group.after(~dispatchGrp2);

~finalDispatchGrp= Group.after(~gateGrp3);

~shifGrp= Group.after(~finalDispatchGrp);
~limitGrp2 = Group.after(~shifGrp);
~gateGrp4 = Group.after(~limitGrp2);
~gateGrp5 = Group.after(~gateGrp4);
~compGrp2 = Group.after(~gateGrp5);
~eqGrp2 = Group.after(~compGrp2);
~recGrp2= Group.after(~eqGrp2);




o = {
	/*Out.kr(~bus1,  Lag.kr(LFNoise0.kr(1.2875).range(0.15,0.0),0.05)
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0.08,0.00));

*/

	Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));
	/*Out.kr(~bus3, Line.kr(0.2,0.2,9999));*/

	Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
	) ).range(82.4,2637.02),);

	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));

	Out.kr(~bus9, SinOsc.kr( LFTri.kr( 0.321875).range(0.321875,1.2875)).range(82.4,1318.51));//DONT DELETE

	/*Out.kr(~bus13, SinOsc.kr(0.64375).range(20.6,41.20));*/

	Out.kr(~bus14, SinOsc.kr(0.321875).range(-1,1));//NOT USED


	/*Out.kr(~bus3, SinOsc.kr(0.3 ).range((-140),1500));*/

}.play;

)

(

//that really matter
~main1 =( ~buf.numFrames.rrand(1000000)- 1000000);~main2=( ~buf.numFrames.rrand(1000000)- 1000000);~main3=( ~buf.numFrames.rrand(1000000)- 1000000);~rythm=( ~leTout.numFrames.rrand(100000)- 100000);

)



~main1=546545.46976089;
~main2 =1680703.4707069;
~main3= 3863125.9584427;

~base.play(t,quant:1)
(

~base = Ppar([

	Pbind(\instrument,\ptr, \buf, ~k, \out, ~ptrBus,\group,~ptrGrp0,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn,~filterBou /*~micBus*/, \buf, ~k,\group,~recGrp0,\dur,inf),


Pxrand([

		Pbind(\instrument,\gran,\dur,Pseq([1/1],64),\amp, 1,\buf, ~k,\out,~filterBus2/*~limitRkick*/,\atk, 0,\rel, Pseq([1/4],64),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([1/1],64),\impulse,0.03/*Pseq([1/1],inf)*/,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),

		Pbind(\instrument,\gran,\dur,Pseq([4/1],16),\amp, 1,\buf, ~k,\out,~filterBus2/*~limitRkick*/,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus,\pitchRte,(-1),\ptrRandSamples, 0,\minPtrDelay, 1000,\group,~granuGrp,\duration,Pseq([4/1],16),\impulse,0.03/*Pseq([1/1],inf)*/,\crv,50,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),],inf),


	Pbind(\instrument,\ptr, \buf, ~f, \out, ~ptrBus2,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus2, \micIn, ~micBus2, \buf, ~f,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e, \out, ~ptrBus3,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus3, \micIn, ~micBus3, \buf, ~e,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e,\out,~reverbBus2,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub) ),


	Pbind(\instrument,\ptr, \buf, ~f2, \out, ~ptrBus23,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus23, \micIn, ~micBus23, \buf, ~f2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\ptr, \buf, ~e2, \out, ~ptrBus33,\group,~ptrGrp,\dur,inf),
	Pbind(\instrument,\rec, \ptrIn, ~ptrBus33, \micIn, ~micBus33, \buf, ~e2,\group,~recGrp,\dur,inf),

	Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~f2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,Pseq([1/4],inf),\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),\amp, 1,\buf, ~e2,\out,~reverbBus23,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),


	Pbind(\instrument, \lfo1, \dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([16/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp),

	Pbind(\instrument, \lfo14, \dur,Pseq([16/1],inf),\val,Prand([0, 12],inf), \out,  ~bus12, \group, ~lfoGrp),

	Pbind(\instrument, \lfo15, \dur,Pseq([4/1],inf), \out,  ~bus15, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,60,\rH,3600 ,\out,  ~bus11, \group, ~lfoGrp),
	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([16/1],inf),\rL,60,\rH,3600, \out,  ~bus3, \group, ~lfoGrp),

	~bassShap,

	Pbind(\instrument, \lfo13,\val,(~hzQbeat/4),\out,~bus2 ,\dur,999,\ph,0, \rL,200,\rH,4000, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.8),\rH,0.8, \group, ~lfoGrp),


	Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10),\out,~kbus),
	Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], inf),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-16.8), \crv1,(-8),\crv2,(-7)   ,\out,~snBus),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
,\gain,1,\in, ~comBusHat ,\ctrl, ~kbus, \out,~hatEq,\group, ~compGrp),
	Pbind(\instrument,\compS,\dur,inf,\thr,0.6 ,\sB, 1,\sA, 4,\atk ,0.001, \rel ,0.04840,\gain,1,\in, ~comBusCymb ,\ctrl, ~kbus, \out,~cymbalEq,\group, ~compGrp),


	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~hatEq, \group, ~compGrp2, \out , ~comFuzz22,\vol,4),
	Pbind(\instrument , \EQHP2, \frq, 3000 ,\dur, inf,\in, ~cymbalEq, \group, ~compGrp2,\out , ~comFuzz22,\vol,4),


	Pbind(\instrument , \EQHP2, \frq, 120 ,\dur, inf,\in, ~snareEQ, \group, ~eqGrp,\val, 1800, \quant, 8, \gain, (-10), /*\val, 10,*/ \out , ~snareLimit),

	Pbind(\instrument , \limiterS,\dur, inf, \in,~snareLimit, \gain, 20,\group, ~limitGrp),



//main dispatch
	Pxrand([
	Pbind(\instrument,\gateS, \dur,Pseq([1/1],64),\in,Pxrand([
			/*Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,64 )   ,
Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ].scramble,64 ),*/

			Pseq([ ~stetoSnaCom12,~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,64 )   ,
Pseq([ ~stetoSnaCom12,~no1,~no1,~no1,~no1,~no1,~no1,~no1 ].scramble,64 ),




/*	Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ,
				~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1
		].scramble,32 )
,*/

//try no things
			/*Pseq([ ~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1 ,
				~stetoSnaCom12,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1,~stetoSnaCom1
		].scramble,32 ) */],inf),\out,~eqBus102,\group, ~gateGrp3,\tS, 0.39550810372374,),


Pbind(\instrument,\gateS, \dur,Pseq([64/1],1),\in, ~no1  , \out,  ~eqBus102,\group, ~gateGrp3,\tS, 0.39550810372374,)],inf),




	Pxrand([
		Pbind(\instrument, \gateS, \dur,Pseq([1/4],64) , \type,/*Pseq([*/
Pseq([\rest,\rest, \note,\rest,\rest,\rest,\rest, \note,\note,\rest,\rest,\note,\rest,\rest,\rest,\rest].scramble,inf)

		/*Pseq([\rest,\rest, \rest,\rest,\rest,\rest,\rest, \rest,\note,\rest,\rest,\note,\rest,\note,\note,\rest].scramble,1) ],inf)        */,
	\atkT,0.1, \decT, 0.8.rrand(0.6),\subsT, 0.2,\relT, 0.2.rrand(0),\atkT, 4.rrand(1), \vlSub , 0.8.rrand(0.4), \vlSub2, Pkey(\vlSub),\relC, (-5).rrand(-1),\tS, 0.39550810372374,
	\in, ~eqBus102,\group, ~finalDispatchGrp, \out, ~toLimitlast),



	Pbind(\instrument, \gateS, \dur,   Pseq([192/4],1) , \tS, 0.39550810372374,
	\in, ~eqBus102,\group, ~finalDispatchGrp, \out, ~toLimitlast),
	],inf),

	Pbind(\instrument, \limiter10,\in, ~toLimitlast, \out,~new10,\dur,inf,\gain,25,\group,~limitGrp2),

//HERE

	Pseq([


	Pbind(\instrument,\gateS, \dur, Pxrand([ Pseq([4/1],16), Pseq([8/1],8)    ],1)
		,\in,Pseq([ ~newCOn,~new10 ],inf), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

Prand([

Pseq([
	Pbind(\instrument,\gateS, \dur,  Pseq([1/1],1)
				,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf)	, \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

			Pbind(\instrument,\gateS, \dur,  Pseq([3/1],1),\in,Pxrand([~newCOn,~newCOn2,~new10,],inf ), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374)].scramble, 16),

		Pseq([
	Pbind(\instrument,\gateS, \dur,  Pseq([2/1],1)
				,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf)	,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

			Pbind(\instrument,\gateS, \dur,  Pseq([6/1],1) ,\in,Pxrand([~newCOn,~newCOn2,~new10,],inf ), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374)].scramble, 8),

		],1),

Pxrand([

	Pbind(\instrument,\gateS, \dur,Pseq([64/1],1)
				,\in, ~no3,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pseq([
		Pbind(\instrument,\gateS, \dur,Pseq([56/1],1)
			,\in, ~no3 ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),


				Pbind(\instrument,\gateS, \dur,Pseq([4/1],1),\in, ~no3  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in, ~newCOn  ,\out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,),

		Pbind(\instrument,\gateS, \dur,Pseq([2/1],1),\in, ~newCOn  , \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374),].scramble,1)
		],1),

		//to chnage for final
	Pbind(\instrument,\gateS, \dur,Pseq([4/1],16)
			,\in,Prand([~percuCom2 ,~rndBus],1), \out,~finGran,\group, ~gateGrp4,\tS, 0.39550810372374,)


	].scramble,inf),


	Pseq([

	Pseq([
		Pseq([
Pbind(\instrument, \playBuf10N,  \out, ~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out, ~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		],1),

		Pbind(\instrument, \gateS, \dur,   Pseq([256/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),


			Pseq([
		Pseq([
Pbind(\instrument, \playBuf10N,  \out, ~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,700, 700,700,700].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out, ~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,700, 700,700,700].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		Pseq([
Pbind(\instrument, \playBuf10N,  \out,~toCom,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames/ 256 * 249.rand),\group, ~gateGrp5)
		],4),

		],1),


			Pbind(\instrument, \gateS, \dur,   Pseq([256/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),


],inf),




	Pbind(\instrument,\comp10, \dur,999999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
				,\in, ~toCom  ,\ctrl, ~snBus, \out,~eqBus10,\group, ~compGrp2,\tS, 0.39550810372374)
	,


	Pbind(\instrument,\EQHP10, \in, ~eqBus10 ,\out, 0,\frq, 100, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,1, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-6),\vol, 1.2),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.04,\sA, 0.2,\atk ,0.0242, \rel ,0.0968,\ctrl,~eqBus10 ,   \in, ~comFuzz22 ,\group,~eqGrp2)







/* for BG
	Pbind(\instrument, \filterS, \dur, inf,\in,~bgFil22, \busMod,~bus2, \qf, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/2,\atk ,0.01, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2,\group,~compGrp ),

	Pbind(\instrument,  \stereoX, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([12/1],inf),  \group, ~stereoGrp,\type, Pseq([\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest].scramble,inf)),

	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~eqGrp2),

	Pbind(\instrument,  \limiterS, \dur, inf, \in,~bgLimit2 ,\out,~bgBus2, \gain, 5,\group,~limitGrp2   ),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.9 ,\sB, 1.2,\sA, 1/2,\atk ,0.01, \rel ,0.3872
		,\gain,1,\in, ~bgBus2 ,\ctrl, ~snBus, \out,~bgStereo2,\group,~compGrp2 ),*/


],1)/*.play(t, quant:1)*/)

Ppar([~base, ~kb],1).play(t,quant:1)
~kb.stop;
(~kb =
Ppar([


	//WATCH OUT UNRECORDED ,aybe put in KB more practical
	Pseq([Pbind( \instrument, \playBuf10, \impulse, 0.3 ,
				\dur,Pseq([4/1],1), \tS,  0.39550810372374,\start,Pfunc({( ~leTout.numFrames.rrand(1000000)- 1000000)}),\buf,~leTout,\out, ~rndBus,\loopy,0)],inf),


Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.2),

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1), Pseq([1/64],64),Pseq([1/64],256)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,1,/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.17),


	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0),


	Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),/*\group,~granGrp,*/\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.22)

	],inf),

Pbind(\instrument, \dispatch , \dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out, Prand([~lpK,~bpK,~hpK],inf)),


Pbind(\instrument, \filter, \dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,\rqLPF,~bus6, \out,~limitRnd, \group,~filterGrp ),

Pbind(\instrument, \filter, \dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~limitRnd, \group,~filterGrp),


	Pbind(\instrument, \limiter,\dur,inf,\gain, 22, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),

Pxrand([
	Pseq([

	Pseq([  Ppar([ ~perc[2]   ,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/2],24), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))],1),


				Prand([
			Pbind(\instrument, \dispatchS10, \dur, Pseq([4/1],1),\in,~rollingK,\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2),

				Pseq([~kick, Pseq([~bassRest],3)],1),
				Ppar([
					Pseq([Pbindf(~kick, \out,~eqBass)],4),Pseq([	Pbindf(~bass,\out,~eqBass)],4),

						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,Pfunc({120.rand}), \group,~shifGrp,\tS, 0.39550810372374,)],1)


	],1),	],1),


	Pseq([/*Ppar([ */~perc[3] ,/* Pwrand([ ~perc[3]   ,~bar[4] ],[4,1],1),*/ /*Pbind( \instrument, \playBufS, \impulse,0.6 ,
	\dur,Pseq([1/2],28), \tS,  0.39550810372374,\start,~rythm,\buf,~bufBg,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
			],1),*/
	/*s,*/
	Ppar([
				  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/2],4), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
			,
					Pbindf(~kick, \out,~eqBass),
	Pbindf(~bass,\out,~eqBass, \type,\note,\dur,Pseq([2/1],1),\rel, 2* (60/~bpm)),

	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([2/1],1), \out,~dipatchKB, \freq,Pfunc({120.rand}), \group,~shifGrp)
],1)
	],1),


		Ppar([	Pseq([   Prand([ ~perc[4],Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/2],48), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest],inf))
			   , Ppar([ ~bar[5],Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 7),\da1,0)  ],1)],1),


	Pbind(\instrument, \dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\out,0,\tS, 0.39550810372374,\group,~dispatchGrp2)
	],1)
		,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
				\dur,Pseq([1/2],32), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))],1),


		   Prand([ Ppar([ ~perc[5]    ,  Pbind( \instrument, \playBuf10, \impulse,0.6 ,
				\dur,Pseq([1/2],32), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf)) ],1) ,/* ~bar[6]*/




			Pseq([	/*Ppar([*/~perc[3]/*, Pbind( \instrument, \playBufS, \impulse,0.6 ,
	\dur,Pseq([1/2],24), \tS,  0.39550810372374,\start,~rythm,\buf,~bufBg,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
			],1)*/
				,

				Ppar([

				Pbind( \instrument, \playBuf10, \impulse,0.6 ,
	\dur,Pseq([1/2],4), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type, Pseq([\rest,\note,\rest,\rest],inf))
		,
					Pseq([Pbindf(~kick, \out,~eqBass)],4),Pseq([	Pbindf(~bass,\out,~eqBass)],4),

						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,Pfunc({120.rand}), \group,~shifGrp,\tS, 0.39550810372374,)],1)



			],1) ],1)


		].scramble,4),




	Pseq([
			Pseq([ Pseq([~kick, Pseq([ ~bassRest], 3)],1)  ,~perc[1] ,

Prand([
			Pbind(\instrument, \dispatchS10, \dur, Pseq([8/1],1),\in,~rollingK,\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
						,Pseq([~kick, Pseq([~bassRest],5),~kick,~bassRest],1)
	],1)


	],1),


	Pseq([ ~perc[0]      ,


	Pbind(\instrument,\dispatchS10, \dur, Pseq([12/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


/*	Prand([*/	Pseq([   Prand([ ~perc[4]   /*, ~bar[5] */ ],1),


	Pbind(\instrument,\dispatchS10, \dur, Pseq([1/1],1),\in,Prand([ 0, ~rollingK],inf),\tS, 0.39550810372374,\out,0,\group,~dispatchGrp2)
	],1),


			Pxrand([ ~perc[5], Pseq([~kick, Pseq([ ~bassRest], 7) ,   Ppar([
					Pseq([Pbindf(~kick, \out,~eqBass)],4),Pseq([	Pbindf(~bass,\out,~eqBass)],4),

						Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,~dipatchKB, \freq,Pfunc({120.rand}), \group,~shifGrp,\tS, 0.39550810372374,)],1), Pseq([~kick, Pseq([ ~bassRest], 3)   ],1)],1)

		],1)
		,

			Pseq([ ~perc[4],Ppar([~kick, Pxrand([~kick,	~bassMel[~scale]],1)],1)


			],1)


				].scramble,4),

],inf),

Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,78, \group, ~limitGrp2),



	//INCORPORAE SLIGHT MOVEMENT

	Pbind(\instrument, \filter10,\freqFil,400, \in,~rythmFil,\which,0,\qf2,0.55, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),

	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~rythmLimit, \group,~eqGrp,\vol,10),

	Pbind(\instrument, \limiter10, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,28, \group, ~limitGrp),

	Pbind(\instrument,\comp10, \dur,inf,\thr,0.7 ,\sB, 1.2,\sA, 2,\atk ,0.001, \rel ,0.3872,\dur,99999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, 0,\group, ~compGrp2 ,\tS, 0.39550810372374),


],1))

Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	/*Pbind(\instrument, \kick,\dur, Pseq([1/1],inf),\amp,(-10),\out,~kbus),*/


Pbind(\instrument, \snare,/*\carHz, 41.2 */\type,Pseq([

	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
	Pseq([\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest,\note ,\rest,\note,\rest].scramble, 4),
],inf),
	\modHz,240.00.rand , \carHz,140.00.rrand(10.00), \noiLv,1.00.rand,

//has to change, cMon! maybe add a disto
	\atk, 0.00502929687,\rel,0.0968.rrand(0.05),\rel2, 0.0968.rrand(0.05),\dur, Pseq([1/4], inf),\amp,(-16.5), \crv1,(-12.00).rrand(-4.00),\crv2,(-12.00).rrand(-4.00)   ,\out,~percuFil/*~percuEq*/, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk)/*,\tS, 0.39550810372374*/,\modAmp,5000.00.rrand(1.00),\modAmp2,5000.00.rrand(1.00)),


	Pbind(\instrument, \filterS, \dur,inf,\which,2, \in,~percuFil,\busMod, ~bus4,\rqLPF,~bus7, \out,~percuEq/*~revSide2*/, \group,~filterGrp ,\freqFil, 30.rrand(-30)),

	/*Pbind(\instrument, \distoS, \dur, inf, \in, ~revSide2 , \out,~percuEq ,\group, ~distoGrp0),*/

	Pbind(\instrument , \EQHP2, \frq, 100 ,\dur, inf,\in, ~percuEq, \group, ~eqGrp0,\val, 1800, \quant, 8, \gain, (-10),/* \val, 10, */\out , ~percuRev),


	/*, REPLACE WITH A FLANGER*/

	 Pbindf( ~quickFix, \instrument, \reverbS, \dur,inf, \in,~percuRev  , \out,~percuCom,\group,~revGrp),


	Pbind(\instrument,\compSX, \dur,Pseq([4/1],inf),\thr,0.6 ,\sB, 1.2,\sA, 2,\atk ,0.0001, \rel ,0.04840
		,\gain,1,\in, ~percuCom ,\ctrl, ~kbus, \out, Pwrand([~percuDelay,~percuLimit],[1,4].normalizeSum,inf),\group, ~compGrp ,\tS, 0.39550810372374),

	Pbind(\instrument, \pingDSX, \in, ~percuDelay ,\bufnum, /*b.bufnum*/Pseq([~delay2,~delay3,~delay4,~delay5],inf), \dur, Pseq([4/1],inf),\out,~percuComb,\group, ~delayGrp2,\delayTime,Pfunc({0.3.rrand(0.04)})/*0.04*/,\feedback,  1.00.rrand(0.1)),

	///*MouseX.kr(0.01,2)*/maxDel, delayT /*MouseY.kr(0.01,2)*/,decT/*3*/)
	Pbind(\instrument, \combS,\in, ~percuComb,\out,~percuLimit,\dur, Pseq([4/1],inf),\group,~combGrp,
		\maxDel,Pfunc({2.00.rrand(0.01)}), \delayT,Pfunc({1.80.rrand(0.01)}),\decT,1.00.rrand(0.1),\tS, 0.39550810372374
	),

Pbind(\instrument , \limiterS,\dur, inf, \in,~percuLimit, \gain, 24,\group, ~limitGrp,\out,~percuCom2)],1))


//TO SEE
/*Pbind(\instrument,\stereoS, \dur, 99999999, \in,   ,,\spread,1,\out,0,\tS, 0.39550810372374,\group, ~stereoGrp),*/



(~track = Ppar([ ~base, ~kb , ~rises, ],1).play(t,quant:1))
~rises.stop;
(~rises =

//WATCH OUT ROUTING TO ZERO OR ~no1

Ppar([

Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


//ONE day to fixx with BG
		Pbind(\instrument, \gateS, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus,\tS, 0.39550810372374),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),



		Pxrand([
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-20), \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,(-20), \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),
				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		],1)

		],1)

	],inf),


	Pbind(\instrument, \compS, \thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,   \dur, inf, \in, ~slideBus , \out,~slideBusToLimit,\ctrl, ~kbus, \group, ~compGrp),
	Pbind(\instrument, \limiterS, \dur, inf, \in, ~slideBusToLimit, \gain, 20, \group,~limitGrp),

	//debug



Pseq([

		Pxrand([

		Ppar([

	Prand([

				Pbind(\instrument,\gran,\dur,Pseq([1/256],1),
		\group,~granuGrp,\vlSub,0,\vlSub2,0,\decC,(-90),\decT, 0.1, \vlDec,1,
	\amp, 1,\buf, ~buf,\out,~noiseStereo2,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\pos,0.90000.rand),

		Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-20),\out,~eqNoise),

		Pbind(\instrument,\gran,\dur,~short1,\amp, 1,\buf, ~buf,\out,~eqDs,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),
				\vlSub, 0.8,\vlSub2,Pkey(\vlSub),\decC,Pfunc({(-10).rrand(2,1)}),\pos,Pfunc({0.90000.rand}))],1),


	Pbind(\instrument, \wNoise,\dur,Pseq([16/1],1),\dec ,Pkey(\dur),\amp,(-12),\type,\rest/*~noiseStereo1*/)
		],1),


		Pxrand([

				Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\type,Prand([\note,\rest],inf),\tS, 0.39550810372374, \out, ~riEq),


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~riFil2/*,\type,Prand([\note,\rest],inf)*/,\tS, 0.39550810372374),

		],1),

		],12),


		Pseq([
Pbind(\instrument,\rise,\dur,Pseq([32/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}), \index,Pfunc({50.00.rrand(1)}),
					\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\finish, { ~key.envirPut(~value)},\tS, 0.39550810372374,/*\type,Prand([\note,\rest],inf),*/\out,~riFil2)],2),


	Pbind(\instrument,\rise,\dur,Pseq([64/1],1),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~riFil,/*\type,Prand([\note,\rest],inf),*/\tS, 0.39550810372374),

		//HERE THE CLASSIC RISE BUT EASY

].scramble,inf),



Pbind(\instrument, \filter , \in,  ~riFil   ,\dur,inf, \out,~riEq, \busMod, ~bus11, \qf,0.6, \group, ~filterGrp),
	Pbind(\instrument, \filter , \in,  ~riFil2   , \dur,inf,\out,~riEq, \busMod, ~bus3, \qf,0.6, \group, ~filterGrp),


	Pbind(\instrument,\EQHP2, \in, ~riEq , \out, ~riDisto ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-8)),






	Pbind(\instrument, \distoS, \dur, inf, \in, ~riDisto , \out,~riRev ,\group, ~distoGrp2),

	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~riRev  , \out,~riComp,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riComp ,\ctrl, ~kbus, \out,~riLimit, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~riLimit, \dur, inf,\gain,8,\group,~limitGrp,\out,~riStereo),

	Pbind(\instrument,\stereoS, \dur, Pseq([64/1],inf), \in, ~riStereo  , \center,Pfunc({0.20.rrand(-0.2)}),\spread,1,\out,~again,\tS, 0.39550810372374,\group, ~stereoGrp),


	Pbind(\instrument,\comp10, \dur,999999,\thr,0.4 ,\sB, 1.04,\sA, 0.2,\atk ,0.0242, \rel ,0.3872
			,\in,~again   ,\ctrl, ~snBus, \out,~eqBus210,\group, ~compGrp2,\tS, 0.39550810372374,),

	Pbind(\instrument,\EQHP10, \in, ~eqBus210 ,\out, 0,\frq, 600, \dur,inf,\group, ~eqGrp2,\val,11800,\quant,1, \gain,(-8),\val2,2600,\quant2,8, \gain2,(-6),\vol, 1),

//Rise  ,riEq,riDisto riRev, riComp,riLimi, ===>random flanger would be awe


	Pbind(\instrument,\EQHP, \in,   ~noiseStereo2 , \out, ~revSide ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,2800, \quant,8, \gain,(-8)),


Pbindf(~rLong,\dur,inf, \in,~revSide , \revtime, 12,\out,~comSide,\taillevel,0,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comSide ,\ctrl, ~kbus, \out,~limitSide, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitSide, \dur, inf,\gain,8,\group,~limitGrp,\out,~stereoSide),

	Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoSide  ,\spread,1,	\atkT,0.05,\crvA,22,  \decT,0.95,\out,~no1,\tS, 0.39550810372374,\group, ~stereoGrp),





	Pbind(\instrument,\EQHP, \in, ~eqNoise , \out, ~noiseRev ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rLong,~rShort]),\instrument, \reverbS, \dur,inf, \in,~noiseRev  ,  \out,~no1,\group,~revGrp),



	Pbind(\instrument,\EQHP, \in, ~eqDs , \out, ~reverbBus3 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( ~rLong,\dur,inf, \in,~reverbBus3  , \out,~comFuzz3,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz3 ,\ctrl, ~kbus, \out,~limitFuzz3, \group, ~compGrp),
	Pbind(\instrument, \limiter,\in, ~limitFuzz3, \dur, inf,\gain,10,\group,~limitGrp,\out,~stereoBus4),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus4   ,\out,~no1, \group, ~stereoGrp),],1)/*.play(t, quant:1)*/)
)


~sequ.play(t)
~t = Ppar([~base, ~kb,~sequ],1).play(t,quant:1)


.stop

(
~sequ =
Ppar([


//For init

/*Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+100000).exprand("1".postln;~main1.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+100000).exprand("2".postln;~main2.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+100000).exprand("3".postln;~main3.postln)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),*/


	Pseq([
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
				\dur,    Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main1+100000).exprand(~main1)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
		\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main2+100000).exprand(~main2)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4),
	Pseq([
Pbind( \instrument, \playBuf, \impulse, 0.3 ,
			\dur, Prand([ Pseq([1/4],4) , Pseq([1/1],1)],1), \tS,  0.39550810372374,\start,Pfunc({(~main3+100000).exprand(~main3)}),\buf,~bufSnoopy,\out, ~eqBus1,\loopy,0)],4)].scramble,inf),




		Pbind(\instrument,\EQHP, \in, ~eqBus1 , \out,~gateBus,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pxrand([



		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,~filterBus),

		Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,  ~gateBus,\out,
			Pwrand([~filterBus,~reverbSquelch ],[16,1].normalizeSum,inf),\group, ~gateGrp,
\atkC,9.00.rrand(2),	\atkT,1, \decT,0),




		Pbind(\instrument, \gate ,\in,  ~gateBus ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~filterBus,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


		Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~filterBus),

		/*
		Pbind(\instrument, \gate, \dur, Pseq([1/4],4)  ,\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in,~gateBus ,\tS, 0.39550810372374,

			\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~delayBus)*/

	],inf),





	Pxrand([
	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([1/4],64), \in,~filterBus/*~gateBus*/ /*~gateSeqBus*/ , \group, ~gateGrp2,
		\type, Pseq([
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest,
			\rest, \note, \note, \rest, \rest, \rest, \rest, \rest,
			\rest, \note, \note, \rest, \note, \rest, \note, \rest  ].scramble,2),
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),


	Pbind(\instrument,\gate, \vlDec, 1,\dur,Pseq([16/1],1), \in,~filterBus /*~gateSeqBus*/ , \group, ~gateGrp2,
		 \tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub),\out,~reverbBus),
],inf),

	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~reverbBus , \out, ~comFuzz ,\group,~revGrp),

	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comFuzz ,\ctrl, ~kbus, \out,~limitFuzz, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur,inf,\gain,25,\group,~limitGrp,\out,~stereoBus1),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoBus1   ,\out,~no1, \group, ~stereoGrp),],1)


)


//NO2 had downshifter
~mainLead.play(t)
Ppar([~base, ~mainLead/*,~kb*/],1).play(t,quant:1)
~mainLead.stop;
(~mainLead =

Ppar([



	//SUPER IMPORTNT ::: ( ~buf.numFrames.rrand(100000)- 100000)
Pbind( \instrument, \playBufX, \impulse, 0.075,
		\dur,inf, \tS,  0.39550810372374,\start,~main1,\buf,~bufSnoopy,\out, ~filterRnd,\loo,1) ,


	Pbind( \instrument, \playBufX, \impulse,Prand([0.01875,0.075],1) ,
		\dur,inf, \tS,  0.39550810372374,\start,~main2,\buf,~bufSnoopy,\out,   ~gateRnd,\loo,1),



	Pbind( \instrument, \playBufX, \impulse,0.075 ,/*Pseq([ Pseq([1/16],64),Pseq([1/4],16),Pseq([1/1],4),Pseq([4/1],1) ].scramble,1)*/
		\dur,inf, \tS,  0.39550810372374,\start,~main3,\buf,~bufSnoopy,\out, ~reverbRnd,\loo,1),


	Pbind(\instrument, \gate,\dur,Pseq([64/1],inf) ,\in,Pseq([ ~reverbRnd,~filterRnd].scramble,inf),\out,~eqBus23/*~distoBus43*/,\group, ~lfoGrp,\tS, 0.39550810372374,\vlSub,1,\vlSub2,Pkey(\vlSub)),



	Pbind(\instrument,\EQHP, \in, /*~filterBus23*/ ~gateRnd, \out,~reverbMelo,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	Pbind(\instrument,\EQHP, \in, ~filterBus23 , \out, ~distoBus43,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),




	 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~distoBus43  , \out,~gateSeqRnd,\group,~revGrp),


	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~gateSeqRnd  ,\ctrl, ~kbus, \out,~newBus1, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in,~newBus1 , \dur, inf,\gain,17,\group,~limitGrp,\out,~newBus2),

Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~newBus2  ,\out, ~no5, \group, ~stereoGrp),



/*	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus43 , \out,~eqBus23 ,\group, ~distoGrp0),*/

	Pbind(\instrument,\EQHP, \in, ~eqBus23 , \out,~gateBus23,
		\val, 3400.00.rrand(1300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(1300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),


	//GIVES BLANKS

	Pxrand([

		Pbind(\instrument, \gate ,\in, ~reverbMelo  ,\vlDec,1,
		\dur,Pseq([1/3],3),    \group,~gateGrp, \out,~outFil ,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),



		Pbind(\instrument, \gate, \dur, Pseq([4/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,Pwrand([~micBus33,~reverbBus23],[1,1].normalizeSum,inf)),

Pbind(\instrument,\gate,\dur,Pxrand([ Pseq([1/4],1),Pseq([1/1],1)],1), \in,~gateBus23  ,\out, Pwrand([~micBus33,~reverbBus23],[1,1].normalizeSum,inf),\group, ~gateGrp,
	\atkC,9.00.rrand(2),	\atkT,1, \decT,0),

		Pbind(\instrument, \gate ,\in,~gateBus23   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,Pwrand([~micBus23,~micBus33,~reverbBus23],[1,1,4].normalizeSum,inf),\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	),


Pbind(\instrument, \gate, \dur, Pxrand([ Pseq([1/4],16), Pseq([1/1],1)  ],1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),





	],inf),



 Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus23  , \out,~comFuzz23,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz23 ,\ctrl, ~kbus, \out,~limitFuzz23, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in, ~limitFuzz23, \dur, inf,\gain,17,\group,~limitGrp,\out,~stereoBus23),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus23   ,\out, ~no3, \group, ~stereoGrp),



Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in, ~outFil , \out,~comBusHat2,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~comBusHat2  ,\ctrl, ~kbus, \out,~comBusCymb2, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in,~comBusCymb2 , \dur, inf,\gain,17,\group,~limitGrp,\out,~limitRkick2),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoRkick2   ,\out, ~no3, \group, ~stereoGrp),

 ],1)

)


~test =Ppar([/*~bassShap,Ppar([~kick ,~bass],inf),*/~base, ~percheur],1).play(t);
~percheur.stop;
(~percheur = //percheur



Ppar([
	//THIS IS TOO SHORTT 1/4 HAVE SOME 1/1

	//debug

	Pxrand([

	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],24)  ,   Pseq([1/1],24)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
		\amp, 1,\buf, ~buf,\out,~phaseBus,\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

		\pos,Pxrand([ Pseq([0.950.rand],24),  Pseq([0.950.rand],24) , Pseq([0.950.rand],24), Pseq([0.950.rand],24) ,
			Pseq([0.950.rand],24),  Pseq([0.950.rand],24) , Pseq([0.950.rand],24), Pseq([0.950.rand],24)],inf),

\tS, 0.39550810372374 ,

\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],24) , Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1)],24), Pseq([1.00.rrand(0.2,1) ],24) ,
		Pseq([  1.00.rrand(0.2,1)   ],24) , Pseq([  1.00.rrand(0.2,1) ],24), Pseq([  1.00.rrand(0.2,1) ],24) , Pseq([  1.00.rrand(0.2,1)   ],24)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Prand([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24),Pseq([0.04.rrand(0.4,0.3)],24)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24),Pseq([0.02.rrand(0.3,0.1)],24)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24),Pseq([0.12.rrand(0.8,1)],24)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],24)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24),Pseq([(-10).rrand(-2,1)],24)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24),Pseq([(-8).rrand(-2,1) ],24)],inf),
	),


	Pbind(\instrument,\gran,\dur,Prand([ Pseq([1/4],12)  ,   Pseq([1/1],12)   ],1)  ,//was 4
/*\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest].scramble,inf),*/
			\amp, 1,\buf, ~buf,\out,Pxrand([ Pseq([~phaseBus],12),Pseq([~distoPerch],12)],inf),\gate, 1,\duration,Pkey(\dur)/*Pseq([1/1],inf)*/,\impulse,0.003,

		\pos,Prand([ Pseq([0.950.rand],12),  Pseq([0.950.rand],12) , Pseq([0.950.rand],12), Pseq([0.950.rand],12) ,
			Pseq([0.950.rand],12),  Pseq([0.950.rand],12) , Pseq([0.950.rand],12), Pseq([0.950.rand],12)],inf),

\tS, 0.39550810372374 ,

\vlSub, Prand([ Pseq([1.00.rrand(0.2,1)],12) , Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1)],12), Pseq([1.00.rrand(0.2,1) ],12) ,
		Pseq([  1.00.rrand(0.2,1)   ],12) , Pseq([  1.00.rrand(0.2,1) ],12), Pseq([  1.00.rrand(0.2,1) ],12) , Pseq([  1.00.rrand(0.2,1)   ],12)           ],inf),\vlSub2,Pkey(\vlSub),
		\atkT,Prand([  Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],24),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12),Pseq([0.00.rrand(1.00,1) ],12)],inf),
	\decT, Prand([Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12),Pseq([0.04.rrand(0.4,0.3)],12)],inf),
	\subsT, Prand([Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12),Pseq([0.02.rrand(0.3,0.1)],12)],inf),
	\relT,Prand([ Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12),Pseq([0.12.rrand(0.8,1)],12)],inf),
	\atckC,Pfunc({Pseq([6.rrand(0,1)],12)},inf),
	\decC,Prand([Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12),Pseq([(-10).rrand(-2,1)],12)],inf),
	\relC,Prand([ Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12),Pseq([(-8).rrand(-2,1) ],12)],inf),
	),

	],inf),//was 10






	Pbind(\instrument, \phaser,\in,~phaseBus,\dur ,Pseq([24/1],inf),\value, Pfunc({1.2875.exprand(0.075)}),\amp,Pfunc({1.exprand(0.075)}),\decT,Pfunc({0.7744.exprand(0.0424)}),\out,~distoPerch, \group,~phaserGrp),

			Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch , \out,~eqPerch,\group, ~distoGrp),

	Pbind(\instrument,\EQHP, \in, ~eqPerch , \out, ~revPerch ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf( Prand([~quickFix, ~rShort]),\dur,inf, \in,~revPerch  , \out,~comPerch ,\group,~revGrp),


	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch ,\ctrl, ~kbus, \out,~limitPerch, \group, ~compGrp),


	Pbind(\instrument, \limiter,\in, ~limitPerch, \dur, inf,\gain,20,\group,~limitGrp,\out,~stereoPerch),

Pbind(\instrument,\stereo, \dur, 9999, \in, ~stereoPerch ,\spread,1  ,\center,Pxrand([ Pfunc({0.80.rand}),Pfunc({-0.80.rand})],inf), \out,~stetoSnaCom12, \group, ~stereoGrp), ],1); )

~t = Ppar([~passant, ~base],1).play(t,quant:1);
~passant.stop;
(~passant=

	//passant

	Ppar([

	Prand([
//was ~buf
		Pbind( \instrument, \playBuf, \impulse, 0.075,
		\dur,Pseq([16/1],inf), \tS,  0.39550810372374,\start,Pfunc({( ~bufSnoopy.numFrames.rrand(1000000)- 1000000)}),\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind( \instrument, \playBuf, \impulse, 0.3,
			\dur,Pseq([4/1],inf), \tS,  0.39550810372374,\start,Pxrand([
			Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),
				Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),
				Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),
				Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),
				Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),Pseq([(~buf.numFrames.rrand(1000000)- 1000000)],4),
		],inf)     ,\buf,~buf,\out, ~filterBou,\loopy,0),


	],inf),


	Pbind(\instrument, \filter, \in ,~filterBou, \dur, inf ,\busMod, ~bus3, \qf,0.8, \out, ~gateBou/*~distoBou*/, \group ,~filterGrp),

	/*Pbind(\instrument, \disto, \dur, inf, \in ,~distoBou,\out,~gateBou, \group ,~distoGrp0),*/


	Pxrand([
	Pbind(\instrument, \gate ,\in,~gateBou   ,\vlDec,1,\vlSub,1, \vlSub2,Pkey(\vlSub),
		\dur, Pseq([4/1],1) ,    \group,~gateGrp, \out,~dead ,\tS, 0.39550810372374 ,\relSu,0,\atkT,0, \decT,1, \subsT,0, \relT,0, \atckC,0, \decC,0, \relC,0,\vlAtk,0,\vlRel,Pkey(\vlAtk)),

		Pbind(\instrument, \gate ,\in,~gateBou   ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],16), Pseq([1/1],1) ],3) ,    \group,~gateGrp, \out,~dead,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
	)
	],inf),


	Pbind(\instrument , \EQHP, \frq, 100 ,\dur, inf,\in, ~dead, \group, ~gateGrp2,\val, 1800, \quant, 16, \gain, (-10), \val, 10, \out , ~reverbBus4),


	Pbindf(~quickFix /*Prand([~quickFix, ~rShort, ~rLong])*/,\dur,inf, \in,~reverbBus4  , \out,~comFuzz4 ,\group,~revGrp),






	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1	,\in, ~comFuzz4 ,\ctrl, ~kbus, \out,~limitFuzz4, \group, ~compGrp),


	Pbind(\instrument, \limiterS,\in, ~limitFuzz4, \dur,inf,\gain,15,\group,~limitGrp,\out,~stereoBus14),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus14   ,\out, ~newCOn, \group, ~stereoGrp),




//OLD HP

		Pbind(\instrument, \filter, \dur,inf, \in,~filterBus2,\which,2,\busMod, ~bus5,\bus7,~bus7, \out,~distoBus4, \group,~filterGrp,\freqFil, 30.rrand(-30)),

	Pbind(\instrument, \disto, \dur, inf, \in, ~distoBus4 , \out,~eqBus2 ,\group, ~distoGrp0),

	Pbind(\instrument,\EQHP, \in, ~eqBus2 , \out, ~gateBus2,
		\val, 3400.00.rrand(2300,0.001),\quant, 16.rrand(5,1), \gain,(-8).rrand((-2),1),
		\val2, 3400.00.rrand(2300,0.001),\quant2, 16.rrand(5,1), \gain2,(-8).rrand((-2),1)
		,\frq, 100, \dur,inf, \group, ~eqGrp0),

	Pxrand([

	Pbind(\instrument, \gate, \dur, Pseq([1/4],16),
			\type, Pxrand([ Pseq([\note],256) , Pseq([\note,\rest,\note,\rest, \rest,\note,\rest,\note].scramble,8),Pseq([\rest,\rest,\note,\rest, \rest,\note,\rest,\rest].scramble,8)],inf), \group, ~gateGrp,

				\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})


			,\in, ~gateBus2, \tS, 0.39550810372374,\out,
			Pwrand([~micBus2,~micBus3,~reverbBus2],[1,1,16].normalizeSum,inf)),
	],inf),
Pbind(\instrument, \gate, \dur,Pwrand([~short,Pseq([1/4 ],16)],[4,1].normalizeSum,1),\group, ~gateGrp,\relSu,Pfunc({0.12.exprand(0.04)}),\vlSub,1,\vlSub2,Pkey(\vlSub),\in, ~gateBus2, \tS, 0.39550810372374,\out,
~reverbBus2),


	Pbindf( Prand([~quickFix, ~rShort, ~rLong]),\dur,inf, \in,~reverbBus2  , \out,~comFuzz2,\group,~revGrp),

	Pbind(\instrument,\compS, \dur,Pseq([1/1],1),\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comFuzz2 ,\ctrl, ~kbus, \out,~limitFuzz2, \group, ~compGrp),
	Pbind(\instrument, \limiterS,\in, ~limitFuzz2, \dur, inf,\gain,22,\group,~limitGrp,\out,~stereoBus2),

	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus2   ,\out, ~newCOn2/*~no1*/, \group, ~stereoGrp)



	],1);

	)

.stop
(~fx=Ppar([	Pbind(\instrument, \pingD, \in, ~delayBus ,\bufnum, /*b.bufnum*/~delay, \feedback,0.38 ,\dur, inf,\out,~revDelay,\group, ~revGrp),


Pbindf( Prand([~quickFix, ~rShort]),\instrument, \reverbS, \dur,inf, \in,~revDelay  , \out,~comDelay ,\group,~delayGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 10,\in, ~comDelay ,\ctrl, ~kbus, \out,~limitDelay, \group, ~compGrp),

Pbind( \instrument, \limiterS,\in,~limitDelay, \dur,inf, \gain,15,\group,~limitGrp,\out ,~stereoBus3),




Pbindf( ~church,\dur,inf, \in,~reverbSquelch  , \out,~comSquelch ,\group,~revGrp),
	Pbind(\instrument,\comp, \dur,inf,\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872
,\gain, 22,\in, ~comSquelch ,\ctrl, ~kbus, \out,~limitSquelch, \group, ~compGrp),

	Pbind(\instrument, \limiterS,\in, ~limitSquelch, \dur, inf,\gain,15,\group,~limitGrp,\out,~stereoBus3),




	Pbind(\instrument,\stereoS, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp),

	Pbind(\instrument,\compS, \dur,inf,\thr,0.6 ,\sB, 1.04,\sA, 0.2,\atk ,0.0968, \rel ,0.3872
		,\in, ~comSnaGrpBus2 ,\ctrl, ~snBus, \group, ~compGrp2,\out,~eqBus10),
],1))




//new one

~base; ~kb; ~no4; ~rises; ~lp;~bp; ~hp;~deNo2; ~mainLead;~percheur;~passant
~base.play(t)/*~deNo2, */

(~track = Ppar([~fx, ~base,~kb ,~no4,  ~rises,~mainLead,~percheur,~passant,~sequ],1).play(t,quant:1))

Pseq([~kick],inf).play(t, quant:1)
Ppar([~bassShap,Pseq([~bass],inf)],1).play(t, quant:1)
~track.play(t, quant:1)


~track.stop

(~track = Ppar([ ~base, ~kb ],1).play(t,quant:1))
s.plotTree
s.meter
FreqScope.new

/*x = Synth(\recLoop10,[buf:~bufBg,\recording,1, \in,0],~recGrp2);// still neeeded ?

x = Synth(\recLoop10,[buf:~bufBg,\recording,1, \in,~toCom],~recGrp2);*/

(Pbind(\instrument, \recLoop10,\buf,~leTout,\recording,1, \in,~toCom,\group, ~recGrp2,\dur,inf).play(t, quant:1))


//NO
x = Synth(\recLoop10,[buf:~leTout,\recording,1, \in,~toCom],~recGrp2);//  this one

~leTout.free
~leTout.play
~bufBg.play
~buf.play