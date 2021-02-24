(
SynthDef(\kick,{
	arg amp = 0.002;

var sig;

	sig = SinOsc.ar(

/*

	EnvGen.ar(Env([0,6645,1319,165,26],
	            [0,0.01,0.005,0.01,0.04],
	            [0,-4  ,-3  ,-2,0]*/



		EnvGen.ar(Env([0,6645  ,1319  ,165  ,26],
	                  [0,0.000005,0.05,0.1,0.04],
	                  [0,-4 ,-5    ,-2.6   ,0]
)//.plot

		,doneAction:2),

		mul:EnvGen.ar(Env([0,1     ,0.16 ,0.95,0.93],
	                      [0,0.0135,0.005,0.02,0.0065,0],
	                      [0,-4    ,-3  ,1    ,4]


)
	)	)*amp






		!2;
Out.ar(0, sig);
}).add;)

Synth(\kick,[\amp,1]);

( Pdef(\k,Pbind(\instrument, \kick,\dur, Pseq([1/1], 1024),\amp,1)).play(t))
//amp
({	EnvGen.ar(Env([0,1   ,0.16 ,0.95,0.93,0],
	              [0,0.014,0.005,0.02,0.0065,0],
	              [0,-4  ,-3  ,1,4]
))
}.plot(duration:0.06))





//key

({	EnvGen.ar(Env([0,6645 ,1319 ,165 ,26],
	              [0,0.0005,0.005,0.001,0.04],
	              [0,-3.4   ,-3   ,-2  ,0]
)


)}.plot(duration:0.02))