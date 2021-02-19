~remyAudio = Buffer.read(s, "/Users/MisterGadou/Collider/remy.wav");



~remyAudio.play


SynthDef(\playBuf ,{Out.ar(0,PlayBuf.ar(2,~remyAudio,trigger: 0,startPos: 100,doneAction: 2));}).play;



	"remy.wav".absolutePath



	(
Dialog.openPanel({ arg path;
    path.postln;
});
)