(({

~bufMain = Buffer.read(s, "/Users/davidmignot/Desktop/again/lol/supercollider/main.aif");
~bufThi= Buffer.read(s, "/Users/davidmignot/Desktop/again/lol/4bars.aif");
//~bufMain.play


~bufSid1 = Buffer.read(s, "/Users/davidmignot/Desktop/again/lol/supercollider/sides 27-Lead.aif");
~bufSid2 = Buffer.read(s,"/Users/davidmignot/Desktop/again/lol/supercollider/sides 28-Lead.aif");
~bufSid3 = Buffer.read(s,"/Users/davidmignot/Desktop/again/lol/supercollider/sides 29-Lead.aif");
~bufSid4 = Buffer.read(s,"/Users/davidmignot/Desktop/again/lol/supercollider/sides 30-Lead.aif");
~bufSid5 = Buffer.read(s,"/Users/davidmignot/Desktop/again/lol/supercollider/sides 31-Lead2.aif");
~bufSid6 = Buffer.read(s,"/Users/davidmignot/Desktop/again/lol/supercollider/sides 32-Lead2.aif");



~bars4=Bus.audio(s,2);
~bars1=Bus.audio(s,2);
~bars16=Bus.audio(s,2);

~buSid1 =Bus.audio(s,2);
~buSid2 =Bus.audio(s,2);
~buSid3=Bus.audio(s,2);
~buSid4=Bus.audio(s,2);
~buSid5=Bus.audio(s,2);
~buSid6=Bus.audio(s,2);

~riseLfo = Bus.control;




	SynthDef(\pl, {| out, buf, bar,krLfo,amp,amp2| Out.ar(out,PlayBuf.ar(2,buf,In.kr(krLfo),trigger: Impulse.kr(~hz1beat/bar))*amp*amp2)}).add;



	SynthDef(\pl, {| out, buf, bar,rise| Out.ar(out,PlayBuf.ar(2,buf,1+  (rise*Saw.kr(0.08,-1).range(0,0.4)),trigger: Impulse.kr(~hz1beat/bar)))}).add;


	SynthDef(\pl, {| out, buf, bar,rise=0,pos=0,amp=0,amp2=0|
		var bar1 =1349189.25;
		Out.ar(out,PlayBuf.ar(2,buf,rate:1+ (rise*
			/*Saw.kr(0.002,-1).range(1,1.1))*/
			 LFSaw.kr(0.002,mul: 1).lincurve(-1,1,-1,1,4).range(0,0.4))

			,trigger: Impulse.kr(~hz1beat/bar),startPos:pos* bar1)*amp*amp2

	)}).add;



	~vol={|attr,val,index=0|for(index, g.size) { g[index].set(attr,val);index=index+1;}};


~vol2={|val ,val2,val3=1|  g[val].set(val2,val3);};


	~bar1 = Routine{ loop{
			~vol.(\amp,0,1);~rand= rrand(1,g.size);  ~vol2.(~rand,\amp ); 3.rand.wait;
		~vol.(\amp,0,1);  ~vol2.(1,\amp ); 4.rrand(7).wait;
	}};


~bar4 = Routine{

		loop{

	 ~vol2.(0,\amp2,0); ~vol.(\amp2,1,1);  /*~rand= rrand(1,g.size);  ~vol2.(~rand,\amp ); ~vol2.(~rand,\amp2 );*/

		8.rrand(12).wait;

		~vol.(\amp2,0);   ~vol2.(0,\amp2); ~vol2.(0,\amp);

		4.rrand(16).wait;
	}

};

	~rise=Routine{loop{~vol.(\rise,1);64.wait;~vol.(\rise,0)}}

}).())





(


g=[
	(Synth(\pl,[\buf:~bufThi, bar:256])),
	(Synth(\pl,[\buf:~bufMain, bar:64])),
	(Synth(\pl,[\buf:~bufSid1 ,bar:1])),
	(Synth(\pl,[\buf:~bufSid2,bar:1])),
	(Synth(\pl,[\buf:~bufSid3, bar:1])),
	(Synth(\pl,[\buf:~bufSid4, bar:1])),
	(Synth(\pl,[\buf:~bufSid5, bar:1])),
	(Synth(\pl,[\buf:~bufSid6, bar:1])),
];
~bar4.play(t);
	~bar1.play(t);
~rise.play(t);
)



-------  ------

SynthDef(\gat, {| out, in|Out.ar(out, In.ar(in,2))}).add;

((g={[
	Synth(\pl,[\buf:~bufThi, \out,~bars16,bar:256]),
	Synth(\pl,[\buf:~bufMain, \out,~bars4,bar:64]),
	Synth(\pl,[\buf:~bufSid1, \out,~buSid1,bar:4]),
	Synth(\pl,[\buf:~bufSid2, \out,~buSid2,bar:4]),
	Synth(\pl,[\buf:~bufSid3, \out,~buSid3,bar:4]),
	Synth(\pl,[\buf:~bufSid4, \out,~buSid4,bar:4]),
	Synth(\pl,[\buf:~bufSid5, \out,~buSid5,bar:4]),
	Synth(\pl,[\buf:~bufSid6, \out,~buSid6,bar:4]),
]

}).())

(g=[
	(Synth(\pl,[\buf:~bufThi, \out,~bars16,bar:256])),
	(Synth(\pl,[\buf:~bufMain, \out,~bars4,bar:64])),
	(Synth(\pl,[\buf:~bufSid1, \out,~buSid1,bar:1])),
	(Synth(\pl,[\buf:~bufSid2, \out,~buSid2,bar:1])),
	(Synth(\pl,[\buf:~bufSid3, \out,~buSid3,bar:1])),
	(Synth(\pl,[\buf:~bufSid4, \out,~buSid4,bar:1])),
	(Synth(\pl,[\buf:~bufSid5, \out,~buSid5,bar:1])),
	(Synth(\pl,[\buf:~bufSid6, \out,~buSid6,bar:1])),
];)

{PlayBuf.ar(2,~bufMain,Saw.kr(0.008,-1).range(0.1,0.6),trigger: Impulse.kr(~hz1beat/256))}.play
~bufMain

{PlayBuf.ar(2,~bufMain,trigger: Impulse.kr(~hz1beat/256))*1*1}.play



{PlayBuf.ar(2,~bufThi,Saw.kr(0.08,-1).range(1,1.4),trigger: Impulse.kr(~hz1beat/256))}.play





----   ----
------
~lf1 = ({Out.kr(~riseLfo,Saw.kr(0.08-1).range(1,1.4))}.play)
forBy(0, 8, 2) { arg i; i.postln };
for(0, g.size) { g[i].set([\out,0]) };
//toujours init, annoying
i=0
for(0, g.size) { g[i].();i=i+1;};
//omg
for(0, g.size) { g[i].set(\rise,1.2);i=i+1;};i=0;
for(0, g.size) { g[i].set(\out,0);i=i+1;};i=0;
for(0, g.size) { g[i].set(\bar,1);i=i+1;};i=0;


for(0, g.size) { g[i].set(\pos,6);i=i+1;};i=0;
g=[
	(Synth(\pl,[\buf:~bufThi, \out,0,bar:256])),
	(Synth(\pl,[\buf:~bufMain, \out,0,bar:64])),
	(Synth(\pl,[\buf:~bufSid1, \out,0,bar:1])),
	(Synth(\pl,[\buf:~bufSid2, \out,0,bar:1])),
	(Synth(\pl,[\buf:~bufSid3, \out,0,bar:1])),
	(Synth(\pl,[\buf:~bufSid4, \out,0,bar:1])),
	(Synth(\pl,[\buf:~bufSid5, \out,0,bar:1])),
	(Synth(\pl,[\buf:~bufSid6, \out,0,bar:1])),
];
while
~rise.clear

(z =Synth(\gat);
x =Synth(\gat,[\out,~bars1]);

~bar4.play(t);
	~bar1.play(t);
g=[
	(Synth(\pl,[\buf:~bufThi, \out,~bars16,bar:256])),
	(Synth(\pl,[\buf:~bufMain, \out,~bars4,bar:64])),
	(Synth(\pl,[\buf:~bufSid1, \out,~buSid1,bar:1])),
	(Synth(\pl,[\buf:~bufSid2, \out,~buSid2,bar:1])),
	(Synth(\pl,[\buf:~bufSid3, \out,~buSid3,bar:1])),
	(Synth(\pl,[\buf:~bufSid4, \out,~buSid4,bar:1])),
	(Synth(\pl,[\buf:~bufSid5, \out,~buSid5,bar:1])),
	(Synth(\pl,[\buf:~bufSid6, \out,~buSid6,bar:1])),
];
//~rise.play(t);
)

for(i=0;i<g.size;i++){g[i].set([\out,0])}
foreach

x =Synth(\gat,[\out,~bars1])
~rise=Routine{loop{
	for(0, g.size) { g[i].set(\rise,1.2);i=i+1;};i=0;
	64.wait;
	for(0, g.size) { g[i].set(\rise,0);i=i+1;};i=0;
}}
for(0, g.size) { g[i].set(\rise,1.2);i=i+1;};i=0;

~bar1 = Routine{

		loop{

		x.set(\in,[~buSid1,~buSid2,~buSid3,~buSid4,~buSid5,~buSid6][6.rand]);

		3.rand.wait;

		x.set(  \in,~bars4);

		4.rrand(7).wait;
	}

};

[~bars1,~bars16][2.rand]
z =Synth(\gat)


~bar4 = Routine{

		loop{

		z.set(\in,~bars1);

		8.rrand(12).wait;

		z.set(  \in,~bars16);

		1.rrand(16).wait;
	}

}


//PEu
~sides=[~buSid1,~buSid2,~buSid3,~buSid4,~buSid5,~buSid6]

[~bars1,~bars16][2.rand]

-----------
x.set(\in,~buSid2)

Pbindef(\brq, \instrument, \gat,\dur,inf ).play
Pbindef(\brq).clear

~bar1 = Routine{

		loop{

		x.set(\in,~sides[~sides.size.rand]);



		/*	~repeatSmall=~arrRepSma[3.rand];*/

		3.rand.wait;

		x.set(  \in,~bars4);


			/*~repeatSmall=~arr4bars[4.rand];*/

				4.rrand(7).wait;
	}


}.play(t)




~arrRepSma = [1,2,3];
~arr4bars = [4,5,6,7];

Routine{

		loop{

		Pbind(\instrument, \gate, \dur,Pseq([1],1)).play(t);
		~repeat.wait;

			~repeat=~arrRepSma[3.rand];
	}


}.play(t)


bufSide		[1,5]

TRIGGER, [1,2

	which main 6 bar sides 1

	0.25,0.5,

	SynthDef(\playB, {| out, in, dur,buf, bar=1|ReplaceOut.ar([0,1], PlayBuf.ar(2,buf,trigger: Impulse.kr(~hz1beat*bar))*
	EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur,doneAction: 2)
)}).add


	Routine{



		loop{
			"hello".postln;
			1.wait;
		}
	}.play


	({PlayBuf.ar(2,~bufMain,trigger: Impulse.kr(~hz1beat/64))}.play)
PlayBuf.ar(2,buf,trigger: Impulse.kr(~hz1beat/836))


SynthDef(\boz,{|whch,bus, bar, buf|
	Out.ar(0,Select.ar(whch, [In.ar(bus,2), PlayBuf.ar(2,buf,trigger: Impulse.kr(~hz1beat*bar))])

)}).add;
