s.boot;
s.scope;

s.reboot;
FreqScope.new;

c = Buffer.alloc(s, 2048);


 c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);




~wt1 = Signal.sineFill(
	2048,
	[1],
	[0]
);


~wt1.plot


~wt1.play;

~wt0

~wt0.plot;

~b1.bufnum
~b1.size

(
~b0 = Buffer.loadCollection(s, ~wt0);
~b1 = Buffer.loadCollection(s, ~wt1);
)
c.bufnum
c.size
bufpos

({
	var sig;
	sig = VOsc.ar(MouseX.kr(0.1), 300, mul:5!2);
}.play;)

Buffer.freeAll
s.defaultGroup.deepFree;