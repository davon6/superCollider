({CombN.ar( BLowPass.ar(SinOsc.ar(210,mul: EnvGen.kr(Env.perc(releaseTime: 1,curve: -30))),EnvGen.kr(Env([14000,400,120],[0.5,0.2,1],[-30,-4,1]),doneAction: 2),1),delaytime: 0.000007 ,decaytime: -0.2)!2}.play);


//HERE

({BBandPass.ar(SinOsc.ar(250,mul:EnvGen.kr(Env.perc(releaseTime: 0.38,curve: -6))),400,0.2)}.play)


({CombN.ar( BHiPass.ar(SinOsc.ar(310,mul: EnvGen.kr(Env.perc(releaseTime: 0.8,curve: -30))),565,1),delaytime: 0.4 ,decaytime: 0.001)!2}.play);


({CombN.ar( BHiPass.ar(SinOsc.ar(310,mul: EnvGen.kr(Env.perc(releaseTime: 0.8,curve: -30))),865,1),delaytime: 0.006 ,decaytime: 0.03)!2}.play);


({BHiPass.ar(SinOsc.ar(310,mul: EnvGen.kr(Env.perc(releaseTime: 0.8,curve: -30))))!2}.play);
(

{BLowPass4.ar(PinkNoise.ar(0.6),EnvGen.kr(Env([1400,500,120],[0.1,0.4,1],[-30,-4,1]),doneAction: 2),Line.kr(0.6,1,1))}.play;

{SinOsc.ar(110,mul: EnvGen.kr(Env.perc(releaseTime: 0.2,curve: -3)))}.play)




//dark step
({BLowPass4.ar(BrownNoise.ar(0.1),EnvGen.kr(Env([1400,500,120],[0.1,0.2,1],[-3-4,1])))}.play)


 ClipNoise, GrayNoise, PinkNoise, WhiteNoise

({BLowPass4.ar(ClipNoise.ar(0.1),EnvGen.kr(Env([1400,500,120],[0.1,0.2,1],[-3-4,1])),Line.kr(0.6,1,1))}.play)


/*

({BLowPass4.ar(WhiteNoise.ar(0.5),EnvGen.kr(Env([1400,500,0],[0.05,0.1,0.1],[-30,-4,1])),Line.kr(0.6,1,1))}.play);*/




(

{ BHiPass4.ar(BrownNoise.ar(0.1),EnvGen.kr(Env([0,4400,9999],[0.1,0.1 ,1],[-30,-4,1]),doneAction: 2))}.play;



({BLowPass4.ar(LFTri.ar(80,mul: EnvGen.kr(Env.perc(releaseTime: 0.04,curve: -3))),EnvGen.kr(Env([1400,500,120],[0.1,0.2,1],[-3-4,1])),0.1)}.play);



({CombN.ar( BLowPass4.ar(ClipNoise.ar(0.3),EnvGen.kr(Env([9000,500,120],[0.1,0.2,1],[-3-4,1]),doneAction: 2),0.1),delaytime: 0.0007 ,decaytime: 0.1)}.play)





({BLowPass4.ar(ClipNoise.ar(0.1),EnvGen.kr(Env([1400,500,120],[0.1,0.2,1],[-3-4,1])),Line.kr(0.6,1,1))}.play)
