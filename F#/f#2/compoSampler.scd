~play = Buffer.read(s, "/Users/davidmignot/Music/SuperCollider Recordings/F#/256barsF#149.wav");


~play.play

~play.numFrames/256

.numFrames/256


SynthDef(\playBufS ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=2|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:impulse,startPos: start,loop:loo,doneAction: dA)

		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

); }).add;




Pbind(\instrument, \playBufS, \buf,~play,\dur,Pseq([1],4),\start,

	Pfunc({~play.numFrames/256 * 5 )


).play(t)


-> List[ [ 1, 1, 5 ], [ 1, 2, 4 ], [ 1, 3, 3 ], [ 1, 4, 2 ], [ 1, 5, 1 ], [ 2, 1, 4 ], [ 2, 2, 3 ], [ 2, 3, 2 ], [ 2, 4, 1 ], [ 3, 1, 3 ], [ 3, 2, 2 ], [ 3, 3, 1 ], [ 4, 1, 2 ], [ 4, 2, 1 ], [ 5, 1, 1 ] ]


	[  1, 1, 5  ,   1, 2, 4  ,   1, 3, 3  ,   1, 4, 2  ,   1, 5, 1  ,   2, 1, 4  ,   2, 2, 3  ,   2, 3, 2  ,   2, 4, 1  ,   3, 1, 3  ,   3, 2, 2  ,   3, 3, 1  ,   4, 1, 2  ,   4, 2, 1  ,   5, 1, 1   ]*(~play.numFrames/256)

~play.numFrames/256 * 5


~newDur=	Pseq([  1, 1, 5  ,   1, 2, 4  ,   1, 3, 3  ,   1, 4, 2  ,   1, 5, 1  ,   2, 1, 4  ,   2, 2, 3  ,   2, 3, 2  ,   2, 4, 1  ,   3, 1, 3  ,   3, 2, 2  ,   3, 3, 1  ,   4, 1, 2  ,   4, 2, 1  ,   5, 1, 1   ],inf)

	~newDur=~newDur*(~play.numFrames/64)


		~newDur=~newDur*(~play.numFrames/1024)

	~newDur=~newDur*4

	Pbind(\instrument, \playBufS, \buf,~play,\dur,Pseq([4],inf),\start,

	~newDur


).play(t)

	------

	Prand([

	Pbind(\instrument, \playBufS, \buf,~play,\dur,Pseq([4],4),\start,	~newDur),

		Pbind(\instrument, \playBufS, \buf,~play,\dur,Pseq([1],4),\start,	Pfunc({~newDur/64})),

		Pbind(\instrument, \playBufS, \buf,~play,\dur,Pseq([1/4],4),\start,	Pfunc({~newDur/256})),
	],inf).play(t)

~newDur=	Pseq([    1, 1, 4, 5, 5 ,    1, 1, 5, 4, 5 ,    1, 1, 5, 5, 4   ,    1, 2, 3, 5, 5   ,    1, 2, 4, 4, 5   ,    1, 2, 4, 5, 4   ,    1, 2, 5, 3, 5   ,    1, 2, 5, 4, 4   ,    1, 2, 5, 5, 3   ,    1, 3, 2, 5, 5   ,    1, 3, 3, 4, 5   ,    1, 3, 3, 5, 4   ,    1, 3, 4, 3, 5   ,    1, 3, 4, 4, 4   ,    1, 3, 4, 5, 3   ,    1, 3, 5, 2, 5   ,    1, 3, 5, 3, 4   ,    1, 3, 5, 4, 3   ,    1, 3, 5, 5, 2   ,    1, 4, 1, 5, 5   ,    1, 4, 2, 4, 5   ,    1, 4, 2, 5, 4   ,    1, 4, 3, 3, 5   ,    1, 4, 3, 4, 4   ,    1, 4, 3, 5, 3   ,    1, 4, 4, 2, 5   ,    1, 4, 4, 3],inf)
