({
	RLPF.ar(

	LFSaw.ar(216+LFNoise0.kr(20.6).range(-158,1560)     + SinOsc.ar(108,mul: MouseY.kr(0,400 )))


		,  SinOsc.ar(1.8).range(1100, 2200),0.2)


}.play)







({


	FreeVerb.ar(

		RLPF.ar(
	//220              2220
			LeakDC.ar(Shaper.ar(~tfBuf,  LFSaw.ar(108+LFNoise0.kr(10.3).range(-58,1792)* SinOsc.ar(0.01).(-1,5)  +SinOsc.ar(561,mul: MouseY.kr(0,70.dbamp )))))


		,   SinOsc.ar(0.3).range(80, 2200),0.2)

	,mix: 0.5 ,damp: 0.04,mul:0.06)!2


}.play)


({
	LFSaw.ar(216*SinOsc.ar(20).range(1,30))  }.play)
~bus13 = Bus.control(s,1);
~bus14 = Bus.control(s,1);

{Out.kr(~bus14, SinOsc.ar(0.08046875).range(20.6,41.20)    );}.play


SynthDef(\lfMlo, {|out, dur, n1| Out.kr( out,EnvGen.kr(Env.step([n1], [dur]),doneAction: 2) )}).add;
(
SynthDef(\blo,{|dur, bus, freq|
Out.ar(0,LFSaw.ar(freq +

		(EnvGen.kr(Env([27.1366666667,0.2],[dur,0],[0,-2]),doneAction: 2)*1)

	/*+ SinOsc.ar(0.64375).range(20.6,41.20)*/
			//extra pitch modulation
		+ In.kr(bus, 1).poll,mul: EnvGen.kr(Env.adsr(decayTime: dur*0.6,sustainLevel: 0,releaseTime:dur*0.28 ),doneAction: 2)
	)*0.05;
)}).add;)
(
Ppar([
/*	Pbind(\instrument,\lfMlo, \dur, Pseq([1/1],inf),/*\n1,Pseq([ 00, 330, 325, 325, 00, 370, 00, 325, 00],inf),*/


		\n1,Pseq([ 00, 330, 325, 325, 00, 370, 00, 325,      00, 00,370, 00,325,325,330,00],inf),

		\out,~bus13 ),*/
	Pbind(\instrument, \blo, \freq, Pseq([432, 432, 477],inf),

		\scale, Scale.todi,


		\dur, Pseq([1/1],inf),/* \type,Pseq([\note, \note ,\note, \rest, \rest, \rest,\rest,\rest,\rest],inf)*/    \bus, ~bus14)],inf).play(t))

s.plotTree


(
//filter broken
SynthDef(\multi, {Out.ar(0,
	 //BLowPass4.ar(
	Saw.ar([432+SinOsc.kr(0.1).range(-430,430),
		435+ SinOsc.kr(0.1).range(-428,450),
		430+ SinOsc.kr(0.1).range(-422,444)]

+	SinOsc.kr(0.02).range(-6.58, 6.48)
	+ LFNoise0.kr(10.3).range(-300, 300)

	, mul:[1, MouseX.kr(0,0.6), MouseX.kr(0,0.6)])

		//,  Saw.kr(10.3).range(400, 2100)  , 0.2)

		!2*0.08





);}).play)


(SynthDef(\men,{Out.ar(0,BPF.ar( Saw.ar(216 * SinOsc.ar(0.02) + EnvGen.kr(Env([50,0],[4/*must be dur*/,0],-3)) ) ,MouseY.kr(80, 2400),0.4) ); }).play;)



mod.wrap(0, 4pi)