ServerOptions.devices;

s.options.inDevice_("Built-in Microph");
Server.default.options.outDevice_("Audient iD14");//soundcard for headphones
(


s.boot;
s.meter;
)
s.reboot;

s.scope
b = Buffer.alloc(s, s.sampleRate *0.3872,1);//1.5488,1);



s.plotTree

(
~micBus = Bus.audio(s,1);
~ptrBus = Bus.audio(s,1);
)

(

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



SynthDef.new(\ptr, {
	arg out=0, buf=0;
	var sig;
	sig = Phasor.ar(0, BufRateScale.kr(buf), 0, BufFrames.kr(buf));
	Out.ar(out, sig);
}).add;

SynthDef.new(\rec, {
	arg ptrIn=0, micIn=0, buf=0;
	var ptr, sig;
	ptr = In.ar(ptrIn, 1);
	sig = In.ar(micIn, 1);
	BufWr.ar(sig, buf, ptr);
}).add;


SynthDef.new(\gran, {
	arg amp=0.5, buf =0, out=0, atk=1, rel=1, gate=1, sync=1, dens=40, baseDur=0.05, durRand=1, rate=1, rateRand=1, pan =0, panRand=0, grainEnv=(-1), ptrBus =0, ptrSampleDelay=20000, ptrRandSamples= 5000, minPtrDelay=1000,pitchRte=1,duration=8,impulse = 1.2875;

	var sig, env, densCtrl, durCtrl, rateCtrl, panCtrl, ptr, ptrRand, totalDelay, maxGrainDur;

	env = EnvGen.kr(Env.asr(atk,1,rel), gate, doneAction:2);
	densCtrl = Select.ar(sync, [Dust.ar(dens), Impulse.ar(dens)]);
	durCtrl= baseDur * LFNoise1.ar(100).exprange(1/durRand, durRand);
	rateCtrl = rate * LFNoise1.ar(100).exprange(1/rateRand, rateRand);
	panCtrl = pan + LFNoise1.kr(100).bipolar(panRand);

	ptrRand = LFNoise1.ar(100).bipolar(ptrRandSamples);
	totalDelay = max(ptrSampleDelay - ptrRand, minPtrDelay) ;

	ptr = In.ar(ptrBus,1);
	ptr = ptr - totalDelay;
	ptr = ptr / BufFrames.kr(buf);


	maxGrainDur = (totalDelay / rateCtrl) / SampleRate.ir;
	durCtrl = min(durCtrl, maxGrainDur);
/*
	sig = GrainBuf.ar(
		2,
		densCtrl,
		durCtrl,
		buf,
		rateCtrl,
		ptr,
		2,
		panCtrl,
		grainEnv
	);
*/





	sig = GrainBuf.ar(
		1,
		Impulse.ar(impulse),//Impulse.ar(0.0968),//lenth of interval ///20.6 and 10.3 are funny was 1
		duration,//3.0976,//8,//length of the feedback
		buf,
		pitchRte,//pitch
		0
	);



	sig = sig * env * amp;
	Out.ar(out, sig!2);
}).add;
)


s.plotTree;

(
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
)


(
//Synth(\mic, [\in, 0, \out, ~micBus], ~micGrp);
Synth(\ptr, [\buf, b, \out, ~ptrBus], ~ptrGrp);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b], ~recGrp);
)
~g.set(\gate, 0);

(


b.zero;

//



o = {Out.kr(~bus1, SinOsc.ar(1.2875).range(5274.04,81.41))  ;
	Out.kr(~bus2, SinOsc.ar(5.15).range(164.81,81.41));
	Out.kr(~bus3, SinOsc.ar(0.0201171875).range(164.81,2.575));
	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));
	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3
	Out.kr(~bus6, SinOsc.ar(0.321875).range(0.0201171875,318.51));
	Out.kr(~bus7, LFNoise1.ar(10.3).range(0.0201171875,1318.51));
	Out.kr(~bus8,SinOsc.ar( 1.2875).range(0.1609375,164.81) );

	Out.kr(~bus9, SinOsc.ar(LFTri.ar(1.2875).range(1.2875,0)).range(657.9895,60.727));//c3
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));
	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));

	 Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
 }.play;



~snewww= Pseq([~lpFuzz,~hpFuzz2,~hpFuzz,~lpFuzz2,~melo,
	~hpFuzz,~lpFuzz2,~pr,~pre,~lpFuzz2,~proo,~proot
],1);


/*
Pdef(\hey,Pbind(\instrument,\mic, \in, 0, \out, ~micBus, ~micGrp));*/



Pdef(\hey2,Pbind(\instrument,\ptr, \buf, b, \out, ~ptrBus,\group,~ptrGrp));
Pdef(\hey3,Pbind(\instrument,\rec, \ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b,\group,~recGrp));


Pdef(\hey4,Pbind(\instrument,\gran,
	\amp, 0.5,
	\buf, b,
	\out, 0,
	\atk, 1,
	\rel, 1,
	\gate, 1,
	\sync, 1,
	\dens, 40,
	\baseDur, 0.05,
	\durRand, 1,
	\rate, 1,
	\rateRand, 1,
	\pan, 0,
	\panRand, 0,
	\grainEnv, -1,
	\ptrBus, ~ptrBus,
	\ptrSampleDelay, s.sampleRate/3,
	\ptrRandSamples, 0,
	\minPtrDelay, 1000,\group,~granGrp));
//Ppar([~snewww,Pdef(\hey2),Pdef(\hey3),Pdef(\hey4)],inf).play(t);


/*

~snewww= Pseq([~lpFuzz,~hpFuzz2,~hpFuzz,~lpFuzz2,~melo,
	~hpFuzz,~lpFuzz2,~pr,~pre,~lpFuzz2,~proo,~proot
],1);
*/


//Synth(\mic, [\in, 0, \out, ~micBus], ~micGrp);




/*

Synth(\ptr, [\buf, b, \out, ~ptrBus], ~ptrGrp);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b], ~recGrp);



~g = Synth(\gran , [
	\amp, 0.5,
	\buf, b,
	\out, 0,
	\atk, 1,
	\rel, 1,
	\gate, 1,
	\sync, 1,
	\dens, 40,
	\baseDur, 0.05,
	\durRand, 1,
	\rate, 1,
	\rateRand, 1,
	\pan, 0,
	\panRand, 0,
	\grainEnv, -1,
	\ptrBus, ~ptrBus,
	\ptrSampleDelay, s.sampleRate/3,
	\ptrRandSamples, 0,
	\minPtrDelay, 1000,
], ~granGrp);
*/
/*
~snewww= Pseq([~lpFuzz,~hpFuzz2,~hpFuzz,~lpFuzz2,~melo,
	~hpFuzz,~lpFuzz2,~pr,~pre,~lpFuzz2,~proo,~proot
],1).play(t);


*/


~snewww.play(t);
//Ppar([~snewww,Pdef(\hey2),Pdef(\hey3),Pdef(\hey4)],inf).play(t);

//~granu =
//Pseq([~snewww,~granu,Pdef(\hey4)],inf).play(t)





//~ee3 = Ppar([       Pseq([~ens15Perc],2),           Pseq([~noise ,~granu,~noise  ],1)    ],inf).play(t);








)


s.plotTree
s.scope

b.plot;
b.play;
b.zero;


s.defaultGroup.deepFree;
