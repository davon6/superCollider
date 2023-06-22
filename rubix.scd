

({SinOsc.ar(200,mul: EnvGen.kr(Env.step([0.5,0,0.5,0,0.5,0,0.5,0,0.5,0,0.5,0,0.5,0],[0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25,0.25]),timeScale:t.beatDur))}.play)
>



~essai=Buffer.read(s,"/Users/davidmignot/Desktop/leadsSC.aif");
~essai.play

({PlayBuf.ar(2,~essai,rate: 1,loop: 0,startPos: 19200,trigger: Impulse.kr(~hz1beat*2))}.play)




~essai.length

307200/16


~hz1beat/4



SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:Impulse.kr(impulse),startPos: start,loop:loo,doneAction: 2)

		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;

Prand([
	Pbind(\instrument, \playBuf,\start, 307200/16*1,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*2,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*3,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*4,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),

Pbind(\instrument, \playBuf,\start, 307200/16*5,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*6,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*7,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*8,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),

Pbind(\instrument, \playBuf,\start, 307200/16*9,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*10,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*11,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*12,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),

Pbind(\instrument, \playBuf,\start, 307200/16*13,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*14,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
Pbind(\instrument, \playBuf,\start, 307200/16*15,\impulse, ~hz1beat*2,\dur,Pseq([1],1),\rte,0.2),
	Pbind(\instrument, \playBuf,\start, 307200/16*16,\impulse, ~hz1beat*2,\dur,Pseq([1],1))],inf).play(t)


~test =  { 0.rrand(15)};


~test2 =  { rand(1.04)};

[0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4

Pseq([Pbind(\instrument, \playBuf,\start, Pfunc([307200/16*~test],1),\impulse, ~hz1beat*2,\dur,Pseq([1],inf))],inf).play(t)


Pseq([Pbind(\instrument, \playBuf,\start, Pfunc([307200/16*~test],1),\impulse, ~hz1beat*2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25],inf),\rte,Pfunc({~test2}))],inf).play(t)

enchainement sequence
insertion blank wihtout creating silenth
complex pitc/modulation
ajouter reverse -1 rate

redudancesequence with all modulaiton



Pseq([Pbind(\instrument, \playBuf,\start, Pseq([307200/16*7 ],1),\impulse, ~hz1beat*2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25],inf),\rte,1)],inf).play(t)


5==5||7==5

~essai.numFrames


 a = 0.rrand(15)

b= 0.rrand(15)
if(b==a){b= 0.rrand(15)}




return

   a = Pbind(
        \dur, 0.125,
        \octave, 4,
        \degree, Plet(\melody, pattern: Pwhite(0,7))
    );

    // the bass, scale degrees sampled from the \melody variable defined above
    b = Pbind(
        \dur, 0.5,
        \octave, 3,
        \degree, Pget(\melody, default: 1, repeats: inf).trace
    ).play;


SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=1,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,buf,rte,trigger:Impulse.kr(~hz1beat*impulse),startPos:~essai.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([1,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;

~suite =[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]


~suite =[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15].scramble

~test =  {0};

~suite =[7,8,9]
[1..16]

(0..16).choose(9)
(0..16).scramble

~test =  { 7.rrand(9)};
~impulse = {2.rrand(4.50)};
Scale.new(#[0, 1, 3, 6, 8, 10, 11], name: "My ET12");
Scale.chromatic(tuning: 'et12')

Pseq([Pbind(\instrument, \playBuf,\start,Pseq([ Pseq(~suite,4),Pfunc([~test],64)].scramble,inf),\impulse, Prand([Pfunc({~impulse}),2].scramble,inf),\dur,Pseq([Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,1),
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25],16)].scramble,inf),\rte,Pfunc({~test2}))],inf).play(t)

c=1
~seq={


	if(c>15){a= Pseq((a..(a+3)).scramble,16);}{c=c+1;|;}

};



~seq={a=0.rrand(16);("a= "+a);c=c+1;
	if(c>15){(a..(a+3)).scramble;}

};


~seq={a=0.rrand(16);("a= "+a);c=c+1;
	if(c>15){(a..(a+3)).scramble;}

};

c=1
d=1

~seq={
	if(c>15){(a..(a+3)).scramble;




},{a=0.rrand(16);("a= "+a);c=c+1;},)

};

1
Pseq([Pbind(\instrument, \playBuf,\start,Pfunc({~seq} ),\impulse, Prand([Pfunc({~impulse}),2].scramble,inf),\dur,Pseq([Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,1),
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25],16)].scramble,4),\rte,Pfunc({~test2}))],inf).play(t)





~seq={

	if(a>13,{
		Pseq(~arr=(12..(12+3)),4)},
	{Pseq(~arr=(a..(a+3)),4)})


	;a=0.rrand(16).postln;};

~seq2 = {"enter phase 2".postln;if(a>13,{a=12}); ~arr=(a..(a+3)).postln}

~seq.()
~seq={

	if(a>12,{
		~arr=(12.rrand(12+3))},
	{~arr=(a.rrand(a+2))})


	;a=0.rrand(16).postln;};


~arr2={	if(a>12,{
		~arr=(12.rrand(12+3)).postln},
{~arr=(a.rrand(a+3)).postln})};


~impulse = {0.02.rrand(2)};
4%2
~impulse = {0.125};

~test2 =  { 0.02.rrand(0.2)};
~essai=Buffer.read(s,"/Users/davidmignot/Desktop/leadsSC.aif");

SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=3,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,~essai,In.kr(rte),trigger:Impulse.kr(~hz1beat*impulse),startPos:~essai.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;

Pseq([

Pseq([Pbind(\instrument, \playBuf,\start,Pfunc({~seq} ),\impulse, Prand([1,2,4].scramble,inf),\dur,Prand([Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,1),
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25],8)].scramble,4),\rte,Pfunc({~test2}),\type,Pseq([\note,\rest,\note,\note,\note,\note,\note,\note],inf))],1),



	Pseq([Pbind(\instrument, \playBuf,\start,Pfunc({~arr2}),\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,Pseq([Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,1),
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*2,1)].scramble,4),\rte,Prand([Pfunc({~test2}),(-1)],inf))],1),

],inf).play(t)



	Pseq([Pbind(\instrument, \playBuf,\start,5,\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,Pseq([
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,1)].scramble,4),\rte,Prand([Pfunc({~test2}),(-1)],inf),\type,Pseq([\note,\rest,\note,\note],inf))],inf).play(t)

m = SimpleMIDIFile.read("/Users/davidmignot/Desktop/New MIDI File.mid".standardizePath);

import midiFile



~atp = {(11..(11+3)).scramble.postln}



Pseq([Pbind(\instrument, \playBuf,\start,Pfuncn({~atp},1),\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,Pseq([
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,4)].scramble,4),\rte,Prand([Pfunc({~test2}),(-1)],inf),\type,Pseq([\note,\rest,\note,\note],inf))],inf).play(t)


\degree


~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);


	SynthDef(\lfo,{|out, vl1, vl2, dur, tim = 0.0484, crv =(-12)|
		Out.kr(out,VarLag.kr( Line.kr(vl1, vl2, dur, doneAction: 2),tim,crv));}).add;



{/*Out.kr(~busC2,SinOsc.kr(0.2).range(0.2,1.54));*/

	Out.kr(~busC3,SinOsc.kr(0.8).range(0.4,1))

}.play

~busC3.poll

Bus.value(28)

{Out.kr(~busC2,SinOsc.kr(0.7).range(0.6,0.9));}.play

	/*Out.kr(~busC3,EnvGen.kr(Env.step([1,5],[56,0]) ))*/

}.play



Pseq([Pbind(\instrument, \playBuf,\start,Pfunc({~seq}),\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,Pseq([
	Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,4)],inf),\rte,~busC2,\rte2,Pfunc({~test2}))],inf).play(t)



SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=3,buf, loo=0,impulse=0.001,rte=1
	vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0|Out.ar(out,PlayBuf.ar(2,~essai,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*impulse),startPos:MouseX.kr(0,15000).poll+~essai.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;


Pseq([Pbind(\instrument, \playBuf,\start,Pfunc({~seq}),\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,~busC3,     \rte,~busC2,\type,Pseq([\note,\rest,\note,\note],inf))],inf).play(t)


~ctn=Array.fill(8,if(~max>1.00,{~max=~max-~max.rand;},{~max});)
~ctn=[0];~max=16.00;

if(~max>1.00,{~max=~max-~max.rand;~ctn.add(~max);},{~ctn.add(~max)});

while(~max>1.00,{~max=~max-~max.rand;~ctn.add(~max);},{~ctn.add(~max);Break;});
.push
Arra

14.343299865723+ 1.2611306081726+ 0.11212214056419+ 0.11212214056419

~max=16.00
~dur={~max=~max.rand;}
~ctn.add(11)
({
	a=0.rrand(16);
~busC2 =Bus.control(s,1);
~busC3 =Bus.control(s,1);






~seq2 = {"enter phase 2".postln;if(a>13,{a=12}); ~arr=(a..(a+3)).postln};


~seq={

	if(a>12,{
		~arr=(12.rrand(12+3))},
	{~arr=(a.rrand(a+2))})


	;a=0.rrand(16).postln;};


~arr2={	if(a>12,{
		~arr=(12.rrand(12+3)).postln},
{~arr=(a.rrand(a+3)).postln})};


~impulse = {0.02.rrand(2)};



~test2 =  { 0.02.rrand(0.2)};
~essai2=Buffer.read(s,"/Users/davidmignot/Desktop/leadsSC.aif");
	~essai=Buffer.read(s,"/Users/davidmignot/Desktop/leads [2023-06-20 222412].aif");

	SynthDef(\playBuf ,{|out = 0,start, trig, dur, amp=3,buf, loo=0,impulse=0.001,rte=1
		vlAtk =0,vlDec=1 ,vlSub=1,rte2=0 ,vlSub2=1,vlRel=0,atkT=0,decT=1,subsT=0,relT=0,atkC=0,decC=0,relC=0,gateSub=0,dA=0,impulseMod|Out.ar(out,PlayBuf.ar(2,~essai,In.kr(rte)+rte2,trigger:Impulse.kr(~hz1beat*(impulse+In.kr(impulseMod))),startPos:/*MouseX.kr(0,15000).poll+*/~essai.numFrames/16* start,loop:1,doneAction: 2)

		* EnvGen.kr(Env.step([2,0],[dur,0]),timeScale: t.beatDur, doneAction:2)* amp

	);}).add;

})

Pseq([0.3,0.1,1.2,0.1,1.7,1.54,0.3,1.2,0.2,1.4,0.5,3],inf)

Pseq([Pbind(\instrument, \playBuf,\start,3,\impulse, Prand([0.125,0.25,2].scramble,inf),\dur,
	Pseq([0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand,0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand],inf),\rte,~busC2,\rte2,Pfunc({~test2}),\type,Pseq([\note,\rest,\note].scramble,inf))],inf).play(t)

\dur,
		Pseq([0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand,0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand].scramble,inf)

Pseq([

	Pbindef(\uiu,\instrument, \playBuf,\start,3,\impulse, Prand([0.125,0.25,2].scramble,inf),\rte,~busC2,\rte2,Pfunc({~test2}),\type,Pseq([\note,\rest,\note].scramble,inf))],inf).play(t)

Pbindef(\uiu,\type,Pseq([\note],inf),\start,Pfunc({~seq}));

Pseq([
Pbindef(\uiu,\start,13,Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note].scramble,inf),\impulse,0.4)


	Pbindef(\uiu,\start,Pfunc({~arr}),\type,Pseq([\note],inf),\impulse,2)


	Pbindef(\uiu,\start,8),7].play(t)
Routine

Pbindef(\uiu,\start,Pseq([5,3,8,1,5,5,3,8],inf))
Pbindef(\uiu,\start,Pfunc({0.rrand(16)}))
Pbindef(\uiu,\start,Pfunc({~arr2}))
Pbindef(\uiu,\type,Pseq([\note,\rest],inf))

Pbindef(\uiu,\type,Pseq([\note,\rest,\note,\rest,\note,\note,\note,\note].scramble,inf))

Pbindef(\uiu,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*2,inf))


Pbindef(\uiu,\dur,Pseq([0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand,0.3.rand,0.1.rand,1.2.rand,0.1.rand,0.7.rand,1.54.rand,0.3.rand,1.2.rand,0.2.rand,1.4.rand,0.5.rand,3.rand]*8,inf))


Pbindef(\uiu,\impulse,0.001);

Pbindef(\uiu,\type,Pseq([\note],inf));

Pbindef(\uiu,\start,Pseq([ Pfunc({~seq},16),Pseq([16.rand.poll],32)],inf)).play(t)

Pbindef(\uiu,\rte2,0.2)
Pbindef(\uiu,\rte,~busC2)



Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1)}),\start,Pfunc({~seq}),\type,Pseq([\note],inf),\rte,55,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,inf)).play(t)


Pbindef(\uiu,\rte,~busC2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25].scramble*0.35,inf),
	\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\note].scramble,inf),\start,Pfunc({~arr2}),\rte2,Pfunc({0.5})
).play(t)





Pbindef(\uiu,\rte,~busC2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*0.8,inf),
	\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\note].scramble,inf),\start,Pfunc({~arr2}),\rte2,Pfunc({0})

	~seq


)

v.stop
v = Routine {

	loop{
		"goinghereFirstavecV".postln;
		Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1.5)}),\start,Pfunc({a=0.rrand(16)}),\type,Pseq([\note],inf),\rte,55,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,inf),\impulse,Prand([4,2,0.5],inf),\impulseMod,55);
        // Often you might see Wait being used to pause a routine
        // This waits for one second between each number
        4.wait;


Pbindef(\uiu,\rte,~busC2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*4,inf),
			\type,Pseq([\note,\rest,\note,\note,\rest,\rest,\note,\note].scramble,inf),\start,Pfunc({~arr2}),\rte2,Pfunc({0}),\impulse,0,\impulseMod,~busC3);
   4.wait;
		"goinghere".postln
	}




}   v.play(t)

y={Out.kr(~busC3,SinOsc.kr(1).range(0.2,8));}.play;
x={Out.kr(~busC2,Saw.kr(0.02).range(0.2,1));}.play;

x={Out.kr(~busC2,SinOsc.kr(1.3).range(1.2,0.4));}.play
	/*Out.kr(~busC3,EnvGen.kr(Env.step([1,5],[56,0]) ))*/

v.stop
y.free

//slow

v = Routine {

	loop{
		"goinghereFirst".postln;
		Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(1.5)}),\start,Pfunc({a=0.rrand(16)}),\type,Pseq([\note],inf),\rte,55,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,inf),\impulse,Prand([4,2,0.5],inf));
        // Often you might see Wait being used to pause a routine
        // This waits for one second between each number
        4.wait;


Pbindef(\uiu,\rte,~busC2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*0.8,inf),
			\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\note].scramble,inf),\start,Pfunc({~arr2}),\rte2,Pfunc({0}),\impulse,Prand([0.25,1,0.5],inf));
   4.wait;
		"goinghere".postln
	}




}.play(t)

v.stop



(

r = Routine {
    var times = { rrand(4, 64) }.dup(10) + thisThread.beats;
    times = times.sort;

	times.postln;
	4.do({ w=	Pbindef(\uiu,\rte2,Pfunc({0.5.rrand(2)}),\start,Pfunc({~seq}),\type,Pseq([\note],inf),\rte,55,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*1,inf));

		 4.wait;


Pbindef(\uiu,\rte,~busC2,\dur,Pseq([0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.5,0.5,1,0.25,0.25,1,0.25,0.25]*0.8,inf),
			\type,Pseq([\note,\rest,\note,\rest,\note,\rest,\note,\note].scramble,inf),\start,Pfunc({~arr2}),\rte2,Pfunc({0}));
   4.wait;


    });
    // Wait half second before saying we're done
    4.wait;
    "done".postln;
}
)


r.play(t)

r.stop

Pbindef(\uiu,\rte,55)

x={Out.kr(~busC2,Saw.kr(0.02).range(0.2,0.5));}.play

x={Out.kr(~busC2,SinOsc.kr(4).range(0.2,2));}.play
	/*Out.kr(~busC3,EnvGen.kr(Env.step([1,5],[56,0]) ))*/

x.free


Pbindef(\uiu,\type,Pseq([\note],inf),\rte,55,);


Scale.

~myOwn = Scale.new(
    [1, 2, 3, 4, 5, 9, 10],
    12,

);

 p = Pbind(
	\degree, Pfunc({~compam.(16, 5, 1, 2, 3, 4, 5)}),
        \scale, Pfunc({ Scale.chromatic }, inf),
	\dur, 0.25
    );


q = p.play;
{Out.kr(~busC2,SinOsc.kr(MouseY.kr(0.02,0.7)).range(0.3,0.9));}.play


,\type,Pseq([\note,\rest,\note].scramble,inf)


(0.125..4).choose
[0.125..4].max
