({EnvGen.kr(Env([0,1,1,1,1,0,0,1],
	            [0,0,0,1,0,1,0,0],0,6,0),Trig.kr(1,12))}.plot(duration:12))


Out.kr(~bus14, EnvGen.kr(Env([0,1,1,1,1,0,0,1],
	            [0,0,0,1,0,1,0,0],0,6,0),Trig.kr(1,12)));




({EnvGen.ar(
			Env.perc(0.0121, 0.40),doneAction:2);}.plot(duration:0.4))




({


	EnvGen.ar(
		Env([0,0,0,0,1,1,1,0],[0,0,0,0.7744,0, 0.7744,0,0],6,6,0),Trig.kr(1,5));



}.plot(t,duration:6))
