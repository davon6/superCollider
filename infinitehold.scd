({/*15.do{*/AllpassN.ar(SinOsc.ar(432, mul:EnvGen.kr(Env.perc(releaseTime: 0.38),doneAction: 2)).dup,0.06, Rand(0.001, 0.06),3);}/*}*/.play)







({/*15.do{*/AllpassN.ar(Saw.ar(432, mul:EnvGen.kr(Env.perc(releaseTime: 0.38)/*,doneAction: 2*/)).dup,0.8, /*Rand(0.001, 0.06)*/0.04,-30);}/*}*/.play)

(
~trans = Bus.audio(s,1);
~miniD = Bus.audio(s,1);
~miniD2 = Bus.audio(s,1);


)

(SynthDef(\bla, {|out=0| Out.ar(out,Saw.ar(MouseY.kr(432,2000)* SinOsc.kr(5,add: 1), mul:0.5));}).add;




SynthDef(\miniD, {|out=0, in, dur | Out.ar(out,In.ar(in,1)  * EnvGen.kr(Env.step([1,1],[0,dur]),doneAction: 2))}).add;

SynthDef(\miniD2, {|out=0, in, dur | Out.ar(out,In.ar(in,1)  * EnvGen.kr(Env.step([1,1],[0,dur]),doneAction: 2))}).add;


SynthDef(\bg,{|out=0, in| Out.ar(out,LPF.ar(AllpassL.ar(In.ar(in,1),0.02, /*Rand(0.001, 0.06)*/0.02,10,900)*EnvGen.kr(Env([0,60,0],[1,500,1],10.5)),SinOsc.kr(0.5).range(100,3000));)}).add;)
(
~grp1 = Group.new;

~grp2 = Group.after(~grp1);)
(
Ppar([
	Pbind(\instrument, \bla, \dur, Pseq([1024/4],inf), \out, ~miniD),



	Pbind(\instrument,\miniD,  \dur, Pseq([1/4],inf), \in, ~miniD ,\out,Prand([~trans,1]/*,[1,1]*/,inf),\group, ~grp1),

/*Pbind(\instrument,\miniD2,  \dur, Pseq([1012/4],inf), \in, ~miniD2 ,\out,0,\group, ~grp2),*/


	Pbind(\instrument, \bg, \dur, Pseq([1024/1]), \in, ~trans ,\out, 0, \group, ~grp2)

],1).play

)

s.plotTree





({/*15.do{*/LPF.ar(AllpassL.ar(Saw.ar(432, mul:EnvGen.kr(Env.perc( 0, releaseTime: 0.1)/*,doneAction: 2*/)).dup,0.02, /*Rand(0.001, 0.06)*/0.02,300,900),MouseX.kr(20,2000))*EnvGen.kr(Env([0,1,0],[1,5,1],10.5));}/*}*/.play)












