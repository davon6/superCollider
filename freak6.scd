s.options.memSize = 1048576;
~reverbBus = Bus.audio(s,1);
s.options.memSize = 1572864;

Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");





s.options.numAudioBusChannels;
s.options.numOutputBusChannels;
s.options.numInputBusChannels;
s.meter
(
s.waitForBoot({


		var numSegs;

	"init buff".postln;


	t = TempoClock.new(151.703592/60).permanent_(true);

	~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);


	s.sync;



	//numSegs= rrand(4,20);
	numSegs= rrand(1,4);


	~tf = Env(
		(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
		{exprand(1,20)}!numSegs,
		{rrand(-20,20)}!numSegs
	).asSignal(1025);



	~tf = ~tf + (
		Signal.sineFill(
			1025,
			//(0!3) ++ [0,0,0,1,1,1].scramble,

			[1, 1/4, 1/6, 1/2],
			{rrand(0,2pi)}!16
		) / 4
	);


	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);





SynthDef(\lead, {
		arg freq= 500, mRatio=1, cRatio=1, index =1, iScale=5, amp=0.01, atk= 0.01  , rel=3, cAtk = 4 , cRel = (-4) , pan =0, atkE =0,decE=0.1936, subsE=50, relE=0, sineRate = 0.0000000095262251, sineRangeHigh = 0, sineRangeLow=0, pitch = 0, sRteLPF = 1.3, timeSca= 0.25, dure= 1/1, which = 1, whichMod = 1, whichAmp =0,phRise= 0 , whichEnv = 0,timeSca2 =1,out=0, eFreq =0 , phFm=8,decEC=0,filF=200, bus,bus2=14,bus3=14,bus4=14,bus5=14,bus6=14,   bpFreq = 500,wCar=0;


	var car,car2, mod,modE,modE2, env, iEnv, mod2, sig, bufpos, envVoice, filRte,lp,bp,hp,lp2, b1;
//dec=3.5        predel=0.025    mix=0.08
	//1.5488
	//2.575
	//1.2875
	//5.15

//dont forget 2nd zero used to be 1
	env = EnvGen.kr(Env([0,1,0,0],[atkE,decE, subsE,relE],[-2,-3,0,0]),
		doneAction:2

	);




	iEnv = EnvGen.kr(


			Env.new(
			[1, 1 * 5, 1 * 5],
			[0.000000000001,        (decE  ),      0.0000000001],	//[atk was  0.01,          450,      10 ],   was 0.01   -1.6   -0.8 was dure
			[4, (-4)]
		),doneAction:2
);//- 1.604003    here!!!


	mod2 = SinOsc.ar(freq/10, mul:freq/10 * iEnv);

	//GOOD LAST                                                                                HERE
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;

	modE = SinOsc.ar(freq * mRatio + mod2*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;


//0.0201171875
	modE2 = SinOsc.ar(Lag.ar(  freq * mRatio + mod2 ,0.06)*SinOsc.kr(sineRate,phRise).range([sineRangeLow]), mul:freq * mRatio * iEnv)!2;




	//extraMod    0.01005859375

/*
	mod = SinOsc.ar(MouseX.kr(freq * mRatio + mod2,0.0201171875)*SinOsc.kr(0.01005859375).range(-10.4,10.4), mul:freq * mRatio *iEnv);
*/

	// the secret *SinOsc.kr(0.01005859375).range(-10.4,10.4)




	//good good
                                                                               // HERE   filRte
	car =SinOsc.ar(  0.00502929687+eFreq * cRatio +SelectX.ar(SinOsc.kr(0.0020,phFm).range(0,1),[SinOsc.ar(0),SelectX.ar(whichMod,[ mod,modE,modE2])]) + pitch +(In.kr(bus4, 1)/4));


	car2 =LFSaw.ar(  0.00502929687+eFreq );



	sig = Shaper.ar(~tfBuf,SelectX.ar(wCar,[car,car2]));

	sig  = LeakDC.ar(sig);



	lp = BLowPass4.ar(sig , In.kr(bus, 1)+In.kr(bus2, 1)+ In.kr(bus3, 1)   //LFNoise1.kr(2.575).range(0.2,20.3)

		,0.4);//82.41     //Varlag ?   0.4
//MouseX.kr(1800+ filF,100)

	lp2 = BLowPass4.ar(sig, (SinOsc.ar(LFNoise1.kr(Lag.kr(2.575,0.0968)).range(0,7.72500)).range(82.41,1400)), rq: 0.3);//MouseX.kr(0,7.72500)

	bp = BPF.ar(sig,bpFreq+ In.kr(bus5, 1)+ In.kr(bus6, 1),0.3);//0.05
	hp = BHiPass4.ar(sig, In.kr(bus, 1)+In.kr(bus2, 1)+ In.kr(bus3, 1)  ,MouseY.kr(1,0.4,0));
//MouseX.kr(100,5000+ filF)
//slcFil
	sig =SelectX.ar(which, [lp, bp,hp,sig]);//* env* amp;

	b1 =  sig * env;


	sig = Pan2.ar( HPF.ar(SelectX.ar(whichEnv, [sig,b1]),100) , pan)* amp;
	Out.ar(out, sig);//was zero   ~reverbBus
}).add;




	"init lead".postln;
SynthDef(\reverb, {
		|out=0, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel, amp=0.3,maxRoomsize,wet=0.4|



	var a ,input;

	input = In.ar(~reverbBus,1);
	a = Resonz.ar(

		input
,
        659.25 * [8,16,32],
 wet
/*
		,
        1760 * [1, 2, 4, 8],
        0.01*/
    ).sum * 10;


//1760

    //    var a = SoundIn.ar(0);
    //    var a = PlayBuf.ar(1, 0);

    Out.ar(out,
        (GVerb.ar(
            a,
            roomsize,
            revtime,
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
				maxRoomsize, (amp-(amp/10)),)
		+ input  )*   EnvGen.kr(Env.perc(0,revtime),Trig.kr(2,revtime),doneAction:2) )



	}).add;
	"init reverb".postln;

	SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100;
		var sig, env;


		env = EnvGen.ar(
			Env(
				[0,1,0],
				[atk,rel],
				[atkcrv,relcrv]
			),
			doneAction:2
		);
		sig = Saw.ar(freq,-1,-0.4);
		sig = sig.lincurve(-1,1,-1,1,-7);
		sig = LPF.ar(sig, lpf);

		//sig = BLowPass4.ar(sig,MouseX.kr(1,5000, \exponential),5);
sig = sig * amp!2;

		sig = sig * env;



		Out.ar(0, sig);
	}).add;

	SynthDef(\kick, {
		arg amp=0.2;
		var sig, env, envF;
		envF = EnvGen.ar(
			Env(
				[1700,1319,165,26,0,0],
				[0.001,0.028,0.1,0,0.4],
				\exp
			),doneAction:2
		);
"init KB".postln;
	/*

		//3322
		env = EnvGen.ar(Env(
			[0,1     ,0.16 ,0.95 ,0.93],
			[0,0.0135,0.005,0.02 ,0.0065],
			[0,-4    ,-3   ,1    ,4]

*/


			env = EnvGen.ar(
			Env.perc(0.0121, 0.40),doneAction:2

		);

/*
			[0,1     ,0.16 ,0.95 ,0.93],
			[0,0.0135,0.005,0.02 ,0.0065,0],
			[0,-4    ,-3   ,1    ,4]

		)//,doneAction:2
	);*/
		sig = SinOsc.ar(envF, mul: env);


		//sig = BLowPass4.ar(sig,MouseX.kr(1,5000, \exponential),5);

		sig = sig * amp!2;

		Out.ar(0, sig);
	}).add;

	s.sync;

	~bassPat = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \note, \note, \note], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.24,
	);

	~kickPat = Pbind(
		\instrument, \kick,
		\dur, Pseq([1],1),
		\amp, 0.028,
	);

	~bassAndKick = Ppar([~bassPat, ~kickPat], 1);



	s.sync;

~bassRest = Pbind(
		\instrument, \bass,
		\type, Pseq([\rest, \rest, \rest, \rest], inf),
		\dur, Pseq([1/4],4),
		\midinote, 28,
		\atk, t.beatDur/4 * 0.01,
		\rel, t.beatDur/4 * 0.99,
		\atkcrv, -2,
		\relcrv, -1,
		\amp, 0.8,
	);

	SynthDef.new(\cymb, {
	arg carHz=500, modHz=1899.3343179398, modAmp=0, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel,1,-1.4), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, rel2, 1, -2), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.05;



	car2 = WhiteNoise.ar(modAmp) * env2 ;

	sig = HPF.ar(car+car2!2,3000)* [amp+0.00555,amp];

	Out.ar(0, sig);
}).add;





SynthDef.new(\percu2, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=0.3872, amp=0.2, pan=0,rel2= 1.1616;
	var car, mod, env, car2, mod2, mod3,env2,sig;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0.001, 0.0484, 1, -1), doneAction:2);

	mod = SinOsc.ar(exprand(20,10000), mul:rrand(0, 10000).postln);
	car = SinOsc.ar(exprand(20,10000) + mod) * env * 0.05;



car2 = WhiteNoise.ar(0.12875) * env2 ;

	sig = HPF.ar(car+car2,3000)!2* [amp,amp+0.007];


	Out.ar(0, sig );
}).add;


SynthDef.new(\snare, {
	arg carHz=500, modHz=100, modAmp=1, atk=0.01, rel=1, amp=0.2, pan=0,rel2=1;
	var car, mod, env, car2, mod2,env2;

	env = EnvGen.kr(Env.perc(0, rel,curve:-3), doneAction:2);

	env2 = EnvGen.kr(Env.perc(0, 2, 1, -0 ), doneAction:2);




	mod = SinOsc.ar(modHz, mul:1691);
	car = SinOsc.ar(carHz + mod) * env * 0.321875;



	car2 = BrownNoise.ar(0.321875) * env2 ;



	Out.ar(0,HPF.ar( car+car2!2* amp ,500));
}).add;

"init percu".postln;

SynthDef.new(\hit, {
	arg carHz=500, modHz=100, modAmp=200, atk=0.01, rel=1, amp=0.2, pan=0;
	var car, mod, env;
	env = EnvGen.kr(Env.perc(atk, rel), doneAction:2);
	mod = SinOsc.ar(modHz, mul:modAmp);
	car = SinOsc.ar(carHz + mod) * env * amp;
	car = HPF.ar(Pan2.ar(car, pan),100);
	Out.ar(0, car);
}).add;


SynthDef(\wNoise, {

	arg in=0, dec=1.5, mix=0.2, lpf1=2000, lpf2= 6000, predel=0.000003,out=0, maxdelaytime=0.000001, amp = 0.0042, sub =1,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0;
	var env,dry, wet, sig,env2, ori;

	env = EnvGen.kr(Env([1,1,0],[0,sub,0]));

	env2 = EnvGen.kr(Env([amp,amp,0],[0,sub2,0]),doneAction:2);

	sig =  SelectX.ar(wFil,[LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3)),HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,3))]);



sig = Pan2.ar( sig , pan);//0 was pan



	Out.ar(out,HPF.ar(sig,100)* env2 //*amp

    )
}).add;
"init side events".postln;

	});
)
