






{Saw.ar(41.2,-1,-0.4).lincurve(-1,1,-1,-4)*0.2!2}.scope;



151.703592/60

2.5283932 bps

1000/2.5283932

395.50810372374/4


//0.3872       0.0968
(

SynthDef(\bass,{
	arg freq = 41.2,dure =1;
	var sig, env, envF;


	//env = EnvGen.kr(Env( [0,1,0.2,0,0,0],[0,0,0.098877025930935,0,0,0],[0,0,-3,0,0,0],releaseNode:3,loopNode:1),gate:Trig.kr( 1,dur:16/1),doneAction:2);

	envF = EnvGen.kr(Env( [0,2000,2000,8,0,0],[0,0,0.098877025930935,0,0,0],[0,0,-1,0,0,0],releaseNode:3,loopNode:1),gate:Trig.kr( 1,dur:dure),doneAction:2);



	sig =LPF.ar(LPF.ar(Saw.ar(freq,-1,-0.4).lincurve(-1,1,-1,-4), envF),81.4);//*env;


	Out.ar(0, sig*0.2!2);
}).add;)



Synth(\bass)


({ EnvGen.kr(Env( [0,1,0.2,0,0,0],[0,0,0.3872,0,0,0],[0,0,-3,0,0,0],releaseNode:3,loopNode:1),gate:Trig.kr( 1,dur:2/1),doneAction:2)}.plot(duration:3))



({ EnvGen.kr(Env( [0,2000,2000,8,0,0],[0,0,0.098877025930935,0,0,0],[0,0,-1,0,0,0],releaseNode:3,loopNode:1),gate:Trig.kr( 1,dur:16/1),doneAction:2);       }.plot(duration:3))