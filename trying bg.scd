({/*15.do{*/AllpassN.ar(SinOsc.ar(432, mul:EnvGen.kr(Env.perc(releaseTime: 0.38),doneAction: 2)).dup,0.06, Rand(0.001, 0.06),3);}/*}*/.play)


Bus.audio.free
~miniD.free
s.boot
~trans.free

({/*15.do{*/AllpassN.ar(Saw.ar(432, mul:EnvGen.kr(Env.perc(releaseTime: 0.38)/*,doneAction: 2*/)).dup,0.8, /*Rand(0.001, 0.06)*/0.04,-30);}/*}*/.play)
Bus.free
(
~trans = Bus.audio(s,2);
~miniD = Bus.audio(s,2);
~miniD2 = Bus.audio(s,2);


)

(SynthDef(\bla, {|out=0| Out.ar(out,Saw.ar(MouseY.kr(42,800)+ SinOsc.kr(5,add: 1), mul:1)!2);}).add;




SynthDef(\miniD, {|out=0, in, dur | Out.ar(out,In.ar(in,2)  * EnvGen.kr(Env.step([1],[dur]),doneAction: 2))}).add;






SynthDef(\miniD2, {|out=0, in, dur | Out.ar(out,Pan2.ar(In.ar(in,2),0)  * EnvGen.kr(Env.step([1,1],[0,dur]),))}).add;


SynthDef(\bg,{|out=0, in,  spread=1, level=1, center=0.0, dur|

	Out.ar(out,Splay.ar(
		LPF.ar(
			AllpassL.ar(In.ar(in,2)*EnvGen.kr(Env.perc( 0, releaseTime: 0.01,level: 25)),0.02, /*Rand(0.001, 0.06)*/0.02,52,3,3)

		,SinOsc.kr(0.3).range(200,2200)*EnvGen.kr(Env([0,5,1],[1,500,1],10.5))

	),spread,level,center)






)




}).add;)
(
~grp1 = Group.new;

~grp2 = Group.after(~grp1);)
(
Ppar([
	Pbind(\instrument, \bla, \dur, Pseq([1024/4],inf), \out, ~miniD),




	Pbind(\instrument,\miniD,  \dur, Pseq([1/4],inf), \in, ~miniD ,\out,~trans/*Pwrand([~miniD2,~trans,123],[2,1],inf)*/,\group, ~grp1),

Pbind(\instrument,\miniD2,  \dur, Pseq([1012/4],inf), \in, ~miniD2 ,\out,0,\group, ~grp2),



	Pbind(\instrument, \bg, \dur, Pseq([1024/1],inf), \in, ~trans ,\out, 0, \group, ~grp2,)

],1).play

)

s.plotTree




({/*15.do{*/LPF.ar(AllpassL.ar(SinOsc.ar(50, mul:0.2).dup,0.02, /*Rand(0.001, 0.06)*/0.02,300,900),MouseX.kr(20,2000))*EnvGen.kr(Env([0,1,0],[1,5,1],10.5));}/*}*/.play)





({/*15.do{*/LPF.ar(AllpassL.ar(SinOsc.ar(50, mul:EnvGen.kr(Env.perc( 0, releaseTime: 0.1)/*,doneAction: 2*/)).dup,0.02, /*Rand(0.001, 0.06)*/0.02,300,900),MouseX.kr(20,2000))*EnvGen.kr(Env([0,1,0],[1,5,1],10.5));}/*}*/.play)



({/*15.do{*/LPF.ar(AllpassL.ar(SinOsc.ar(500, mul:0.02)/*,doneAction: 2*/.dup,0.02, /*Rand(0.001, 0.06)*/0.02,300,900),MouseX.kr(20,2000))*EnvGen.kr(Env([0,1,0],[1,5,1],10.5));}/*}*/.play)








