(
SynthDef(\blo, {
var sig, drive, car_2, car_1, car_0, amp_env,amp_1_env, amp_2_env, ind_2_env, harm_2_env, fund_phasor, modulator,ind_1_env,harm_1_env,amp_0_env,ind_0_env, vibrato, detune,vibrato_width_env,freq_0_env, vibrato_freq_env;
detune = LFNoise2.ar (7) / 60;




	vibrato = SinOsc.ar (2 ** (vibrato_freq_env - 6)) * vibrato_width_env / 12;

	fund_phasor = LFSaw.ar (freq_0_env * (2 ** (detune + vibrato))).range (0, 1);
	modulator = sin (fund_phasor * 2pi);

	car_0 = amp_env ** 0.5 * Crossfade_Formant.ar (fund_phasor, modulator, K2A.ar (1), ind_0_env, amp_0_env);
	car_1 = amp_env ** 1.5 * Crossfade_Formant.ar (fund_phasor, modulator, harm_1_env, ind_1_env, amp_1_env);
	car_2 = amp_env ** 2 * Crossfade_Formant.ar (fund_phasor, modulator, harm_2_env, ind_2_env, amp_2_env);

	sig = car_0 + car_1 + car_2;
	sig = sig * drive;
	sig = sig.tanh;


	Out.ar(0,sig);
}).play;)





({SinOsc.ar(MouseX.kr(250,1500) *SinOsc.kr(45).range(0.25,0.5),mul:0.2)}.play)