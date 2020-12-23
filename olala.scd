ServerOptions.devices;

s.options.inDevice_("Built-in Microph");
Server.default.options.outDevice_("Audient iD14");//soundcard for headphones
(


s.boot;
s.meter;
)
s.reboot;


//b = Buffer.alloc(s, s.sampleRate *0.7744,1);

//b = Buffer.alloc(s, s.sampleRate *3.0976);//8


b = Buffer.alloc(s, s.sampleRate *1.5488);

Buffer.freeAll;

c = Buffer.alloc(s, 2048);



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


(SynthDef.new(\sound,{
arg in=0, out=0, amp =1;
	var sig, mod;


	//mod = SinOsc.kr(0.1609375,0.5, add:MouseX.kr(100, 10000, 1));
 mod = SinOsc.kr(0.040234375,0.5, add:MouseX.kr(100, 10000, 1));

	//OK THE IDEA INITIAL FREQ OF SINE IS A DRAWED WAVEFORM OR ENVELOPE START AS A FALL ,END LIKE RISE, HAS A TIME FLAT FREQ ALIGNED TO KEY



	c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


	sig = Osc.ar( c,mod , mul:0.2);

	//sig = Osc.ar(c,MouseX.kr(100, 10000, 1) , mul:0.2);



	Out.ar(out, sig);
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
Synth(\sound, [\in, 0, \out, ~micBus],target:~micGrp);
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
