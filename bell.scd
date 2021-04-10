~combGrp = Group.new;

Ppar([


	Pbind(\instrument, \percussion, \dur,Pseq([4/1],1 ),\carHz, Pfunc({1050.12070612224.rrand(150)}),\modHz,Pfunc({9334.3179398.rrand(0.1)}),\modAmp,Pfunc({ 0.00875.rrand(0.0001)}) ,\amp,1,\rel,4.5544,\rel2,4.242,\stereoL, 0.00555, \crv1,  (-7.4), \crv1b,(-42), \mulMod, 901,\out, ~bellFlang,\latch,8900,\atk,0.01,\atk2,Pfunc({0.3.rrand(0.01)})),

	/*Pbind(\instrument,\combS, \in,~bellComb, \out,0, \group,~combGrp, \delayT,15/*Pfunc({5.00.rrand(1)})*/,\decT, /*Pfunc({4.00.rrand(0.1)})*/2,  \dur,Pseq([4/1],1 ),\maxDel,0.001)*/


	Pbind(\instrument,\flanger,\dur,Pseq([8/1],1 ), \in,~bellComb, \out,0, \group,~combGrp,\flangefreq,Pfunc({1.2875.rrand(0.075)}),\fdback,Pfunc({1.00.rrand(0.1)}),\tS , 0.39550810372374)

],1).play(t);


SynthDef(\flanger, {arg flangefreq=0.3, fdback=0.3,in,tS=1,dur,out=0;

var input, effect;

input=In.ar(in,2);

input= input+ LocalIn.ar(2);

effect= DelayN.ar(input,0.02,SinOsc.kr(flangefreq,0,0.005,0.005)); //max delay of 20msec

LocalOut.ar(fdback*effect);

//LocalOut.ar(fdback*BPF.ar(effect,MouseX.kr(1000,10000),0.1)); //alternative with filter in the feedback loop

Out.ar(out,effect * EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2));
}).add;








~bellComb


s.plotTree




//bus.kr on pitchrate of gran





