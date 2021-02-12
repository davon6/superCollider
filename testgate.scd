
~gate.free
~gate = Pbind(\instrument,\gate, \dur,Pseq([1/4],1),\in, ~gateBus, \atkT,0, \decT,Pseq([1/4],4),\bus1,~bus1,\group, ~gateGrp);

(
/*~leadGrp = Group.new;

~gateGrp =  Group.after(~leadGrp);*/




Ppar([


Pseq([~gate],inf),
	/*Pbindf(*/
	Pbind(\instrument,\lead,\dur,Pseq([1024/1],1),\decE, Pseq([1024/1],1),\freq,659.26 ,\which,2 ,\bus,~bus5,\bus7,~bus6,\out,~gateBus,\group,~leadGrp),
/*Pseq([~gate],inf)*/




],1).play(t);

)








(

Pbind(\instrument,\lead,

	\dur,Pseq([4/16],160),

	\decE, Pseq([4/16],160),

	\bus2,~bus1,

	\subsE,0,


	\freq,659.26 ,\which,2 ,\bus,~bus5,\bus7,~bus6,\out,0 ).play(t);



)