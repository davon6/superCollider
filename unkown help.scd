(a = {
	var trig = Impulse.kr(2);
	var decay = Decay2.kr(trig * TRand.kr(0.05, 0.8, trig), 0.01, 0.7);
	var sig = LPF.ar(PinkNoise.ar, 1200) * decay;
	sig.dup
}.play;
)
(

a = {
	var trig = Impulse.kr(2);
	var decay = Decay2.kr(trig * TRand.kr(0.05, 0.8, trig), 0.01, 0.7);
	var sig = LPF.ar(PinkNoise.ar, 1200) * decay;
	sig = Compander.ar(sig, sig, 0.001, 1, 0.05, 0.02, 0.8) * 50;
	sig.dup
}.play;
)