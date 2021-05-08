



	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 *  222.rrand(1).postln
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],inf) ,).play(t);


~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)

~kb.stop



(

~bou= Pseq([
	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 78
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ,),




		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 33
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ,),




],1);)

(
Pseq([ ~bou, Pbind(\instrument,\gateS, \dur, Pseq([1/4],6),\tS, 0.39550810372374  ),~bou,Pbind(\instrument,\gateS, \dur, Pseq([1/4],6),\tS, 0.39550810372374  ),~bou,	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 43
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ),
Pbind(\instrument,\gateS, \dur, Pseq([1/4],5),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 16
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([10/4],1) ,),
/*Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),*/

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 200
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/4],1) ),
],inf).play(t));



(

~bou2= Pseq([
	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 78
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([6/4],1) ,),




		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 33
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([6/4],1) ,),




],1);)

(
Pseq([ ~bou2, Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),~bou2,Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),~bou2,	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 43
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ),
Pbind(\instrument,\gateS, \dur, Pseq([1/4],5),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 16
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([10/4],1) ,),
/*Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),*/

		/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 200
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/4],1) ),*/
],inf).play(t));



~kb=Pbind(\instrument, \playBufS, \dur,  Pseq([1/1],inf), \tS,  0.39550810372374,\buf,~kb2).play(t)

~kb.stop

~part3.play(t)
(

~part3 =

Ppar([

Pseq([
Pseq([ ~bou, Pbind(\instrument,\gateS, \dur, Pseq([1/4],6),\tS, 0.39550810372374  ),~bou,Pbind(\instrument,\gateS, \dur, Pseq([1/4],6),\tS, 0.39550810372374  ),~bou,	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 43
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ),
Pbind(\instrument,\gateS, \dur, Pseq([1/4],5),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 16
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([10/4],1) ,),
/*Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),*/

		Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 200
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/4],1) ),

],2),
Pseq([ ~bou2, Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),~bou2,Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),~bou2,	Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 43
	,\loopy,0,\tS,0.39550810372374,\dur,Pseq([5/4],1) ),
Pbind(\instrument,\gateS, \dur, Pseq([1/4],5),\tS, 0.39550810372374  ),

Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,~absoFinalGate3, \start, ~leTout2.numFrames/ 256 * 16
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([10/4],1) ,),
/*Pbind(\instrument,\gateS, \dur, Pseq([1/4],4),\tS, 0.39550810372374  ),*/

		/*Pbind(\instrument, \playBuf10, \buf ,~leTout2,\out,0, \start, ~leTout2.numFrames/ 256 * 200
		,\loopy,0,\tS,0.39550810372374,\dur,Pseq([2/4],1) ),*/

],2),

		],inf),
		Pbind(\instrument, \playBufS,\dur  ,Pseq([2/1],inf),\buf,~fkAr,\tS,  0.39550810372374,\start,~fkAr.numFrames.rand,\out, ~limitBus1),




],1)
;)


