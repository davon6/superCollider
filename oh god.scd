Synth(\lead , [\freq, 76.midicps, \timeSca,4  ]);

t = TempoClock.new(151.703592/60).permanent_(true);



~aa = Ppar([Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484)]);
~aaa = Ppar([Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936)]);

~song = Pseq([~aa,~aaa],1).play(t, quant:4);


)

(
~aa = Pbind(\instrument,\lead, \dur,Pseq([1/16], 128),\decE,0.0484,\freq, 76.midicps);
~aaa = Pbind(\instrument,\lead, \dur,Pseq([1/4], 32),\decE,0.1936,\freq, 76.midicps);

~song = Pseq([~aa,~aaa],1).play(t);


)


 Pseq([Pbind(\instrument,\lead, \dur,Pseq([1/16], 128),\decE,0.0484,\freq, 76.midicps),Pbind(\instrument,\lead, \dur,Pseq([1/4], 32),\decE,0.1936,\freq, 76.midicps)],1).play(t, quant:4);




~aaa = Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936);



~aa = Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484);


~aa = Ppar([Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484)]);
~aaa = Ppar([Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936)]);




~song = Pseq([~aaa],1).play();

(
Routine.new({
	~aa =Ppar([Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484,\gate,0)]);
	8.5.wait;
	~aaa =Ppar([Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936,)]);
}).play;

)


(
Pseq([
	Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484),





	Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936)]).play


)





l.stop

Pdef(\e,Pbind(\instrument,\lead,\pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,520,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740], 1024), \dur,Pseq([1/16], 1024),\decE,0.0484,\freq, 76.midicps,\amp,0.03)).play( quant: 4);


(
Routine.new({
	~aa =Pbindef(\l, \dur,Pseq([1/16], 128),\decE,0.0484,\gate,0);
	8.5.wait;
	~aaa =Pbindef(\l, \dur,Pseq([1/4], 32),\decE,0.1936,);
}).play;

)






o



Pdef(\x,Pbind(\instrument,\lead, \dur,Pseq([1/16], 1024),\decE,0.0484,\freq, 76.midicps,\amp,0.03,\pitch,0,\sRteLPF,3.1)).play( quant:4);





Pdef(\x,Pbind(\instrument,\lead, \dur,Pseq([1/16], 1024),\decE,0.0484,\freq, 76.midicps,\amp,0.03,\pitch,0,\sRteLPF,3.1)).play( quant:4);



Pdef(\z,Pbind(\instrument,\lead, \dur,Pseq([1/1], 64),\decE,1,\freq, 76.midicps,\amp,0.03,\sRteLPF,3.1)).play( quant:4);




/*god*/
~song = Pseq([ Pdef(\x).postln, Pdef(\y),Pdef(\z),Pdef(\a),Pdef(\b),Pdef(\c),Pdef(\d),Pdef(\e)],inf).play( quant:4);





~song.stop

(//this annd FOR FINAL MODUL

Pdef(\x,Pbind(\instrument,\lead, \dur,Pseq([1/16], 16),\decE,0.0484,\freq, 76.midicps,\amp,0.03,\pitch,0,\sRteLPF,3.1));
Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([1/4], 4),\decE,0.1936,\freq, 76.midicps,\amp,0.03,\sRteLPF,0));
Pdef(\z,Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),\decE,1,\freq, 76.midicps,\amp,0.03));
Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([1/16], 72),\decE,0.0484,\freq, 76.midicps,\amp,0.03),\pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,520,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720], 72));
Pdef(\b,Pbind(\instrument,\lead, \dur,Pseq([1/4], 4),\decE,0.1936,\freq, 76.midicps,\amp,0.03,\pitch, 0));
Pdef(\c,Pbind(\instrument,\lead, \dur,Pseq([1/16], 16),\decE,0.0484,\freq, 76.midicps,\amp,0.03));
Pdef(\d,Pbind(\instrument,\lead, \dur,Pseq([1/1], 1),\decE,1,\freq, 76.midicps,\amp,0.03));
Pdef(\e,Pbind(\instrument,\lead, \dur,Pseq([1/16], 36),\decE,0.0484,\freq, 76.midicps,\amp,0.03,\pitch,Pseq([10.3,20,30,40,50,60,70,80,90,10,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360], 36)));


)

//VarLag
///newer


Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 76.midicps,\dure,8/1));//0.5
//Pdef(\z,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 56.midicps, \timeSca, 0.5,\dure,8/1));
Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, (76.midicps), \dure,8/1));//1

//Pdef(\a,Pbind(\instrument,\lead, \dur,Pseq([16/1],1 ),\freq, 88.midicps, \dure,8/1));//1

~song = Pseq([  Pdef(\y),Pdef(\a)],inf).play(t);


//~song = Pseq([  Pdef(\y),Pdef(\z),Pdef(\a)],inf).play(t);

/*working befroe bed*/

Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([2/1],1 ),\freq, 76.midicps,\amp,0.02, \timeSca, 2));//0.5



Pdef(\z,Pbind(\instrument,\lead, \dur,Pseq([4/1],1 ),\freq, 76.midicps,\amp,0.02, \timeSca, 4));//1



~song = Pseq([  Pdef(\y),Pdef(\z)],inf).play(t);

s.plotTree


varLag


Pdef(\y,Pbind(\instrument,\lead, \gate,0));


Pdef(\y,Pbind(\instrument,\lead, \gate,0));


Synth(\)



Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([1/16],1 ),\decE,0.1936,\freq, 76.midicps,\amp,0.03, \timeSca, 0.5)).play;


Pdef(\y,Pbind(\instrument,\lead, \dur,Pseq([64/1],1 ),\decE,0.1936,\freq, 76.midicps,\amp,0.03,\sRteLPF,5, \timeSca, 128)).play;






x = Synth(\lead);


x.set(\gate,0);
















q = Pdef(\p).play(t);
d = Pdef(\d).play(t);
~aaa = Pbind(\instrument,\lead, \dur,Pseq([1/4], 32),\decE,0.1936,\freq, 76.midicps);

	