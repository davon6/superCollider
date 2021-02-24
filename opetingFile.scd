~remyAudio = Buffer.read(s, "/Users/MisterGadou/Collider/remy.wav");

~ro = ~remyAudio.bufsize= 300;

~remyAudio.play


SynthDef(\playBuf ,{|start, trig, dur|Out.ar(0,PlayBuf.ar(2,~remyAudio,trigger: Dust.kr(4.0),startPos: start,doneAction: 2));}).add;

Pbind(\instrument, \playBuf , \dur, Pseq([1/16],1), \trig, 30,\start ,Prand([0, 3500, 7700, 22000],inf)).play

	"remy.wav".absolutePath



	(
Dialog.openPanel({ arg path;
    path.postln;
});
)

s.plotTree