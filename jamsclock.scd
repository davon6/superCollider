(
a = {
    [\ar, \kr].do { |rate|
        var pulse = Impulse.perform(rate, 1);
        var time = Sweep.perform(rate, 1);
        Poll.perform(rate., pulse, time, rate);
    };
    Silent.ar(1);
}.play;
)

a.free;