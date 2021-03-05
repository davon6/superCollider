(



{GrainIn.ar(2, in: ~buf)}.play


SynthDef(\playBuf ,{|out = 0,start, trig, dur|Out.ar(out,PlayBuf.ar(2,~buf,1,1,startPos:408200,loop: 1 ,doneAction: 2));}).play;


//sig = GrainIn.ar(

({
	var sig;
sig = GrainBuf.ar(
	2,
	Impulse.ar(10),
	10,
	~remyAudio.bufnum,
	1,
	0.13,
	2,
);}.play;

)



b = Buffer.readChannel(s,"/Users/MisterGadou/Desktop/music/SAMPLES:PRESETS/noVS4.wav",channels:[0]);

b = Buffer.readChannel(s,"/Users/davidmignot/superCollider-master/remy.wav",channels:[0]);

b = ~buf
s.sampleRate
~buf.play
b.play;

s.plotTree
//base
({
	var vib;

	vib = GrainBuf.ar(
		1,
		Impulse.ar(1),

		1,
		~buf.bufnum,
		pos: 0.67

		,mul: 0.02


	);
}.play;)

Grain
