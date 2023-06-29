 v.stop
~routine4.stop
~routine3= Routine{

	loop{
		"goinghereFirst2".postln;


Pbindef(\uiu,\rte,~busC10,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*16,inf),
	\type,Pseq([\note].scramble,inf),\start,Pseq([7,10],inf),\rte2,Pfunc({ (-0.2).rrand(0.5) }),\impulse,0.01,\impulseMod,55,\envVol,~busC11);

~funk.();
		~valR.wait;


Pbindef(\uiu,\rte,~busC12,\dur,Pseq([3]*1,inf),
	\type,Pseq([\note,\note,\note,\note],inf),\start,0.rrand(16),\rte2,0,\impulse,3,\impulseMod,55,\envVol,~busC11);

~funk.();
		~valR.wait;

			"goinghere2".postln
	}




}
p.stop
~routine3.stop
~routine3.play(t)

1.5 2.5

256 128 64 32 16 8 4 2

~funk ={"inthefunk".postln;if( ~valR==2,{
~valR = 256;
	~valR=~valR/2;},{~valR=~valR/2;})}


~rigol

~busC10=Bus.control(s,1);
~busC11=Bus.control(s,1);
~busC12=Bus.control(s,1);

~record1 =Bus.audio(s,2);
	~record2 =Bus.audio(s,2);
	~record3 =Bus.audio(s,2);
	~record4 =Bus.audio(s,2);
	~record5 =Bus.audio(s,2);



h={Out.kr(~busC10,LFNoise0.kr(0.9).range(3,0.2))}.play;

i={Out.kr(~busC11,LFPulse.kr(SinOsc.kr(0.2).range(6,0.5)).range(1,1))}.play;

h.free

i.free

w={Out.kr(~busC12,LFTri.kr(0.01).range(0.02,3));}.play;

w.free
~a=0.rrand(16)
Pbindef(\uiu).play(t)

~routine4= Routine{

	loop{
		"goinghereFirst3".postln;


		Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1.5)}),\start,Pfunc({~a}),\type,Prand([Pseq([\note],4),Pseq([\note,\rest],8)],inf),\rte,55,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,inf),\impulse,Prand([0,2,0.5],inf),\impulseMod,~busC6);

4.wait;
		~a=0.rrand(16);

		Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1.5)}),\start,a=0.rrand(16),\type,Prand([Pseq([\note],4),Pseq([\note,\rest],8)],inf),\rte,55,\dur,~seq4.(),\impulse,Prand([0,2,0.5],inf),\impulseMod,~busC6);


				"goinghere2".postln;

		4.wait;


	}


}
b=4


~seq4={"calling".postln;~seq5= Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*(8.rrand(1)),inf)};
~routine4.stop

~routine4.play(t)
~busTest = Bus.audio(s,1

s.makeGui
	r = Recorder(s);
{ GVerb.ar(Dust.ar(4)) }.play; // play on bus 64
r.record(~record1,numChannels:2);
r.stopRecording;


s.meter(2,6);
{Out.ar(~record1,SinOsc.ar(220,mul: 0.1!2))}.play;
~record1

{Out.ar(~record2,SinOsc.ar(340,mul: 0.1!2))}.play;

~busTest
	~catch ={Out.ar(0,In.ar(~record1,2));
		Out.ar(0,In.ar(~record2,2));
		Out.ar(0,In.ar(~record3,2));
		Out.ar(0,In.ar(~record4,2));
		Out.ar(0,In.ar(~record5,2));
	}.play
~catch.freeAll
	~catch

	{Out.ar([0,1],In.ar([4,5],2))}.play

~test.free

	~recorders = ~recordBuses.value(
	[
		Bus(\audio, ~record1.index, 2, s),
		Bus(\audio, ~record2.index, 2, s),
		Bus(\audio, ~record3.index, 2, s),
		Bus(\audio, ~record4.index, 2, s),
		Bus(\audio, ~record5.index, 2, s)
	],
	"/Users/davidmignot/Desktop/again/recording2/%.wav"
);