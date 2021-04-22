~snare = Pbind(\instrument, \snare,\carHz, 41.2 ,\type, Pseq([\rest ,\rest,\note,\rest], 8),\atk, 0.00502929687,\rel, 0.0968,\rel2, 0.3872,\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,~snareEQ, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),\da1,0);





Pbindf(~snare ,\dur, Pseq([1/2], 128)).play(t)
Pbindf(~snare ,\da1,0,\type, Pseq([\rest ,\rest,\note,\rest], 32),\out,0).play(t)
Pbindf(~snare ,\da1,0,\rel2, 0.7744,\dur, Pseq([1/2], 128)).play(t)

Ppar([

Pbind(\instrument, \snare,\carHz, 41.2 ,\type,Pseq([
	Pseq([\rest ,\rest,\note,\rest], 96), Pseq([\rest,\rest,\rest,\rest],32)].scramble,inf)
	,\atk, 0.00502929687,\rel, 0.0968,\rel2,
	Pseq([Pseq([ 0.3872],32), Pseq([ 0.7744],32)],inf),\dur, Pseq([1/2], inf),\amp,(-12), \crv1,(-8),\crv2,(-7)   ,\out,0/*~snareEQ*/, \atk,t.beatDur * 0.02, \atk2,Pkey(\atk),
	\da1,Prand([ Pseq([2],32),Pseq([0],32)],inf)      ),


Pbind(\instrument, \percussion,\type,Pseq([Pseq([Pseq(~rythm1,1),Pseq(~rythm2,1),],4),Pseq([Pseq(~rythm3,1),Pseq(~rythm4,1),],4),Pseq(~rythmL, 32) ],inf),\dur,Pseq([1/4],inf ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, 0/*~cymbalEq*/),


Pbind(\instrument,\percussion,\dur,Pseq([1/4], inf),\atk, 0,\rel,0.04840,\rel2,0.02420,\amp,Pseq([( -16.2), ( -16.7),( -16.5),( -16.2),( -16.2),( -15.9),( -16.2),( -16.2)],inf), \crv1, (-3), \crv1b, (-5), \modHz, exprand(500,10000).postln, \mulMod, rrand(100, 500).postln, \carHz, exprand(20,10000), \modAmp, 0.12875, \latch, 18500, \stereoR, 0.007,\out,0/*~hatEq*/),

Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)

],1).play(t)



~cymbal = Pbind(\instrument, \percussion,\type,Pseq([

	Pseq([
	Pseq([\rest,\rest,\rest,\rest ,\rest,\rest ,\note, \rest].scramble,1),
	Pseq([\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble,1),
	],2),

	Pseq([
	Pseq([\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble,1),
	Pseq([\rest,\rest,\rest,\rest ,\note,\note ,\note, \rest].scramble,1),
	],2),


	/*Pseq([\rest,\rest,\rest,\rest ,\rest,\note ,\note, \rest].scramble,8),*/
	Pseq([\rest,\rest,\note,\note ,\rest,\note ,\note, \rest].scramble, 192)],inf)

	,\dur,Pseq([1/4],inf ),\carHz, 525.12070612224.rrand(0.01),\modHz,11899.3343179398.rrand(0.001),\modAmp, 0.12875.rrand(0.000001).postln ,\amp,(-19),\rel,Pseq([1/4],inf),\rel2,Pseq([1/16],inf),\latch,8000,\stereoL, 0.00555, \crv1,  (-14.4).rrand(-1), \crv1b,(-4), \mulMod, 1691,\out, 0/*~cymbalEq*/).play(t)
