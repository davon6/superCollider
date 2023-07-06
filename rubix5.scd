







SynthDef(\playBuf ,{|out =0,start, trig, dur, amp=4,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0,impulseMod,envVol,audio1,audio2,audio3,audio4,audio5|



	Out.ar( ~record1,PlayBuf.ar(2,audio1,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)

		*

		In.kr(envVol));

			Out.ar( ~record2,PlayBuf.ar(2,audio2,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)

		*

		In.kr(envVol));


				Out.ar( ~record3,PlayBuf.ar(2,audio3,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));


					Out.ar( ~record4,PlayBuf.ar(2,audio4,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));

						Out.ar( ~record5,PlayBuf.ar(2,audio5,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/307200/16* start,loop:1,doneAction: 2)


		*

		In.kr(envVol));




	Out.ar(0,In.ar(~record1,2)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur, doneAction:2));
		Out.ar(0,In.ar(~record2,2));
		Out.ar(0,In.ar(~record3,2));
		Out.ar(0,In.ar(~record4,2));
		Out.ar(0,In.ar(~record5,2));


	}).add;

~sqr={Out.kr(~busC4,LFPulse.kr(MouseY.kr(0.4,10),width:  MouseX.kr).range(1,0))}.play
~sqr.free

~sqr = {Out.kr(~busC4,Osc.kr(~bufSw,MouseY.kr(0.4,10)).range(1,0))}.play;

Pbindef(\uiu,\dur,Prand([1,4],inf),\envVol,~busC4,\start,Pfunc({0.rrand(16)}),\impulseMod,~lfo1,\rte,~busC6,\rte2,0.3);



{PlayBuf.ar(2,~lead2.bufnum,startPos: 30000,trigger: Impulse.kr(SinOsc.kr(0.8).range(9,0.03)),loop: 0)}.play



{PlayBuf.ar(2,~lead2.bufnum,rate:LFTri.kr(0.8).range(1.3,0.5), startPos: 30000,trigger: Impulse.kr(0.08),loop: 0)}.play



{PlayBuf.ar(2,~lead2.bufnum,rate:SinOsc.kr(0.8).range(1.3,0.5), startPos: 30000,trigger: Impulse.kr(SinOsc.kr(0.8).range(9,0.03)),loop: 0)}.play



{EnvGen.kr(Env([0,1,0],[0.8,0.1,0],[5,5,0]))}.plot(duration:1)


~bufBreath=Buffer.alloc(s,2048);
env =Env([0,1,0],[0.7,0.3,0],[3,5,0]);

var env,sig,wt;
env =Env([0,1,0],[0.8,0.1,0],[5,5,0]);
sig = env.asSignal(1024);
wt = sig.asWavetable;
~bufBreath.loadCollection(wt);

({Osc.ar(~bufBreath,1)}.play)
150/60
150
60 1

2.5/8

{PlayBuf.ar(2,~lead2.bufnum,startPos: 30000,trigger: Impulse.kr(Osc.kr(~bufBreath,1).range(0.03,9)),loop: 0)}.play



{PlayBuf.ar(2,~lead2.bufnum,rate:Osc.kr(~bufBreath,0.625).range(0.5,1.3), startPos: 30000,trigger: Impulse.kr(0.08),loop: 0)}.play



{PlayBuf.ar(2,~lead2.bufnum,rate:Osc.kr(~bufBreath,0.3125).range(1.7,0.5), startPos: 30000,trigger:  Impulse.kr(Osc.kr(~bufBreath,0.3125).range(17,0.03)),loop: 0)}.play

//nul hehehe
{PlayBuf.ar(2,~lead1.bufnum,rate:Osc.kr(~bufBreath,0.3125).range(3,0.5), startPos: 0,trigger:  Impulse.kr(Osc.kr(~bufBreath,0.3125).range(0.5,0.1)),loop: 0)}.play


{PlayBuf.ar(2,~lead1.bufnum,rate:LFNoise0.kr(0.3125*32).range(8,5), startPos: 0,trigger:  Impulse.kr(Osc.kr(~bufBreath,0.3125).range(25,100)),loop: 0)}.play


{PlayBuf.ar(2,~lead3.bufnum,rate:Osc.kr(~bufBreath,0.3125).range(0.1,0.5), startPos: 17000,trigger:  Impulse.kr(Osc.kr(~bufBreath,0.3125).range(3,0.1)),loop: 0)}.play

({LFPulse.ar(4).range(6,6).poll}.play)
--------

~choice =0.rrand(6);


~controlPitch.free;
~controlPulse.free;
~controlVolume.free;

~controlPitch= {Out.kr(~lfo3, Osc.kr(~bufBreath,0.3125).range(~sounds[~choice][1],~sounds[~choice][2]))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufBreath,0.3125).range(~sounds[~choice][7],~sounds[~choice][5]))}.play;

 ~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,~sounds[~choice][4]).range(1,0))}.play;


------


~controlPitch.free;
~controlPulse.free;
~controlVolume.free;

~controlPitch= {Out.kr(~lfo3, Osc.kr(~bufBreath,0.3125).range(1.00.rand,1.00.rand))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufBreath,0.3125).range(1.00.rand,1.00.rand))}.play;
 ~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,~sounds[~choice][4]).range(1,0))}.play;



	Pbindef(\uiu,

	\impulse,0,\impulseMod,~lfo1,\rte,Prand([~lfo3,~lfo11,~lfo12],inf),\rte2,0,

	\dur,/*Pseq([2,1,1,1.5,0.5,0.5,0.25,0.25,1],inf)Pfunc({1.20.rand(0.125)})*/

/*	Prand([ Pseq([1],1),Pseq([0.5],2), Pseq([1.5],1) ,Pseq([0.25],2)],inf)*/


		Prand([ Pseq([1],1),Pseq([1.5],1) ],inf)



	,\start,/* Pseq([4,2,10,4,2,10,6,4,2,10,8],inf)               */ Pfunc({0.rrand(15)})
/*
	Pseq([1,6,8,1,Pfunc({0.rrand(15)}),3,7,Pfunc({0.rrand(15)})],inf)*/,\envVol,/*,\gat,*/Prand([~lfo2,~lfo4,~lfo5,~lfo10],inf),\type,Prand([\note/*,Pseq([\note,\note,\note,\rest],1)*/],inf));



Pbindef(\uiu,\start,Pfunc({10.rrand(13)}))

Pbindef(\uiu,\start,6)
Pbindef(\uiu,\dur,8)

Pbindef(\uiu,\rte2,Pfunc({-2.rrand(-1.5)}))

Pbindef(\uiu,\rte,55,\rte2,1)

Pbindef(\uiu,\impulseMod,55,\impulse,0.3)


Pbindef(\uiu,\rte,55,\rte2,1,\impulseMod,55,\impulse,0.3)

~la.stop
~la=Routine{loop{
~choice =0.rrand(6);

	5.00.rrand(0.125).wait;

~chg1.free;
~chg2.free;
~chg3.free;
~chg4.free;
~controlVolume.free;

	/*((4,4),(5,5)).choose*/

~chg1 = {Out.kr(~lfo6,LFPulse.kr(4).range(~sounds[~choice][4]),~sounds[~choice][4])}.play;
~chg2 = {Out.kr(~lfo7,LFPulse.kr(4).range(~sounds[~choice][3]),~sounds[~choice][3])}.play;
~chg3 = {Out.kr(~lfo8,LFPulse.kr(4).range(~sounds[~choice][2]),~sounds[~choice][2])}.play;
~chg4 = {Out.kr(~lfo9,LFPulse.kr(4).range(~sounds[~choice][1]),~sounds[~choice][1])}.play;
 ~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,/*0.3125*/~sounds[~choice][4]).range(2,0))}.play;

}}

~la.play(t)


~controlPitch.free;

~controlPitchOff= {Out.kr(~lfo11, Osc.kr(~bufBreath,0.3125).range(1,1))}.play;
~controlPitch= {Out.kr(~lfo3, Osc.kr(~bufBreath,0.3125/4).range(In.kr(~lfo6),In.kr(~lfo7)))}.play;

~controlPitcRise= {Out.kr(~lfo12, Saw.kr(0.3125/16).range(1.4,0.7))}.play;


~controlPitch= {Out.kr(~lfo3, Osc.kr(~bufBreath,0.3125).range(In.kr(~lfo6),In.kr(~lfo7)))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufBreath,0.3125).range(In.kr(~lfo8),In.kr(~lfo9)))}.play;
/*~ui=[2,3,4].choose*/

~sqr={Out.kr(~lfo4,LFPulse.kr( Osc.kr(~bufBreath,1.2).range(0.4,8),width:  Osc.kr(~bufBreath,1.4).range(0.5,0)).range(0.5,0))}.play

~sqr={Out.kr(~lfo4,LFPulse.kr(SinOsc.kr(1.2).range(0.4,8),width: SinOsc.kr(1.4).range(0.5,0)).range(0.5,0))}.play
~sqr.free

~sw={Out.kr(~lfo5,Osc.kr(~bufSw,SinOsc.kr(1.2).range(1.5,6)).range(1,0))}.play
~sw.free
~sw={Out.kr(~lfo5,Osc.kr(~bufSw,Osc.kr(~bufBreath,1.2).range(1.5,6)).range(1,0))}.play

~flat={Out.kr(~lfo10,LFPulse.kr(00.1).range(0.5,0.5))}.play
~flat.free



~groo={Out.kr(~lfo3,VOsc.kr(SinOsc.kr(0.02).range(~bufCy.bufnum,~bufCy2.bufnum),0.3).range(0.5,-0.5))}.play
~groo.free



	 ~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufADSR,~sounds[~choice][4]).range(1,0))}.play;
~controlPulse = {Out.kr(~lfo1,Osc.kr(~bufADSR,~sounds[~choice][6]).range(~sounds[~choice][7],~sounds[~choice

~controlVolume = {Out.kr(~lfo2,Osc.kr(~bufBreath,0.3125).range(~sounds[~choice][3],~sounds[~choice][4]))}.play;