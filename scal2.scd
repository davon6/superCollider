.majHarmonic


Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -12)//-3




Pseq([
Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -12),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -11),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -12),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -12),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -12),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -11),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -10),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -10)].scramble,inf)
	\legato, 2,






/*Scale.majHarmonic*/


SynthDef(\blo,{|val|Out.ar(0, Saw.ar(432+val,mul: EnvGen.kr(Env.perc(releaseTime: 0.3))*0.02))}).add;





Pbind(\instrument,\blo, \dur, Pseq([1/4],inf), \val,Pseq([
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -1),
	Scale.majorPentatonic(\just).degreeToFreq(7.rand, 76.midicps, -1),
	\legato, 2,
].scramble,inf)
).play(t)

Scale



Pbind(\instrument,\blo, \dur, Pseq([1/4],inf), \val,Pseq([
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -1),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -1),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -1),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -1),
].scramble,inf)
).play(t)


Pbind(\instrument,\blo, \dur, Pseq([1/4],inf), \val,Pseq([
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -2),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -3),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -4),
	Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -4),
].scramble,inf)
).play(t)



~ma1=Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -3);
~ma2=Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -2);
~ma3=Scale.major(\just).degreeToFreq(7.rand, 76.midicps, -3);