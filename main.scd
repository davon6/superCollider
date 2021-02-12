/*~pseq = {~pp = Pseq([1/4],16);~pp};*/




(
Ppar([



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




	],inf),

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