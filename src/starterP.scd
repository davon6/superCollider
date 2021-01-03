Synth(\lead , [\freq, 76.midicps  ]);


t = TempoClock.new(151.703592/60).permanent_(true);



Pbindef(\l,\freq, 100.midicps,);

(

Pdef(\l,
	Pbind(
		\instrument, \lead,
		\dur, Pseq([4/1], 1),
		\dure, 16/1,
		\freq, 76.midicps,
		\sRteLPF, 0.65




	)
	);

)


Pbindef(\l,\freq, 76.midicps);

l = Pdef(\l).play(t);

l.stop;


s.defaultGroup.deepFree;




(

Pdef(\l,
	Pbind(
		\instrument, \lead,
		\dur, Pseq([1/16], inf),
		\freq, 76.midicps,
		//\amp,Pseq([0.2,0,0.2,0 ],inf)
		//	\sineRate,0.01005859375,
		//\sineRange, [-10.4,10.4]



	)
	);

)


(

Pdef(\l,
	Pbind(
		\instrument, \lead,
		\dur, Pseq([32/1], inf),
		\freq, 76.midicps,
		//\amp,Pseq([0.2,0,0.2,0 ],inf)
		\atkE,10,



	)
	);

)





(
/*very important*/
Pdef(\l,
	Pbind(
		\instrument, \lead,
		\dur, Pseq([/1], inf),
		\freq, 76.midicps,
		//\amp,Pseq([0.2,0,0.2,0 ],inf)
		\atkE,200,
		\sineRate,0.01005859375,
		\sineRange, [-10.4,10.4]



	)
	);

)

s.plotTree


Pbindef(\l,\sineRate,0.01005859375,\sineRange, [-10.4,10.4],\gate,0,\decE,8,\dur,Pseq([8/1], inf));


(


//var  obj = SinOsc.kr(0.01005859375).range(-10.4,10.4);


/*  marche*/

Pbindef(\l,
		\instrument, \lead,
		\dur, Pseq([1/4], inf),
		\freq, 76.midicps,
	\gate,0,
		//\amp,Pseq([0.2,0,0.2,0 ],inf)
		//\atkE,20,
		//\extraMod,obj
	\decE,0.1936,
	\sineRange, 0,
	\sineRate,0.0000000095262251,
	\pitch, 0,



	);


)



Pbindef(\l,\sineRate,0.0000000095262251,\sineRange, 0,);

Pbindef(\l,\decE,0.0968,\gate,0,);
Pbindef(\l,\decE,0.0484);

Pbindef(\l,\decE,0.1936,\gate,0,);

Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484,\gate,0,\freq, 76.midicps);
Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936,);
Pbindef(\l, \dur,Pseq([1/1], 1));




~song = Pseq([
	Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484, \pitch,0),
	Pbindef(\l, \pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,520,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740], 74)),
Pbindef(\l, \dur,Pseq([1/4], 4),\decE,0.1936,\pitch,0);

	,inf]).play();




Pbindef(\l,\sineRate,0.01005859375,\sineRange, [-10.4,10.4]);

Pbindef(\l, \dur,Pseq([8/1], inf),\decE,8,);

Pbindef(\l, \dur,Pseq([16/8], inf),\decE,8,\pitch,0,\gate,0,);


Pbindef(\l, \pitch,Pseq([10.3,20.6,41.2,82.4, 164.81, 329.63,659.25, 1318.51,2637.02], inf));

Pbindef(\l, \pitch,0 );

Pbindef(\l, \pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360], inf));

Pbindef(\l, \pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,520,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740], inf));

Pbindef(\l, \pitch,Pseq([f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.(),f.()], inf));





/*math function*/
v = 1;

~beat = { ~beat =  60/151.703592};
~beat.()

~beat

f = { v =  v + v; };
f.()
v;


Routine


//\sineRate,0.01005859375,
		//\sineRange, [-10.4,10.4]


Pbindef(\l).play

l.stop;
s.freeAll

s.defaultGroup.deepFree;

Pseq(\dur,Pseq([32/1], inf));
//Pseq(\dur,Pseq([32/1], inf));

Pdefn(\lead_dur,Pseq([1/4], inf));

Pseq(\dur,Pseq([1/4], inf));

Buffer.freeAll
s.freeAll



s.plotTree;

//alooo

l = Pdef(\l).play(t);





Pdef(\d,

	Pbind(
	\instrument,\percu2,
		\dur, Pseq([1/4], inf),
	\carHz,164.81, //Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	\modHz,164.81,//Pseq([164.81,164.81,164.81,164.81,164.81,164.81,164.81,164.81],inf),
	//\modAmp, rrand(0, 10000).postln,
	\atk, 0,
	\rel,0.04840,
	\rel2,0.02420
	//\rel,2,

	));