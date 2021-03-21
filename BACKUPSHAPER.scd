(
~beat = 60/151.703592;
~vol1 = 0.06;
~vol2;

s.options.memSize = 1048576;
)
(
s.waitForBoot({
	var numSegs;


	~tf = Env([-0.8,0,0.8],[1,1],[8,-8]).asSignal(1025);
	~tf = ~tf.asWavetableNoWrap;

	s.sync;

	~tfBuf = Buffer.loadCollection(s, ~tf);


	s.sync;



	//numSegs= rrand(4,20);
	numSegs= rrand(1,2).postln;


	~tf = Env(
		(({rrand(0.0,0.01).postln}!(1)) * [1,-1]).scramble,
		{exprand(1,20)}!numSegs,
		 {rrand(-20,20)}!numSegs
	).asSignal(1025);


	// ~tf.plot

	~tf = ~tf + (
		Signal.sineFill(
			1025,
			//(0!3) ++ [0,0,0,1,1,1].scramble,

			[1,/* 1/4,*/ /*1/6,*/ 1/2],
			{rrand(0,2pi)}!2 //was 16
		) / 4
	);


	~tf = ~tf.normalize;

	~tfBuf.loadCollection(~tf.asWavetableNoWrap);

	// ~tfBuf.plot


}))