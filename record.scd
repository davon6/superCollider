SynthDef("help-Diskout", { |bufnum|
    DiskOut.ar(bufnum, In.ar(0,10));
}).add;





~track = Buffer.alloc(s, s.sampleRate*(t.beatDur* 1024), 10);



~track.write("~/diskouttest.aiff".standardizePath, "aiff", "int16", 0, 10, true);




~recT = Synth.tail(nil, "help-Diskout", ["bufnum", ~track],~recGrp3);



(
~x1 = Synth.basicNew("help-Diskin-2chan");
~m1 = { |buf| ~x1.addToHeadMsg(nil, [\bufnum,buf])};

~track = Buffer.cueSoundFile(s,"~/diskouttest.aiff".standardizePath, 0, 10, completionMessage: ~m1);
)

FreqScope.new