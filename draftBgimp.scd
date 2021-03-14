b = Buffer.alloc(s, 44100 * 2, 2);

SynthDef("help-PingPong", { |out = 0, bufnum = 0|
    var left;
    left = Decay2.ar(Impulse.ar(0.7, 0.25), 0.01, 0.25,
        SinOsc.ar(SinOsc.kr(3.7,0,200,500)));



    Out.ar(out,
        PingPong.ar(bufnum, [left, left] *  EnvGen.kr(Env([1, 1, 0], [2, 0.1])),
            0.1, 0.8, 1)
    )
}).play(s, [\out, 0, \bufnum, b.bufnum]);




SynthDef(\playBuf ,{|out = 0,start, trig, dur, buf, dA=2|Out.ar(out,PlayBuf.ar(2,~bufBg/*buf*/,trigger:
		0.002/*Dust.kr(4.0)*/,startPos: start,loop: 1/*,doneAction: dA*/)/** EnvGen.kr(Env([0,1,1,0],[0,dur,0]))*/);}).play;

Ppar([~kick,~bass],inf).play(t);




Synth(\playBuf2,  [  \buf,~bufBg , \out, ~bgFil22    ]);


Ppar([

	Pseq([Pbindf(~kick,\out,~kbus)],inf),
	Pbind(\instrument, \lfo13,\val,~hzQbeat/4,\out,~bus2 ,\dur,999,\ph,0, \rL,400,\rH,4000, \group, ~lfoGrp),

	Pbind(\instrument, \lfo13,\val,~hzQbeat,\out,~bus10 ,\dur,999,\ph,0, \rL,(-0.8),\rH,0.8, \group, ~lfoGrp),

	Pbind(\instrument, \filterS, \dur, inf,\in,~bgFil22, \busMod,~bus2, \qf, ~bus1,\which,0,\out,~bgCom2,\group,~filterGrp ),



	Pbind(\instrument,\compS, \dur,inf,\thr,0.8 ,\sB, 1.2,\sA, 1/2,\atk ,0.01, \rel ,0.0968
		,\gain,1,\in, ~bgCom2 ,\ctrl, ~kbus, \out,~bgStereo2,\group,~compGrp ),


	Pbind(\instrument,  \stereoS2, \in,~bgStereo2,  \out, ~eqBg10, \modPan,~bus10 ,  \center, 0.1 ,\dur,9999, \group, ~stereoGrp),


	Pbind(\instrument, \EQHP10,  \dur, inf, \in, ~eqBg10, \out,~bgLimit2,\group,~eqGrp2),

		Pbind(\instrument,  \limiterS, \dur, inf, \in,~bgLimit2 ,\out,0, \gain, 20,\group, ~finalDispatchGrp   ),




			Pbind(\instrument, \dispatch2, \dur, Pseq([16/1],1),\in,~bgBus2,\out,0,\group, ~limitGrp2)
],1).play(t)





	Pbind(\instrument, \EQHP10,  \dur, inf, \in,  \out, \group,

	Pbind(\instrument,  \limiterS, \dur, inf, \in,  \out, \group,

Pbind(\instrument, \dispatch2, \dur, Pseq([16/1],1),\in,~bgBus2,\out,0 )



			~bgFil22
	~bgCom2
	~bgLimit2
	~bgBus2
	~bgStereo2
	~bgStereo2
	~eqBg10



~bufBg.play



Pbind(\instrument,\gran,\dur,


		Pseq([  Pseq([1/4],16)    ,  Pseq([1/16],64),Pseq([1/64],64)],inf),

		\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0).play