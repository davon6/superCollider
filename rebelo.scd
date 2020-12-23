s.boot;
s.scope;


(~tf = Signal.newClear(1025).waveFill({
	arg x, old, i;
	sin(x)
},-pi/2,pi/2);
~tf = ~tf.waveFill({
	arg x, old, i;
	old * ((cos(x*0.08) / 4) + 0.3);
}, 0,50pi).normalize;
~tf.plot;

~tf.asWavetableNoWrap;


~tfBuf.loadCollection(~tf.asWavetableNoWrap);
)



s.defaultGroup.deepFree;
~tf.size;

({
	var sig, input;
	input = LFSaw.ar(250);
	sig = Shaper.ar(~tfBuf, input);
	sig = sig * 0.3!2;
}.play;
)


s.freeAll;


/*

(~tf = Env([-1,1],[1],[0]).asSignal(1025);//where u ll set sub
~tf = ~tf + (
	Signal.sineFill(
		1025,
		(0!3) ++ [0,0,0,1,0.8,0.5,0.4,0.2].scramble,
		//{rrand(0,2pi)}!9
	)/4;
);

*/
/////WORKING

(
~tf = Env([-1,1],[1],[0]).asSignal(1025);
~tf = ~tf + (
	Signal.sineFill(
		1025,
		(0!3) ++ [0,0,0,1,1,1].scramble,
		{rrand(0,2pi)}!16
	) / 4
);
~tf = ~tf.normalize;
~tf.plot;
~tfBuf.loadCollection(~tf.asWavetableNoWrap);
)



~tfBuf.plot


~tf.size;

({
	var sig, input;
	inp4ut = LFSaw.ar(250) * LFNoise1.kr(0.5).range(0.1,1);
	sig = Shaper.ar(~tfBuf, input);
	sig = sig * 0.3!2;
}.play;
)

s.defaultGroup.deepFree;
s.freeAll;