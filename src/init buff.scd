

s.boot;s.scope;
s.reboot;
s.quit


{SinOsc.ar(164.81)}.play;

Buffer.freeAll

~wt1 = Signal.sineFill(
	2048,
	[1]
)


~wt2 = Signal.sineFill(
	2048,
	[1]
)


Signal.chebyFill(2048, [1]).play;


~b0 = Buffer.loadCollection(s, ~wt1);
~b1 = Buffer.loadCollection(s, ~wt2);

c = Buffer.alloc(s, 2048);


c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);


Buffer.freeAll;

{Osc.ar(0  ,164.81)}.play;


VOsc.ar(0,164.81));}.play

	sig = Shaper.ar(~tfBuf,sig);



{VOsc.ar(SinOsc.kr(0.0201171875).exprange(0.00001,1.99999),164.81)!2;}.play


{VOsc.ar(SinOsc.kr(0.0201171875).exprange(0.00001,1.99999),164.81)!2;}.play



{Osc.ar(0,164.81)!2;}.play

//0.0001
s.defaultGroup.deepFree;


//to run first
(
~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
~tf = ~tf.asWavetableNoWrap;
)

~tf.plot



~tfBuf = Buffer.loadCollection(s, ~tf);

c = Buffer.alloc(s, 2048);




(

var env, sig, wt, numSegs;
//numSegs= rrand(4,20);
numSegs= rrand(1,4);


~tf = Env(
	(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
{exprand(1,20)}!numSegs,
{rrand(-20,20)}!numSegs
).asSignal(1025);



~tf = ~tf + (
	Signal.sineFill(
		1025,
		//(0!3) ++ [0,0,0,1,1,1].scramble,

[1, 1/4, 1/6, 1/2],
		{rrand(0,2pi)}!16
	) / 4
);




~tf = ~tf.normalize;

//~tf.plot;

//~tf = LeakDC.ar(~tf);


//~tfBuf  = LeakDC.ar(~tfBuf);
~tfBuf.loadCollection(~tf.asWavetableNoWrap);

)

~tf.plot




