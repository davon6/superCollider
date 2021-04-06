~lfoGrp = Group.new;
~gateGrp= Group.after(~lfoGrp);

SynthDef(\lfoPulse, {|out, val, dur,tS=1,ph =0,gte=(-4),frq=1,wdth=0.5|Out.kr(out,

		LFPulse.kr(frq/*MouseY.kr(0.001,32)*/,width:wdth/*MouseX.kr(0.1,1) */)* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: tS,doneAction: 2)
	)}).add;


Ppar([

	~bassShap, Ppar([~hat2,~kick, ~bass],inf),
	Pbind(\instrument ,	\EQHP2,\dur, inf, \in,~bassEq, \out,0,\group, ~gateGrp, \frq, 20.6,\vol,1/*\val, 659.255, \quant,1, \gain ,(-20)*/),
	Pbind(\instrument ,	\EQ2,\dur, inf, \in,~kickHatEq, \out,0,\group, ~gateGrp, \val, 659.255, \quant,1.7, \gain ,(-20)),


	Pbind(\instrument, \lfoPulse, \out, ~bus13, \dur, Prand([ Pseq([8/1],1), Pseq([2/1],1)],inf),\group,~lfoGrp ,\frq,Pfunc({20.6.exprand(0.3)}),\wdth,~bus14 ),

Pbind( \instrument, \playBuf, \impulse, 0.025,
		\dur,99999, \tS,  0.39550810372374,\start,Pfunc({( ~buf.numFrames.rrand(1400000)- 1400000)}),\buf,/*Prand([*/~bufSnoopy/*,~bufSnoopy2],inf)*/,\out, ~toGateX,\loopy,1),
Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus13 ,\in, ~toGateX,\out,0,\group, ~gateGrp)

],1).play(t)



Ppar([


	Pbind(\instrument, \lfoSaw, \out, ~bus8, \dur, Pseq([4/1],inf), \ph, Pfunc({8pi.rrand(0.01)}), \gte,Pfunc({  (10).exprand(1).neg    }), \group, ~lfoGrp),



Pbind(\instrument,\rise,\dur,Pseq([64/1],inf),\atk,1, \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({50.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out , ~toGateX,/*\type,Prand([\note,\rest],inf),*/\tS, 0.39550810372374),



Pbind(\instrument, \gateX,\dur,9999, \tS, 0.39550810372374, \busMod, ~bus8 ,\in, ~toGateX,\out,0,\group, ~gateGrp)],1).play(t)




s.plotTree



8pi
SinOsc