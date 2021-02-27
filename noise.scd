	SynthDef(\wNoise, {

		arg in=0, mix=0.2, amp = (-20), dec =0,sub2 =3, valStart= 10000,valEnd =100, wFil=1, pan =0, durF =3,out =0,atk=0;
	var env,dry, wet, sig,env2, ori;

		env = EnvGen.kr(Env([0,amp.dbamp,0],[atk,dec,0],[3,-2]),doneAction:2);

	sig =  SelectX.ar(wFil,[
			LPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF)),

			HPF.ar(WhiteNoise.ar(env),XLine.kr(valStart,valEnd,durF))]);

/*sig = Pan2.ar( sig , pan);*///0 was pan

	Out.ar(out,HPF.ar(sig,100);//* env2 //*amp

    )
}).add;
"side events init".postln;



Pbind(\instrument, \wNoise,\dur, Pseq([1/2],1),\atk,Pseq([1/2],1),\amp,(-20),\out,0).play

~short1 = Prand([ Pseq([1/4],1),Pseq([1/1],1),Pseq([4/1],1)],1);

~long1 = Prand([ Pseq([16/1],1),Pseq([1/1],1),Pseq([4/1],1)],1);
~long2 = Prand([ Pseq([16/1],1),Pseq([64/1],1),Pseq([4/1],1)],1);


(
Ppar([
Pbind(\instrument, \wNoise,\dur, ~short1,\dec ,Pkey(\dur),\amp,(-20),\out,~noiseStereo1),

	Pbind(\instrument, \stereo, \dur, inf, \in , ~noiseStereo1,\group, ~stereoGrp)],1).play(t)
)
Pbind(\instrument, \wNoise,\dur,~short1,\atk ,Pkey(\dur),\amp,(-20),\out,0).play