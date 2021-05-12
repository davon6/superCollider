Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 187
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],inf) ,\type,Pseq([\note,\note,\rest,\rest],inf)).play(t)



240.rand.postln



Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 *
240.rand.postln
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/1],1))


],inf).play(t)



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)

~kb.stop

(
Ppar([


	~kb,~boost,
Pseq([
Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
240.rand.postln
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
240.rand.postln
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
240.rand.postln
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),

	Pseq([

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
240.rand.postln
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([4/1],2)),

	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~toCom, \start, ~leTout2.numFrames/ 256 *
		Pfunc({240.rand.postln})
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([8/1],1))
	],2),


],inf)],1).play(t))
