(
{
    EnvGen.kr(
        Env([0, 1, 0, 0.2, 0, 0.5, 0.8, 0], [0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01], releaseNode: 5, loopNode: 1),
        gate: Trig.kr(2, 0.9)
    );
}.plot(duration: 1)
)






(
{
    EnvGen.kr(
		Env([0,1,0, 1, 0, 1, 0, 0.5, 0.8, 0], [[1/16], [1/16], [1/16], [1/16], [1/16], [1/16], [1/16]], releaseNode: 5, loopNode: 1),timeScale:0.1
    );
}.plot(duration: 1)
)


o = Env(	[1,1,0,0], [1/4],[0,-1,0,0],releaseNode: 5, loopNode: 1);



o




(
{


    EnvGen.kr(

		Env(

			[1,1,0,0,1,1,0,0], [[1/4],[1/4]],[0,-1,0,0,0,-1,0,0],releaseNode: 5, loopNode: 1


		),timeScale:0.1


)}.plot(duration: 1))






(
{


    EnvGen.kr(

		Env(

			[1,1,0,0,1,1,0,0],
			[[1/4],0,[1/4],0],
			[0,-1,0,0,0,0,0,0],
			//		[0,-1,0,0,0,-1,0,0],

			releaseNode: 5, loopNode: 1


		),timeScale:1


)}.plot(duration: 1))






//immacule 1/16
(
{


    EnvGen.kr(

		Env(

			[1,1,0,0,1,1,0,0],
			[[1/16],0,[1/16],0],
			[0,0,0,0,0,0,0,0],
			//		[0,-1,0,0,0,-1,0,0],

			releaseNode: 5, loopNode: 1


		),timeScale:1


)}.plot(duration: 1))





//back up
(
{


    EnvGen.kr(

		Env(

			[1     ,1  ,0,0     ,1  ,1,0,0],
			[[1/16],0.2,0,[1/16],0.2,0],
			[0,-1,0,0,0,0,0,0],
			//		[0,-1,0,0,0,-1,0,0],

			releaseNode: 3, loopNode: 1


		),timeScale:1


)}.plot(duration: 1))





(
{


    EnvGen.kr(

		Env(

			[1,1,1,0,1,1,0,0],
			[[1/16],0,[1/16],0],
			[0,0,-16,0,0,0,0,0],
			//		[0,-1,0,0,0,-1,0,0],

			releaseNode: 5, loopNode: 1


		),timeScale:1


)}.plot(duration: 1))







