
//lfo == random, pulse, triangle , saw , sine
//note and melo
//multi voic

(
SynthDef(\fm, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1, multi, out=0;
	var car, mod2, env, iEnv, mod, sig;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = SinOsc.ar(
		[freq, freq+10, freq -5]

		/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi),[1,multi,multi]) * env * amp;


	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);


	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;






SynthDef(\fm2, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1,multi, out=0;
	var car, mod2, env, iEnv, mod, sig;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = Saw.ar([freq, freq+10, freq -5]/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi),[1,multi,multi]) * env * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);


	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;



SynthDef(\fm3, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1,multi, out=0;
	var car, mod2, env, iEnv, mod, sig;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod2 =SinOsc.ar(freq3/10, mul:freq3/10* iEnv* index2);

	mod = Saw.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = SinOsc.ar([freq, freq+10, freq -5]/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi),[1,multi,multi]) * env * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);


	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;




SynthDef(\fm4, {
	arg freq = 500,freq2 = 50, mRatio = 1, cRatio = 1, index = 1, iScale = 5, amp = 0.2, atk = 0.01, rel = 30000, cAtk = 4, cRel = 80, pan = 0, freq3=50, index2=1, index3=1,multi, out=0;
	var car, mod2, env, iEnv, mod, sig;
	iEnv = EnvGen.kr(
		Env.new(
			[index, index * iScale, index],
			[atk, rel],
			[cAtk, cRel]
		)
	);
	env = EnvGen.kr(
		Env.perc(atk, rel, curve: [cAtk, cRel]),
		doneAction: 2
	);
	mod2 =Saw.ar(freq3/10, mul:freq3/10* iEnv* index2);

	mod = SinOsc.ar(freq2  /*In.kr(~bus.postln,1) */   * mRatio,mod2.wrap(0, 16pi), mul:/* freq2 **/ iEnv* index3/*MouseX.kr(0,iEnv)*/);

	car = SinOsc.ar([freq, freq+10, freq -5]/*+ LFNoise0.kr(10.3).range(-40,1200) */* cRatio, mod.wrap(0, 16pi),[1,multi,multi]) * env * amp;
	sig = Shaper.ar(~tfBuf,   car);

	sig  = LeakDC.ar(sig);


	sig = Pan2.ar(sig, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\sequencer,{|value, dur, in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=1, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2|

		ReplaceOut.ar(in,  In.ar(in, 2) *    EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlRel,0],
			[dur * atkT ,dur *decT  -In.kr(bus1, 1)  , dur * subsT,dur* relT],
			[atckC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)



	doneAction:2));


	Out.kr(out/*~seqBus*/,EnvGen.kr(Env.step([value],[dur]),doneAction: 2))}).add;


// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([1/1],inf, \in,~outFil))
// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([1/4],inf))
// Pbindef(\seq, \value, Pseq([300, 400, 330],inf), \dur, Pseq([4/1],inf))

)

t.free;d.free;w.free;q.free;


(
t = (Synth( \fm, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, ~outFil],~synthGrp));
d = (Synth( \fm2, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, ~outFil],~synthGrp));
w = (Synth( \fm3, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, ~outFil],~synthGrp));
q = (Synth( \fm4, [\dur, inf,\stretch, 3.5,\mRatio, 1,\cRatio, 1,\index, 1,\out, ~outFil],~synthGrp));

)


~synthGrp = Group.new;
~filterGrp = Group.after(~synthGrp);

~outFil =Bus.audio(s,2);


k = (Synth( \filterModu, [\dur, inf,\in,~outFil],~filterGrp));

SynthDef(\filterModu,{|out=0, in, filMod,qf, which |

		var lp,hp, sig;

		sig = In.ar(in,2);

		lp = BLowPass4.ar(sig ,  filMod ,qf);

		hp = BHiPass4.ar(sig, filMod,qf);

		sig = SelectX.ar(which, [lp, hp]);

		Out.ar(out, sig);
	}).add;