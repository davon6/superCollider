

z = Buffer.read(s,"/Users/MisterGadou/Desktop/music/stevie.wav");
s.boot;
z = Buffer.read(s,"/Users/MisterGadou/Desktop/music/boom boom.wav");


/*z = Buffer.readChannel(s,"/Users/MisterGadou/Desktop/music/SAMPLES:PRESETS/noVS4.wav",channels:[0]);
*/



z = Buffer.readChannel(s,"/Users/MisterGadou/Desktop/music/stevie.wav",channels:[0]);


z = Buffer.readChannel(s, SinOsc.ar(200, 0, 0.5) ,channels:[0]);


z.play;

{GrainBuf.
	ar(1,
		Impulse.ar(4),
		1,
		z,
		1,
		0)
}.play;
s.defaultGroup.deepFree;

z.set(\gate, 0);

({
	var vib;

	vib = GrainBuf.ar(
		1,
		Impulse.ar(41.2)!2,
		//Impulse.ar(freq),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(0.2, 12.1),
		1,
		z.bufnum,
		//0.25,
		1,
		//30.midiratio,
		0,
		2,
		0,
		-1,
		//32768,
		512,
		1

	);
}.play;)