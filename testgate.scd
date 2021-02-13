(
~gate.free;
~gate = Pbind(\instrument,\gate, \dur,Pseq([1/4],1),\in, ~gateBus, \atkT,0, \decT,Pseq([1/4],4),\bus1,~bus1,\group, ~gateGrp);


~counter = Pbind(\instrument, \shap, \dur, Pseq([1024/1],1), \out2, ~filterCtrl,)
)
(
/*~leadGrp = Group.new;

~gateGrp =  Group.after(~leadGrp);*/





Ppar([

Pseq([
	 Pseq([~gate],64),
Pseq([	Pbindf(~gate,  \dur,Pseq([1/1],1), \decT,Pseq([1/1],1))],1),

	Pseq([	Pbindf(~gate,  \dur,Pseq([1/3],1), \decT,Pseq([1/3],1))],12),


	],inf),

	Pbind(\instrument,\lead,\dur,Pseq([1024/1],1),\decE, Pseq([1024/1],1),\freq,659.26 ,\which,2 ,\busHP,~bus5,\bus7,~bus6,\out,~gateBus,\group,~leadGrp),
/*Pseq([~gate],inf)*/




],1).play(t);

)





Ppar([


	~counter,

Pseq([
	 Pseq([~gate],64),
	Pseq([	Pbindf(~gate,  \dur,Pseq([1/1],1), \decT,Pseq([1/1],1))],1),

	Pseq([	Pbindf(~gate,  \dur,Pseq([1/3],1), \decT,Pseq([1/3],1))],12),


	],inf),

	Pbind(\instrument,\lead,\dur,Pseq([1024/1],1),\decE, Pseq([1024/1],1),\freq,659.26 ,\which,/*~filterCtrl*/ 2,
	\busLP, ~bus4, \busHP, ~bus5, \busBP, ~bus9 , \bus7,~bus6,\out,~gateBus,\group,~leadGrp),
/*Pseq([~gate],inf)*/




],1).play(t);








(

Pbind(\instrument,\lead,

	\dur,Pseq([4/16],160),

	\decE, Pseq([4/16],160),

	\bus2,~bus1,

	\subsE,0,


	\freq,659.26 ,\which,2 ,\bus,~bus5,\bus7,~bus6,\out,0 ).play(t);



)