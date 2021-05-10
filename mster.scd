Pseq([
				Pbind(\instrument, \gateS, \dur,   Pseq([32/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),
		Pseq([
Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, ~toCom,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~gateGrp5)
		],2),

				/*Pbind(\instrument, \gateS, \dur,   Pseq([64/1],1) , \tS, 0.39550810372374,
	\in, ~finGran,\group, ~gateGrp5, \out, ~toCom),*/
].scramble,1).play(t)


Synth(\playB10,[\buf, ~leTout,\out,~finGran ]   )



(
Pseq([

Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, 0/*~toCom*/,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster,\group, ~granuGrp),

	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2),

	Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, 0/*~toCom*/,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster2,\group, ~granuGrp),


	Pbind(\instrument, \playBuf10, \dur, Pseq([48/1],1),\tS, 0.39550810372374,\buf, ~leTout,\start,~mster2),


],1).play(t)

)


~leTout

~mster= /* (~lpPrec.numFrames.rrand(400000)- 400000) ;*/ (~leTout.numFrames/ 256 * 226.rand);
~mster2= /* (~lpPrec.numFrames.rrand(400000)- 400000) ;*/ (~leTout.numFrames/ 256 * 226.rand);
~mster3= /* (~lpPrec.numFrames.rrand(400000)- 400000) ;*/ (~leTout.numFrames/ 256 * 226.rand);
~mster3= /* (~lpPrec.numFrames.rrand(400000)- 400000) ;*/ (~leTout.numFrames/ 256 * 226.rand);



//yeeee
Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, 0/*~toCom*/,\dur,Pseq([ Pseq([6/1],2),  Pseq([1.5/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster3,\group, ~granuGrp),

	Pbind(\instrument, \playBuf10NToMixer,  \c22,1,\name,22,\out, 0/*~toCom*/,\dur,Pseq([ Pseq([4/1],2),  Pseq([2/1],3),Pseq([1/1],2)
].scramble,1),\in,Pseq([~fusible, ~fusible,~fusible, ~fusible,~finGran, ~finGran,~finGran,~finGran].scramble,inf)
	,\impulse,0.075,\tS, 0.39550810372374,\loopy,0,\buf, ~leTout,\start,~mster4,\group, ~granuGrp)




4860003.5785573.rrand( 303750.22365983)- 303750.22365983

 ~bufSnoopy.numFrames.rrand(s.sampleRate*16*t.beatDur)  - s.sampleRate*16*t.beatDur  ;