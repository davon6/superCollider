(
s.meter;
s.boot;
s.plotTree;

s.scope;


)
s.reboot;


ServerOptions.devices
Audient iD14


s.options.memSize = 65536;
s.options.memSize = 131072;

Server.default.options.outDevice_("Audient iD14");

Server.default.options.outDevice_("Built-in Output");


ServerOptions.outDevices;


{ SinOsc.ar(200, 0, 0.5) }.play;

{SinOsc.ar(200, 0, 0.5)}.play;

//b = Buffer.readChannel(s,"/Users/MisterGadou/Downloads/SuperCollider/noVS.wav",channels:[0]);


b = Buffer.readChannel(s,"/Users/MisterGadou/Desktop/music/SAMPLES:PRESETS/noVS4.wav",channels:[0]);

b.play;


//base
({
	var vib;

	vib = GrainBuf.ar(
		1,
		Impulse.ar(41.2)!2,
		//Impulse.ar(freq),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(0.2, 12.1),
		1,
		b.bufnum,
		//0.25,
		1,
		//30.midiratio,
		0.1,
		2,
		0,
		-1,
		32768,
		//512,
		1

	);
}.play;)








s.sampleRate ;



s.reboot;

//driver's block size
({

	var vib;
	vib = GrainBuf.ar(
		1,
		Impulse.ar(10.3)!2,
		//Impulse.ar(freq),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(0.2, 12.1),
		2,
		b.bufnum,
		//0.25,
		//30.midiratio,
		1,
		0.1,
		2,
		0.28,
		-1,
		65536,
		1

	);




}.play)


(f = {

	arg freqAdded = 20.6;
	var sig, vib, env, frequenv,sin,lfo, env2;
/*
	env = EnvGen.ar(
		Env.new(
	[0,1,0.2,0.2,1],
	[1,2.5,10,3],
	[0,0,0,0]
	),doneAction:2);

*/
	vib = GrainBuf.ar(
		1,
		Impulse.ar(0),
		//Impulse.ar(freq),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(0.2, 12.1),
		1,
		b.bufnum,
		//0.25,
		30.midiratio,
		0.1,
		2,
		0.28,
		-1,
		512,
		1
		,freqAdded
	);


	 sig = GrainBuf.ar(
		1,
		//Impulse.ar(vib),
		Impulse.ar(20.6)!2,
		//Impulse.ar({ExpRand(vib,vib)}!2),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		LFNoise1.kr(0.8!12).exprange(12.1, 12.3),
		//1,
		b.bufnum,
		vib,
		//30.midiratio,
		0.1,
		2,
		0.28,
		-1,
		512,
		1
	);

	//sin = SinOsc.kr(55);.play;
/*
	frequenv = EnvGen.kr(
		Env.new(
			[10547.2, 82.4],
			[1],
			[-1]
		)
	);


env2 = 	Env.new(
			[15000, 500],
			[4],
			[-12]
		));

*/

	//lfo = SinOsc.kr(frequenv,0,1,82.4);

	//sig = LPF.ar(sig, frequenv );


/*
10.do({	env = EnvGen.ar(
		Env.new(
	[0,1,0.2,0.2,1],
	[1,2.5,10,3],
			[0,0,0,0]        )).plot;})*/





//LFNoise1.kr(0.8).exprange(0.2, 12.1)
	//e.g fm src vib = SinOsc.ar(100,0,200,300);

	//sig= SinOsc.ar(vib)!2;

	//sig= SinOsc.ar(55)!2;







}



)

x = f.play;

x.release(5);

x.free;

x.set(\freq, exprand(50,800));


x.set(\freqAdded,12.3);




({
	arg gate =0;
	var sig,env;
	//env =EnvGen.kr(Env.adsr,gate);
	sig = VarSaw.ar(SinOsc.kr(16).range(500,1000));



}.play;)


//expo

(x = {

	arg gate =0  ;//freq = 16 -- 8
	var sig,env, modHR, vib;
	//env =EnvGen.kr(Env.adsr,gate);
	//sig = VarSaw.ar(SinOsc.kr(16).range(500,1000));

	//var freq = SinOsc.kr(20.6).range(0.040234375,MouseX.kr(1,80.4).poll);

//MouseX.kr(1,9).poll///MouseY.kr(387.2,193.6)

/*
	env = EnvGen.ar(
		Env.new(
	[20.60,2637.02,164.81,659.25,5274.04],
	[1.5488,3.0976,12.3904,3.0976],
	[0,0,0,0]
	)//.plot

);

	env = EnvGen.ar(
		Env.new(
	[2093,1318.51,164.81,659.25,20.60],
		[6.1952,0.7744,1.5488,3.0976],
	[0,0,0,0]
	)//.plot

);

*/


	env = EnvGen.ar(
		Env.new(
	[2093,1318.51,164.81,659.25,20.60],
		[0.7744,0.1936,0.3872,1.5488]
	[0,0,0,0]
	)//.plot

);



	vib = SinOsc.ar(600, 0, 6,500);

	///here hHHHEREE


	 sig = GrainBuf.ar(
		1,
		//Impulse.ar(vib),
		//SinOsc.kr(16).range(500,1000),
		//Impulse.ar(SinOsc.kr(freq).range(387.2,193.6))!2  ,
		//Impulse.ar(SinOsc.kr(freq).range(659.25,164.81 ))!2  ,
		Impulse.ar(vib)!2,
		//Impulse.ar(20.6)!2,
		//Impulse.ar({ExpRand(vib,vib)}!2),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(12.1, 12.3),
		0.7744,
		b.bufnum,
		2,
		//65.midiratio,
		0.4,
		-1,//2
		0.28,
		-1,
		131072,
		1
	);





}.play;)


x.set(\freq, 2);


//testing env

(

var env2;


env2 = EnvGen.ar(
		Env.new(
	[100,0,0,0],
	[20,0,0,0],
	[0,0,0,0]
	).plot;

);



)
//phasing

(f= {

	arg freqAdded = 20.6, phTrig=0, phRate=0.05, phStart=0,lfoNoi =164.81;
	var sig, vib, env, frequenv,sin,lfo, env2;



	env = EnvGen.ar(
		Env.new(
	[20.60,2637.02,164.81,659.25,5274.04],
	[1,2.5,10,3],
	[0,0,0,0]
	)//.plot

);



	env2 = EnvGen.ar(
		Env.new(
	[500,0,0,0],
	[20,0,0,0],
	[0,0,0,0]
	);

);









	vib = GrainBuf.ar(
		1,
		Impulse.ar(0),
		//Impulse.ar(freq),
		//Impulse.ar({ExpRand(41,41.2)}!2),
		//LFNoise1.kr(0.8!12).exprange(0.2, 12.1),
		1,
		b.bufnum,
		//0.25,
		1,
		//30.midiratio,
		0.1,
		2,
		0,
		-1,
		32768,
		//512,
		1
		,freqAdded
	);




	 sig = GrainBuf.ar(
		1,
		//Impulse.ar(vib),
		//Impulse.ar(20.6)!2,
		//Impulse.ar({ExpRand(vib,vib)}!2),
		Impulse.ar(
			{ExpRand(20,20.6)}!2

		//env2
		),
		//LFNoise1.kr(0.8!12).exprange(12.1, 12.3),
		LFNoise1.kr(0.8).exprange(12.1, 12.3),
		//1,
		b.bufnum,
		vib,
		//1,
		//30.midiratio,
		//0.1,
		(	Phasor.ar(phTrig, phRate * BufRateScale.ir(b), phStart, BufSamples.ir(b)-1)
			+ LFNoise1.ar(lfoNoi).bipolar(0.0 * SampleRate.ir)
		) / BufSamples.ir(b),
		2,
		0,
		-1,
	32768,
		1
	);

/*
	env = EnvGen.ar(
		Env.new(
	[20.60,2637.02,164.81,659.25,5274.04],
	[1,2.5,10,3],
	[0,0,0,0]
	)//.plot

);


	sig = LPF.ar(sig, env);


*/


	//sig = Impulse.ar(55);






}.play;



)


p = f.play;





p.set(\lfoNoi,329.63);//next time melo 300

p.set(\freqAdded,12.3);

p.release(5);

p.free;



//phTrig=0, phRate=0.05, phStart=0;





p.set(\phTrig,5);

p.set(\phRate,500);


p.set(\phStart,2);


p.set(\freq, exprand(50,800));






//gosh

({

	Saw.ar(Phasor.ar(0, 100 * BufRateScale.ir(1), 0, BufSamples.ir(1)-1)
			+ LFNoise1.ar(100).bipolar(0.0 * SampleRate.ir)
		 / BufSamples.ir(1))!2;





}.play;)

