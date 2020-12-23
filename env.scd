

s.boot;

(

{


var env;
//E

env = EnvGen.ar(
		Env.new(
	[20.60,2637.02,164.81,659.25,5274.04],
	[1,2.5,10,3],
	[0,0,0,0]
	)//.plot

);



	SinOsc.ar(env, 0, 0.5);






}.play;

)

{ SinOsc.ar(200, 0, 0.5) }.play;

