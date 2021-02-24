~gate =Bus.audio(s,3);
~gate2 =Bus.audio(s,3);

(
SynthDef(\kiasmosPad, {arg freq = 440, out = 0, amp = 1, atk= 0.01, rel= 0.01, dur = 1;
    var carriers, modulators, mix, verb, filter, env, filterEnv;
    freq = freq + [0, Rand(1,4)];
    carriers = [SinOsc, Saw, Pulse].collect(_.ar(freq));
    modulators = carriers.collect {|c| SinOsc.kr(rrand(0.0322,1.0)*0.0647)};
    mix = Mix(carriers * modulators) * 0.15;
    /*verb = FreeVerb.ar(mix)/*+sig*/;

	filterEnv = EnvGen.kr(Env([3600, 220], dur, \exp), doneAction: Done.freeSelf);
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, dur - atk - rel, rel], [4,-4]));

	filter = LPF.ar(verb, filterEnv);*/
	Out.ar(out, mix /*filter * env * amp*/);
}).add;


SynthDef(\gate2,{|in, out=0, vlAtk=0, vlDec=1,vlSub=0, vlRel=0, atkT=0, decT=0, subsT=0, relT=0, atckC=0, decC=0, relC=0, bus1, bus2, dur,relSu=0|
	var env;

		env =   In.ar(in, 3) *    EnvGen.kr(Env.adsr(decayTime: dur*0.8,sustainLevel: 0,releaseTime:dur*0.18 ),doneAction: 2);




		Out.ar(out, env);
}).add;

SynthDef(\fil, {
	arg freq = 440, out = 0, amp = 1, atk= 0.01, rel= 0.01, dur = 1,in;
    var carriers, modulators, mix, verb, filter, env, filterEnv;

	verb = FreeVerb.ar(In.ar(in, 3))/*+sig*/;

	filterEnv = EnvGen.kr(Env([3600, 220], dur, \exp), doneAction: Done.freeSelf);
	env = EnvGen.kr(Env([0, 1, 1, 0], [atk, dur - atk - rel, rel], [4,-4]));

	/*filter = LPF.ar(verb, filterEnv);*/

Out.ar(out, In.ar(in, 3)/** filter */* env * amp);}).add;
)

(
~gateGrp = Group.new;
~gateGrp2 = Group.after(~gateGrp);)
(

Ppar([
Pbind(
	\instrument, \kiasmosPad,
		\scale, Scale.major,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20,
	\out,~gate
)
,
	Pbind(\instrument,\gate2, \dur,Pseq([1/16],inf)

		/*Pwrand([/*Pseq([4/1],1),*/Pseq([1/4],Pwrand([1,4,16,64],[1,4,16,16],1)),Pseq([1/1],Prand([1,4],1)),Pseq([1/3],Prand([1,3,12],1)) ],[4,1,1],inf)*/
		,\in, ~gate, \atkT,0,\out,0,\group, ~gateGrp),



	Pbind(
	\instrument, \fil,
	\scale, Scale.ionian,
	\degree, Prand((0..12), inf) + [0,1,5],
	\amp, 0.6,
	\atk, 1, \rel, 0.5,
	\legato, 2,
	\dur, 20,
	\in,~gate2, \group, ~gateGrp2
)
],1).play;)
s.plotTree
