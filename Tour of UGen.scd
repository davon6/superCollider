{ var x; x = BrownNoise.ar(0.2); [x,x] }.scope(2); // correlated
{ {BrownNoise.ar(0.2)}.dup }.scope(2); // not correlated

// correlated
{ var x; x = LPF.ar(BrownNoise.ar(0.2), MouseX.kr(100,10000)); [x,x] }.scope(2);
// not correlated
{ LPF.ar({BrownNoise.ar(0.2)}.dup, MouseX.kr(100,10000)) }.scope(2);


// correlated
(
{ var x;
    x = Klank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar(7e-3));
    [x,x]
}.scope(2))
// not correlated
{ Klank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar([7e-3,7e-3])) }.scope(2);

// two waves mixed together coming out both speakers
{ var x; x = Mix.ar(VarSaw.ar([100,101], 0, 0.1, 0.2)); [x,x] }.scope(2);
// two waves coming out each speaker independently
{ VarSaw.ar([100,101], 0, 0.1, 0.2 * 1.414) }.scope(2); // * 1.414 to compensate for power

// delays as cues to direction
// mono
{ var x; x = LFTri.ar(1000,0,Decay2.ar(Impulse.ar(4,0,0.2),0.004,0.2)); [x,x]}.scope(2);

(
// inter-speaker delays
{ var x; x = LFTri.ar(1000,0,Decay2.ar(Impulse.ar(4,0,0.2),0.004,0.2));
    [DelayC.ar(x,0.01,0.01),DelayC.ar(x,0.02,MouseX.kr(0.02, 0))]
}.scope(2);
)

(
// mixing two delays together
// you hear a phasing sound but the sound is still flat.
{ var x; x = BrownNoise.ar(0.2);
    x = Mix.ar([DelayC.ar(x,0.01,0.01),DelayC.ar(x,0.02,MouseX.kr(0,0.02))]);
    [x,x]
}.scope(2);
)

(
// more spatial sounding. phasing causes you to perceive directionality
{ var x; x = BrownNoise.ar(0.2);
    [DelayC.ar(x,0.01,0.01),DelayC.ar(x,0.02,MouseX.kr(0.02, 0))]
}.scope(2);
)