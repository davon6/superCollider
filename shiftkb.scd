~shifGrp = Group.new;




Ppar([

	Pseq([Pbindf(~kick, \out,~eqBass)],1),
Pseq([	Pbindf(~bass,\out,~eqBass,\type,\note,\rel, 1* (60/~bpm))],1),



	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],1), \out,0, \freq,Pfunc({120.rand}), \group,~shifGrp,\tS, 0.39550810372374)


],1).play(t)


s.plotTree




Pseq([Pbindf(~kick, \out,~eqBass)],4),
Pseq([	Pbindf(~bass,\out,~eqBass)],4),



	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],inf), \out,0, \freq,Pfunc({120.rand}), \group,~shifGrp)






Pbindf(~kick, \out,~eqBass),
	Pbindf(~bass,\out,~eqBass, \type,\note,\dur,Pseq([4/1],1),\rel, 4* (60/~bpm)),

	Pbind(\instrument, \shift2, \in,~eqBass,\dur, Pseq([4/1],inf), \out,0, \freq,Pfunc({120.rand}), \group,~shifGrp)