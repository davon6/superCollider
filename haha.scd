ServerOptions.devices;

s.options.inDevice_("Built-in Microph");
Server.default.options.outDevice_("Audient iD14");//soundcard for headphones
(


s.boot;
s.scope;
)
s.reboot;

Buffer.freeAll;

//b = Buffer.alloc(s, s.sampleRate *0.7744,1);

//b = Buffer.alloc(s, s.sampleRate *3.0976);//8


b = Buffer.alloc(s, s.sampleRate *1.5488);

//to run first
(
~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
~tf = ~tf.asWavetableNoWrap;
)
~tf.plot

~tfBuf = Buffer.loadCollection(s, ~tf);

c = Buffer.alloc(s, 2048);


(

var env, sig, wt, numSegs;
//numSegs= rrand(4,20);
numSegs= rrand(5,10);


~tf = Env(
	(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
{exprand(1,10)}!numSegs,
{rrand(-10,10)}!numSegs
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

//~tf.plot;


~tfBuf.loadCollection(~tf.asWavetableNoWrap);
)
~tfBuf.plot



/*play to test*/

({
	var sig, input;
	input = Saw.ar(82.41);
	sig = Shaper.ar(~tfBuf, input);


		//sig  = LeakDC.ar(sig);

	sig = sig * 0.3!2


}.play
)

s.defaultGroup.deepFree;


b.size

(
~micBus = Bus.audio(s,1);
~ptrBus = Bus.audio(s,1);
)
/*
(

SynthDef.new(\mic,{
	arg in=0, out=0, amp =1;
	var sig;
	sig = SoundIn.ar(in) * amp;
	Out.ar(out, sig);
}).add;
*/

s.scope;
(SynthDef.new(\sound,{











	arg in=0, out=0, freq= 300, mRatio=1, cRatio=1, index =1, iScale=5, amp=1, atk= 0.01, rel=3, cAtk = 4 , cRel = (-4) , pan =0, rateSound = 0.0201171875;
	var car, mod, env, iEnv, mod2, sig, input, sig2,mod3 ;
	iEnv = EnvGen.kr(


	/*	Env.new(
			[index, index * iScale, index * iScale],
			[atk,          50,      10 ],
			[cAtk, cRel]
		)
*/






/*

		Env.new(
	[0,3,0],
	[1,2.5,0],
	[0,0]
	)

			Env.new(
	[0,2.575,0],
	[1,3.0976,0],
	[2,0]
	)


*/



				Env.new(
	[1.2875,2.575,0],
	[1,3.0976,0],
	[2,-2]
	)//.plot


	);


	env = EnvGen.kr(


		//Env.perc(atk,rel, curve:[cAtk,cRel]),
		//doneAction:2


	Env.new(
	[1,1,1,1],
	[2.5,2.5,10,3],
	[0,0,0,0]
	)//.plot




	);





	mod2 = SinOsc.ar(freq/10, mul:freq/10 );//* iEnv);

//	mod = SinOsc.ar(freq * mRatio + mod2 , mul:freq * mRatio * iEnv);



	//GOOD ONE
	mod = SinOsc.ar(freq * mRatio + mod2 , mul:MouseX.kr(1, freq * mRatio * iEnv, 1));


	/* TRY HERE if (MouseX=<659.2)
	freq * mRatio + mod2
	else
	freeMouse

mod = SinOsc.ar(

		if(MouseX.kr<659.2,{
			freq * mRatio + mod2 },{
			MouseX.kr(100, 10000, 1)})







		, mul:MouseX.kr(1, freq * mRatio * iEnv, 1));


	*/

/*
	TO NOT USE
	car = SinOsc.ar(freq * cRatio + mod) * env * amp;
	car = Pan2.ar(car, pan);
	*/



	c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


//	mod3 = SinOsc.kr(0.040234375,0.5, add:MouseX.kr(100, 10000, 1));







	//tthis

	//car = SinOsc.ar(freq * cRatio + mod) * Line.kr(0,4,30);//LFNoise1.kr(0.5).range(0.1,1);

	//or



//car = VOsc.ar(MouseX.kr(0.1),  freq * cRatio + mod)* Line.kr(0,4,30);


	//coz tired   car = VOsc.ar(SinOsc.kr(0.1609375),  freq * cRatio + mod)* Line.kr(0,4,30);



	/*intersting*/
	// car = VOsc.ar(SinOsc.kr(0.0201171875),  freq * cRatio + mod)* Line.kr(0,4,30);


	//car = LPF.ar(VOsc.ar(SinOsc.kr(0.0201171875),  freq * cRatio + mod)* Line.kr(0,4,30) ,MouseX.kr(1,5000));


/*funny
	car = LPF.ar(VOsc.ar(SinOsc.kr(0.0201171875).exprange(0.00001,0.99999),  freq * cRatio + mod)* Line.kr(0,4,30) ,MouseX.kr(1,5000));

*/






	car =VOsc.ar(SinOsc.kr(rateSound).exprange(0.00001,0.99999),   freq * cRatio + mod)*  Line.kr(0,4,30) ;


	/* OR*/


	//car =VOsc.ar(SinOsc.kr(rateSound).exprange(0.00001,0.99999),   MouseX.kr(100, 10000, 1))*  LFNoise1.kr(0.08046875) ;









	sig = Shaper.ar(~tfBuf, car);


/*STEP 2
		car = BPF.ar(VOsc.ar(SinOsc.kr(0.0201171875).exprange(0.00001,0.99999),  freq * cRatio + mod)* Line.kr(0,4,30) ,MouseX.kr(20.6,2637.02),2);

*/






//sig = Osc.ar( c,mod , mul:0.2);




	//yes sig2 = Shaper.ar(~tfBuf, Osc.ar(c, SinOsc.ar(MouseX.kr(100, 10000, 1)) * LFNoise1.kr(0.5).range(0.1,1)););
	sig2 = Shaper.ar(~tfBuf, Osc.ar(c, SinOsc.ar(MouseX.kr(100, 10000, 1)) ));

	//sig2 = Shaper.ar(~tfBuf,VOsc.ar(MouseX.kr(0.1), LFSaw.ar(mod3) * LFNoise1.kr(0.5).range(0.1,1)););


//sig2 = Shaper.ar(~tfBuf,VOsc.ar(SinOsc.kr(0.64375), LFSaw.ar(mod3) * LFNoise1.kr(0.5).range(0.1,1)););







/*MAKE c a wavtable or take it from there*/
 /*	c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


	 mod = SinOsc.kr(MouseX.kr(100, 10000, 1),0.5);


	sig = Shaper.ar(~tfBuf,mod , mul:0.2);*/





//inspo to not use/ sig = Osc.ar(c,mod , mul:0.2);

sig  = LeakDC.ar(sig);


sig = sig * 0.3!2;


//this
/*



		c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


	mod3 = SinOsc.kr(0.040234375,0.5, add:MouseX.kr(100, 10000, 1));


	sig2 = Shaper.ar(~tfBuf, Osc.ar(c, LFSaw.ar(mod3) * LFNoise1.kr(0.5).range(0.1,1)););


*/





	sig2  = LeakDC.ar(sig);


	//sig2 = sig2 * 4!2;














	Out.ar(out, sig2);
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
	arg amp=0.5, buf =0, out=0, atk=1, rel=1, gate=1, sync=1, dens=40, baseDur=0.05, durRand=1, rate=1, rateRand=1, pan =0, panRand=0, grainEnv=(-1), ptrBus =0, ptrSampleDelay=20000, ptrRandSamples= 5000, minPtrDelay=1000;

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
		Impulse.ar(1.2875)!2,//Impulse.ar(0.0968),//lenth of interval ///20.6 and 10.3 are funny was 1
		6.1952,//8,//3.0976,//8,//length of the feedback
		buf,
		1,//pitch
		0
	);



	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)


s.plotTree;

(
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);
)






Synth(\sound);


s.defaultGroup.deepFree;


(
//Synth(\sound, [\in, 0, \out, ~micBus], ~micGrp);
Synth(\sound, [\in, 0, \out, ~micBus, \freq, 76.midicps, \rateSound,0.040234375],target:~micGrp);
Synth(\ptr, [\buf, b, \out, ~ptrBus], ~ptrGrp);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b], ~recGrp);
)





/*
(
Synth(\mic, [\in, 0, \out, ~micBus], ~micGrp);
Synth(\ptr, [\buf, b, \out, ~ptrBus], ~ptrGrp);
Synth(\rec, [\ptrIn, ~ptrBus, \micIn, ~micBus, \buf, b], ~recGrp);
)*/
~g.set(\gate, 0);

(


b.zero;


~g = Synth(\gran, [
	\amp, 0.5,
	\buf,  b,
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
)


c.plot;
b.plot;
b.play;
b.zero;




s.defaultGroup.deepFree;
