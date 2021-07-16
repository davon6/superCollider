/// goes from up to down (MouseY) with the mouse

~b2 = Buffer.alloc(s,48000,1);

SynthDef(\example, {arg flangefreq=0.3, fdback=(-0.9),in,tS=1,dur,out=0,flangMod,ph=4.6;

		var input, effect;

	input=  Saw.ar( 60).range(5,100);

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,LFTri.kr(MouseY.kr(0.084/256,1.5),ph,0.005,0.005));

		LocalOut.ar(fdback*effect);

	Out.ar(out,

		BLowPass4.ar(


		BufCombC.ar(~b2.bufnum,
				Decimator.ar(
			effect
					,MouseY.kr(44100,4000),MouseY.kr(21,6) ),
		SinOsc.kr(MouseY.kr(0.024,0.6),1.6).range(0.0008,0.02)
		,-0.5)

			,SinOsc.kr(MouseY.kr(0.3,10)).range(20000,800),0.9	)


			*0.0008  !2 /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).play;


SynthDef(\example, {arg flangefreq=0.3, fdback=(-0.9),in,tS=1,dur,out=0,flangMod,ph=4.6;

		var input, effect;

	input=  Saw.ar( SinOsc.kr(0.3,4.6).range(50,5)).range(5,100);

		input= input+ LocalIn.ar(1);

	effect= DelayN.ar(input,0.02,LFTri.kr(MouseY.kr(0.084/16,0.084/64),ph,0.005,0.005).range(0.4,1));

		LocalOut.ar(fdback*effect);

	Out.ar(out,

		BLowPass4.ar(


/*		BufCombC.ar(~b2.bufnum,*/
				Decimator.ar(
			effect
					,MouseY.kr(44100,4000),MouseY.kr(21,6) )/*,
		SinOsc.kr(MouseY.kr(0.024,0.6),1.6).range(0.0008,0.02)
		,-0.5)*/

			,MouseY.kr(20000,800),0.9	)


			*0.0008  !2 /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).play;









SynthDef(\example, {arg flangefreq=0.3, fdback=(-0.9),in,tS=1,dur,out=0,flangMod,ph=4.6;

		var input, effect;

	input=  Saw.ar( SinOsc.kr(00.084,4.6).range(5,1)).range(50,100);

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,SinOsc.kr(MouseY.kr(0.084/16,1.5),ph,0.005,0.005));

		LocalOut.ar(fdback*effect);

	Out.ar(out,

		BLowPass4.ar(


		BufCombC.ar(~b2.bufnum,
				Decimator.ar(
			effect
					,MouseY.kr(44100,4000),MouseY.kr(21,6) ),
		SinOsc.kr(MouseY.kr(0.024,0.6),1.6).range(0.0008,0.02)
		,-0.5)

			,MouseY.kr(20000,800),0.9	)


			*0.0008  !2 /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).play;







// PBind(\instrument, \lfo13, \out,~bus1, \val, 0.11, \ph,6,).play(t,quant:1)

o={Out.kr(~bus1,SinOsc.kr(0.11,6,0.005,0.005))}.play

// SinOsc.ar(val,ph).range(rL,rH)    rL=1,rH=0.4

//acier
SynthDef(\example, {arg flangefreq=0.3, fdback=(-0.934),in,tS=1,dur,out=0,flangMod,ph=6,busFl;

		var input, effect;

	input=  Saw.ar( 30.midicps*(432/440),EnvGen.kr(Env.perc(releaseTime: t.beatDur/4,curve: -8)));

		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,

		//that one
		// SinOsc.kr(0.11,ph,0.005,0.005)

		In.kr( ~bus1)

	);

		LocalOut.ar(fdback*effect);

	Out.ar(out,

/*FreqShift.ar(*/
			effect
		/*	,Saw.kr(0.07).range(0,70))*/

		*0.2!2
			   /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).play;


	({Saw.ar(0.3)}.scope)




//spoaceship
SynthDef(\example, {arg flangefreq=0.3, fdback=(-0.7),in,tS=1,dur,out=0,flangMod,ph=6,busFl;

		var input, effect;

	input=

FreeVerb.ar(
		WhiteNoise.ar( 1),0.5,0.6);






		input= input+ LocalIn.ar(1);

		effect= DelayN.ar(input,0.02,

		//that one
		SinOsc.kr(~hz1beat/32,ph,0.005,0.005)

		// In.kr( ~bus1)

	);

		LocalOut.ar(fdback*effect);

	Out.ar(out,

/*FreqShift.ar(*/
			BBandPass.ar(
	Decimator.ar(
			effect,
			MouseY.kr(100,48000),4)
		/*	,Saw.kr(0.07).range(0,70))*/
			,LFTri.kr(~hz1beat/16).range(40,4000),0.67)

		*0.04!2
			   /** EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2)*/);
	}).play;




({BBandPass.ar(WhiteNoise.ar(0.5),MouseY.kr(100,4000),0.4)}.play)

