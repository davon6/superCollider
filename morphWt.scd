s.boot;s.scope;

s.reboot;
FreqScope.new;




~wt0 = Signal.sineFill(
	1024,
	1/(1..8),
	0!8
).asWavetable;

~wt1 = Signal.sineFill(
	1024,
	[1,0,1/2,1,1/4],
	[0,0,pi,0,pi]
).plot;


~wt1 = Signal.sineFill(
	1024,
	[1],
	[0,0,pi,0,pi]
).//plot;


Buffer.freeAll

(
~b0 = Buffer.loadCollection(s, ~wt0);
~b1 = Buffer.loadCollection(s, ~wt1);
)

({
	var sig;
	sig = VOsc.ar(MouseX.kr(0.1),  300, mul:0.2!2);
}.play;)


s.defaultGroup.deepFree;


Buffer.freeAll;















b = Buffer.alloc(s, 2048);

c = Buffer.alloc(s, 2048);



(
~sig = Signal.sineFill(
	2048,//4096
	[1, 1/4, 1/6, 1/2],
	0!4

);

~wt2 =  ~sig.asWavetable;

)
//
(
~wt1 = Signal.sineFill(
	1024
	,
	[6,0,3,6,1.5,4,8,2,3,1,2],
	[0,0,pi,0,pi]
).play;)
//



~b7 = Buffer.loadCollection(s, ~wt6);
(


c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true).plot;

)

(

~sigX = Signal.sineFill(
	1024,
	[500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ]
).play
)


g = Signal.sineFill(1000, 1/[1, 2, 3, 4, 5, 6]).play;

g.free;
//
b = Signal.sineFill(512, [1]).play(true, 0.2);//HEREEE
b.free;    // free the buffer again.
//
w = Signal.sineFill(1000, 1/[1, 2, 3, 4, 5, 6,4,6,3,2]).play;

w.free;



w = Signal.sineFill(1000, 1/[1200,2400,1,2,3]).play;//OK


w = Signal.sineFill(1000, 1/[1318.51,20.6,1.2875,2.575,5.15]).play;


w = Wavetable.chebyFill(329.63, pi/[1318.51,20.6,1.2875,2.575,5.15]).play;

w.free;

//important
Buffer.freeAll;

v = {Saw.ar(41.205,1,0)}.play;

v.free;

//asWavetable

~wt6 = ~sigX.asWavetable;

~wt6.plot;


~b6 = Buffer.loadCollection(s, ~wt6);

~b6.bufnum


VOsc.ar(6, 300, mul:0.2!2).play;



({
	var sigX;
	sigX = VOsc.ar(56, 300, mul:1!2);
}.play;)




~wt3 = c;
~b2.bufnum;

~b3.bufnum;

(
~b2 = Buffer.loadCollection(s, ~wt2);


~b3 = Buffer.loadCollection(s, ~wt3);
)

({
	var sig;
	sig = VOsc.ar(MouseX.kr(0.5), 300, mul:0.2!2);//56
}.play;)


s.defaultGroup.deepFree;

{Osc.ar(b,164.81, mul:0.2!2)}.play;







