/*~pseq = {~pp = Pseq([1/4],16);~pp};*/

(
~gate.free;
~gate = Pbind(\instrument,\gate, \dur,Pseq([1/4],1),\in, ~gateBus, \atkT,0, \decT,Pseq([1/4],4),\bus1,~bus1,\out,~limitFuzz,\group, ~gateGrp);


/*~counter = Pbind(\instrument, \lfo, \dur, Pseq([16/1],inf),\dA2,2, \out, ~filterCtrl,)*/


~lfoSeqFi = Pbind(\instrument, \lfo, \dur, Pseq([16/1],inf)/*,\dA2,2,*/ ,\out, ~filterCtrl,);


~lfoRise = Pbind(\instrument, \lfo2, \dur, Pseq([16/1],inf),\out, ~sineRCtrl,\out2, ~sineSCtrl,\out3, ~sinePCtrl)
)


(
Ppar([


		/*~counter,*/	~lfoSeqFi, ~lfoRise,

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

		,\gain,124,\group,~limitGrp,\out,0),


/*
	Pseq([
	Pseq([

/*	Pseq([Pbindf(~bass,\dur,Pseq([1/4],1))],63 ),//15
		Pbind(\instrument, \wNoise,\dur, Pseq([1/4],1),\atk,Pseq([1/4],1),\amp,(-20),\out, ~limitNonRec2,\group, ~micGrp)
],4),*/

			Pseq([Pbindf(~bassRest,\dur,Pseq([1/1],1))],7 ),//15
		Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\atk,Pseq([1/2],1),\amp,(-20),\out, 0),



],3),
	Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\atk, Pseq([1/1], 1),\amp,(-23),\out, 0,)

],4),



Pseq([

		Pbindf(~inst.(), \dur,Pseq([4/1],1),\decE,Pseq([4/1],1)),
		Pbindf(~inst.(), \dur,~pseq.(~ins,False),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),


		Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~bassRest, \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
		].scramble,~dur.()),



Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~bassRest, \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
		].scramble,~dur.()),






Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
].scramble,~dur.()),Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),

Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),


].scramble,~dur.()),


				Pbindf(~inst.(), \dur,Pseq([4/1],1),\decE,Pseq([4/1],1)),
		Pbindf(~inst.(), \dur,~pseq.(~ins,True),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),


		Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~bassRest, \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
		].scramble,~dur.()),



Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~bassRest, \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
		].scramble,~dur.()),






Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),







//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
].scramble,~dur.()),Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),

Pseq([
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
	Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(~ins),\decE,~pp),


].scramble,~dur.())




	],inf),*/

	Pseq([~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],

		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],


		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],

		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],





		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],

		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],


		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],

		~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],~toUse[0.rrand(~toUse.size,1)],



	],inf),
],1).play(t,quant:1)


)

~toUse[0.rrand(~toUse.size,1)].play(t,quant:1)