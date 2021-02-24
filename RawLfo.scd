// internal server needed for all examples with SharedOut,
// shared memory also works with local server

(
s = Server.internal;
Server.default = s;
s.boot;
)

// start LFO

x = { SharedOut.kr(0, LFDNoise3.kr(0.3, 20, 70)) }.play;


// play event pattern

(
p = Pbind(
    \dur, 0.15,
    \midinote, Pfunc { s.getSharedControl(0) }
).play;
)

(
p.stop;
x.free;
)

//////////////////////////

// example with GUI

// ATTENTION: this version of the example works with SC versions > 3.4.4
// in which SharedOut is still supported and which already include
// the fix of a minor bug which blocked adding of SynthDefs.
// See below for an equivalent example with shared memory.

// If you're using a version <= 3.4.4 you can fix it by yourself,
// adding this method to SharedOut and recompile:
// *numFixedArgs { ^1 }

// ... or take the example version below the following version

(
s = Server.internal;
Server.default = s;
s.boot;
)

(
SynthDef(\control, { |midiCenter, dev, devFreq| SharedOut.kr(0, LFDNoise3.kr(devFreq, dev, midiCenter)) }).add;

p = Pbind(
    \dur, 0.15,
    \midinote, Pfunc { s.getSharedControl(0) } + [0, 4]
);

// start control synth before stream

v = VarGui(synthCtr: [
    \midiCenter, [50, 80, \lin, 0.01, 70],
    \dev, [0, 20, \lin, 0.01, 20],
    \devFreq, [0, 3, \lin, 0.01, 0.5]],
    synth: \control, stream: p
).gui(playerPriority: \synth);
)


// this version of the example works also with SC versions <= 3.4.4

(
SynthDef(\control, { |midiCenter, dev, devFreq| SharedOut.kr(0, LFDNoise3.kr(devFreq, dev, midiCenter)) }).send(s);
)

(
x = Synth(\control).register;

// or start paused:
// x = Synth.newPaused(\control).register;

p = Pbind(
    \dur, 0.15,
    \midinote, Pfunc { s.getSharedControl(0) } + [0, 4]
);
)

(
v = VarGui(synthCtr: [
    \midiCenter, [50, 80, \lin, 0.01, 70],
    \dev, [0, 20, \lin, 0.01, 20],
    \devFreq, [0, 3, \lin, 0.01, 0.5]],
    synth: x, stream: p
).gui(playerPriority: \synth);
)


// shared memory example, SC version >= 3.5
// start LFO

c = Bus.control(s, 1);

x = { Out.kr(c, LFDNoise3.kr(0.3, 20, 70)) }.play;


// play event pattern

(
p = Pbind(
    \dur, 0.15,
    \midinote, Pfunc { c.getSynchronous }
).play;
)

(
p.stop;
x.free;
)