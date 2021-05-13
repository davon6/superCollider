	s.record;
/*	s.latency=0.02;*/
s.record
s.meter
s.latency=t.beatDur

~leTout2.play



Pbind(\instrument,\rise,\dur,Pseq([256/1],inf), \vlAtk, Pfunc({4.00.rand}),\f1, Pfunc({1.00.rand}) , \f2, Pfunc({1.00.rand}) , \f3, Pfunc({1.00.rand}),  \ic_atk,Pfunc({10.00.rrand(-5)}),\index,Pfunc({5.00.rrand(1)}),\mRatio,Pfunc({3.rrand(1)}),\out ,0,\tS, 0.39550810372374, /*\fR,Pfunc({1.00.rand}), */\moduS,~mod2,\fS,Pfunc({1.00.rand}),
	\key,Pseq([\dec,\atk ], inf),\value,1, \finish, { ~key.envirPut(~value) }),



//may be the one
Pbind( \instrument, \playBufX, \impulse, 2.575/2,
	\dur,9999, \tS,  0.39550810372374,\start, ~bufSnoopy.numFrames/256 * 240.rand,\buf,~bufSnoopy,\out, 0,\loopy,1).play(t)

~part3.play(t)
//PArt3
(

~part3=
Ppar([
Pseq([


		Pseq([

				Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,    Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1),\type,\rest  ),

	Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],5),\tS, 0.39550810372374  ),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10,\buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1),\type,\rest   ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second+  ~leTout2.numFrames/ 256 *2
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),
		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

			Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256 *3
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

				Pbind(\instrument, \gateS, \in,~toGate102,  \group, ~gateGrp6,\tS, 0.39550810372374,\out,~absoFinalGate3),\dur,Pseq([3.75/1],1) ],1),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),



	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,    Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),
//was here
	Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([5/4],1),\tS, 0.39550810372374  ),


		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~second+  ~leTout2.numFrames/ 256 *2
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

			Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~first
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.75/1],1)  ),

Pbind(\instrument,\gateS, \group,~dispatchGrp2,\dur, Pseq([1/4],1),\tS, 0.39550810372374  ),

			Prand([
Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start,~second+  ~leTout2.numFrames/ 256 *3
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([3.75/1],1)  ),

				Pbind(\instrument, \gateS, \in,~toGate102,  \group, ~gateGrp6,\tS, 0.39550810372374,\out,~absoFinalGate3),\dur,Pseq([3.75/1],1) ],1),

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1)  ),

],2),

			Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],64),\buf,~fkAr,\tS,  0.39550810372374,\start,612277.44552995,\out, ~limitBus1),
],inf),

Pbind(\instrument, \shiftEx, \dur, inf, \in,~limitBus1,\group ,~distoGrp0,\out,  ~eqPerch2),
		/*Pbind(\instrument, \disto, \dur, inf, \in, ~distoPerch2 , \out,~eqPerch2,\group, ~distoGrp),*/
	Pbind(\instrument,\EQHP2, \in, ~eqPerch2 , \out, ~revPerch2 ,\frq, 100, \dur,inf, \group, ~eqGrp0),
	Pbindf(~quickFix,\instrument, \reverbS,\dur,inf, \in,~revPerch2  , \out,~comPerch2 ,\group,~revGrp),
	Pbind(\instrument,\compS, \dur,inf,\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1/*(50)*/	,\in, ~comPerch2 ,\ctrl, ~kbus, \out,~limitPerch2, \group, ~compGrp),


		Pbind(\instrument,\stereoS, \dur, Pseq([16/1],inf), \in, ~stereoPerch ,\spread,1  ,\center, 0, \out,~absoFinalGate3, \group, ~dispatchGrp2 ,\tS, 0.39550810372374),


	// Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2)

],1))

Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)



~dispatchGrp2=Group.new;
~revGrp=Group.new
(
Ppar([
/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~revBus1, \start, ~leTout2.numFrames/ 256 * 222.rrand(1)
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2.25/1],inf)),*/

	Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],64),\buf,~fkAr,\tS,  0.39550810372374,\start,612277.44552995,\out, ~revBus1),

	Pbind(\instrument, \shiftEx, \in, ~revBus1,\group, ~revGrp,\dur ,inf),
	 Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2,\out, 0)
],1).play(t))


~leTout2.play


~leTout.play







SynthDef(\triModul,{|modu, busMod,hS=1200,lS=(-40),dur,tS=1,out|Out.kr(out, LFTri.kr(modu+ In.kr(busMod)).range(lS,hS)* EnvGen.kr(Env.step([1,1],[dur,0]),timeScale: tS,doneAction: 2))}).add;


Ppar([

	Pbind(\instrument,\triModul, \lS, 600, \hS,  -300, \modu,0.08/16,  \out, ~bus11,\ph,1,\dur,Pseq([64/1],inf), \tS, 0.39550810372374,),

	Pbind(\instrument,\rise,\dur,Pseq([64/1],inf), \vlAtk, 0,\f1, 0.3 , \f2, 0.3 , \f3, 0.1,  \ic_atk,-0,\index,0.1,\mRatio,1,\out , 0,\tS, 0.39550810372374,\dec,1,\moduS,~bus11,\fS,  0.2,
		\freq, 659.255/8
)],1).play(t)








({LFTri.kr(60,0.6)}.plot(duration:0.1))