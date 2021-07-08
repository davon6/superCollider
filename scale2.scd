SynthDef(\bla,{|frq|Out.ar(0,Saw.ar(frq,EnvGen.kr(Env.perc(releaseTime: t.beatDur),doneAction: 2))*0.04)}).add;



Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.chromatic(\just).degreeToFreq(7.rand, 76.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t,quant:1)


Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.ionian(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)


Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.lydian(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

lydian

Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.minorPentatonic(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)


Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.ajam(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)


Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.majorPentatonic(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)


Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.major(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.minor(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.dorian(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.todi(\just).degreeToFreq(7.rand, 78.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

Pbind(\instrument,\bla, \frq,Pseq([ Pfuncn({Scale.hijaz(\just).degreeToFreq(7.rand, 76.midicps, -2)}) ],inf),\dur,Pseq([1/2],inf)).play(t)

Scale.