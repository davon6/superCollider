(
~gate.free;
~gate = Pbind(\instrument,\gate, \dur,Pseq([1/4],1),\in, ~gateBus, \atkT,0, \decT,Pseq([1/4],4),\bus1,~bus1,\out,~limitFuzz,\group, ~gateGrp);


~lfoSeqFi = Pbind(\instrument, \lfo, \dur, Pseq([16/1],inf)/*,\dA2,2,*/ ,\out, ~filterCtrl,);


~lfoRise = Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf),\out, ~sineRCtrl,\out2, ~sineSCtrl,\out3, ~sinePCtrl)

)
(
/*~leadGrp = Group.new;

~gateGrp =  Group.after(~leadGrp);*/


// ~counter.play(t)


Ppar([

	~lfoSeqFi, ~lfoRise,

Pseq([
	 Pseq([~gate],64),
Pseq([	Pbindf(~gate,  \dur,Pseq([1/1],1), \decT,Pseq([1/1],1))],1),
 Pseq([~gate],64),
	Pseq([	Pbindf(~gate,  \dur,Pseq([1/3],1), \decT,Pseq([1/3],1))],12),
		 Pseq([~gate],64),
		Pseq([	Pbindf(~gate,  \dur,Pseq([16/1],1), \decT,Pseq([16/1],1))],1),


	],inf),

	Pbind(\instrument,\lead,\dur,Pseq([4096/1],1),\decE, Pseq([4096/1],1),\freq,659.26 ,\which,~filterCtrl,\busHP,~bus5,\bus7,~bus6,\factor3,~fac3.(),

	/*	\sineRangeLow,(-10.4),\sineRate,0.01005859375,\phRise,(15),*/

		\busLP, ~bus4, \busBP, ~bus9 ,

		\out,~gateBus,\group,~leadGrp), //~gateBus



	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1)
	/*,\thr,  0.1*/

		,\gain,74,\group,~limitGrp,\out,0),




],1).play(t);

)

Pbindef(\blast, \sineRangeLow,(-10.4),\sineRate,0.01005859375,\phRise,(15))

Pbindef(\blast, \sineRate , 0.0000000095262251, \sineRangeLow,0,\phRise,0)







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