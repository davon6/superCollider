~strtRt5 =0.rrand(16);
~routine5.stop
~routine5.play(t)
~routine5 = Routine{

	loop{
		"goingInRoutine5".postln;



	Pbindef(\uiu,\rte2,0.5.rrand(0),\type,\note,

	\impulse,0.1,\impulseMod,55,\rte,~lfo1,\dur,8,\start,~strtRt5,\envVol,~lfo2);


	3.5.wait;


Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1)}),\type,Prand([Pseq([\note],4),Pseq([\note,\rest],8)],inf),

	\impulse,Prand([0,2,0.5],inf),\impulseMod,~busC6,\rte,55,\dur,0.125,\start,a=0.rrand(16));


		1.5.wait;



~controlVolume.free;
~controlPitch.free;
~controlPulse.free;

~controlPitch = {Out.kr(~lfo3,LFTri.kr(2.00.rand,4.00.rand).range(4.00.rand,1.00.rand))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,3.00.rand).range(8.00.rand,1.00.rand))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;


	Pbindef(\uiu,\rte2,0,\type,\note,

	\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,8,\start,0.rrand(16),\envVol,~lfo2);

		3.wait;
}}
~strtRt5
~seq4.(),

Pbindef(\uiu).play(t)

~testons = Routine{

	loop{
4.do({"test In".postln ;
			1.wait;
		});

1.wait;
		"test Out".postln}}


~testons.play(t)
Pbindef(\uiu,\rte2,0.1.rrand(1.5),\type,\note,

	\impulse,0,\impulseMod,~lfo1,\rte,55,\dur,8,\start,0.rrand(16),\envVol,~lfo2);



~lfo1 = Bus.control;
~lfo2 = Bus.control;
~lfo3 = Bus.control;

~controlPitch = {Out.kr(~lfo1,Osc.kr(~bufSw,0.2).range(2,0.2))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufSw,5.4,1).range(1,0))}.play;
~controlPulse={Out.kr(~busC6,SinOsc.kr(1).range(0.02,6));}.play;


{Osc.ar(~bufADSR,1)}.play


~controlPitch2 = {Out.kr(~lfo3,Osc.kr(~bufADSR,

	Osc.kr(	0.2).range(2,0.2)).range(1,0.3))}.play;


~controlPitch2 = {Out.kr(~lfo3,LFTri.kr(1.2).range(1,0.7))}.play;
~controlPitch = {Out.kr(~lfo1,Osc.kr(~bufADSR,0.2).range(6,0.1))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,0.3).range(2,0))}.play;

~controlVolume.free;
~controlPitch.free;
~controlPitch2.free;



~controlVolume.free;
~controlPitch.free;
~controlPulse.free;

~controlPitch = {Out.kr(~lfo3,LFTri.kr(2.00.rand,4.00.rand).range(3.00.rand,1.00.rand))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,3.00.rand).range(8.00.rand,1.00.rand))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;







~bufSw=Buffer.alloc(s,2048);

~bufADSR=Buffer.alloc(s,2048);
{EnvGen.kr(Env([1,0,1,0,1,0,1,0,1,0],[0.2,0,0.2,0,0.2,0,0.2,0],curve: -3.4))}.plot(duration:1)


{Osc.kr(~bufSw,1)}.plot(duration:1)

(
var env,sig,wt;
env =Env([1,0,1,0,1,0,1,0,1,0],[0.2,0,0.2,0,0.2,0,0.2,0],curve: -3.4);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufSw.loadCollection(wt);

)


{Osc.ar(~bufSw,MouseX.kr(0.4,5,1)*[1,2.01],mul: 0.2!2)}.play


{  EnvGen.kr(Env(
			[0.1,1  ,0.6 ,0.6,0.3],
			[0.1,0.2   , 0.6,0.7,0],
			[-1,-2 ,-4     ,-1]),    //decC- (In.kr(bus2, 1)

	);}.plot(duration:4)


{  EnvGen.kr(Env(
			[0.1,1  ,0.6 ,0.6,0.3],
			[0.1,0.2   , 0.6,0.7,0],
			[-1,-2 ,-4     ,-1]),    //decC- (In.kr(bus2, 1)

	);}.plot(duration:4)


{  EnvGen.kr(Env(
	[0.rrand(0.4),0.rrand(1.00)  ,0.rrand(0.8)  ,0.rrand(0.8)  ,0.rrand(0.3) ],
			[0.rrand(0.5),0.rrand(0.5)   , 0.rrand(0.5),0.rrand(0.5),0],
			[-1,-2 ,-4     ,-1]),    //decC- (In.kr(bus2, 1)

	);}.plot(duration:4)


{  EnvGen.kr(Env(
	[0.rrand(0.4),0.rrand(1.00)  ,0.rrand(0.8)  ,0.rrand(0.8)  ,0.rrand(0.3) ],
			[0.rrand(0.5),0.rrand(0.5)   , 0.rrand(0.5),0.rrand(0.5),0],
	[(-2).rrand(2.00),(-3).rrand(1.00) ,-3.rrand(1.00)    ,-3.rrand(1.00)]),    //decC- (In.kr(bus2, 1)

	);}.plot(duration:4)


(
var env,sig,wt;
env =Env(
	[0.rrand(0.4),0.rrand(1.00)  ,~v1= 0.rrand(0.8)  ,~v1 ,0.rrand(0.3) ],
			[0.rrand(0.5),0.rrand(0.5)   ,0.rrand(0.5),0.rrand(0.5),0],
	[(-2).rrand(2.00),(-3).rrand(1.00) ,-3.rrand(1.00)    ,-3.rrand(1.00)]);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufADSR.loadCollection(wt);

)

{Osc.ar(~bufADSR,1)}.play

{  EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:2);}.plot(duration:1)



{  EnvGen.kr(Env(
			[vlAtk,vlDec                  ,vlSub ,vlSub2,vlRel,0],
			[dur * atkT ,dur * decT  -(dur*relSu) /*- In.kr(bus1, 1)*/  , dur * subsT-relSu,dur* relT],
			[atkC,decC ,0     ,relC]),    //decC- (In.kr(bus2, 1)

		timeScale:  t.beatDur,	doneAction:2);}.plot(duration:1)
