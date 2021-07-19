SynthDef(\blo,{|out=0,freq=432,fre2=0,freq3=1,dur|Out.ar(out,/*Resonz.ar( */ Saw.ar([freq,freq+9].flop
	+EnvGen.kr(Env([-7],[dur],-6),timeScale: t.beatDur)+fre2*freq3,EnvGen.kr(Env.perc(attackTime: 0.03,releaseTime:MouseY.kr(t.beatDur,t.beatDur/32)/* [0.12,0.125]*/),timeScale: MouseY.kr(t.beatDur*4 , t.beatDur),doneAction: 2))/*,MouseX.kr(190,3500),4)*/*0.1)}).add;


SynthDef(\blo,{|out=0,freq=432,fre2=0,freq3=1|Out.ar(out,Resonz.ar(  Saw.ar([freq,freq+9]+fre2*freq3,EnvGen.kr(Env.step(times: [0.12,

	MouseY.kr(t.beatDur/4,t.beatDur/32)
]),doneAction: 2)),MouseX.kr(140,3000)))}).add;





Pbind(\instrument,\blo,\dur,Pseq([1/8],inf),\freq,Pseq([402,216,318,402,402,216,318,402,472,402,216,318,],inf),\type,Pseq([\note,\note,\note,\note,\rest,\note,\note,\note,\note,\note,\note,\note],inf),\fre2,Pseq([Pseq([0],12),Pseq([10],12),Pseq([0],12),Pseq([0],12)],inf)).play


~delayGrp=Group.new;
Pseq([



	Pbind(\instrument,\blo,\dur,Pseq([1/8],384),\freq,Pseq([66.midicps,69.midicps,70.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Prand([1,1,2,1].scramble,inf),\out,0),

Pseq([

Pbind(\instrument,\blo,\dur,Pseq([1/8],128),\freq,Pseq([65.midicps,68.midicps,69.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Pseq([1,1,2].scramble,inf),\out,0),



	Pbind(\instrument,\blo,\dur,Pseq([1/8],128),\freq,Pseq([66.midicps,69.midicps,70.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Prand([1,1,2,1].scramble,inf),\out,0)],inf)],1)



.play(t,quant:1);


g=({PingPong.ar(~delay6, [In.ar(~record1),In.ar(~record1)],0.3,0.5)}.play)

g=	Synth(\pingDS,[\in  ,~record1S,\feedback,0.3, \delayTime,0.5 ],~delayGrp);



~cpt=1;

Pbind(\instrument,\blo,\dur,Pseq([1/8],384),\freq,Pseq([66.midicps,69.midicps,70.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Prand([1,1,2,1].scramble,inf)).play(t)


Routine({



s.record(s,path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy.aiff",numChannels:1,duration:t.beatDur*64);

}).play(t,quant:1)

~trancy.play

~trancy=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy.aiff")

~cpt=1;



SynthDef(\blo,{|out=0,freq=432,fre2=0,freq3=1,dur|Out.ar(out,Resonz.ar(  Saw.ar([freq,freq+9]
	+EnvGen.kr(Env([-7],[dur],-6),timeScale: t.beatDur)+fre2*freq3,EnvGen.kr(Env.perc(attackTime: 0.03,releaseTime:MouseY.kr(t.beatDur,t.beatDur/32)/* [0.12,0.125]*/),doneAction: 2)),MouseX.kr(190,3500),4)*0.1)}).add;


Pbind(\instrument,\blo,\dur,Pseq([1/8],inf),\freq,Pseq([66.midicps,69.midicps,70.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Prand([1,1,2,1].scramble,inf)).play(t,quant:1)



	if(~cpt==0.125,{~cpt= 0.125;~cpt=~cpt+0.025},{~cpt=~cpt-0.025});



({Resonz.ar(FreeVerb.ar( PlayBuf.ar(2,~trancy2,loop: 1),room: 0.53),MouseX.kr(270,3500),0.7)}.play)

Routine({

a=({Out.ar(~record1S,PlayBuf.ar(2,~trancy2,startPos:177000,trigger: 1,loop: 1,doneAction: 2)*EnvGen.kr(Env.perc(releaseTime: t.beatDur*16)))}.play);

			wait(0.16);
s.record(s,path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy4.aiff",numChannels:2,duration:t.beatDur*32);
}).play(t,quant:1)

~trancy4=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy4.aiff");

~eqGrp=Group.new;
~revGrp=Group.after(~eqGrp);
~delayGrp=Group.after(~revGrp);
~filterGrp=Group.after(~delayGrp);

~eqi.free
~eqi=Synth(\EQHP96S,[\in,~record1S,\out,~record2S],~eqGrp);
~eqi.set(\vol,6,\val5,1000, \shelf2,1.7,\gain5,(-11));
~revi =Synth(\reverbS,[\in,~record2S,\out,~record3S,\room, 0.53],~revGrp);
~revi.set(\mix,0.46);

y=({Out.ar(~record5,PingPong.ar(~delay3,In.ar(~record3S,2)/*~record1S*/, 0.33, t.beatDur*2))}.play(target:~delayGrp));

f=Synth(\filterGS,[\in,~record5,\out,0,\qf2,0.6],~filterGrp);





Routine({

	({Out.ar(~record1S,PlayBuf.ar(2,~trancy2,loop: 1))}.play);
		wait(0.16);
s.record(s,path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy3.aiff",numChannels:2,duration:t.beatDur*64);
}).play(t,quant:1)




~trancy2=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy2.aiff")

a=({Out.ar(~record1S,PlayBuf.ar(2,~trancy3,startPos:350000,trigger: 1,loop: 0,doneAction: 2)*EnvGen.kr(Env.perc(releaseTime: t.beatDur*4)))}.play);

({PingPong.ar(~delay3,In.ar(~record1S,2)/*~record1S*/, 0.33, t.beatDur*2)}.play(target:a,addAction:\addAfter))





~trancy3=Buffer.read(s,"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy3.aiff")
Routine({

	a= ({Out.ar(~record1,PlayBuf.ar(1,~trancy,loop: 1))}.play);


g=({PingPong.ar(~delayX, [In.ar(~record1),In.ar(~record1)], MouseX.kr(t.beatDur, t.beatDur/16), MouseY.kr(0.8,0.1), )}.play(target:a,addAction:\addAfter));


	wait(0.2);
s.record(s,path:"/Users/davidmignot/Music/SuperCollider Recordings/F#/1/trancy2.aiff",numChannels:2,duration:t.beatDur*64);

}).play(t,quant:1)