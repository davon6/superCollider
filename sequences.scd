Pdef(\c2,Pbind(\instrument,\lead, \dur,Pseq([16/1],inf ),\freq, 76.midicps, \dure,60/151.703592*16,\amp,0.014,\which,3,\whichMod,0,\whichAmp,3));



s.plotTree

~work = Ppar([~ens15Perc, Pdef(\c2)],inf).play(t);
