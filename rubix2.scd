SynthDef(\playBuf ,{|out =0,start, trig, dur, amp=3,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0,impulseMod,envVol|Out.ar( [0,1,2,3,4,5],PlayBuf.ar(2,[~lead1,~lead2,~lead3,~lead4,~lead5],In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		/**

		In.kr(envVol);*/


	);}).add;



~lead1

SynthDef(\playBuf ,{|out =0,start, trig, dur, amp=4,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0,impulseMod,envVol|



	Out.ar( out,PlayBuf.ar(2,~lead1,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		*

		In.kr(envVol));

			Out.ar( out,PlayBuf.ar(2,~lead2,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		*

		In.kr(envVol));


				Out.ar( out,PlayBuf.ar(2,~lead3,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		*

		In.kr(envVol));


					Out.ar( out,PlayBuf.ar(2,~lead4,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		*

		In.kr(envVol));

						Out.ar( out,PlayBuf.ar(2,~lead5,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~lead1.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2.2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp
		*

		In.kr(envVol));


	}).add;



k=Buffer.alloc(s,2048);
{EnvGen.kr(Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],curve: rrand(-4,-2)))}.plot(duration:0.5)

(
var env,sig,wt;
env =Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],curve: rrand(-4,-2));
sig = env.asSignal(1024);
wt = sig.asWavetable;
k.loadCollection(wt);



)





[~lead1,~lead2,~lead3,~lead4,~lead5]

volEnv

({EnvGen.kr(Env.perc(releaseTime: 0.22,curve: -4))}.plot(duration:1))
EnvGen.kr(Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],releaseNode:5,loopNode:  5,curve: -2))}.plot(duration:1)

[~lead1,~lead2,~lead3,~lead4,~lead5]

~lead1 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 21-15-Audio 1.aif");
~lead2 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 22-leads2.aif");
~lead3 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 23-leads3.aif");
~lead4 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 24-leads4.aif");
~lead5 = Buffer.read(s,"/Users/davidmignot/Desktop/again/forT/Lead 25-leads5.aif");

[
"/Users/davidmignot/Desktop/again/forT/Lead 21-15-Audio 1.aif",

"/Users/davidmignot/Desktop/again/forT/Lead 22-leads2.aif",

"/Users/davidmignot/Desktop/again/forT/Lead 23-leads3.aif",

"/Users/davidmignot/Desktop/again/forT/Lead 24-leads4.aif",

"/Users/davidmignot/Desktop/again/forT/Lead 25-leads5.aif",

]


ar

~rigol=(5..15).rand

~busC4=Bus.control(s,1);
~busC5=Bus.control(s,1);
~busC6=Bus.control(s,1);
~busC7=Bus.control(s,1);

~busC8=Bus.control(s,1);
~busC9=Bus.control(s,1);

g={Out.kr(~busC8,Osc.kr(k,SinOsc.kr(0.8).range(1,0.5),mul: SinOsc.kr(0.4).range(1,0)).range(1,0))}.play
g.free

o={Out.kr(~busC9,SinOsc.kr(0.8).range(0.1,0.6))}.play
o.free
EnvGen.kr(Env(volEnv,durEnv,releaseNode:5,loopNode:  5,curve: -2))

Exprand(5..10)

m={Out.kr(~busC4,SinOsc.kr(0.1).range(0.02,1));}.play;
n={Out.kr(~busC5,LFTri.kr(0.02).range(0.2,2));}.play;

n.free

c={Out.kr(~busC6,SinOsc.kr(0.5).range(0.02,6));}.play;
f={Out.kr(~busC7,LFTri.kr(0.04).range(0.3,0.7));}.play;

v.stop
f.free
v.play(t)
p.play(t)
n.free
m.free
p.play(t)

p.stop



p = Routine {

	loop{
		"goinghereFirst".postln;

Pbindef(\uiu,\rte,~busC5,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,inf),
	\type,Pseq([\note],inf),\start,Pfunc({(0).rrand(15)}),\rte2,Pfunc({ (-0.2).rrand(0.2) }),\impulse,0,\impulseMod,~busC4,\envVol,~busC8);

     4.5.wait;


Pbindef(\uiu,\rte,~busC7,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*3,inf),
	\type,Pseq([\note,\rest],inf),\start,Pseq(~rigol,inf),\rte2,Pfunc({ (-0.2).rrand(0.5) }),\impulse,0,\impulseMod,~busC6,\envVol,~busC9);
 3.5.wait;
		"goinghere".postln
	}




}




Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],curve: rrand(-20,20));

k=Buffer.alloc(s,2048);
{EnvGen.kr(Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],curve: rrand(-4,-2)))}.plot(duration:0.5)

(
var env,sig,wt;
env =Env([0,1,0,1,0,1,0,1,0,1,0],[0.02,0.2,0,0.2,0,0.2,0,0.2,0],curve: rrand(-4,-2));
sig = env.asSignal(1024);
wt = sig.asWavetable;
k.loadCollection(wt);



)



k.plot




{Osc.ar(k,MouseX.kr(0.4,5,1)*[1,2.01],mul: 0.2!2)}.play
