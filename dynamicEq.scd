
~busG = Bus.audio(s,1);
~blin= Group.new

SynthDef(\blou, {Out.ar(~busG, Saw.ar(mul: MouseX.kr(0,10)))}).add;

SynthDef(\dynaEQ,{Out.kr(0,Amplitude.ar(In.ar(~busG)).linlin(0, 2.54172, -2, -18).poll)}).add;

.range(-2,-18)


Synth(\blou)

Synth( \dynaEQ,target: ~blin)


 0.0413584


SynthDef(\bk,{Out.ar(0,BPeakEQ.ar( Saw.ar(mul: EnvGen.kr(Env.perc(releaseTime: 0.1))),     1500,db: /*Amplitude.ar(In.ar(~busG)).range(0,-15).poll*/0)) }).add;



Synth(\blou,target:~blin )
Pbind(\intrument, \blou, \dur, Pseq([1/16],inf),\group,~blin).play


FreqScope.new


({Amplitude.kr(In.ar(~busG)).poll}.play)

SynthDef(\ampi,{Out.kr(0,Amplitude.ar(In.ar(~busG)).range(0,-15).poll)}).add;





SynthDef(\dynaEQ,{|out=0, in, val,quant, ctrl|

	Out.ar(out,BPeakEQ.ar(
	In.ar(in,2)

	,val,quant, Amplitude.ar(In.ar(ctrl)).range(-2,-18).poll))}).add;

Pbind(\instrument, \ampi, \dur, 40,\group,~blin).play

({Amplitude.kr(SoundIn.ar(0)).poll}.play)


({Amplitude.kr(Saw.ar(mul: MouseX.kr(0,10))).poll}.play)