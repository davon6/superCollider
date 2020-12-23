(
~audioBus_ex_1a = Bus.audio(s, 1);

// pass envelopes with buffer, hanning is GrainIn's default anyway
h = Signal.hanningWindow(1000);
e = Buffer.loadCollection(s, h);

SynthDef(\soundIn, { |out, in, ampIn = 1|
    Out.ar(out, SoundIn.ar(in) * ampIn)
}).add;

SynthDef(\live_gran_1a, { |out, in, envBuf, trigRate = 50, overlap = 0.5, panMax = 0.5,
    panType = 0, amp = 1, minGrainDur = 0.001|
    var inSig, sig, trig, grainDur, pan;

    inSig = In.ar(in, 1);
    // reduce feedback
    inSig = DelayC.ar(LPF.ar(inSig.tanh, 2000), 0.1, 0.01);

    trig = Impulse.ar(trigRate);
    grainDur = max(trigRate.reciprocal * overlap, minGrainDur);

    // select L/R or random sequencing
    pan = Demand.ar(
        trig,
        0,
        Dswitch1([
            Dseq([1, -1], inf),
            Dwhite(-1, 1)
        ], panType)
    ) * min(panMax, 0.999);

    sig = GrainIn.ar(
        2,
        trig,
        grainDur,
        inSig,
        pan,
        envBuf
    );
    Out.ar(out, sig * EnvGate.new * amp);
}).add;
)


// to avoid feedback use with headphones

(
// start granulation (first row) before to ensure right order
VarGui(
    synthCtr: [
        [
            \envBuf, e.bufnum,
            \in, ~audioBus_ex_1a.index,
            \trigRate, [5, 500, \lin, 0, 50],
            \overlap, [0.05, 3, \lin, 0, 0.5],
            \panType, [0, 1, \lin, 1, 0],
            \panMax, [0, 1, \lin, 0, 0.5],
            \amp, [0, 1, \lin, 0, 0.1]
        ],[
            \out, ~audioBus_ex_1a.index,
            // you might have to pass a different 'in' bus for SoundIn
            // depending on your setup
            \in, 0,
            \ampIn, [0, 1, \lin, 0, 1]
        ]
    ],
    synth: [\live_gran_1a, \soundIn]
).gui
)