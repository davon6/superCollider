




~lfoGrp = Group.new;

Ppar([

	Pbind(\instrument, \lfo13, \val,0.3,\dur,Pseq([4/1],1),\rL,0,\rH,
		Pseq([(-0.3),(-0.4),(-0.5),(-0.6)],inf) ,\out,  ~bus22, \group, ~lfoGrp,\tS, 0.39550810372374),


Pbind( \instrument, \playBufMod, \trig, 0.3 ,\dur, Pseq([1/1],4), \tS,  0.39550810372374,\buf,~b3,\out,0,\loopy,0,\start,8020,\modP, ~bus22),


	Pbind(\instrument,\gran,\dur,Pseq([1/4],16),\amp, 1,\buf, ~k2,\out,0,\pitchRte,1,\duration,Pkey(\dur),\impulse,Pkey(\dur),\pos,0.017,\type, Pseq([\note,\note,\note,\note,\rest,\rest,\rest,\rest].scramble,inf))

],1).play(t)









