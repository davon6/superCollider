

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
~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");
// ~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated-01.wav");
~buf=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src1.aiff");
~bufSnoopy=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/src1F.aiff");
~lpPrec2 =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/LPL.aiff");
~lpPrec =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/HPL.aiff");
~lpPrec3= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/BPL.aiff");
~fkAr= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/fkAr.aiff");
~kb2Test= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/idea.aiff");
~pad= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pad.aiff");
~funkPerc= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/funkPerc.aiff");
~leTout =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/stem1.aiff");
~leTout2 =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/stem2.aiff");
~cymb= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/cymbal.aiff");
~hat= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/hat.aiff");
~snare= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/snare.aiff");
~hit2= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/hit2.aiff");
~bell1= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bell.aiff");
~kb1=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kB.aiff");
~k2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kick.aiff");
~b3=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bass.aiff");
~trippy=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/trippy.aiff");
~audio4=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bg.aiff");

~lpPrec32= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/BPLX.aiff");

~lpPrec33= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/BPLX2.aiff");

~b4=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bass2.aiff");

~ped= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/pedonk.aiff");
~vap  = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/vap.aiff");
~rising  = Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/rising.aiff");
~voc= Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/voc.aiff");
~clap =Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/clap.aiff");
~bssBrkF =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/bassBrkF.aiff");
~noise =  Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/noiseHIt.aiff");
~kRise=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/E/kickRise.aiff");


~one = ~leTout2.numFrames/ 256 * 240.rand;
~two = ~leTout2.numFrames/ 256 * 240.rand;
~troi= ~leTout2.numFrames/ 256 * 240.rand;

~st2=~lpPrec.numFrames.rand;

//MUST RUN  ( ~buf.numFrames.rrand(320000)- 320000)
~rythm= ~leTout.numFrames/256* 190.rand  ;
~rythmB= ~leTout.numFrames/256* 220.rand;
~main1= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983 ) ;
~main2 =   ( ~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983) ;
~main3= (~bufSnoopy.numFrames.rrand(303750.22365983)- 303750.22365983)  ;

/*~pass1 =(~buf.numFrames.rrand(400000)- 400000);
~pass2=(~buf.numFrames.rrand(400000)- 400000);
~pass3=(~buf.numFrames.rrand(400000)- 400000);
~pass4=(~buf.numFrames.rrand(400000)- 400000);*/


/*~mster= (~leTout.numFrames/ 256 * 226.rand);
~mster2= (~leTout.numFrames/ 256 * 226.rand);*/
~mster3= (~leTout.numFrames/ 256 * 226.rand);
~mster3=  (~leTout.numFrames/ 256 * 226.rand);
~bssFreq1= 800.rrand(-140);~bssFreq2= 800.rrand(-140);~bssFreq3= 800.rrand(-140);
~r1= 3.rand;~r2= 3.rand;~r3= 3.rand;
~modHz=240.00.rand; ~carHz=140.00.rrand(10.00); ~noiLv=1.00.rrand(0.3); ~crv1=(-12.00).rrand(-4.00); ~crv2=(-12.00).rrand(-4.00); ~rel=0.0968.rrand(0.05); ~rel2=0.0968.rrand(0.05); ~modAmp=5000.00.rrand(1.00); ~modAmp2=5000.00.rrand(1.00);
~rythm1=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm2=[\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble; ~rythm3=[\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble; ~rythm4=[\rest,\rest,\rest,\note ,\note,\note ,\note, \rest].scramble;
	~rythmL = [\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble;

~start = ~start =~fkAr.numFrames.rrand(215000)-215000;


~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~no4S = ( ~bufSnoopy.numFrames.rrand(1400000)- 1400000);





~ri1vlAtk=4.00.rand;~ri1f1=1.00.rand;~ri1f2=10.00.rrand(1);~ri1f3= 1.00.rand;~ri1ic_atk=10.00.rrand(-5);~ri1index=5.00.rrand(1);~ri1mRatio=3.rrand(1);~ri1fs=1.00.rand;
~ri2vlAtk=4.00.rand;~ri2f1=1.00.rand;~ri2f2=10.00.rrand(1);~ri2f3= 1.00.rand;~ri2ic_atk=10.00.rrand(-5);~ri2index=50.00.rrand(1);~ri2mRatio=3.rrand(1);~ri2fR=1.00.rand;
~ri3vlAtk=4.00.rand;~ri3f1=1.00.rand;~ri3f2=10.00.rrand(1);~ri3f3=1.00.rand;~ri3ic_atk=10.00.rrand(-5);~ri3index=50.00.rrand(1);~ri3mRatio=3.rrand(1);/*~ri3fR=1.00.rand*/




~perc1 = (~buf.numFrames.rrand(1400000)- 1400000);~perc2 = (~buf.numFrames.rrand(1400000)- 1400000);~perc3 = (~buf.numFrames.rrand(1400000)- 1400000);~perc4 = (~buf.numFrames.rrand(1400000)- 1400000);~perc5 = (~buf.numFrames.rrand(1400000)- 1400000);~perc6 = (~buf.numFrames.rrand(1400000)- 1400000);~perc7 = (~buf.numFrames.rrand(1400000)- 1400000);~perc8 = (~buf.numFrames.rrand(1400000)- 1400000);
~pHVal=1.2875.exprand(0.075); ~pHdecT=0.3872.rrand((-0.3872));~pHVal2=1.2875.exprand(0.075);~pHdecT2=0.3872.rrand((-0.3872));
~pHVal3=1.2875.exprand(0.075); ~pHdecT3=0.3872.rrand((-0.3872));~pHVal4=1.2875.exprand(0.075);~pHdecT4=0.3872.rrand((-0.3872));
~pHVal5=1.2875.exprand(0.075); ~pHdecT5=0.3872.rrand((-0.3872));~pHVal6=1.2875.exprand(0.075);~pHdecT6=0.3872.rrand((-0.3872));
~pHVal7=1.2875.exprand(0.075); ~pHdecT7=0.3872.rrand((-0.3872));~pHVal8=1.2875.exprand(0.075);~pHdecT8=0.3872.rrand((-0.3872));
~pSub =0.5.rrand(0.2,1);~pAtkT=0.10.rrand(0.01);~pDecT =  0.3.rrand(0.8,0.3);~pSubT = 0.3.rrand(0.2);~pRelT=0.22.rrand(0.1,1);~pAtkC=6.rrand(1,1);~pDecC=(-4).rrand(-0.1);~pRelC=(-8).rrand(-2,1);
~pvlAtk =0.1.rrand(0.01);
~pSub2 =0.5.rrand(0.2,1);~pAtkT2=0.10.rrand(0.01);~pDecT2 =  0.3.rrand(0.8,0.3);~pSubT2 = 0.3.rrand(0.2);~pRelT2=0.22.rrand(0.1,1);~pAtkC2=6.rrand(1,1);~pDecC2=(-4).rrand(-0.1);~pRelC2=(-8).rrand(-2,1);
~pvlAtk2 =0.1.rrand(0.01);
~pSub3 =0.5.rrand(0.2,1);~pAtkT3=0.10.rrand(0.01);~pDecT3 =  0.3.rrand(0.8,0.3);~pSubT3 = 0.3.rrand(0.2);~pRelT3=0.22.rrand(0.1,1);~pAtkC3=6.rrand(1,1);~pDecC3=(-4).rrand(-0.1);~pRelC3=(-8).rrand(-2,1);
~pvlAtk3 =0.1.rrand(0.01);
~pSub4 =0.5.rrand(0.2,1);~pAtkT4=0.10.rrand(0.01);~pDecT4 =  0.3.rrand(0.8,0.3);~pSubT4 = 0.3.rrand(0.2);~pRelT4=0.22.rrand(0.1,1);~pAtkC4=6.rrand(1,1);~pDecC4=(-4).rrand(-0.1);~pRelC4=(-8).rrand(-2,1);
~pvlAtk4 =0.1.rrand(0.01);
~pSub5 =0.5.rrand(0.2,1);~pAtkT5=0.10.rrand(0.01);~pDecT5 =  0.3.rrand(0.8,0.3);~pSubT5 = 0.3.rrand(0.2);~pRelT5=0.22.rrand(0.1,1);~pAtkC5=6.rrand(1,1);~pDecC5=(-4).rrand(-0.1);~pRelC5=(-8).rrand(-2,1);
~pvlAtk5 =0.1.rrand(0.01);
~pSub6 =0.5.rrand(0.2,1);~pAtkT6=0.10.rrand(0.01);~pDecT6 =  0.3.rrand(0.8,0.3);~pSubT6 = 0.3.rrand(0.2);~pRelT6=0.22.rrand(0.1,1);~pAtkC6=6.rrand(1,1);~pDecC6=(-4).rrand(-0.1);~pRelC6=(-8).rrand(-2,1);
~pvlAtk6 =0.1.rrand(0.01);
~pSub7 =0.5.rrand(0.2,1);~pAtkT7=0.10.rrand(0.01);~pDecT7 =  0.3.rrand(0.8,0.3);~pSubT7 = 0.3.rrand(0.2);~pRelT7=0.22.rrand(0.1,1);~pAtkC7=6.rrand(1,1);~pDecC7=(-4).rrand(-0.1);~pRelC7=(-8).rrand(-2,1);
~pvlAtk7 =0.1.rrand(0.01);
~pSub8 =0.5.rrand(0.2,1);~pAtkT8=0.10.rrand(0.01);~pDecT8 =  0.3.rrand(0.8,0.3);~pSubT8 = 0.3.rrand(0.2);~pRelT8=0.22.rrand(0.1,1);~pAtkC8=6.rrand(1,1);~pDecC8=(-4).rrand(-0.1);~pRelC8=(-8).rrand(-2,1);
~pvlAtk8 =0.1.rrand(0.01);


~ouai=~leTout2.numFrames/256* (220.rand);
~ouai2=~leTout2.numFrames/256* (220.rand);


~bangVar = (~leTout.numFrames/ 256 * 145.rand);
~first=  ~leTout2.numFrames/ 256 * 222.rrand(1);
		 ~second= ~leTout2.numFrames/ 256 * 222.rrand(1);
~noiseFrq = 3000.rrand(180); ~noiseFrq2 = 3000.rrand(180); ~noiseFrq3 = 3000.rrand(180); ~noiseFrq4 = 2500.rrand(180);



)



(
	~mont =0;

~bobo=700;
~crv=6;


~lfoGrp  = Group.new;

~ptrGrp0 = Group.after(~lfoGrp);
~recGrp0 = Group.after(~ptrGrp0);


~granuGrp= Group.after(~recGrp0);
~phaserGrp =  Group.after(~granuGrp);
~distoGrp =  Group.after(~phaserGrp);
~dispatchGrp = Group.after(~distoGrp);
~filterGrp  = Group.after(~dispatchGrp);
~distoGrp0 =  Group.after(~filterGrp);
~gateGrp12= Group.after(~distoGrp0);

~eqGrp0 = Group.after(~gateGrp12);
~distoGrp2 =  Group.after(~eqGrp0);

~gateGrp =  Group.after(~distoGrp2);
~ptrGrp = Group.after(~gateGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
~gateGrp2 =  Group.after( ~granGrp);




~revGrp = Group.after(~gateGrp2);
~eqGrpplus = Group.after(~revGrp);
~delayGrp = Group.after(~eqGrpplus);
~eqGrp = Group.after(~delayGrp);
~dispatchGrp1 = Group.after(~eqGrp);
~filterGrp2  = Group.after(~dispatchGrp1);


~compGrp = Group.after(~filterGrp2);
~delayGrp2 = Group.after(~compGrp);
~combGrp = Group.after(~delayGrp2);
~limitGrp = Group.after(~combGrp);
~gateGrp8= Group.after(~limitGrp);
~gateGrp9= Group.after(~gateGrp8);
~stereoGrp = Group.after(~gateGrp9);
~dispatchGrp2 = Group.after(~stereoGrp);

~gateGrp3 = Group.after(~dispatchGrp2);

~finalDispatchGrp= Group.after(~gateGrp3);

~shifGrp= Group.after(~finalDispatchGrp);
~limitGrp2 = Group.after(~shifGrp);
~gateGrp4 = Group.after(~limitGrp2);
~gateGrp5 = Group.after(~gateGrp4);
~compGrp2 = Group.after(~gateGrp5);
~gateGrp10 = Group.after(~compGrp2);
~gateGrp6 = Group.after(~gateGrp10);
~eqGrp2 = Group.after(~gateGrp6);
~recGrp2= Group.after(~eqGrp2);


~gateGrp7 = Group.after(~recGrp2);


~extraDelay= Group.after(~gateGrp7);
~extraRev= Group.after(~extraDelay);
~compGrp4 = Group.after(~extraRev);
~eqGrp4 = Group.after(~compGrp4);
~limitGrp4 = Group.after(~eqGrp4);
~stereoGrp4 = Group.after(~limitGrp4);

~gateGrp11 = Group.after(~stereoGrp4);
~shiftGrpEx = Group.after(~gateGrp11);
~distoGrpEx = Group.after(~shiftGrpEx);
~eqGrpEx = Group.after(~distoGrpEx);
~revGrpEx = Group.after(~eqGrpEx);
~compGrpEx = Group.after(~revGrpEx);
~limitGrpEx = Group.after(~compGrpEx);
~stereoGrpEx = Group.after(~limitGrpEx);
~compGrp5 = Group.after(~stereoGrpEx);
~eqGrp3=Group.after(~compGrp5);
~dynaEq= Group.after(~eqGrp3);
~stereoGrp5 = Group.after(~dynaEq);
~compGrp6 = Group.after(~stereoGrp5);
~extraGrp = Group.after(~compGrp6);
~kbGate= Group.after(~extraGrp);
~recGrp3= Group.after(~kbGate);



o = {


	/*Out.kr(~bus1, SinOsc.ar(0.42916666666667).range(1,0.4));*/


	/*Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]) ).range(82.4,2637.02));*/


	Out.kr(~bus4, SinOsc.kr(0.3).range(82.4,2637.02));
/*
	Out.kr(~bus6, SinOsc.ar(1.2875).range(1,0.4));*/

Out.kr(~bus9, SinOsc.kr( LFTri.kr( ~hz1beat/4).range(~hz1beat/4,~hz1beat)).range(~hz1beat*64,~hz1beat*1024));//DONT DELETE


	Out.kr(~bus14,SinOsc.ar(0.6).range(1.5,0.27));

	//super important for gran modu
	/*Out.kr(~bus18, /* Lag.kr(*/LFNoise0.kr(1.2875).range(0.15,0.0)/*,0.05)*/
	+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,20.6])).range(0,4))*/

}.play;

)


~base.play(t,quant:1)
(

~base = Ppar([



	Pbind(\instrument, \lfo13, \val,0.075,\dur,Pseq([64/1],inf),\rL,3200,\rH,1720, \ph,4.2,\out,  ~bus3, \group, ~lfoGrp,\tS, 0.39550810372374),

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

		Pbind(\instrument, \gateS ,\dur, Pxrand([Pseq([4/1],4), Pseq([1/1],16) ],4)
,\tS, 0.39550810372374, \in ,Pxrand([ ~no1, ~no2,~no3],inf),\out,/*~toGate10*/0,\group,~gateGrp5),


Pseq([
//maybe no rrepeat wiht this one
		Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([2.5/1],1), \tS,  0.39550810372374,\start, 514019,\buf,~bufSnoopy,\out, ~filterBou,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([12.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		],1),

			Pseq([

		Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4060549,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-1),\type,Pseq([\note,\note,\rest,\note,\note,],inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
	].scramble,2),


			Pseq([
		Pbind( \instrument,\playBuf /*\playBuf1N*/, \impulse, 0.3,\dur,Pseq([1.5/1],1), \tS,  0.39550810372374,\start,2286611,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,0),

		Pbind(\instrument,\gateS, \dur,  Pseq([6.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),







			Pseq([
		/*Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0,\vlSub,0 ,\vlSub2,0,\decC,(-3),\type,Pseq([\note,\note,\rest,\note,\note,],inf)),*/


Pbind( \instrument,\playBufXG, \impulse, 0.3,\dur,Pseq([1/2],5), \tS,  0.39550810372374,\start, 4302193,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,0,\decT,0,\atkT,1,\atckC,4,\type,Pseq([\note,\note,\rest],inf)),

		Pbind(\instrument,\gateS, \dur,  Pseq([5.5/1],1),\in,~finGran, \out,0/*~toGate10*/,\group, ~gateGrp5,\tS, 0.39550810372374,),
		].scramble,2),

].scramble,1)



].scramble,inf),

],1))

s.scope
Ppar([~boost, ~kb],1).play(t,quant:1)
~kb.play(t);
.stop
(~kb =
Ppar([


	Pbind(\instrument, \lfo13T, \val,~hzQbeat/8,\dur,Pseq([64/1],inf),\rL,5000,\rH,3400 ,\out,  ~bus23, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,0),

	Pbind(\instrument,\lfo13T, \out, ~bus31, \val, 0.1609375,  \rL,2370,\rH,4000, \ph, 4.4, \dur, Pseq([64/1],inf), \tS,  0.39550810372374) ,


		Pbind(\instrument, \lfo1, \dur,Pseq([64/1],inf),\ph,Pxrand([1,0,2,3],inf), \out, ~bus5, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,~hzQbeat,\dur,Pseq([64/1],inf),\ph,Pxrand([1,0,2,3],inf), \out,  ~bus7, \group, ~lfoGrp,\tS, 0.39550810372374),

	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],inf),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),

/*	512*3   1536 +128*/



/*	~bruti={In.kr(~fusible2).linlin(0,0.0304096,1,0)}.play*/
/*Pseq([


		/*Pbind(\instrument,\wNoise,\dec,Pkey(\dur),\tS,t.beatDur,\valStart,4500,\valEnd,9500,\durF,0.3,\wFil,0,\dA,2,\dur,Pseq([144/2],1),\crv,(-8),\out,~toNoise,\type, \rest,),
*/
/*~by=True;*/

		/*,\amp3,Pfunc({   if( /*In.kr(~fusible2).linlin(0,0.0304096,1,0)*/  <= 0.5 , {1;},{0;})  })  */
	/*Pwrand([*/

	Pseq([
			Pbind(\instrument,\wNoise,\dec,Pkey(\dur),\tS,t.beatDur,\valStart,500,\valEnd,6500,\durF,Pseq([0.025],256),\wFil,0,\dA,2,\dur,Pseq([1/2],256),\crv,(-8),\out,~toNoise,\type, Pseq([\note ,\rest,\note,\rest,  ],inf) ,\amp,0),

			Pbind(\instrument,\wNoise,\dec,Pkey(\dur),\tS,t.beatDur,\valStart,4500,\valEnd,9500,\durF,0.3,\wFil,0,\dA,2,\dur,Pseq([64/2],1),\crv,(-8),\out,~toNoiseEq,\type, \rest,),

	],inf)
	/*Pbind(\instrument,\wNoise,\dec,Pkey(\dur),\tS,t.beatDur,\valStart,1500,\valEnd,3500,\durF,0.3,\wFil,0,\dA,2,\dur,Pseq([1/2],4),\crv,(-8),\out,0,\type, \rest),
	],[1.25,1].normalizeSum,32),
*/

		/*Pbind(\instrument,\wNoise,\dec,Pkey(\dur),\tS,t.beatDur,\valStart,1500,\valEnd,3500,\durF,0.3,\wFil,0,\dA,2,\dur,Pseq([1/2],32),\crv,(-8),\out,0,\type, \rest),*/

	],inf),*/

Pseq([
		Pbind(\instrument, \wNoise2, \durF,0.1936,\dA,2,\dur,  Pseq([16/1], 1),\atk, 1,\out, ~slideBus,\tS,  0.39550810372374,\type,\rest),

	Pseq([
	Pbind(\instrument, \wNoise2, \durF,0.1936,\dA,2,\dur,  Pseq([1/2], 1664),\atk, 1,\out, ~slideBus,\tS,  0.39550810372374
				,\type,Pseq([Pseq([\rest],16),Pseq([\rest],32),Pseq([ Pseq([\rest,\note,\rest,\rest,\rest,\note,\rest,\rest],8),Pseq([\rest],64)],inf)],1),\valStart,14000),



	Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],64), \tS,  0.39550810372374,\start,4138621,\buf,~leTout,\out, ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,12)  /*,Pseq([\rest ], 32)*/	].scramble,inf)  ),

],inf),

		],1),

	Prand([

	Pbind(\instrument,\gran,\dur,Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)  ],1),\amp, 1.76,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.05,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([ Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16)/*,Pseq([1/3],3), Pseq([1/12],12)*/ ,Pseq([1/1],1) ],1),\amp, (-10),\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.003,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp,  (-10),\buf, ~k2,\out,~dispatchBus,\pitchRte, (-1),\duration,Pkey(\dur),\impulse,0.001,\pos,0.04,\tS,  0.39550810372374),

		Pbind(\instrument,\kick,\dur,Prand([Pseq([1/1],1),Pseq([1/1],4)   ],1),\amp,  (-10),\buf, ~k2,\out,~dispatchBus,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.001,\pos,0,\tS,  0.39550810372374),

		Pbind(\instrument,\gran,\dur,Pseq([1/3],3),\amp, 1.76,\buf, ~k2,\out,~dispatchBus,\pitchRte,(-1),\duration,Pkey(\dur),\impulse,0.003,\pos,0.04,\tS,  0.39550810372374)


	],inf),

	Pbind(\instrument, \gate ,\vlSub,1,\vlSub2, Pkey(\vlSub),\dur, Prand([Pseq([4/1],1),Pseq([ 16/1],1)],inf), \in,~dispatchBus, \out,Prand([~lpK,/*~bpK,*//*~hpK*/],inf),\tS,  0.39550810372374),


	Pbind(\instrument, \filter, \freqFil,100,\dur,inf,\which,0, \in,~lpK,\busMod, ~bus4,/*\rqLPF,~bus6,*/ \out,~limitRnd, \group,~filterGrp,\qf,0.6 ),

/*Pbind(\instrument, \filter, \freqFil,100,\dur,inf, \in,~bpK,\which,1,\busMod, ~bus9, \out, ~limitRnd, \group,~filterGrp),


Pbind(\instrument, \filter, \freqFil,100,\dur,inf, \in,~hpK,\which,2,\busMod, ~bus5,\qf2,0.4,/*\bus7,~bus7, */\out,~limitRnd, \group,~filterGrp),*/


	Pbind(\instrument, \limiterS,\dur,inf,\gain, 30, \in,~limitRnd  ,  \out,~stereoK, \group, ~limitGrp),


	Pbind(\instrument, \stereo,  \dur, Prand([Pseq([1/16],1), Pseq([1/16],16),Pseq([1/16],4),  Pseq([1/4],1),Pseq([1/4],4),Pseq([1/4],16), Pseq([1/3],3), Pseq([1/12],12) ,Pseq([1/1],1)  ],inf)  ,\tS, 0.39550810372374,     \center, Pfunc({(-0.80).rrand(0.80)}), \in, ~stereoK   , \out,~rollingK , \group,~stereoGrp),



	Pbind(\instrument,\pan2, \dur,inf, \in,~dispatchBus, \out,~rollingKS, \group,~stereoGrp,\amp,0.8),





						/*Pbind( \instrument, \playBufS, \trig, 0.3 ,\dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out,~eqBass,\loopy,0),*/
	Pbind(\instrument, \playBufS, \dur,  Pseq([1024/1],inf), \tS,  0.39550810372374,\buf,~kb1,\out,~eqBass,\loopy,0, \start,0),

	Pseq([
	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],1), \out,~dipatchKB, \freq,/*~bssFreq1*/ 582, \group,~shifGrp,\tS, 0.39550810372374,\vl,0.002),

		Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([8/1],1), \out,~dipatchKB, \freq,300/*~bssFreq2*/, \group,~shifGrp,\tS, 0.39550810372374,\vl,0.02),

	],inf),


	Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,100,\out,~dipatchKB2, \group, ~limitGrp2),

	Pseq([
		Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~b3,\out,~toPan3,\loopy,0,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,~toPan3,\pitchRte,1,\duration,Pkey(\dur),\impulse,0.0003/*,\pos,0.17*/,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf), \tS,  0.39550810372374,\vl,1.76)
	],1),


	Pbind(\instrument, \pan2,\in, ~toPan3,\dur, inf,\out,~to4bar,\group, ~limitGrp,\group, ~stereoGrp),




		Pbind(\instrument, \playBuf,  \tS,  0.39550810372374, \rte, (-4.4),	\buf,~snare,\type,
		Pwrand([Pseq([\rest ,\note,\rest,\rest] ,1),

			Pseq([\rest ,\rest,\rest,\rest] ,1)

],[1,128].normalizeSum,inf),\dur, Pseq([1/2], inf),\out,~snareEQ),

/*	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,	\buf,~snare,\type,
		Pwrand([Pseq([\note ,\rest,\rest,\rest],1), Pseq([\rest ,\rest,\rest,\rest],1) ],[2,1,32].normalizeSum,inf)  ,\dA,Pseq([0.25],inf),\dur, Pseq([1/2], inf),\out,~snareEQ),*/
Pseq([
Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,
		\type,
		Pseq([	Pseq([\rest],8),Pseq([

 Pseq([\rest,\rest,\rest,\rest ,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest ],1),


Pseq([\rest ,\rest,\note,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
	\rest ,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
		\rest ,\rest,\note,\rest,  \rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,
	\rest ,\rest,\note,\rest, \rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest
					],1),


		Pseq([\rest ,\rest,\note,\rest,  \rest,\rest,\rest,\rest,  \rest, \rest,\rest,\rest,  \rest,\rest,\rest,\rest,],1),

			Pseq([\rest ,\rest,\note,\rest,  \rest,\rest,\note,\rest,  \rest, \rest,\note,\rest,  \rest,\rest,\rest,\rest,],1),



Pseq([\rest ,\rest,\note,\rest  ,\rest,\rest,\note,\rest,  \rest,\rest,\note,\rest,  \rest,\rest,\note,\rest,
					],1),



			/*Pseq([\rest ,\rest,\note,\rest  ,\rest,\rest,\note,\rest,  \rest,\rest,\note,\rest,  \rest,\rest,\note,\rest,
					],4),*/
		/*	Pseq([
				Pseq([\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest


	],6),    Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest ,\rest,\rest,\rest,\rest ,\rest,\rest,\rest,\rest  ],2),  ].scramble,inf)*/ ],1) ],1)


	,\dur, Pseq([1/2], 40) ,\out,~snareEQ,
	\dA,Pseq([  Pseq([1],64), Pseq([0.5],64)].scramble,inf)),


		Pseq([

	 Pbind(\instrument, \playBuf, \buf, ~clap,\vl,1,\tS,t.beatDur,\dur,Pseq([1/2],64),\loopy,0,\type, Pseq([\rest,\rest,\note,\rest ],inf),\out,~clapEq),

		Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~snare,
		\type,
		Pseq([
			Pseq([
				Pseq([\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest,\rest,\rest,\note,\rest


	],6),    Pseq([\rest,\rest,\rest,\rest,\rest,\rest,\rest,\rest ,\rest,\rest,\rest,\rest ,\rest,\rest,\rest,\rest  ],2),  ],inf) ],1)


	,\dur, Pseq([1/2], 512) ,\out,~snareEQ,
	\dA,Pseq([  Pseq([1],128), Pseq([0.5],128)],inf)),

		].scramble,inf),
],1),


	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~cymb,\type,Pseq([ Pseq([ \rest],128),Pseq([ Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),

		/*Pseq(~rythmL, 128 /*32*/),*/Pseq([Pseq(~rythmL,1024),Pseq([\rest],128) ],inf)],1)],1),\dur,Pseq([1/4],inf ),\stereoL, 0.00555,\out,    ~cymbalEq),



	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\buf,~hat,\dur,Pseq([1/4], inf),\rel2,0.02420,\vl,Pseq([( -17.2), ( -17.7),( -17.5),( -17.2),( -17.2),( -16.9),( -17.2),( -17.2)],inf), \stereoR, 0.007,\out,~comBusHat,\type, Pseq([Pseq([ \rest],128) , Pseq([ Pseq([ \note],896),Pseq([\rest],128)],inf)],1))
	,


	//0.39550810370174
/*	Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810370174,\buf,~kb2,\out, ~toKbGate,\loopy,0),*/

	// Pbindef(\kb,\instrument, \playBufS, \dur,  Pseq([1024/1],1), \tS,  0.39550810372374,\buf,~kb1,\out,~toKbGate,\loopy,0, \start,0),



Pseq([
	Pbind(\instrument, \playBuf,  \tS,  0.39550810372374,\dur, Pseq([256/1], 1),\type,\rest),

Ppar([

Pbind(\instrument, \playBufS,  \tS,  0.39550810372374,\buf,~kRise,\dur, Pseq([16/1], 1),\out, ~filKBX),
Pbind(\instrument,\blank, \in,~kSRise,\out,~toKbGate,\dur,Pseq([16/1], 1),\group,~kbGate)

],1)

],1),


			Pseq([Pbindf(~kick,\out,~limitKick)],1024),

	Pseq([
		Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],64), \tS,  0.39550810372374,
			\start,0,\type,\rest),

		Pseq([
	Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],512), \tS,  0.39550810372374,
		\start,0,\type,Pseq([\rest,\note,\note,\note],inf),\buf,~b3  ,\out,~comFuzz ,\loopy,0, \decT,0.7,\vlDec,1,\vlSub,Pkey(\vlDec),\vlSub2,Pkey(\vlDec),\subsT ,Pseq([0,0.1,0.2,0.3],inf),\start,2800),


	Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],1024), \tS,  0.39550810372374,
	\start,0,\type,Pseq([\rest,\note,\note,\note],inf),\buf,~b4,\out,~comFuzz ,\loopy,0, \decT,0.9/*0.7*/,\vlDec,1,\vlSub,Pkey(\vlDec),\vlSub2,Pkey(\vlDec),/*\subsT ,Pseq([0,0.1,0.2,0.3],inf),*/\start,2800)
		],inf),
	],1),


	/*Pbind( \instrument, \playBufXG, \impulse, 0.003 ,\dur,    Pseq([1/4],4096), \tS,  0.39550810372374,
	\start,0,\type,Pseq([\rest,\note,\note,\note],inf),\buf,~b3,\out,~comFuzz ,\loopy,0, \decT,0.6,\vlDec,1,\vlSub,Pkey(\vlDec),\vlSub2,Pkey(\vlDec),\subsT ,Pseq([0,0.15,0.3,0.4],inf),\start,3800),*/




/*Pseq([
	Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythm,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),

		Pbind( \instrument, \playBuf10, \impulse,0.6 ,
		\dur,Pseq([1/2],128), \tS,  0.39550810372374,\start,~rythmB,\buf,~leTout,\out,  ~rythmFil,\loopy,0	,\type,Pseq([
				Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\rest,
				\note,\note,\rest,\rest,\rest,\rest,\note,\note
		].scramble,6)  ,Pseq([\rest ], 32)	].scramble,inf)  ),



],inf),*/


	Pbind(\instrument,\envSli,\out, ~bus21,\dur,Pseq([1/2],inf),\tS, 0.39550810372374,\val1,1000,\val2,(-40),\crv,-3.2),


	Pbind(\instrument, \filter10,\freqFil,300 ,\busMod,~bus21 ,\in,~rythmFil,\which,0,\qf,0.75, \dur, inf, \out,~rythmFilEQ, \group,~filterGrp),



	Pbind(\instrument, \EQHP10, \in,~rythmFilEQ,\dur, inf, \out,~toComp10, \group,~eqGrp,\vol,4,\val,1320,\quant,2, \gain,(-16)),

/*	Pbind(\instrument, \limiter10toMixer,\c20,1,\name,30, \dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,40, \group, ~limitGrp),*/

	/*Pbind(\instrument,\comp10, \dur,inf,\thr,0.9 ,\sB, 1.08,\sA, 1/2,\atk ,0.001, \rel ,0.3872,\dur,9999
		,\gain,1,\in,~rythmComp  ,\ctrl, ~kbus, \out, ~toKbGate,\group, ~compGrp2 ,\tS, 0.39550810372374),*/




		/*Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),


// BG
		Pbind(\instrument, \gate, \dur,Pseq([1/1],1),\atkT,1 ,\decT ,0 ,\atkC, 42, \in,  ~bgFil22,\group, ~gateGrp, \type, Prand([\rest, \note],inf),\out,~slideBus2,\tS, 0.39550810372374),

		Pbind(\instrument, \wNoise,\dur, Pseq([ 8/1],1), \type, \rest),
],inf),*/




		/*Pxrand([


			Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),
		Pbind(\instrument, \wNoise,\dur,  Pseq([1/1], 1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

		],1),


				Pseq([
		Pbind(\instrument, \wNoise,\dur, Pseq([ 7/1],1), \type, \rest),

			Pseq([
			Pbind(\instrument, \wNoise,\dur,  Pseq([1/4],1),\key, Prand([\atk, \dec], 1),\value,Pkey(\dur),\amp,1, \finish, { ~key.envirPut(~value) },\out, ~slideBus,\type,Prand([\note, \rest],inf)),

				Pbind(\instrument, \wNoise,\dur, Pseq([ 3/4],1), \type, \rest),
		].scramble,1)
				],1),

		],inf),*/



	/*Pbind(\instrument,\stereo, \dur, 9999, \in, ~slideBusToStereo  ,\spread,0.4,\out,~toKbGate,\tS, 0.39550810372374,\group, ~stereoGrp),

	Pbind(\instrument,\stereo, \dur, 9999, \in, ~toStereoRise  ,\spread,0.1,\out,~toKbGate/*~gateRise*/,\tS, 0.39550810372374,\group, ~stereoGrp),*/
Pseq([
	Ppar([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([16/1],1),\type,\rest)
			],1),


		Pseq(~steady=[

			/*Pseq([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([8/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([8/1],1),\type,\rest)
			].scramble,1),*/

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([16/1],1)),

			Pseq([
Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([15/1],1)),

					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),

			].scramble,1),

			Pseq([
Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([15/1],1)),
			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
	Pbind(\instrument,\gate2, \in ,~rollingKS, \group, ~kbGate, \tS,  0.39550810372374,\dur, Pseq([1/1],1))].scramble,1),
			].scramble,1),

	/*	Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,\dur, Pseq([12/1],1)),

						Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0),
	Pbind(\instrument,\gate2, \in ,~rollingKS, \group, ~kbGate, \tS,  0.39550810372374,\dur, Pseq([4/1],1))].scramble,1),
					],1),*/

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([16/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,\dur, Pseq([16/1],1)),

				Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

				Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([13/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([3/1],1))].scramble,1),
				],1),

			Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,\dur, Pseq([8/1],1)),

						Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
	Pbind(\instrument,\gate2, \in ,~rollingK, \group, ~kbGate, \tS,  0.39550810372374,\dur, Pseq([8/1],1))].scramble,1),
		],1)].scramble,1),Pseq( ~steady.reverse,1),
	~jumpy= Pxrand([
	/*Pseq([*/



			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([16/1],1)),

Pseq([
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),
				Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([2/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
	Pbind(\instrument,\gate2, \in ,~rollingKS, \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([1/1],1))],1)
			],1),




Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([15/1],1)),


			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
	Pbind(\instrument,\gate2, \in ,~rollingKS, \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([1/1],1))].scramble,1),


			].scramble,1),



		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([3/1],1)),

				Pbind(\instrument,\gate2, \in ,~toKbGate, \group,~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

			Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
	Pbind(\instrument,\gate2, \in ,~rollingKS, \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([1/1],1))].scramble,1),


			].scramble,1),

	Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),


		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1)) ],1),  ].scramble,1),


			Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([6/1],1)),
Ppar([

					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([8/1],1),\type,\rest),

				],1),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1)) ],1),  ].scramble,1)

],16),
		//].scramble,2),
		/*Pseq(~steady.reverse,1),*/
		Pseq([
		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),


		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
		/*	Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1))  */
				Pbind(\instrument, \playBufS, \dur,  Pseq([4/1],1), \tS,  t.beatDur,\buf,~bssBrkF,\loopy,0,\start,0,\vl,1)].scramble,1) ],1),


			Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([6/1],1)),
Ppar([

					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([6/1],1),\type,\rest),

				],1),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1),

				Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([14/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),


		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

			Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([7/1],1)),

					Ppar([
					Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,Pseq([1/1],1), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS,~to4bar],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([2/1],1))].scramble,1),
				],1),

		Pseq([
	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([12/1],1)),

	Prand([
				Pbind(\instrument, \playBuf, \impulse, 0.003 ,\dur,    Pseq([1/1],4), \tS,  0.39550810372374,\buf,~k2,\out, ~kbToPan2,\loopy,0,\start,0,\tS, 0.39550810372374,\vl,1.76),
			Pbind(\instrument,\gate2, \in ,Prand([~dipatchKB2,~rollingKS],inf), \group, ~kbGate, \tS,  0.39550810372374,
			\dur, Pseq([4/1],1)) ],1),  ].scramble,1),



	Pbind(\instrument,\gate2, \in ,~toKbGate, \group, ~kbGate, \tS,  0.39550810372374,
		\dur, Pseq([2/1],1)),


		].scramble,1),




		Pbind(\instrument,\gate2, \in ,3000,  \tS,  0.39550810372374,
			\dur, Pseq([14/1],1),\type,\rest),


		~breakPart1,



		/*~breakPart2,*/ ~jumpy

		/*Pbind(\instrument,  \stereoX1, \in,~bgStereo2,  \out, ~toCom, \modPan,~bus10 ,   \center, 0.1  ,\dur,Pseq([64/1],1),  \group, ~stereoGrp,\spread, 0.8,\tS,  0.39550810372374,\vlSub,0.3,\atkT,  0.01,\decT,0.999)*/










	],1),







	//WHat about 	~bassMel[~scale]

/*Pbind(\instrument, \limiterS, \dur, inf, \in,~dipatchKB, \gain,90, \group, ~limitGrp2),*/


	Pbind(\instrument, \pan2, \in,~kbToPan2,\out,0 ,\group,~recGrp3,\dur, inf),

],1))



(~track = Ppar([ ~base, ~hitX, ],1).play(t,quant:1))




~hitX.play(t)
~hitX.stop;
(~hitX=

Ppar([


		Pbind(\instrument, \lfo13T, \val,0.084,\dur,Pseq([32/1],inf),\rL,0.084,\rH,1.2875 ,\out,  ~bus26, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,4.4),


	//??
	/*Pbind(\instrument, \envSli2, \out, ~bus23, \val1,Pfunc({20.6.rrand(5.15)}), \val2,Pfunc({41.2.rrand(20.6)}),\crv,2,\crv2,3.6, \dur,Pseq([64/1],inf),\tS, 0.39550810372374, \val0, Pfunc({5.15.rrand(0.3)})),

	Pbind(\instrument, \ranModul,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod1,\lS,Pfunc({(-0.00).rrand(-300)}) ,\hS, Pfunc({1200.rrand(0.1)}),\busMod,~bus23 ),*/




/*		Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus16 ,\dur,Pseq([64/1],inf), \rL,(-0.3),\rH,0.3, \group, ~lfoGrp,\tS, 0.39550810372374),*/

	Pbind(\instrument, \lfo13T, \val,0.075,\dur,Pseq([32/1],inf),\rL,1200,\rH,6600 ,\out,  ~bus12, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),
		Pbind(\instrument, \lfo13, \val,1.2875,\dur,Pseq([2/1],inf),\rL,600,\rH,7600 ,\out,  ~bus20, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

	Pbind(\instrument, \lfo13T, \val,0.3,\dur,Pseq([8/1],inf),\rL,600,\rH,7600 ,\out,  ~bus19, \group, ~lfoGrp,\tS, 0.39550810372374,\ph,1.5),

		Pbind(\instrument, \envSli, \val1,50, \val2, 5600, \dur, Pseq([1/1],inf),\out, ~bus8,\tS, 0.39550810372374),

/*below not working copz \modu instead of \val*/
	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,500,\modu,

		0.001875/**4*/,\ph,1.42),


	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~bus27,\rL,1500 ,\rH,4200,\modu,

		0.001875/**4*/,\ph,1.42),






		Ppar([



		Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,0,\f1, 0.004 , \f2,0.001, \f3,0.00001,  \ic_atk,-1,\index,151,\mRatio,5,\out ,~flanToDisto2,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),


		Pbind(\instrument,\rise,\dur,Pseq([4/1],inf), \vlAtk,-1 ,\f1, 0.001 , \f2, 0.03 , \f3,0,  \ic_atk,4,\index,9,\mRatio,1,\out ,~bellFlang4,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),

	/*	Pbind(\instrument,\rise,\dur,Pseq([1/1],inf), \vlAtk,0 ,\f1, 0.01 , \f2, 0.3 , \f3,0.01,  \ic_atk,4,\index,140,\mRatio,0.1,\out ,~bellFlang3,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })*/


		Pbind(\instrument,\rise,\dur,Pseq([1/1],inf), \vlAtk,0 ,\f1, 0.01 , \f2, 0.003 , \f3,0.01,  \ic_atk,1,\index,4,\mRatio,0.1,\out ,~bellFlang3,\tS, 0.39550810372374,\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) })


],inf),


Pseq([
	/*	Pseq([
					Ppar([

				Pxrand([

			Pbind(\instrument, \playBuf,\loopy,0,\buf,~bell1,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([8/1],1 ),\vl,1 )
						],1),

],1),*/
			Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],8) , \tS,  0.39550810372374,\start,1385868.5,\buf,~leTout,\out, ~gateRise,\loopy,0,\vl,1),


			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([56/1],1),\tS, 0.39550810372374 ),
//was 56

	/*	],1),*/

		Pseq([
			/*Pxrand([*/
				Pseq([
					Ppar([

				Pxrand([


							Pbind(\instrument,\playBuf,\loopy,0,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([3/1],1))

							,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],3) , \tS,  0.39550810372374,\start,1385868.5,\buf,~leTout,\out, ~gateRise,\loopy,0,\vl,1)
						],1),
],1),

					Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([13/1],1),\tS, 0.39550810372374 )
				],1),
/*
Pbind(\instrument, \trippyRise, \dur,  Pseq([16/1],1),   \ph, Pfunc({ 6.00.rand}),\tS, 0.39550810372374, \out, ~riTriptoDisto),
			],1),*/

			Pbind(\instrument, \gateS, \group,~gateGrp3, \in,~risesGate, \out, ~gateRise,\dur,Pseq([48/1],1),\tS, 0.39550810372374 )

		],1),

		Pseq([


			Ppar([
				Pxrand([



Pbind(\instrument,\playBuf,\loopy,0,\buf,~bell1,\out, ~bellFlang  ,\tS, 0.39550810372374,\vl,1,\dur, Pseq([2/1],1))

					,
						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/2],4) , \tS,  0.39550810372374,\start,1518760.0,\buf,~leTout,\out, ~gateRise,\loopy,0,\vl,1)

				],1),
],1),


			Pbind(\instrument, \gateS, \group,~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([62/1],1),\tS, 0.39550810372374 )
		],1),




Ppar([


			Pseq([


			Ppar([Pxrand([


					// Pbind(\instrument, \playBuf,\loopy,0,\buf,~hit2,\out,~hit2ToEq,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),




						Pbind(\instrument, \playBuf,\loopy,0,\buf,~bell1,\out, ~flanToDisto,\tS,0.39550810372374,\dur,Pseq([1/1],1 ),\vl,1 ),



						Pbind( \instrument, \playBuf10, \impulse, 10 ,
							\dur,  Pseq([1/1],1) , \tS,  0.39550810372374,\start,1518760.0,\buf,~leTout,\out,~gateRise /*~bangLimit*/,\loopy,0,\vl,1)
				],1),
],1),

Pbind(\instrument, \gateS, \group, ~gateGrp3,\in,~risesGate, \out, ~gateRise,\dur,Pseq([63/1],1),\tS, 0.39550810372374 )
		],1),


			Pbind(\instrument,\rise,\dur,Pseq([16/1],1), \vlAtk,0.4,\f1, 1 , \f2,1, \f3,0.001,  \ic_atk,4,\index,1,\mRatio,3,\out ,~riToDisto,\tS, 0.39550810372374,\atk,1, ),

		],1),

		],inf),
Pbind(\instrument, \gateS, \dur, Prand([ Pseq([4/1],4), Pseq([1/1],4), Pseq([1/1],1) ,
		Pseq([4/1],1)],inf), \in,Prand([~riToGate,~riToGate3,~riToGate2],inf)  ,\out,~risesGate , \group,~dispatchGrp2,\tS, 0.39550810372374,),

	/*Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~riToStereo2  ,\spread,0,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),*/


	/*Pbind(\instrument,\stereoS, \dur, 9999, \in,  ~noiseToStereo ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),*/

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus4   ,\out, ~gateRise, \group, ~stereoGrp),


Pbind(\instrument,\stereo, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp),

	/*Pbind(\instrument,\stereoX, \dur, 9999, \in, ~riTriptoStereo  ,\spread,1,\out,~gateRise,\tS, 0.39550810372374,\group, ~stereoGrp, \modPan,~bus16),*/





		Prand([
		Pbind(\instrument,\gateS, \dur,Pseq([1/8],16),\type,
			Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note,

				\note,\note,\rest,\rest,\note,\note,\note,\rest
			],inf),
		\in,  ~gateRise ,\out ,~toGate102,\group, ~gateGrp10,\tS, 0.39550810372374),


		Pbind(\instrument,\gateS, \dur,Pseq([3/1],1),\in, ~gateRise  ,\out ,~toGate102 ,\group, ~gateGrp10,\tS, 0.39550810372374),
				],inf)

],1);
)




Ppar([~base,~no4],1).play(t, quant:1)

~no4.play(t, quant:1)
~no4.stop;
(~no4 = Ppar([

	Pbind(\instrument, \lfo13,\val,(~hzQbeat),\out,~bus2 ,\dur,Pseq([64/1],inf),\ph,0, \rL,1200,\rH,3000, \group, ~lfoGrp,\tS, 0.39550810372374),


	//why was it commented out
	Pbind(\instrument, \lfo13,\val,(1.2875),\out,~bus10 ,\dur,Pseq([64/1],inf),\ph,1.4, \rL,1500,\rH,2900, \group, ~lfoGrp,\tS, 0.39550810372374),


	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur,Pseq([3/1],inf),\group,~lfoGrp ,\frq,Pfunc({5.15.rrand(0.321875)}),\wdth,~bus14 ,\tS, 0.39550810372374),


	Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX2,\out,~no2Eq,\group, ~distoGrp0),



	/*Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in,  ~no2ToStereo  ,\out,~no2,\center, Pxrand([0.2,(-0.2),(-0.1),(0.1)],inf), \group, ~stereoGrp,\tS, 0.39550810372374),*/


	Pbind(\instrument,\stereo, \dur, Pseq([4/1],inf), \in, ~stereoBus3   ,\out,~comSnaGrpBus2,\center, Pfunc({0.24.rrand(-0.24)}), \group, ~stereoGrp,\tS,  0.39550810372374,\spread,0.4),


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

/*~sequ.play(t)
~t = Ppar([~base, ~sequ],1).play(t,quant:1)*/
// .stop
~sequ =
Ppar([

	Pbind(\instrument, \lfoSin, \out, ~bus15,\dur,Pseq([64/1],inf),\tS, 0.39550810372374, \group, ~lfoGrp),



/*Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec2,\out,
		~eqBus1,\impulse,0.003,\start, 80000,\tS, 0.39550810372374,\loo,0),*/


	/*Pbind(\instrument,\playBufXG,\dur, Prand([Pseq([1/8],2),Pseq([1/2],1), Pseq([1/4],1),Pseq([1.25/1], 1 ) /*,Pseq([2/1],1), */].scramble,inf),\amp, 1,\buf,~lpPrec,\out,~toEq,\gate, 1,\duration,Pkey(\dur),\impulse,0.003,\start,~st2, \tS, 0.39550810372374 ,
	\vlSub,  0.9 , \vlSub2,Pkey(\vlSub), \atkT,0.001/*~pAtkT*/,\decT, 0.6/*~pDecT*/ ,	\subsT,0.399 /*~pSubT*/ , \relT,0.01/*~pRelT*/,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loo,0),*/

	/*Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~eqBus2x,\impulse,0.003,\start, 0,\tS, 0.39550810372374,\loo,1),*/

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
		/*Pbind(\instrument, \gate, \dur, Pseq([1.5/1 ],1),\group, ~gateGrp,
			\in,~gateBus,\tS, 0.39550810372374,

				\vlSub,0.8,\vlSub2,Pkey(\vlSub), \out,~reverbBus,

		\atkT,Pfunc({0.10.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,Pfunc({6.exprand(1,1)}),
	\decC,Pfunc({-4.exprand(-0.1)}),
			\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)}))*/

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


	/*Pbind(\instrument,\gran,\dur,Pseq([1/2],inf),\amp, 1,\buf, ~f2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus2,\ptrRandSamples, 0,\atk,0,\minPtrDelay, 1000,\group,~granGrp,\duration,Pseq([1/2],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,0.8,\vlSub2,Pkey(\vlSub)),*/

	Pbind(\instrument, \playBufXG,\rte,Pfunc({8.rrand(0.25)}),\buf, ~f2,\out,~main1GToG,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/2],inf)),



	/*Pbind(\instrument,\gran,\dur,Pseq([1/4],inf),\amp, 1,\buf, ~e2,\out,~main1GToG,\atk, 0,\rel, Pseq([1/4],inf),\gate, 1,\ptrBus, ~ptrBus3,\ptrRandSamples, 0,\minPtrDelay, 1000,\atk,0,\group,~granGrp,\duration,Pseq([1/4],inf),\impulse,0.0003,\amp,0.8,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub)),*/


	Pbind(\instrument, \playBufXG,\buf, ~e2,\out,~main1GToG2,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/8],inf)),


	Pbind(\instrument, \playBufXGMod,\busMod,~bus1,\buf, ~f,\out,~main1GToG3,\group,~granGrp,\impulse,0.0003,\tS, 0.39550810372374,\dur,Pseq([1/1],inf)),


	/*Pbind(\instrument,\playBufXG,\dur,Pseq([16/1],inf),\amp, 1,\buf,~lpPrec3,\out,
	~filterRnd,\impulse,0.003,\start, 600000,\tS, 0.39550810372374 ,\loo,1),*/


	/*Prand([*/
		/*Pbind(\instrument, \gate, \dur, Pseq([3/1 ],1),\group, ~distoGrp2,
\in, ~gateBus23,\tS, 0.39550810372374,

				\vlSub,1,\vlSub2,Pkey(\vlSub), \out,~micBus33),*/


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

		/*Pbind(\instrument, \gate, \dur, Pseq([/*3*/1.5/1 ],1),\group, ~gateGrp,
\in, ~gateBus23,\tS, 0.39550810372374, \vlSub,1,\vlSub2,Pkey(\vlSub), \out,~reverbBus23),*/


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


	]/*,[2,2,1].normalizeSum*/,inf),


 ],1)

);



~fx.play(t)
Ppar([~base,~fx],1).play(t)
.stop
(~fx=Ppar([


	Pbind(\instrument,\stereoS, \dur,Pseq([8/1],inf), \in, ~delToStereo   ,\out,~tofinalRythm,\spread,1, \center, Prand([ Pfunc({0.6.rrand(0.2)}),Pfunc({-0.6.rrand(-0.2)})],inf),\group,~stereoGrp4,\tS, 0.39550810372374),


	Pbind(\instrument,\stereoS, \dur, 9999, \in, ~stereoBus3b   ,\out,~tofinalRythm,\spread,1, \group, ~stereoGrp4),

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

	  s.record(path:"/Users/davidmignot/Music/SuperCollider Recordings/E/stem1.aiff",numChannels:10,duration:t.beatDur*256);


}).play(t,quant:1))



~helpVol=Synth(\volAna,[\in,0],target:~recGrp2 /*~recGrp3*/)
~helpVol.set(\in,0)
~helpVol.free








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




