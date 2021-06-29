SynthDef(\blo,{|out=0,freq=432,fre2=0,freq3=1,dur|Out.ar(out,Resonz.ar(  Saw.ar([freq,freq+9]
	+EnvGen.kr(Env([-7],[dur],-6),timeScale: t.beatDur)+fre2*freq3,EnvGen.kr(Env.perc(attackTime: 0.03,releaseTime:MouseY.kr(t.beatDur,t.beatDur/32)/* [0.12,0.125]*/),doneAction: 2)),MouseX.kr(190,3000)))}).add;


SynthDef(\blo,{|out=0,freq=432,fre2=0,freq3=1|Out.ar(out,Resonz.ar(  Saw.ar([freq,freq+9]+fre2*freq3,EnvGen.kr(Env.step(times: [0.12,

	MouseY.kr(t.beatDur/4,t.beatDur/32)
]),doneAction: 2)),MouseX.kr(140,3000)))}).add;





Pbind(\instrument,\blo,\dur,Pseq([1/8],inf),\freq,Pseq([402,216,318,402,402,216,318,402,472,402,216,318,],inf),\type,Pseq([\note,\note,\note,\note,\rest,\note,\note,\note,\note,\note,\note,\note],inf),\fre2,Pseq([Pseq([0],12),Pseq([10],12),Pseq([0],12),Pseq([0],12)],inf)).play


Pseq([

Pbind(\instrument,\blo,\dur,Pseq([1/8],128),\freq,Pseq([65.midicps,68.midicps,69.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Pseq([1,1,2].scramble,inf)),



	Pbind(\instrument,\blo,\dur,Pseq([1/8],128),\freq,Pseq([66.midicps,69.midicps,70.midicps],inf),\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest,\note,\rest],inf),\fre2,Pseq([Pseq([0],1),Pseq([0],1),Pseq([0],1),Pseq([30],1)],inf),\freq3,Prand([1,1,2,1].scramble,inf))],inf).play(t)



Pbind(\instrument,\blo,\dur,Pseq([1/8],inf),\freq,Pseq([402,216,310,402,402,216,310,402,420,402,216,310,],inf),\type,Pseq([\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note,\note],inf),\fre2,Pseq([Pseq([0],12),Pseq([97],1),Pseq([0],11),Pseq([27],1),Pseq([0],11),Pseq([0],12),],inf)).play
