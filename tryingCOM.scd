

Decay2
s.plotTree


Pbindf(~kick,\out,~kbus).play(t);


(

~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~effctGrp2 = Group.after(~effctGrp);
~revGrp = Group.after(~effctGrp2);
~revGrp2 = Group.after(~revGrp);
~compGrp = Group.after(~revGrp2);

Pbindf(~kick,\out,~kbus).play(t);

Ppar([

Pbind(\instrument, \lead,\dur, Pseq([64/1],1), \gra, 0, \eFreq, [329.63,331.63,334.63,335.63], \subsE, 0,\amp,-23.dbamp,\whichMod,2, \decE, Pseq([64/1],1),\whichEnv,1,\bus4, ~bus2 , \which,1,\out, ~reverbBus3),


Pbind(\instrument,\reverb,\dur,Pseq([64/1],1),\roomsize, 16, \revtime, Pseq([64/1],1)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus3 , \out,~compressBus,\group, ~revGrp,\spread, 1,   \center, 0),





	//Pbind(\instrument,\comp,\dur,Pseq([1/1],64),\atkDb,-25,\crv,-6,\thr,0.4,\dec,/*Pseq([1/1],64) -1*/0.9872 ,\in, ~compressBus,\group, ~compGrp),

	Pbind(\instrument,\comp,\dur,Pseq([1/1],64),\dec,Pseq([1/1],64) ,\thr ,0.6 ,\sB , 1, \sA , 2, \atk , 0.001, \rel ,0.04840

		,\in, ~compressBus ,\in2, ~kbus,\group, ~compGrp),




	Pseq([~bar16],2)



],1).play(t)


)
s.meter
(
Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/12],24),\eFreq,        Pseq([  [329.63 ,326.63 ]    ,1,  [369.63,366.63],  360,  [389.63,386.63],  390,[409.63,406.63],400,400,430,450,450,45,45,380,1      ,450   ,400  ,360,430,   380,  400,400,430,450,450,45,45],inf),\which,2,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/12],24),\bus,~bus12,\bus3,24,\bus4,34,\amp,0.0001	,\subsE,0,\out,~reverbBus),

			Pbind(\instrument,\reverb,\dur,Pseq([1/12],24),\roomsize, 16, \revtime, Pseq([1/12],24)+3, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t)


)


Splay

x.set(\spread, 1,   \center, 0);  // full stereo
x.set(\spread, 0.5, \center, 0);  // less wide
x.set(\spread, 0,   \center, 0);  // mono center
x.set(\spread, 0.5, \center, 0.5);
// spread from center to right
x.set(\spread, 0,   \center, -1); // all left
x.set(\spread, 1,   \center, 0);  // full stereo