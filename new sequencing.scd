(	Pseq([
		~specialHits[1],Ppar([~specialHits[2],
		Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\dec, Pseq([1/1], 1),\amp,(-20),\out, ~reverbBus2,)   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus2,\group,~revGrp2,\out,~limitNonRec,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
	)],1),~specialHits[3]     ,~specialHits[0] ,

~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],
	~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],

	~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],
	~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],
	~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],
	~perc[7.rrand(28,1)],~perc[7.rrand(28,1)],








/*	,~specialHits[3]     ],1),~specialHits[0]  ],1),~arrSpecialKB[~boo[~ind]], Pseq([~perc[5.rrand(12,1)]],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~perc[5.rrand(12,1)]],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~perc[5.rrand(12,1)]],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~perc[5.rrand(12,1)],~perc[5.rrand(12,1)]],1) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+11]]


	, Pseq([~perc[5]],3),~half16
	*/





],1).play(t,quant:0)

	)