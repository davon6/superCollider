

Ppar([
/*	Pbind(\instrument, \lfo13,\tS, 0.39550810372374, \dur, Pseq([64/1],inf),\out,~mod2,\rL,0 ,\rH,3200,\modu,

		0.001875/**4*/,\ph,1.42),*/



	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk,1,\f1, 1 , \f2,2, \f3,0,  \ic_atk,-3,\index,5,\mRatio,5,\out ,0/*~flanToDisto2*/,\tS, 0.39550810372374,\atk,1,\moduS,~mod2, \fS,1 ),],1).play(t)