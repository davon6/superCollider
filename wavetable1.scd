

s.boot;


Server.default.options.outDevice_("Built-in Output");

s.reboot;

s.scope;

b = Buffer.alloc(s, 2048);

c = Buffer.alloc(s, 2048);

FreqScope.new

(
~sig = Signal.sineFill(
	2048,//4096
	[1, 1/4, 1/6, 1/2],
	0!4

);

~wt =  ~sig.asWavetable;

b.loadCollection(~wt);
)

b.plot;
~sig.plot;

{Osc.ar(b, MouseX.kr(100, 1000, 1), mul:0.2!2)}.play;

{Osc.ar(b,164.81, mul:0.2!2)}.play;

{Osc.ar(b)}.play;












(SynthDef.new(\sound,{
	var sig;

	//sig = ~sig

	//sig = Osc.ar(b);

	sig = SinOsc.ar(440,0,0.2);
	Out.ar(0, sig);
}).add;
)


Synth(\sound);

({
	var sig;
	sig = GrainBuf.ar(
		1,
		Impulse.ar(2.2),
		1,
		b,
		1,
		0,
		2,
		0,
		-1,
		512

	);
}.play;
)





(
var env, sig, wt, numSegs;
numSegs= rrand(4,20);
env = Env(
	(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
{exprand(1,20)}!numSegs,
{rrand(-20,20)}!numSegs
)//.plot;
sig = env.asSignal(1024);
wt= sig.asWavetable;
b.loadCollection(wt);
)

//{Osc.ar(b, MouseX.kr(10, 10000,1)* [1,2.01], mul:0.2!2)}.play;
{Osc.ar(b,82.405, mul:0.2!2)}.play;








(
var env, sig, wt, numSegs;
numSegs= rrand(4,20);
env = Env(
	(({rrand(0.0,1.0)}!(numSegs+1)) * [1,-1]).scramble,
{exprand(1,20)}!numSegs,
{rrand(-20,20)}!numSegs
);
sig = env.asSignal(1024);
wt= sig.asWavetable;
b.loadCollection(wt);
)

{Osc.ar(b, MouseX.kr(10, 10000,1)* [1,2.01], mul:0.2!2)}.play;
//{Osc.ar(b,82.405, mul:0.2!2)}.play;


/*
(
//~amps =[1] ++ ({[0, exprand(0.05,0.5)].choose}!31);
~amps =[1] ++ ({[0, 4].choose}!31);
	~sig = Signal.sineFill(
		1024,
		~amps,
		0!32
	);
~wt = ~sig.asWavetable;
	b.loadCollection(~wt);
)*/
//b.sine3([1,50],[1,1],[0,0], asWavetable:true);



b.sine3([500],[1,1],[0,0], asWavetable:true);



{Osc.ar(c, MouseX.kr(100, 10000, 1), mul:0.2!2)}.play;


{Osc.ar(c,  SinOsc.ar(5,add: LFNoise0.ar(25, 1400, 450)), mul:0.2!2)}.play;//working
{Osc.ar(c,  SinOsc.ar(125,add: LFNoise0.ar(25, 1400, 450)), mul:0.2!2)}.play;//working



{Osc.ar(c,  SinOsc.ar(15,add: LFNoise0.ar(25, 1400, 450)), mul:0.2!2)}.play;//working


(


c.sine3([500, 500, 500,500, 560, 40.0024271845 ],
	      [10,  14, 23, 15, 20, 20 ],
	[0,0],
	asWavetable:true);

)
{Osc.ar(b,4.12, mul:0.2!2)}.play;



s.defaultGroup.deepFree;





{Osc.ar(b, 10.rand.postln, mul:0.2!2)}.play;


