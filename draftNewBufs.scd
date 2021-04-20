~audio = Buffer.read(s, "/Users/davidmignot/Desktop/E/E1.wav");


~audio2 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/consolidated.wav");

~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated.wav");

~audio3.play

~bufSnoopy.play

~audio.numFrames

~audio2 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/consolidated.wav");
~vocal  = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/03-thEnd-consolidated.wav");


~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-02.wav");
~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated-03.wav");
~vocal.play
~audio2.play

g = Synth(  \playBufX2,[ \impulse, 0.00001,\loo,1,\buf,~audio,\out, 0]);




g = Synth(  \playBufX,[ \impulse, 0.00001,\loo,1,\buf,~audio3,\out, 0]);




Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,0,\buf,~audio3,\out, 0/*~bgFil22*/).play(t)



Pbind(\instrument, \playBufX,\dur, Pseq([16/1],inf),\impulse, 0.00001,\loo,0,\buf,~audio3,\out, 0/*~bgFil22*/).play(t)


Prand([
Pbind(\instrument, \playBufX,\dur, Pseq([4/1],1),\impulse, 0.00001,\loo,0,\buf,~vocal,\out, 0,\tS,  0.39550810372374,
\vl,0.4
	),

	Pbind(\instrument, \playBufX2,\dur, Pseq([1/1],1),\impulse, 20.6,\loo,0,\buf,~vocal,\out, 0,\tS,  0.39550810372374,\vl,0.4),

Pbind(\instrument, \playBufX2,\dur, Pseq([1/2],2),\impulse, 10.3,\loo,0,\buf,~vocal,\out, 0,\tS,  0.39550810372374,
		\start,Pfunc({(~vocal.numFrames-7000).rand}),\vl,0.4)
],inf).play(t)



	SynthDef(\playBufX ,{|out = 0,start, trig, dur, amp=1,buf, dA=2, loo=0,tS=1,impulse=0.001|Out.ar(out,PlayBuf.ar(1,buf,trigger:
		Impulse.kr(impulse* (60/~bpm),mul: amp),startPos: start,loop:loo,doneAction: 2));}).add;



