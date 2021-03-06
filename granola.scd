Pbind(\instrument,\gran,\dur,40,
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,40,\impulse,0.3,\pos,0).play

Pbind(\instrument,\gran,\dur,Pseq([1/1],inf),
\type, Pseq([\rest, \rest,\rest,\note, \rest,\rest,\rest,\rest],inf),
		\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pseq([1/1],inf),\impulse,Pseq([1/1],inf),\pos,0.99999.rand).play


Pbind(\instrument,\gran,\dur,Pseq([1/16],inf),
	/*\type, Pseq([\note, \rest,\rest,\rest, \rest,\rest,\rest,\rest],inf),*/
		\amp, 1,\buf, ~buf,\out,0,\gate, 1,\duration,Pseq([1/16],inf),\impulse,Pseq([1/16],inf),\pos,0.99999.rand).play