

~freq2 = Pfunc({1800.rrand(0)})
~freq3=Pfunc({1800.rrand(0)})
~mul2 = Pfunc({6000.rand})
~which = Prand([0,1,2],inf)
~clip = Pfunc({(1.0).rrand(0.2)}),
~skew = Pfunc({(1.0).rrand(-1.0)}),
~pitch1=Pfunc({-1400.rrand(1400)})
~pitch2=Prand([9.65.rrand(8),9.65,0])
~pitch3=Pfunc({-12.rand})
~pitch4=Pfunc({4.00.rrand(1)})
~lfoP=Pfunc({22.rand})


///to keep
~p2Func={~arr=[9.65.rrand(8),9.65,0].scramble;~arr[3.rand];}




"~freq2 = ".post;1800.rrand(0).post;";~freq3=".post;1800.rrand(0).post;"; ~mul2 = ".post;6000.rand.post;";~which =".post; 3.rand.post;";~clip = ".post;(1.0).rrand(0.2).post;";~skew = (".post;(1.0).rrand(-1.0).post;"); ~lfoPVal= ".post;23.rand.post;";~lfoPW =".post; 2.rand.post;";".post;"~pitchEStrt=".post;1400.rand.post;"; ~pitchEPol= (".post;(-1).rrand(1).post;"); ~pitchECrv=".post; 13.rand.post;"; ~pitchELoop=".post; 2.rand.post;";~pitchDecL =(".post;(-0.2).rrand(0.4).post;");~pitchDec =".post;61.00.rand.post;";".post;


x=1

"~freq2".post;x.value;" = ".post;1800.rrand(0).post;";~freq3=".post;1800.rrand(0).post;"; ~mul2 = ".post;6000.rand.post;";~which =".post; 3.rand.post;";~clip = ".post;(1.0).rrand(0.2).post;";~skew = (".post;(1.0).rrand(-1.0).post;"); ~lfoPVal= ".post;23.rand.post;";~lfoPW =".post; 2.rand.post;";".post;"~pitchEStrt=".post;1400.rand.post;"; ~pitchEPol= (".post;(-1).rrand(1).post;"); ~pitchECrv=".post; 13.rand.post;"; ~pitchELoop=".post; 2.rand.post;";~pitchDecL =(".post;(-0.2).rrand(0.4).post;");~pitchDec =".post;61.00.rand.post;";".post;



~freq2 = 1318;~freq3=1266; ~mul2 = 4365;~which =0;~clip = 0.67485094070435;~skew = (0.85995221138); ~lfoPVal= 5;~lfoPW =1;~pitchEStrt=452; ~pitchEPol= (1); ~pitchECrv=6; ~pitchELoop=1;~pitchDecL =(0.17158644199371);~pitchDec =13.923557043076;-



~freq2 = 1646;~freq3=568; ~mul2 = 647;~which =0;~clip = 0.50809841156006;~skew = (0.96295309066772); ~lfoPVal= 0;~lfoPW =1;~pitchEStrt=247; ~pitchEPol= (-1); ~pitchECrv=8; ~pitchELoop=0;~pitchDecL =(0.11567733287811);~pitchDec =27.829029202461;-> ;





(
n = 1;
while ( { n < 9 }, {


	"~freq2".post;n.post;" = ".post;3800.rrand(0).post;";~freq3".post;n.post;"=".post;3800.rrand(0).post;"; ~mul2".post;n.post;" = ".post;6000.rand.post;";~which".post;n.post;" =".post; 3.rand.post;";~clip".post;n.post;" = ".post;(1.0).rrand(0.2).post;";~skew".post;n.post;" = (".post;(1.0).rrand(-1.0).post;"); ~lfoPVal".post;n.post;"= ".post;23.rand.post;";~lfoPW".post;n.post;" =".post; 2.rand.post;";".post;"~pitchEStrt".post;n.post;"=".post;1400.rand.post;"; ~pitchEPol".post;n.post;"= (".post;(-1).rrand(1).post;"); ~pitchECrv".post;n.post;"=".post; 13.rand.post;"; ~pitchELoop".post;n.post;"=".post; 2.rand.post;";~pitchDecL".post;n.post;" =(".post;(-0.2).rrand(0.4).post;");~pitchDec".post;n.post;" =".post;61.00.rand.post;";".post;




	n = n + 1;
});
)

(
n = 2;
while ( { n < 3 }, {


	"~freq2".post;n.post;" = ".post;3800.rrand(0).post;";~freq3".post;n.post;"=".post;3800.rrand(0).post;"; ~mul2".post;n.post;" = ".post;6000.rand.post;";~which".post;n.post;" =".post; 3.rand.post;";~clip".post;n.post;" = ".post;(1.0).rrand(0.2).post;";~skew".post;n.post;" = (".post;(1.0).rrand(-1.0).post;"); ~lfoPVal".post;n.post;"= ".post;23.rand.post;";~lfoPW".post;n.post;" =".post; 2.rand.post;";".post;"~pitchEStrt".post;n.post;"=".post;1400.rand.post;"; ~pitchEPol".post;n.post;"= (".post;(-1).rrand(1).post;"); ~pitchECrv".post;n.post;"=".post; 13.rand.post;"; ~pitchELoop".post;n.post;"=".post; 2.rand.post;";~pitchDecL".post;n.post;" =(".post;(-0.2).rrand(0.4).post;");~pitchDec".post;n.post;" =".post;61.00.rand.post;";".post;




	n = n + 1;
});
)

~freq28 = 422;~freq38=636; ~mul28 = 170;~which8 =1;~clip8 = 0.74356899261475;~skew8 = (0.59700798988342); ~lfoPVal8= 18;~lfoPW8 =0;~pitchEStrt8=1383; ~pitchEPol8= (1); ~pitchECrv8=8; ~pitchELoop8=1;~pitchDecL8 =(-0.047194695472717);~pitchDec8 =60.556487679482;-> nil


~freq23 = 1169;~freq33=847; ~mul23 = 4120;~which3 =1;~clip3 = 0.60937404632568;~skew3 = (0.95804142951965); ~lfoPVal3= 2;~lfoPW3 =0;~pitchEStrt3=424; ~pitchEPol3= (1); ~pitchECrv3=1; ~pitchELoop3=0;~pitchDecL3 =(0.25069851875305);~pitchDec3 =14.496034145355;-> nil


~freq24 = 1283;~freq34=1316; ~mul24 = 5034;~which4 =2;~clip4 = 0.62599458694458;~skew4 = (0.89394950866699); ~lfoPVal4= 1;~lfoPW4 =0;~pitchEStrt4=328; ~pitchEPol4= (1); ~pitchECrv4=0; ~pitchELoop4=0;~pitchDecL4 =(0.24036071300507);~pitchDec4 =40.646717786789;-> nil


~freq22 = 1446;~freq32=753; ~mul22 = 1230;~which2 =1;~clip2 = 0.9924711227417;~skew2 = (-0.021504640579224); ~lfoPVal2= 3;~lfoPW2 =1;~pitchEStrt2=1049; ~pitchEPol2= (1); ~pitchECrv2=5; ~pitchELoop2=1;~pitchDecL2 =(0.30142245292664);~pitchDec2 =13.303188085556;-> nil



~freq26 = 1619;~freq36=648; ~mul26 = 3054;~which6 =1;~clip6 = 0.44514198303223;~skew6 = (0.55343389511108); ~lfoPVal6= 10;~lfoPW6 =1;~pitchEStrt6=1061; ~pitchEPol6= (0); ~pitchECrv6=1; ~pitchELoop6=0;~pitchDecL6 =(0.01553258895874);~pitchDec6 =19.316175580025;-> nil

~freq27 = 1180;~freq37=1627; ~mul27 = 3220;~which7 =0;~clip7 = 0.4467041015625;~skew7 = (-0.27355980873108); ~lfoPVal7= 12;~lfoPW7 =1;~pitchEStrt7=716; ~pitchEPol7= (-1); ~pitchECrv7=4; ~pitchELoop7=1;~pitchDecL7 =(0.39767019748688);~pitchDec7 =59.099531054497;-> nil

~freq25 = 1039;~freq35=204; ~mul25 = 257;~which5 =1;~clip5 = 0.49797525405884;~skew5 = (-0.80623769760132); ~lfoPVal5= 8;~lfoPW5 =0;~pitchEStrt5=362; ~pitchEPol5= (0); ~pitchECrv5=9; ~pitchELoop5=0;~pitchDecL5 =(0.37480018138886);~pitchDec5 =59.303125977516;-> nil





~freq21 = 1442;~freq31=295; ~mul21 = 5776;~which1 =0;~clip1 = 0.48354349136353;~skew1 = (0.47704267501831); ~lfoPVal1= 13;~lfoPW1 =1;~pitchEStrt1=695; ~pitchEPol1= (1); ~pitchECrv1=12; ~pitchELoop1=1;~pitchDecL1 =(0.1215726852417);~pitchDec1 =20.999444127083;~freq22 = 1195;~freq32=177; ~mul22 = 986;~which2 =2;~clip2 = 0.99521017074585;~skew2 = (-0.83169960975647); ~lfoPVal2= 14;~lfoPW2 =0;~pitchEStrt2=981; ~pitchEPol2= (0); ~pitchECrv2=1; ~pitchELoop2=1;~pitchDecL2 =(-0.17834270000458);~pitchDec2 =60.007447481155;~freq23 = 374;~freq33=3323; ~mul23 = 5430;~which3 =1;~clip3 = 0.37176055908203;~skew3 = (0.97558045387268); ~lfoPVal3= 16;~lfoPW3 =1;~pitchEStrt3=157; ~pitchEPol3= (0); ~pitchECrv3=5; ~pitchELoop3=1;~pitchDecL3 =(0.092533588409424);~pitchDec3 =0.27228403091431;~freq24 = 2478;~freq34=683; ~mul24 = 3685;~which4 =2;~clip4 = 0.69403657913208;~skew4 = (0.6435432434082); ~lfoPVal4= 15;~lfoPW4 =1;~pitchEStrt4=765; ~pitchEPol4= (0); ~pitchECrv4=6; ~pitchELoop4=0;~pitchDecL4 =(0.28358855247498);~pitchDec4 =31.9296438694;~freq25 = 2943;~freq35=1187; ~mul25 = 4366;~which5 =1;~clip5 = 0.37576999664307;~skew5 = (-0.52921319007874); ~lfoPVal5= 9;~lfoPW5 =1;~pitchEStrt5=519; ~pitchEPol5= (-1); ~pitchECrv5=1; ~pitchELoop5=1;~pitchDecL5 =(-0.13582696914673);~pitchDec5 =56.179240465164;~freq26 = 492;~freq36=3510; ~mul26 = 5456;~which6 =1;~clip6 = 0.35856609344482;~skew6 = (0.18512153625488); ~lfoPVal6= 10;~lfoPW6 =1;~pitchEStrt6=144; ~pitchEPol6= (-1); ~pitchECrv6=11; ~pitchELoop6=0;~pitchDecL6 =(0.3306848526001);~pitchDec6 =17.781243801117;~freq27 = 3276;~freq37=3045; ~mul27 = 4684;~which7 =1;~clip7 = 0.38310556411743;~skew7 = (0.27809143066406); ~lfoPVal7= 10;~lfoPW7 =1;~pitchEStrt7=594; ~pitchEPol7= (-1); ~pitchECrv7=4; ~pitchELoop7=1;~pitchDecL7 =(-0.004575252532959);~pitchDec7 =40.788480877876;~freq28 = 3591;~freq38=2302; ~mul28 = 2260;~which8 =1;~clip8 = 0.44329357147217;~skew8 = (-0.10585951805115); ~lfoPVal8= 15;~lfoPW8 =0;~pitchEStrt8=810; ~pitchEPol8= (0); ~pitchECrv8=5; ~pitchELoop8=0;~pitchDecL8 =(0.24433217048645);~pitchDec8 =37.166181206703;-> nil








SynthDef(\lfoLin, {|out, dur, val| Out.kr(out, Line.kr(val,val,inf))}).add;



SynthDef(\lfoEnvPitch,{|out,strt,loop,val,pol,dec, decL, crv=7|var sig1,sig2;

	sig1 = XLine.kr(start: strt, end: 0, dur: dec);
	sig2 = Saw.kr(val,mul: pol,add: decL).lincurve(-1,1,-1,1,crv).range(strt,0);

	Out.kr(out,SelectX.kr(loop,[sig1,sig2]));

}).add;


SynthDef(\lfo, {|out, dur,ph, val = (~hzQbeat), rL=(-1500),rH=1500, which=0 |var sine,noi;


	sine = SinOsc.kr(val,ph).range(rL,rH);
	noi = LFNoise0.kr(val).range(rL,rH);

	Out.kr(out,SelectX.kr(In.kr(which),[noi,sine]))}).add;



	SynthDef(\lfoPerc, {|out, valA,valD,lvl,crv| Out.kr(out,EnvGen.kr(Env.perc(valA,valD,lvl,crv),timeScale:  t.beatDur,doneAction: 2))}).add;


	SynthDef(\lfoStep, {|out, dur, val| Out.kr(out,EnvGen.kr(Env.step([val,0],[dur,0]),timeScale:  t.beatDur,doneAction: 2))}).add;




SynthDef(\osc, {|out=0,freq=   161.81716430268 /*(52.midicps*(432/440))*/,freq2=610,freq3=610,amp=1,in,gate=1,mul=1,mul2=1,mul3=1,which,clip,skew,pitch,lfoP, melo |var sig, sig2, sig3,mod,mod2;


	mod2 = SinOsc.ar(  In.kr(freq2)/10 ,mul:  In.kr(mul2)/10);
	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:In.kr(mul2));
	sig3 = Squine.ar( freq+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew ) + mod);


	mod2 = SinOsc.ar(  In.kr(freq3)/10 ,mul:  In.kr(mul3)/10);
	mod = SinOsc.ar( In.kr(freq2)+ mod2,mul:1/*In.kr(mul2)/10*/);
	sig2 = Squine.ar( freq+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew) + mod2)+mod;


	mod2 = Squine.ar(  In.kr(freq3)+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew ) ,mul:  1);
	mod = Squine.ar( In.kr(freq2)+In.kr(pitch)+In.kr(lfoP)+In.kr(melo) ,In.kr(clip),In.kr(skew ),mul:1/*In.kr(mul2)/10*/);
	sig = Squine.ar( freq+In.kr(pitch)+In.kr(lfoP)+In.kr(melo)    ,In.kr(clip),In.kr(skew ) )+mod+mod2;

	Out.ar(out,  LeakDC.ar(Shaper.ar(~tfBuf, Select.ar(In.kr(which),[ sig,sig2,sig3])   )) * amp );

}).add;





(

~g1=Group.new;
~g2=Group.after(~g1);
~g3=Group.after(~g2);

~modF2  = Synth(\lfoLin,[\out,~busC4,\val,~freq21],~g1);
~modM2  = Synth(\lfoLin,[\out,~busC3,\val,~mul21],~g1);
~modF3  = Synth(\lfoLin,[\out,~busC2,\val,~freq31],~g1);
// ~mod  = Synth(\lfoLin,[\out,~busC1,\val,],~g1);

~modW  = Synth(\lfoLin,[\out,~busC5,\val,~which1],~g1);
~modC  = Synth(\lfoLin,[\out,~busC6,\val,~clip1],~g1);
~modS  = Synth(\lfoLin,[\out,~busC7,\val,~skew1],~g1);
~modLfoP  = Synth(\lfo,[\out,~busC9,\val,~lfoPVal1 ,\which,~lfoPW1],~g1);
~modEnvP= Synth(\lfoEnvPitch,[ \strt,~pitchEStrt1, \crv,~pitchECrv1, \pol, ~pitchEPol1,\dec, ~pitchDec1,\decL,~pitchDecL1,\loop, ~pitchELoop1, \out,~busC8],~g1);



 Synth( \osc,[\out,~bus1A,\freq2,~busC4,\mul2,~busC3,\freq3,~busC2,\mul3,~busC3,\which,~busC5,\clip,~busC6,\skew, ~busC7,\pitch, ~busC8,\lfoP,~busC9,\melo,~busC10],~g1,addAction: 'addAfter');


Ppar([

		Pbind(\instrument, \lfoStep,\out, ~seqBus, \val,Pfunc({

		Scale.chromatic(\just).degreeToFreq(7.rand, 38.midicps, 2)*(432/440)

	}),\dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16)],inf),\group,~g1,\out,~busC10),



	Pbind(\instrument, \lfoPerc, \dur,Pxrand([ Pseq([4/1],1),Pseq([1/1],4), Pseq([1/4],16),Pseq([1],1)],inf),\val,Pfunc({(-1.0).rrand(1.0)}),\group,~g1,\out,~busC11,\valA,Pfunc({1.00.rand}),\valD,Pfunc({1.00.rand}),\lvl,Pfunc({(-65).rrand(700)}),\crv,Pfunc({(-6).rrand(6)})),



	Pbind(\instrument, \gate ,\in,  ~bus1A ,\vlDec,1,
		\dur,Pxrand([Pseq([1/4],4),   Pseq([1/4],10), Pseq([1/1],1) ],inf) ,    \group,~g2, \out,0,\tS, 0.39550810372374,
		\vlSub,Pfunc({0.7.exprand(0.4,1)}),\vlSub2,Pkey(\vlSub),\atkT,Pfunc({0.14.exprand(0.01)}),
	\decT,Pfunc({0.6.exprand(0.8,0.3)}),
	\subsT,Pfunc({0.2.exprand(0.1)}),
	\relT,Pfunc({0.22.exprand(0.1,1)}),
	\atckC,0,
	\decC,Pfunc({-4.exprand(-0.1)}),
		\relC,Pfunc({-8.exprand(-2,1)}),\vlAtk ,Pfunc({1.00.exprand(0.01)}),\vlRel,Pfunc({0.1.exprand(0.01)})
)],inf).play(t);

{ReplaceOut.ar(0, BHiPass4.ar(In.ar(0),  /*+MouseY.kr(100,2500)*/

	 SinOsc.kr( LFTri.kr( ~hz1beat/4).range(~hz1beat/4,~hz1beat)).range(~hz1beat*64,~hz1beat*1024)

	+In.kr(~busC11)

	,0.5))}.play(target:~g2, addAction: \addAfter);

)

MIDIClient.init;
MIDIIn.connectAll;
// MIDIIn.disconnectAll;
(
MIDIdef.cc(\cal, { |value|var modFreq = value/*.linlin(0, 127, 1, 11)*/;

/*	// ~h1.set(\rte, modFreq.round(0.01).postln);
if(modFreq.round(1) ==15,{
/*~modF2.set(\val,~freq21);

		~modM2.set(\val,~mul21);
		~modM2.set(\val,~mul21);

		~modF3.set(\val,~freq31);
~modW.set(\val,~which1);

		~modC.set(\val,~clip1);
~modS.set(~skew1);

		~modLfoP.set(\val,~lfoPVal1 ,\which,~lfoPW1);*/
		~modEnvP.set(\strt,~pitchEStrt1, /*\crv,~pitchECrv1, \pol, ~pitchEPol1,\dec, ~pitchDec1,\decL,~pitchDecL1,\loop, ~pitchELoop1*/);
	},{	});*/



if(modFreq.round(1) ==15,{

		"1".postln;
~modF2.set(\val,~freq21);
~modM2.set(\val,~mul21);
~modF3.set(\val,~freq31);
~modW.set(\val,~which1);
~modC.set(\val,~clip1);
~modS.set(~skew1);
~modLfoP.set(\val,~lfoPVal1 ,\which,~lfoPW1);
		~modEnvP.set(\strt,~pitchEStrt1, \crv,~pitchECrv1, \pol, ~pitchEPol1,\dec, ~pitchDec1,\decL,~pitchDecL1,\loop, ~pitchELoop1);},{	});

	if(modFreq.round(1) ==30,{
	"2".postln;
		~modF2.set(\val,~freq22);
~modM2.set(\val,~mul22);
~modF3.set(\val,~freq32);
~modW.set(\val,~which2);
~modC.set(\val,~clip2);
~modS.set(~skew2);
~modLfoP.set(\val,~lfoPVal2 ,\which,~lfoPW2);
		~modEnvP.set(\strt,~pitchEStrt2, \crv,~pitchECrv2, \pol, ~pitchEPol2,\dec, ~pitchDec2,\decL,~pitchDecL2,\loop, ~pitchELoop2);},{	});


	if(modFreq.round(1) ==45,{
	"3".postln;
		~modF2.set(\val,~freq23);
~modM2.set(\val,~mul23);
~modF3.set(\val,~freq33);
~modW.set(\val,~which3);
~modC.set(\val,~clip3);
~modS.set(~skew3);
~modLfoP.set(\val,~lfoPVal3 ,\which,~lfoPW3);
		~modEnvP.set(\strt,~pitchEStrt3, \crv,~pitchECrv3, \pol, ~pitchEPol3,\dec, ~pitchDec3,\decL,~pitchDecL3,\loop, ~pitchELoop3);},{	});

	if(modFreq.round(1) ==60,{
	"4".postln;
		~modF2.set(\val,~freq24);
~modM2.set(\val,~mul24);
~modF3.set(\val,~freq34);
~modW.set(\val,~which4);
~modC.set(\val,~clip4);
~modS.set(~skew4);
~modLfoP.set(\val,~lfoPVal4 ,\which,~lfoPW4);
		~modEnvP.set(\strt,~pitchEStrt4, \crv,~pitchECrv4, \pol, ~pitchEPol4,\dec, ~pitchDec4,\decL,~pitchDecL4,\loop, ~pitchELoop4);},{	});


	if(modFreq.round(1) ==75,{
	"5".postln;
		~modF2.set(\val,~freq25);
~modM2.set(\val,~mul25);
~modF3.set(\val,~freq35);
~modW.set(\val,~which5);
~modC.set(\val,~clip5);
~modS.set(~skew5);
~modLfoP.set(\val,~lfoPVal5 ,\which,~lfoPW5);
		~modEnvP.set(\strt,~pitchEStrt5, \crv,~pitchECrv5, \pol, ~pitchEPol5,\dec, ~pitchDec5,\decL,~pitchDecL5,\loop, ~pitchELoop5);},{	});

	if(modFreq.round(1) ==90,{
	"6".postln;
		~modF2.set(\val,~freq26);
~modM2.set(\val,~mul26);
~modF3.set(\val,~freq36);
~modW.set(\val,~which6);
~modC.set(\val,~clip6);
~modS.set(~skew6);
~modLfoP.set(\val,~lfoPVal6 ,\which,~lfoPW6);
		~modEnvP.set(\strt,~pitchEStrt6, \crv,~pitchECrv6, \pol, ~pitchEPol6,\dec, ~pitchDec6,\decL,~pitchDecL6,\loop, ~pitchELoop6);},{	});

	if(modFreq.round(1) ==105,{
	"7".postln;
		~modF2.set(\val,28/*~freq27*/);
~modM2.set(\val,~mul27);
~modF3.set(\val,~freq37);
~modW.set(\val,~which7);
~modC.set(\val,~clip7);
~modS.set(~skew);
~modLfoP.set(\val,~lfoPVal7 ,\which,~lfoPW7);
		~modEnvP.set(\strt,~pitchEStrt7, \crv,~pitchECrv7, \pol, ~pitchEPol7,\dec, ~pitchDec7,\decL,~pitchDecL7,\loop, ~pitchELoop7);},{	});

	if(modFreq.round(1) ==120,{
		"8".postln;

		~modF2.set(\val,~freq28);
~modM2.set(\val,~mul28);
~modF3.set(\val,~freq38);
~modW.set(\val,~which8);
~modC.set(\val,~clip8);
~modS.set(~skew8);
~modLfoP.set(\val,~lfoPVal8 ,\which,~lfoPW8);
		~modEnvP.set(\strt,~pitchEStrt8, \crv,~pitchECrv8, \pol, ~pitchEPol8,\dec, ~pitchDec8,\decL,~pitchDecL8,\loop, ~pitchELoop8);},{	});

},ccNum: 74 ); //is 2

)


