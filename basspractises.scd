({Saw.ar(41.2,-1,-0.4).lincurve(-1,1,-1,1,-7)}.play)





({Saw.ar(41.2)/*.lin curve(-1,1,-1,1,-7)*/}.play)



({VarSaw.ar(41.2,mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7)}.play)




SynthDef(\bass,{
		arg freq=41.2, dure=1, amp=0.5,
		atkcrv=1, relcrv=5,
		atk=0, rel=0.1, lpf=100, out = 0, bus, dur,cho=0,rel2,relcrv2,envF,relcrv3;

		var sig, env, lvlBa;

		env = EnvGen.kr(
			Env(
				[0,1,0.6,0],
				[atk,rel-cho,rel2],
				[atkcrv,relcrv,relcrv2]
			),
			doneAction:2
		);

		envF = EnvGen.kr(
			Env(
				[0,1080,0,0],
				[atk,rel/*/4*/,rel2],
				[atkcrv,relcrv3,relcrv2]
			),
			doneAction:2
		);


		sig =VarSaw.ar(41.2,mul: -1,add: -0.4).lincurve(-1,1,-1,1,-7);


		sig =

/*		BPeakEQ.ar(
			BPeakEQ.ar(
					BPeakEQ.ar(	BPeakEQ.ar(*/
/*LPF.ar(LPF.ar(	*/



		LPF.ar(LPF.ar(


			sig.round(2**(-4))
					/*	,envF+lpf - In.ar(bus, 1)),envF+lpf - In.ar(bus, 1))*/

			,envF+lpf - In.ar(bus, 1)),envF+lpf - In.ar(bus, 1));

					/*	,659.255,0.8,(-35))
						, 1318.51,1.2,(-20))
			,2637.02 /*659.255*4*/ ,1, (-25))
				,164.81375,8, (-14));
*/
		sig = sig * amp.dbamp;

		sig = sig * env;

		Out.ar(out, Pan2.ar(sig));

		Out.ar(0,RMS.ar(sig).ampdb.round(0.1).poll(label:"bass db :")* [0,0,1])
	}).add;
		