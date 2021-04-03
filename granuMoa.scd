
(
Ppar([
Pseq([

		Pseq([
Pbind(\instrument, \playBuf10,  \out, 0,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames.rrand(1000000)-1000000))
		],4)

		,
		Pseq([
		Pbind(\instrument, \playBuf10,  \out, 0,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames.rrand(1000000)-1000000))
				],4)
			,

		Pseq([
Pbind(\instrument, \playBuf10,  \out, 0,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames.rrand(1000000)-1000000))

			],4)
		,
Pseq([
		Pbind(\instrument, \playBuf10,  \out, 0,\dur,Pseq([ Pseq([8/1],1),  Pseq([1/1],6),Pseq([2/1],1)
].scramble,1),\type,Pseq([\note, \rest,\note, \rest,\note, \rest,\note,\note].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,(~leTout.numFrames.rrand(1000000)-1000000)),
],4)



],inf),
	~kb, ~base],1).play(t, quant:1))