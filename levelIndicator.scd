


Ppar([

	~base,

Pbind(\instrument,\rise,\dur,Pseq([64/1],1), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({5.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,~flanToDisto,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\atk,1, \fS,Pfunc({1.00.rand})),




	Pbind(\instrument,\flanger,\dur,Pseq([8/1],inf ), \in,~bellFlang, \out,~flanToDisto, \group,~phaserGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374),
	Pbind(\instrument, \distoS, \dur, inf, \in, ~flanToDisto , \out,~flanToEq ,\group, ~distoGrp),
	Pbind(\instrument,\EQHP2, \in, ~flanToEq , \out, ~flanToRev ,\frq, 600, \dur,inf, \group, ~eqGrp0, \val,3600, \quant,8, \gain,(-6),\val2,11800,\quant2,1, \gain2,(-18).rrand(-4)),
	Pbindf( ~rShort, \instrument, \reverbS, \dur,inf, \in,~flanToRev  , \out,~flanToComp,\group,~revGrp),
		Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~flanToComp ,\ctrl, ~kbus, \out,~flanToLimit, \group, ~compGrp),
	Pbind( \instrument, \limiterStoMixer,\c16,1,\in, ~flanToLimit, \dur, inf,\gain,60,\group,~limitGrp,\out,~flanToStereo),

Pbind(\instrument,\stereoS, \dur, 9999, \in, ~flanToStereo  ,\spread,0.2,\out,0/*~again*/,\tS, 0.39550810372374,\group, ~stereoGrp),


],1).play(t)






({Amplitude.kr(In.ar(~flanToDisto,2).poll,)}.play)

LevelIndicator(


	a = LevelIndicator(bounds:Rect(10, 10, 20, 160)).front;

s.meterColor_

s.meterView

RangeSlider


(
// use input amplitude to control SinOsc frequency - use headphones to prevent feedback.
{
    SinOsc.ar(
            Amplitude.kr(
                        SoundIn.ar(0),
                        0.01,
                        0.01,
                        1200,
                        400
            ).poll,
            0, 0.3)
}.play;
)