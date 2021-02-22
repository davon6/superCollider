





({Resonz.ar(Saw.ar(432, mul:02)!2, MouseX.kr(100,2040),0.03)}.play)


({CombN.ar(Saw.ar(432, mul:02),)}.play)



({CombC.ar(Saw.ar(LFNoise0.kr(1.2875).range(40,2000), mul:02),2,MouseX.kr(0.001,1),4)}.play)



({CombN.ar(Saw.ar(LFNoise0.kr(1.2875).range(40,2000), mul:02),2,MouseX.kr(0.001,1),4)}.play)





(SynthDef(\comb,{|dur|Out.ar(0,CombN.ar(Saw.ar(LFNoise0.kr(1.2875).range(40,2000), mul:EnvGen.kr(Env.perc(releaseTime: dur),doneAction: 2)),2,MouseX.kr(0.001,0.1),4)!2);}).add;)




Pbind(\instrument, \comb, \dur, 0.1).play



// modulate fundamental frequency, formant freq stays constant
{ Formant.ar(XLine.kr(400,1000, 8), 2000, 800, 0.125) }.play

// modulate formant frequency, fundamental freq stays constant
{ Formant.ar(200, XLine.kr(400, 4000, 8), 200, 0.125) }.play

// modulate width frequency, other freqs stay constant
{ Formant.ar(400, 2000, XLine.kr(800, 8000, 8), 0.125) }.play