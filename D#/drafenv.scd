({EnvGen.kr(Env([1,0,1],[t.beatDur/4,0,0],[-5,0,0],0,3),Impulse.kr(9.65))}.plot(duration:t.beatDur))


SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5)| Out.kr(out,


	({EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: 1,doneAction: 2)}.plot(duration:t.beatDur))



)}).add;


t.beatDur


~hz1beat*8

~hz1beat*8


SynthDef(\lfoEnv, {|out, dur, valP1=1, valP2=0,fc=0.25,imp=9.65,crv=(-5)| Out.kr(out,	EnvGen.kr(Env([400,0,400],[dur/4,0,0],[-5,0,0],0,3),Impulse.kr(9.65)*

	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
	,timeScale: t.beatDur,doneAction: 0))}).add;


Prand([
	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({-1800.rrand(0)}),\out,~busC8,\imp,Pfunc({9.65.rand}),\crv,Pfunc({-12.rand}),\time,Pfunc({4.00.rrand(1)})),


	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({1400.rand}),\out,~busC8,\imp,Pfunc({9.65.rand}),\crv,Pfunc({(-12).rand}),\time,Pfunc({4.00.rrand(1)}))],inf).play(t);


({SinOsc.ar(100+ In.kr(~busC8))}.play)


	Prand([
	Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({1800.rrand(0)}),\group,~g1,\out,~busC8,\imp,Pfunc({9.65.rand})),
		Pbind(\instrument, \lfoEnv,\dur,Pseq([1],inf),\valP1,Pfunc({-1800.rrand(0)}),\group,~g1,\out,~busC8,\imp,Pfunc({9.65.rand}))],inf),



({SinOsc.ar(100+

	EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: 1,doneAction: 2)


)}.play)




{Out.kr(~busC8,EnvGen.kr(Env([400,0,400],[t.beatDur/4/*t.beatDur* (dur*fc)*/ ,0,0],[-5,0,0],0,3),Impulse.kr(9.65),timeScale: 1,doneAction: 2))}.play


({SinOsc.ar(100+ In.kr(~busC8))}.play)

--------------------------------------



({EnvGen.kr(Env.perc(0.02,0.04,500,6),timeScale:  t.beatDur,doneAction: 2)}.plot(duration:0.1))


-----------------

({SinOsc.ar(Saw.kr(MouseY.kr(0.0002,2),mul: -1,add: 0.4).range(1440,40))}.play)



a=(SynthDef(\ye,{XLine.kr(start: -1.0, end: 2.0, dur: 1.0, mul: 1.0, add: 0.0, doneAction: 0)}).play)



a.free


({SinOsc.ar(400+Saw.kr(1,mul: -1,add: MouseY.kr(0.00000001,1)).lincurve(-1,1,-1,1,7).range(1440,0))}.play)



SynthDef(\ye,{|fc,dur,out,strt,which,val,pol,dec|var sig1,sig2;


	sig1 = XLine.kr(start: strt, end: 0, dur: dur*fc );

	sig2 = Saw.kr(val,mul: pol,add: dec).range(-1440,0);


	Out.kr(out,SelectX.kr(which,[sig1,sig2]));

}).add;


({Line.kr(5,5,inf)}.play)


	SynthDef(\stereo,{|out=0, in, spread=0, level=1, center=0.0,dlt1=0.3,dlt2=0.4,decT=2, mxDel=1|

		ReplaceOut.ar(out,Splay.ar({

			CombN.ar(
			In.ar(in, 1), mxDel, [In.kr(dlt1),In.kr(dlt2)], In.kr(decT))

	},In.kr(spread),level,In.kr(center)))}).add;


Synth(\stereo,[\spread,~bspread,\center,~bcenter,\dlt1,~bdlt1,\dlt2,~bdlt2,\decT,~bdecT],~g3);

~bspread=Bus.control(s);~bcenter=Bus.control(s);~bdlt1=Bus.control(s);~bdlt2=Bus.control(s);~bdecT=Bus.control(s);

-> List[ [ 1, 1, 5 ], [ 1, 2, 4 ], [ 1, 3, 3 ], [ 1, 4, 2 ], [ 1, 5, 1 ], [ 2, 1, 4 ], [ 2, 2, 3 ], [ 2, 3, 2 ], [ 2, 4, 1 ], [ 3, 1, 3 ], [ 3, 2, 2 ], [ 3, 3, 1 ], [ 4, 1, 2 ], [ 4, 2, 1 ], [ 5, 1, 1 ] ]


SynthDef(\try,{|val|Out.ar(0,SinOsc.ar(100*val,mul: EnvGen.kr(Env.perc,doneAction: 2)))}).add;



Pbind(\instrument,\try, \val,Pseq([ 1, 1, 5 ,  1, 2, 4 ,  1, 3, 3 ,  1, 4, 2 ,  1, 5, 1   ,   2, 1, 4   ,   2, 2, 3   ,   2, 3, 2   ,   2, 4, 1   ,   3, 1, 3   ,   3, 2, 2   ,   3, 3, 1   ,   4, 1, 2   ,   4, 2, 1   ,   5, 1, 1 ],1),\dur,1).play(t)


x=({VerbEF.ar(BLowPass4.ar( Saw.ar(MouseX.kr(40,1200)),SinOsc.kr(~hz1beat).range(50,2600),0.6),


	5.5,0.09,2000,6000,0.025
)!2}.play)



x=({VerbEF.ar(BLowPass4.ar( Saw.ar(MouseX.kr(40,1200)),SinOsc.kr(~hz1beat).range(50,2600),0.6),


	15.5,0.9,2000,6000,0.025
)!2}.play)