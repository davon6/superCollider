
Pbindef(\uiu,\instrument,\playBuf,\audio1,~lead1.bufnum,\audio2,~lead2.bufnum,\audio3,~lead3.bufnum,\audio4,~lead4.bufnum,\audio5,~lead5.bufnum,\record1,~record1,\record2,
	~record2 ,\record3,
	~record3,\record4,
	~record4 ,\record5,
	~record5
).play(t)


(
~record1 =Bus.audio(s,2);
	~record2 =Bus.audio(s,2);
	~record3 =Bus.audio(s,2);
	~record4 =Bus.audio(s,2);
	~record5 =Bus.audio(s,2);




~lead1 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 21-15-Audio 1.aif");
~lead2 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 22-leads2.aif");
~lead3 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 23-leads3.aif");
~lead4 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 24-leads4.aif");
~lead5 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 25-leads5.aif");



~lfo1 = Bus.control;
~lfo2 = Bus.control;
~lfo3 = Bus.control;


~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);
~busC4=Bus.control(s,1);
~busC5=Bus.control(s,1);
~busC6=Bus.control(s,1);
~busC7=Bus.control(s,1);
~busC8=Bus.control(s,1);
~busC9=Bus.control(s,1);


~bufCy=Buffer.alloc(s,2048);

~bufCy2=Buffer.alloc(s,2048);

~bufSw=Buffer.alloc(s,2048);

~bufADSR=Buffer.alloc(s,2048);

)
(
var env,sig,wt;
env =Env([1,0],[0.2,0],curve: -3.4);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufSw.loadCollection(wt);


env =Env(
	[0.rrand(0.4),0.rrand(1.00)  ,~v1= 0.rrand(0.8)  ,~v1 ,0.rrand(0.3) ],
			[0.rrand(0.5),0.rrand(0.5)   ,0.rrand(0.5),0.rrand(0.5),0],
	[(-2).rrand(2.00),(-3).rrand(1.00) ,-3.rrand(1.00)    ,-3.rrand(1.00)]);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufADSR.loadCollection(wt);


env =Env([1,0,0,1],[0.2,0.2,0.2,0.2],[-5,0,5,5]);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufCy.loadCollection(wt);



env =Env([1,0,0,1],[0.2,0.2,0.2,0.2],[-1,0,1,5]);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufCy2.loadCollection(wt);

)

~newCon = Routine{

loop{
	Pbindef(\uiu,\rte2,0,\type,\note,

			\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,Pfunc({3.00.rrand(0.125)}),\start,Pfunc({0.rrand(16)}),\envVol,~lfo2);


	2.wait;

			~controlVolume.free;
~controlPitch.free;


		~controlPitch = {Out.kr(~lfo3, LFTri.kr(2.00.rand,4.00.rand).range(4.00.rand,1.00.rand))}.play;

~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;

		Pbindef(\uiu,\type,\rest,\dur,8,

		\envVol,55);

		1.wait;

	}
}
~controlVolume.free;
~controlPitch.free;
~controlPulse.free

		~controlPitch = {Out.kr(~lfo3, LFTri.kr(2.00.rand,4.00.rand).range(4.00.rand,1.00.rand))}.play;

~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,3.00.rand).range(8.00.rand,1.00.rand))}.play;

	Pbindef(\uiu,\rte2,0,\type,\note,

			\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,16,\start,0.rrand(16),\envVol,~lfo2);


//below


~i=0
while{~i<10}{~sounds=~sounds.insert(0,((1.00..8).rand).insert(9,0.rrand(16)));~i = ~i + 1}
for loop
(
~i = 0;
while { ~i < 5 } { i = i + 1; "boing".postln };



)
~sounds=[]
7.do{~sounds=~sounds.insert(0,((1.00..8).rand).insert(9,0.rrand(16)))}
~sounds[4]



~controlVolume.free;
~controlPitch.free;
~controlPulse.free;

~bloup=SinOsc.ar(250)

~bloup=SinOsc

~bloup=({Out.ar(0,SinOsc.ar(250))})
~bloup.play
~bloup.pki

.

0.stopReadFromBus
{Out.ar(0,~bloup.ar(250))}.play

{Out.ar(0,~bloup)}.play

~bloup.play

//here

~trio = Routine{loop{
~choice =0.rrand(6);
1.wait;

	// ~controlVolume.free;
~controlPitch.free;
~controlPulse.free;


~controlPitch = {Out.kr(~lfo3, LFTri.kr(~sounds[~choice][0],~sounds[~choice][1]).range(~sounds[~choice][2],~sounds[~choice][3]))}.play;

	// ~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,~sounds[~choice][4]).range(1,0))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,~sounds[~choice][6]).range(~sounds[~choice][7],~sounds[~choice][5]))}.play;

	Pbindef(\uiu,\rte2,0,\type,\note,

	\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,1,\start,~sounds[~choice][8],\envVol,~lfo2);

1.wait;
}}

~trio.play(t)
~trio.stop

//send gating to another bus and envelope shape on one other and bring some melody
~sqr={Out.kr(~lfo2,LFPulse.kr(MouseY.kr(0.4,10),width:  MouseX.kr(1,0.4)).range(1,0))}.play
~sqr.free


~groo={Out.kr(~lfo3,VOsc.kr(SinOsc.kr(0.02).range(25,26),100).range(3,-0.5))}.play




//not here
~controlPitch = {Out.kr(~lfo3, LFTri.kr(~sound2[0],~sound2[1]).range(~sound2[2],~sound2[3]))}.play;



~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,~sound2[4]).range(1,0))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,~sound2[6]).range(~sound2[7],~sound2[8]))}.play;

	Pbindef(\uiu,\rte2,0,\type,\note,

	\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,16,\start,~sound2[9],\envVol,~lfo2);


//suite above

~newCon.play(t)
~newCon.stop
	~sqr={Out.kr(~lfo2,LFPulse.kr(MouseY.kr(0.4,10),width:  MouseX.kr(0.4,1)).range(1,0))}.play
~sqr.free


~tre.free
~tre={Out.kr(~lfo3, Osc.kr(~bufCy,0.12).range(-0.2,0.9) )}.play
Pbindef(\uiu,\rte2,0,\type,\note,

			\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,8,\start,0.rrand(16),\envVol,~lfo2);

~newCon = Routine{

	loop{
4.do({"test In".postln ;

			~controlVolume.free;
~controlPitch.free;
~controlPulse.free;

~controlPitch = {Out.kr(~lfo3,LFTri.kr(2.00.rand,4.00.rand).range(4.00.rand,1.00.rand))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,3.00.rand).range(8.00.rand,1.00.rand))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;



			8.wait;
		});


		"test Out".postln;



		Pbindef(\uiu,\rte2,0,\type,\note,

			\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,8,\start,0.rrand(16),\envVol,~lfo2);
}}

~cmpt = 0
{0.rrand(16)}

Array
~arr=Array.new(4)
~arr=~arr.insert(1,Pbindef)


~arr[1]


~recorders = ~recordBuses.value(
	[
		Bus(\audio, ~record1.index, 2, s),
		Bus(\audio, ~record2.index, 2, s),
		Bus(\audio, ~record3.index, 2, s),
		Bus(\audio, ~record4.index, 2, s),
		Bus(\audio, ~record5.index, 2, s)
	],
	"/Users/davidmignot/Desktop/again/recording2/%.wav"
);




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

Pbindef(\uiu,\instrument,\playBuf,\audio1,~lead1.bufnum,\audio2,~lead2.bufnum,\audio3,~lead3.bufnum,\audio4,~lead4.bufnum,\audio5,~lead5.bufnum,\record1,~record1,\record2,
	~record2 ,\record3,
	~record3,\record4,
	~record4 ,\record5,
	~record5
).play(t)
//next

(~tre={Out.kr(~busC6, Osc.kr(~bufCy,0.12).range(0.2,1.3) )}.play)
~tre.free

~sqr={Out.kr(~busC4,LFPulse.kr(3,width:  MouseX.kr))}.play

~controlVolume = {Out.kr(~lfo3,Osc.kr(~bufSw,3).range(1,0))}.play;
~controlVolume.free
	Pbindef(\uiu,\rte2,0,\type,\note,

	\impulse,0,\impulseMod,~lfo1,\rte,~busC4,\dur,0.5,\start,Pseq([1,6,8,1,Pfunc({0.rrand(16)}),1,2,2,2,1,7,Pfunc({0.rrand(16)}),11,3,14],inf),\envVol,~lfo2);
~err=8
~valo=~err
~tryy= Routine{

Pbindef(\uiu,\dur,3,\envVol,~lfo3,\start,0.rrand(16),\impulseMod,55);

	~err.wait;


}
150

150*2/120

120 =2
//re next


~sqr={Out.kr(~busC4,LFPulse.kr(MouseY.kr(0.4,10),width:  MouseX.kr(0.4,1)).range(1,0))}.play
~sqr.free

~sqr = {Out.kr(~busC4,Osc.kr(~bufSw,MouseY.kr(0.4,10)).range(1,0))}.play;

Pbindef(\uiu,\dur,Prand([1,4],inf),\envVol,~busC4,\start,Pfunc({0.rrand(16)}),\impulseMod,~lfo1,\rte,~busC6,\rte2,0.3);

~testons = Routine{

	loop{
4.do({"test In".postln ;

			~controlVolume.free;
~controlPitch.free;
~controlPulse.free;

~controlPitch = {Out.kr(~lfo3,LFTri.kr(2.00.rand,4.00.rand).range(4.00.rand,1.00.rand))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,3.00.rand).range(8.00.rand,1.00.rand))}.play;
~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,2.00.rand).range(2,0))}.play;



			8.wait;
		});


		"test Out".postln;



		Pbindef(\uiu,\rte2,0,\type,\note,

			\impulse,0,\impulseMod,~lfo1,\rte,~lfo3,\dur,8,\start,0.rrand(16),\envVol,~lfo2);
}}






~testons = Routine{

	loop{
4.do({"test In".postln ;
			4.wait;
		});


		"test Out".postln}}

~testons.stop
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






~controlVolume = {Out.kr(~lfo3,Osc.kr(~bufSw,5.4,1).range(1,0))}.play;


{EnvGen.kr(Env([1,0],[0.2,0],curve: -3.4))}.plot(duration:1)


{Osc.kr(~bufSw,1)}.plot(duration:1)





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


PlayBuf.ar(