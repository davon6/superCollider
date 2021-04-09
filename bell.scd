~combGrp = Group.new;

Ppar([


	Pbind(\instrument, \percussion, \dur,Pseq([4/1],1 ),\carHz, 1050.12070612224.rrand(150),\modHz,9334.3179398.rrand(0.1),\modAmp, 0.00875.rrand(0.0001) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, 0,\latch,8900,\atk,0.01,\atk2,0.3.rrand(0.01)),

	/*Pbind(\instrument,\combS, \in,~bellComb, \out,0, \group,~combGrp, \delayT,15/*Pfunc({5.00.rrand(1)})*/,\decT, /*Pfunc({4.00.rrand(0.1)})*/2,  \dur,Pseq([4/1],1 ),\maxDel,0.001)*/

],1).play(t)

~bellComb


s.plotTree




//bus.kr on pitchrate of gran





