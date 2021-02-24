(
~gate.free;
/*~choos = Pbind(\instrument, \choo, \dur,Pseq([4/1],inf), \dec, Pseq([2/1],inf), \val, Pxrand([1,2,3,4],inf), \out, ~choose);


~lfoRise = Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf),\out, ~sineRCtrl,\out2, ~sineSCtrl,\out3, ~sinePCtrl);

~lfoFx = Pbind(\instrument, \lfo3, \dur, Pseq([639/128],inf),\out, ~busRting,);

~lfoFilMod = Pbind(\instrument, \lfo4, \dur, Pseq([2/1],inf),\dec, Pseq([2/1],inf), \filL,Pxrand([~bus4.index,~bus4.index,~bus4.index,~bus4.index,~bus7.index,~bus8.index],inf), \filH,Pxrand([~bus5.index,~bus5.index,~bus5.index,~bus5.index,~bus7.index,~bus8.index],inf),\filB, ~bus12.index,
	\out, ~busFilLMod,  \out2, ~busFilHMod,  \out3, ~busFilBMod, );


~lfoSeqFi = Pbind(\instrument, \lfo, \dur, Pseq([16/1],inf)/*,\dA2,2,*/ ,\out, ~filterCtrl,);*/



/*~lfoLead = Pbind(\instrument, \lfo, \dur,Pseq([4/1],1), \val,2, //Pxrand([0,1,2,3,4],inf)



\dec,Pseq([4/1],inf),	\out2, ~busRting ,\out3, ~busFilLMod,\out4, ~busFilHMod,\out5, ~busFilBMod);*/


/*~lfoRise = Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf),\out, ~sineRCtrl,\out2, ~sineSCtrl,\out3, ~sinePCtrl);*/

/*~busLFis = [~bus4,~bus4,~bus4,~bus4,~bus7,~bus8];
	~busHFis = [~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];*/


~lfoLead =Pbind(\instrument, \lfo, \dur,Pseq([4/1],1), \bus, Pxrand([~filterBus.index, ~filterBus2.index, ~filterRnd.index, ~filterSquelch.index, ~filterMelo.index],inf),\out, ~busRting, \bLP,Pxrand([~bus4.index,~bus4.index,~bus4.index,~bus4.index,~bus7.index,~bus8.index],inf), \bHP,  Pxrand([~bus5.index,~bus5.index,~bus5.index,~bus5.index,~bus7.index,~bus8.index],inf), \bBP, Pxrand([~bus9.index,~bus12.index],inf),



\dec,Pseq([4/1],inf),	\out2, ~busFilLMod,\out3, ~busFilHMod,\out4, ~busFilBMod);



~gate = Pbind(\instrument,\gate, \dur,Pseq([1/4],1),\in, ~gateBus, \atkT,0, \decT,Pseq([1/4],4),\bus1,~bus1,\out,~busRting,\group, ~gateGrp);


)

(


Ppar([

	/*~choos, ~lfoSeqFi, ~lfoRise,~lfoFx, ~lfoFilMod,*/

	~lfoLead,/* ~lfoRise,*/

/*Pseq([
	 Pseq([~gate],64),
Pseq([	Pbindf(~gate,  \dur,Pseq([1/1],1), \decT,Pseq([1/1],1))],1),
 Pseq([~gate],64),
	Pseq([	Pbindf(~gate,  \dur,Pseq([1/3],1), \decT,Pseq([1/3],1))],12),
		 Pseq([~gate],64),
		Pseq([	Pbindf(~gate,  \dur,Pseq([16/1],1), \decT,Pseq([16/1],1))],1),


	],inf),*/





	Pbind(\instrument,\lead,\dur,Pseq([4096/1],1),/*\decE, Pseq([4096/1],1),*/\freq,659.26, /*,\which,     ~filterCtrl,*/



/*		\busHP,~bus5,\bus7,~bus6,*/
/*		\busHP,~busFilHMod,\bus7,~bus6,*/

		/*\factor3,~fac3.(),*/

	/*	\sineRangeLow,(-10.4),\sineRate,0.01005859375,\phRise,(15),*/  //   ~filterCtrl

		/*\busLP, ~bus4, \busBP, ~bus9 ,*/


/*		\busLP, ~bus4, \busBP, ~busFilBMod ,*/

		\out,0),//,\group,~leadGrp), //~gateBus



	/*Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([1024/1],1)
	/*,\thr,  0.1*/

		,\gain,74,\group,~limitGrp,\out,0),
*/



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