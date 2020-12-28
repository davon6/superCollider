{(


	EnvGen.kr(
        Env(
		levels:[0,1, 1 ,1,0,0  ],
		times: [0,0,0.3,0.1,0,0  ],
            curve: 0,releaseNode:4,loopNode:1
        ),

		gate: Trig.kr( 1,dur:4)







		)//doneAction:0,timeScale:1;

)}.plot(t,duration: 4)

