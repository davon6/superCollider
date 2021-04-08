
~sig = Signal.newClear(513);

(
//trigonometric stuff - simple sine wave transfer function
~sig.waveFill({
	arg x, y, i;
	sin(x).abs
}, 0, 2pi) //note the new domain
)

~sig.plot;



(
//trigonometric stuff - simple sine wave transfer function
~sig.waveFill({
	arg x, y, i;
	sin(x).abs
}, 0, 2pi) //note the new domain
)



~sig.play

~t = Buffer.alloc(s, 2048);


~b = Buffer.alloc(s, 2048);
~sig = Signal.newClear(1024);



(
//more complex trigonometric expression
~sig.waveFill({
	arg x, y, i;
	sin(x.squared) + cos(x.sqrt);
}, 0, 2pi)
)

 (~wtx = ~sig.asWavetable; ~b.loadCollection(~wtx); )




//~sig.plot;

~b.bufnum



{Osc.ar(~b.bufnum, MouseY.kr(0,88).poll, mul:0.2!2).range(-0.6,1)}.scope
