s.boot;


(

x={

	arg t_gate =1;


	var sig, env;

	env = EnvGen.kr(Env.new(
		[0,1,0.2,0],
		[0.5,1,2],
		[3,-3,0]),t_gate);

	sig = Pulse.ar(LFPulse.kr(8).range(600,900)) * env;
}.play;
)




x.set(\t_gate,1);


(

x={

	arg t_gate =1;


	var sig, env;

	env = EnvGen.kr(Env.new(
		[1,1,0],
		[0.01,0.4],
		[3,-3]),t_gate);

	sig = Pulse.ar(432) * env;
}.play;
)




x.set(\t_gate,1);






(

{

	arg gate =1;


	var sig, env;

	env = EnvGen.kr(Env.new(
		[1,1,0],
		[0.01,0.4],
		[3,-3]),gate);

	sig = Pulse.ar(432) * env;
}.play)



Pdef(\y,Pbind(\instrument,\lead, \decE,0.1936,\freq, 76.midicps,\amp,0.03, \timeSca, 0.25)).play;







/*working befroe bed*/

Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([2/1],1 ),\freq, 76.midicps,\amp,0.02, \timeSca, 2));//0.5



Pdef(\z,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 76.midicps,\amp,0.02, \timeSca, 4));//1



~song = Pseq([  Pdef(\y),Pdef(\z)],inf).play(t);




//    //
//try here


Pdef(\h,Pbind(\instrument,\xmas,\dur,Pseq([2/1],1  )));




//mouais

Pbind(\instrument,\xmas,\dur,Pseq([4/1],1  )) .play(t);//0.5







Pdef(\y,Pbind(\instrument,\xmas,\dur,1  )).play(t);//0.5

s.plotTree




Synth(\xmas,[ \dure, 0.25] );

Synth(\xmas,[ \dure, 0.0625] );




   Env(
	levels:[1/16 ,1/16  ,1/16  ,1/4 ,1/4 ,1/4,1/16 ,1/16  ,1/16  ,1/4 ,1/4 ,1/4 ],
            times: [0, 1/2   ,  0   ,0   ,1/2 ,0,0, 1/2   ,  0   ,0   ,1/2 ,0   ],


	   ).plot




Env(
	levels:[1/16 ,1/16  ,1/16  ,1/4 ,1/4 ,1/4 ,         1/16 ,1/16  ,1/16  ,1/4 ,1/4 ,1/4       ],
            times: [0, 1/2   ,  0   ,0 ,1/2  ,0 ,0      ,    0, 1/2   ,  0   ,0 ,1/2  ,0 ,0     ],
).plot



Env(
	levels:[1/16 ,1/16  ,1/4 ,1/4  ,1/16 ,1/16  ,1/4 ,1/4         ,1/8,1/8,1/8,1/8 ,1/8,1/8,1/4     ],
            times: [ 1/2   ,  0   ,1/2 , 0, 1/2   ,  0   ,1/2 , 0  ,1/2 , 0    ,1/2 , 0   ,1/1 , 0                ],
).plot()


Env(
	levels:[ 0,0, 0.2,1    ,  1  ,1 , 1  ,1 ,0 ,0],
	times:[  0,0, 1/4,0   ,  3/4 ,0,8/4 ,0 ,1/1 ,0],
	curve:[2]
	).plot

Synth(\xmas );
Done

Pbind(\instrument,\xmas,\dur,Pseq([16/1],1  )) .play(t);//0.5




  Env(
levels:[ 0,0,      0.08,0.08,0   ,0,0  , 0,0   ,0.08 ,0.08, 0  ,0 , 0.08  ,0.08 ,0 ,0,0,0.08,0.08,0,0.08,0.08],
	times:[0,0,     1/4,0   , 3/4,0,8/4,0 ,1/1 ,0    ,0   ,15/4 ,0,    1/4  ,1/4 ,0  ,15/4,0,0,1/4,0,15/4,0]).plot

(

SynthDef(\xmas, {

	arg t_gate =1, imp =90, dure=0.0625,duri= 0.25, doAc =0;



	var sig, env ,du, sqr, rate,atk;
	du = 1/16;

	//sqr = Pulse.kr(1/2).range(dure, duri);
/*dur must be 1*/
	rate =
	 EnvGen.kr(
        Env(
//	levels:  [0.0625,0.25,0.25],
   //         times: [16,0,16],
		//levels:        [0.0625,0.0625,0.25,0.25,0.25],
          //  times: [1/1    ,  0,0, 1/1,0   0,1/1],
	//		levels:[0.0625,0.0625,0.25,0.25,0.25 ],
      //      times: [1/2   ,  0   ,0   ,1/2 ,0   ],

	//levels:[1/16 ,1/16  ,1/4 ,1/4  ,1/16 ,1/16  ,1/4 ,1/4        ],
    //        times: [ 1/2   ,  0   ,1/2 , 0, 1/2   ,  0   ,1/2 , 0      ],


	levels:[0,0,1/16 ,1/16  ,1/4 ,1/4  ,1/16 ,1/16  ,1/4 ,1/4         ,1/8,1/8,1/8,1/8 ,1/8,1/8,1/4,1/4       ],
            times: [0,0, 1/2   ,  0   ,1/2 , 0, 1/2   ,  0   ,1/2 , 0  ,1/2 , 0    ,1/2 , 0   ,1/2 , 0    ,1/2 , 0                ],

 releaseNode: 16, loopNode: 0


	   ),doneAction:2,
		//gate: Trig.kr( Impulse.kr(90),dur:4),doneAction:2;
		gate: Trig.kr(1, 17.9)

    );

atk =

	EnvGen.kr(
        Env(

			/* pretty cool
levels:[ 0,0, 0.08,0.08,0   ,  0  ,0 , 0  ,0 ,0.08 ,0.08],
	times:[  0,0, 1/8,0   ,  7/8 ,0,8/4 ,0 ,1/1 ,0])    */



levels:[ 0,0,      0.08,0.08,0   ,0,0  , 0,0   ,0.0 ,0.08, 0  ,0 , 0.08  ,0.08 ,0 ,0,0,0.08,0.08,0,0.08,0.08],
	times:[0,0,     1/4,0   , 3/4,0,8/4,0 ,1/1 ,0    ,0   ,15/4 ,0,    1/4  ,1/4 ,0  ,15/4,0,0,1/4,0,15/4,0])




			 ,doneAction:2,
		gate: Trig.kr( Impulse.kr(90),dur:4),doneAction:2;
	);


	env =

	   EnvGen.kr(
        Env(
			levels:  [0,1,0],//SinOsc.kr(1.3).range(0,1)],
            times: [0.01,0.4],
            curve: 0,releaseNode:2
        ),
		//gate: Trig.kr( Impulse.kr(90),dur:1/16),doneAction:0;
		gate: Trig.kr( Impulse.kr(imp),dur:rate),doneAction:0,timeScale:1;
	);


	//Line.kr(0,2,10)

	//Line.kr(0,3,1)

	/*EnvGen.kr(Env.new(
		[1,1,0],
		[0.01,0.4],
		[3,-3]),t_gate);*/

	sig = Pulse.ar(432) * env*0.1;
	Out.ar(0, sig!2);
}
).add;)

d = 1/
// to keep Line.kr(0,2,4/16)
(
(
Pbindef(\l,
		\instrument, \xmas,
	\dur, 4
);




).play(t);)

Pbindef(\l).play(t)


s.freeAll

Pbindef(\l,\dure,4);



Pbindef(\l,\doAc,4);














(
{
    EnvGen.kr(
        Env(
            levels: [0, 0.1, 0.2, 0.3],
            times: [0.1, 0.1, 0.1],
            curve: 8
        ),
		gate: Impulse.kr(4)
    );
  }.plot(duration: 1);
)
