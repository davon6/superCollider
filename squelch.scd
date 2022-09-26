SynthDef(\squelch,{|out,dur,strt,dec,atk,rel|Out.ar(0,Saw.ar(EnvGen.kr(Env([strt,dec],[dur*atk,dur*(1-atk)]),timeScale: t.beatDur,doneAction: 2)))}).add;


Pbind(\instrument,\squelch,\strt,Pfunc({1000.rrand(0.1)}),\dec,Pfunc({1000.rrand(0.1)}),\atk,Pfunc({0.8.rrand(1)}),\rel,Pfunc({0.8.rrand(1)}),\dur,Pfunc({1.rrand(0.125)})).play(t)

SynthDef(\squelch,{|out,dur,strt,dec,atk,rel|Out.ar(0,	LeakDC.ar(Shaper.ar(~tfBuf,

	Saw.ar(EnvGen.kr(Env([strt,dec],[dur*atk,dur*(1-atk)]),timeScale: t.beatDur,doneAction: 2))


)))}).add;




SynthDef(\squelch,{|out,dur,strt,dec,atk,rel|Out.ar(0,	Saw.ar(EnvGen.kr(Env([strt,dec],[dur*atk,dur*(1-atk)]),timeScale: t.beatDur,doneAction: 2)/*+SinOsc.ar(strt*dec,mul: MouseY.kr(0.001,50000,1))*/)
+

	Saw.ar(EnvGen.kr(Env([strt-50,dec],[dur*atk,dur*(1-atk)]),timeScale: t.beatDur,doneAction: 2))
)}).add;






SynthDef(\squelch,{|out,dur,strt,dec,atk,rel|Out.ar(0,Splay.ar({	CombN.ar(	Saw.ar(EnvGen.kr(Env([strt,dec],[dur*atk,dur*rel],'exp'),timeScale:1,doneAction: 2)/*+SinOsc.ar(strt*dec,mul: MouseY.kr(0.001,50000,1))*/)
+

	Saw.ar(EnvGen.kr(Env([strt-50,dec],[dur*atk,dur*rel]),timeScale: 1,doneAction: 2))








		, 0.39, [0.32,0.38], 0.2)

},0.5,1 ,-0.16).round(2**(-16))
)}).add;