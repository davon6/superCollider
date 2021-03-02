SynthDef(\recLoop){|buf=0,in=0,out=0,recording = 1|
    var input = SoundIn.ar(in);
	// Timer measures times between triggers
	// Changed emits a trigger when recording changes value
	// Gate updates recEnd only when not recording
	// BufSampleRate because Timer measures seconds and we need samples instead
	var recEnd = Gate.kr(
		Timer.kr(Changed.kr(recording)),
		1-recording
	)*BufSampleRate.ir(buf);

	// record buf from start to end
	// run only when recording
	// jump to start when recording is started
    var rec = RecordBuf.ar(input,buf,run:recording,loop:0,trigger:recording);

	var play = LoopBuf.ar(1,buf,1,
		// when gate is positive: loop,
		// when gate is negative: play normally
		// (don't loop when recEnd is still at 0)
		gate:recEnd>1,
		startPos:0,
		startLoop:0,
		endLoop:recEnd
	);

	Out.ar(0,play);
}.add

~buf = Buffer.alloc(s,44100*20); // alloc buffer
x = Synth(\recLoop,[buf:~buf]); // start synth
x.set(\recording,0); // start looping
x.set(\recording,1); // new rec
x.set(\recording,0); // start new loop
~buf.stop
~buf.free
~buf.play
~buf.pause
x.pause
x.stop

x.free